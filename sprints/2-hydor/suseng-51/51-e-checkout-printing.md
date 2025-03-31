# Order lifecyle
There are several processes happening before, around, and after save:

## Before Save
- **Validations**: The model validates inclusion of status and payment_type, and requires presence of currency and order_internal_type

## Around Save
- **State Machine (AASM)**: The core of this model's behavior is its state machine
- No explicit ActiveRecord around_save callbacks, but the state transitions contain logic that runs before/after state changes

## After State Changes (which often trigger saves)
- **State transition after_enter hooks**: Many state transitions have after_enter callbacks
- For example, when an order enters PENDING state, it:
  ```ruby
  state :PENDING, :after_enter => Proc.new {|o|
    o.track_sales
    o.auto_upgrade_to_rush_if_possible
    # Additional logic to handle non-shippable items
  }
  ```
- SHIPPED state triggers

add_shipping_info

 then calls

completed!


- COMPLETED state processes all line items with

post_order_completed

## Manual Save Calls
- Several methods explicitly call

save!

 after changing state:
  -

ok!

 method calls save! after changing status
  -

error!

 method calls save! after setting status to ERROR
  -

add_shipping_info

 sets shipping date then calls save!

The model doesn't use traditional ActiveRecord callbacks like before_save/after_save, instead relying on the AASM state machine for lifecycle management with validations for data integrity.

# Complete Order Creation and Placement Flow

Here's how the order creation process works from start to finish:

## 1. Order Generation Begins
```ruby
# OrderGenerator receives checkout data and initiates the process
generator = CheckoutSystem::OrderGenerator.new(checkout, remote_ip, payment_method)
response = generator.place_order
```

## 2. Order Building Phase
```ruby
# Inside place_order, if validations pass:
Order.transaction do
  order = build_order  # Creates Order object with all attributes
  order.save!          # Triggers validations
end
```

The

build_order

 method:
- Creates a new Order
- Sets user, total, currency, and other basic attributes
- Adds coupon uses from checkout
- Sets billing/shipping addresses
- Sets tax, shipping costs
- Creates sub_orders for different line item types

## 3. Payment Processing
```ruby
# After successful save, attempt payment authorization
auth_message = order.attempt_auth!(...)
if auth_message.success?
  # Attempt to capture the payment
  capture_messages = order.attempt_captures!(...)
  if captures_successful?
    # Continue with order processing
  end
else
  # Auth failed - destroy order and report error
  order.destroy
end
```

## 4. State Transitions
If payment succeeds, the order moves through the AASM state machine:
1. **NEW** (initial state)
2. **AUTHORIZED** (after successful auth)
3. **CAPTURED** (after successful capture)
4. **AWAITING_FILES** (called explicitly after capture)
   -

wait_for_files!

 transitions here
   -

try_move_awaiting_to_pending

 checks if files are ready

## 5. Post-Payment Processing
```ruby
# In OrderGenerator#place_order after successful captures:
order.wait_for_files!
order.notify_ebook_author_if_converting
order.deliver_ebook_download_urls
order.deliver_order_confirmation
```

## 6. Later State Transitions
The order will continue through more states based on fulfillment:
- **PENDING** → When files are ready for processing
- **PROCESSING** → When sent to printer/fulfillment
- **SHIPPED** → When physical items are shipped
- **COMPLETED** → Final state after shipping

Each state has callbacks that may:
- Send notifications
- Update tracking information
- Process inventory changes
- Record sales data

The AASM state machine is the central controller of the order's lifecycle, with various callbacks running before, during, and after each state change.

```plantuml
@startuml
title Order Creation and Placement Flow

actor User
participant "CheckoutSystem::OrderGenerator" as Generator
participant "Order" as Order
participant "Transaction::Processor" as Payment
participant "StateManager(AASM)" as StateManager
participant "Notifications" as Notifications

User -> Generator: place_order
activate Generator

Generator -> Generator: valid?
alt Valid checkout
    Generator -> Generator: build_order
    activate Generator

    Generator -> Order: new(checkout_data)
    Generator -> Order: save!
    activate Order
    Order --> Order: validations run
    Order --> Generator: order
    deactivate Order

    Generator -> Order: attempt_auth!(payment_data)
    activate Order
    Order -> Payment: authorize
    Payment --> Order: auth_message
    Order --> Generator: auth_message
    deactivate Order

    alt Auth success
        Generator -> Order: attempt_captures!(source)
        activate Order
        Order -> Payment: capture
        Payment --> Order: capture_messages
        Order --> Generator: capture_messages
        deactivate Order

        alt Capture success
            Generator -> Order: wait_for_files!
            activate Order
            Order -> StateManager: transition to AWAITING_FILES
            StateManager --> Order:
            Order --> Generator:
            deactivate Order

            Generator -> Order: notify_ebook_author_if_converting
            Generator -> Order: deliver_ebook_download_urls
            Generator -> Order: deliver_order_confirmation

            Generator -> Order: post_processing

            note right of Order
                Later state transitions:
                AWAITING_FILES -> PENDING
                PENDING -> PROCESSING
                PROCESSING -> SHIPPED
                SHIPPED -> COMPLETED
            end note
        else Capture failed
            note right of Order
                Order remains in CAPTURE_FAILED state
                for tracking purposes
            end note
        end
    else Auth failed
        Generator -> Order: destroy
        Generator -> Generator: handle_order_processing_error
    end
else Invalid checkout
    Generator -> Generator: populate @response.errors
end

Generator --> User: response
deactivate Generator

@enduml
```

# Order Processing Flow for Printables with RPI as Printer

flow of how printable items get sent to the printer, specifically focusing on RPI.

## Order Creation and Initial Processing

1. When a checkout is completed, `OrderGenerator` handles creating the order:
   - Payment authorization via

order.attempt_auth!

   - Payment capture via

order.attempt_captures!

   - The order transitions to `AWAITING_FILES` via

order.wait_for_files!

   - Order confirmations are delivered via

order.deliver_order_confirmation

2. The `SubOrderGenerator` creates sub-orders during checkout:
   ```ruby
   sub_order.print_vendor = checkout.printer.name
   ```

## Transition to Print Processing

3. The `Order.process_pending_orders` method is called periodically (every 10 minutes) by a river workflow to process orders in PENDING state:
   ```ruby
   find(:all,
     :include => [:sub_orders],
     :conditions => ["orders.status = 'OK' and orders.state = 'PENDING' and ((orders.created_at < (now() - (interval '3 hours'))) or orders.internal_type_id = ? or orders.api_key_id = ?)",,],
     :order => 'orders.id'
   )
   ```

4. This triggers `attempt_printing!` on each sub-order.

## Sending to RPI (PrinterServer)

5. In the `SubOrder` class, the `attempt_printing` event has multiple transitions:
   ```ruby
   transitions :from => [:NEW], :to => :SUBMITTING_CONTENT,
               :guard => lambda { !place_in_holding_bin? && needs_content_submission? }

   transitions :from => [:NEW, :ERROR], :to => :IN_HOLDING_BIN,
               :guard => lambda { place_in_holding_bin? && at_printer? }

   transitions :from => [:NEW, :ERROR], :to => :PROCESSING,
               :guard => lambda { ( !contains_shippable_line_items? || at_printer? ) && !needs_content_submission? }
   ```

6. When transitioning to `PROCESSING`, the `post_processing` method is called which:
   ```ruby
   def post_processing
     ensure_placed if edi_printer?
     set_contractual_ship_date!
     self.transferred_to_printer_at = Time.now
     save
     # ...
   end
   ```

7. For non-EDI printers like RPI, the actual sending to printer happens via `ensure_placed`:
   ```ruby
   def ensure_placed
     # ...
     order_response = @@order_service_proxy.place_order(self)
     if order_response.success?
       self.global_order_id = order_response.global_order_id
       # ...
     end
     # ...
   end
   ```

8. The `place_order` method in `order_service_proxy` determines whether to use BookServe (for standard printers like RPI) or BookWizard (for EDI printers):
   ```ruby
   def place_order(sub_order)
     if (sub_order.edi_printer?)
       @@bookwizard.place_order([sub_order])
     else
       @@bookserve.place_order(sub_order)
     end
   end
   ```

## Holding Bin Rules

Orders might go to a holding bin before printing based on different rules. Orders in the holding bin need to be released (either automatically or manually) before they continue to printing.

## RPI-Specific Logic

There are some special cases for RPI:

1. Rush handling is available for RPI orders in the US with specific trim sizes:
   ```ruby
   def qualifies_for_rush?
     return false unless self.print_vendor == "RPI"
     # Additional conditions...
   end
   ```

2. For Amazon orders, RPI appears to be the default printer unless it's a pick-and-pack (PNP) order:
   ```ruby
   def printer(amazon_order)
     if pnp_order?(amazon_order)
       nil  # let order router determine printer
     else
       Printer.find_by_name('RPI')
     end
   end
   ```

The order will get a `global_order_id` when successfully submitted to BookServe, and its status will be tracked through various state transitions until it's eventually shipped.

```plantuml
@startuml
title Book Order Sending to Bookserve
participant "SubOrder" as SO
participant "Bookwizard::OrderServiceProxy" as OSP
participant "BookServe" as BS
participant "Services::LegacyBookGateway::Clients::Order" as LGCO
participant "BookServe API" as API
participant "RPI Printer" as RPI

activate SO
note over SO: SubOrder in NEW/PENDING state

SO -> SO: ensure_placed()
activate SO #FFBBBB

SO -> SO: Check if has shippable line_items
SO -> SO: Check if already has global_order_id
SO -> SO: Check if print_vendor exists
SO -> SO: Check if needs_content_submission?
SO -> SO: Check if in holding bin and EDI printer

alt Normal Printing Flow
  SO -> OSP: place_order(self)
  activate OSP

  alt EDI Printer
    OSP -> "Bookwizard::OrderServiceClient": place_order([sub_order])
  else Standard Printer (like RPI)
    OSP -> BS: place_order(sub_order)
    activate BS

    BS -> BS: Validate order status is OK
    BS -> BS: Check if order is PENDING or PROCESSING

    BS -> BS: Create request payload with order details
    note right of BS
      - Order ID
      - User info
      - Shipping info
      - Book list data
      - Currency info
      - Price totals
      - Printer vendor (RPI)
      - Ship method
    end note

    alt Printable Product
      BS -> LGCO: place_printable_product_order(request)
      activate LGCO
      LGCO -> API: POST /PlaceOrderForPrintableProduct
    else Regular Book
      BS -> LGCO: place_book_order(request)
      activate LGCO
      LGCO -> API: POST /PlaceOrderForBlurby
    end

    API --> LGCO: Response with global_order_id
    LGCO --> BS: OrderCallReturn with success/error status
    deactivate LGCO

    BS --> OSP: OrderCallReturn with global_order_id
    deactivate BS
  end

  OSP --> SO: OrderCallReturn
  deactivate OSP

  SO -> SO: Set global_order_id
  SO -> SO: Update estimated_ship_date
  SO -> SO: Save SubOrder
  SO -> SO: Set transferred_to_printer_at = Time.now

  note over API
    BookServe processes the order:
    1. Validates files
    2. Creates print-ready files
    3. Routes to printer
  end note

  API -> RPI: Send print job with print specifications

  note over RPI
    RPI processes the order:
    1. Receives print specifications
    2. Queues job
    3. Performs printing
    4. Ships completed product
  end note

  SO --> SO: Return global_order_id
else Error Cases
  SO --> SO: Return false or true depending on error
end

deactivate SO #FFBBBB
deactivate SO
@enduml
```

## Key points in this flow:
1. SubOrder.ensure_placed() performs several validations before attempting to place the order:
  - Checks if the order has shippable items
  - Verifies if it already has a global_order_id
  - Confirms if a print vendor is assigned
  - Checks if content submission is required
  - Determines if it should be in holding bin (for EDI printers)

2. OrderServiceProxy acts as a router determining where to send the order:
  - EDI printers are handled by BookWizard
  - Standard printers (including RPI) are handled by BookServe

3. BookServe prepares the payload with order details:
  - Customer information
  - Shipping details
  - Line items/products
  - Printer information (RPI)
  - Currency and pricing information
  - Shipping method

4. The REST client sends the appropriate request:
  - /PlaceOrderForBlurby for regular books
  - /PlaceOrderForPrintableProduct for printable products

5. BookServe API processes the order and routes it to RPI, where it's queued for printing

6. After successful submission, the global_order_id is stored on the SubOrder and can be used for tracking the order status

# Bookserve processing
The command to print to RPI (or any print vendor) is not directly sent from the PlaceOrderAPI class. Instead, this class sets up the order data in the database and triggers PDF rendering, but the actual print command happens later in the workflow.

The actual communication with print vendors happens through the `PrintTalkOrder` class, which uses PrintTalk XML protocol to submit orders to print vendors. Here's the flow:

1. In `PlaceOrderAPI.placeOrder()`, the method:
- Creates database records (order group, order items, order tasks)
- Triggers PDF generation via `PdfServiceClient` for rendering
- Creates documentation and metadata

2. Later, a separate process (triggered by a task processor) handles the actual print vendor communication:
- The `PrintTalkOrder.purchaseOrder()` method creates a PrintTalk XML document
- It sends this XML to the printer using QueryPrintTalkPrinters.post()
- The HTTP request is sent to the print vendor's service URL (configured in the database)
- The communication with RPI would use their service endpoint (something like http://uos.rpiprint.com/uossoap/uos_soap.asmx/SubmitRequest based on the migration files in the codebase).

This separation of concerns allows the order placement to happen quickly while the more time-consuming processes of PDF rendering and printer communication happen asynchronously.

```plantuml
@startuml
title Book Order Processing Flow

actor Client
participant "BookServService" as BSS
participant "AddBookServlet" as ABS
participant "PlaceOrderAPI" as POA
participant "OrderTaskGroup" as OTG
participant "PdfServiceClient" as PSC
participant "PrintTalkOrder" as PTO
participant "SyncRequest" as SR
participant "QueryPrintTalkPrinters" as QPT
database "Database" as DB
participant "RPI PrintTalk Service" as RPI

Client -> BSS : PlaceOrderForBlurby(requestData)
activate BSS

BSS -> POA : setRequestData(requestData)
activate POA
POA --> BSS : acknowledge

BSS -> POA : placeOrder()
POA -> POA : validate(m_printer, m_shipMethodId)
POA -> DB : makeDBConnection()
activate DB

POA -> POA : createOrderGroup(conn)
note right: Creates OrderGroup with shipping details

POA -> POA : createOrderItems(conn)
note right: Creates OrderItem records for each book

POA -> OTG : new OrderTaskGroup(conn, order, lineItems)
activate OTG

POA -> OTG : saveToDB(m_inHoldingBin, m_dollar)
OTG -> OTG : render(lineItem, format, renderId, assetCollectionId, apiAccount)
OTG -> DB : OrderTaskDao.createTask(conn, task)
DB --> OTG : task created
OTG --> POA : Map<OrderTask, LineItem>
deactivate OTG

POA -> DB : conn.commit()
note right: Commits all database changes as a transaction

loop for each entry in renderTaskIdLineItemMap
    alt assetCollectionId exists && !skipRendering
        POA -> PSC : callPdfService(orderDate, lineItem, orderTask, assetCollectionId, apiAccount)
        activate PSC
        note right: Triggers PDF rendering with retry logic
        PSC --> POA : rendering response
        deactivate PSC
    end
end

POA -> POA : createOrderDetailHTML(conn)
note right: Creates HTML documentation of the order

POA --> BSS : status map with order details
deactivate POA
BSS --> Client : order response
deactivate BSS

note over Client, DB : Later, order submission to printer happens

Client -> PTO : new PrintTalkOrder(conn, orderGroup)
activate PTO
Client -> PTO : purchaseOrder()
activate PTO

PTO -> SR : xml4PO(orderGroup, printer, conn, orderItems, writer)
activate SR
note right: Generates PrintTalk XML document with order details
SR -> SR : addHeader(doc, printer)
SR -> SR : createDelivery(doc, "Delivery1", shippingMethod, originalShippingMethod, deliveryItems)
SR -> SR : createPartJDF(db, doc, item, "cover")
SR -> SR : createPartJDF(db, doc, item, "trunk")
SR --> PTO : XML payload
deactivate SR

PTO -> QPT : new QueryPrintTalkPrinters(printer, writer.toString(), payload, orderGroup)
activate QPT
note right: Saves the XML to filesystem
QPT -> QPT : FileUtil.saveFile(dir, payload + ".xml", xml)
QPT --> PTO : instance

PTO -> QPT : post()
QPT -> QPT : post = new PostMethod(printer.getServiceURL())

alt RPI_PRINTERS_IDENTITY
    QPT -> QPT : post.addParameter("XMLOrder", xml)
    note right: RPI requires "XMLOrder" parameter
else other printers
    QPT -> QPT : post.setRequestEntity(new StringRequestEntity(xml, "text/xml", "utf-8"))
end

QPT -> RPI : httpclient.executeMethod(post) with retry logic
activate RPI
RPI --> QPT : HTTP response
deactivate RPI

QPT --> PTO : response string
deactivate QPT

PTO -> PTO : sr.syncStatus(orderGroup.getEcCartID(), response, "PurchaseOrder", connection)
PTO -> DB : OrderGroupDao.updateSubmittedOrder(connection, orderGroup)
note right: Updates order with partnerID from printer

PTO --> Client : result code
deactivate PTO

@enduml
```