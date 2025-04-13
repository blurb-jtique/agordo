# Shipping Service in Checkout Process

Although shipping is not directly part of the pricing calculator page, it plays a crucial role in the checkout process and explanation can be extracted from there. When a customer checks out on Blurby, the system orchestrates several components to calculate available shipping methods and their associated costs. This process ensures accurate shipping rates are computed by integrating multiple elements within the Blurby checkout system. Here's an overview of how this calculation works:

## Main Flow

1. **Customer reaches shipping page**: When a customer enters the shipping stage of checkout, the system:
   - Loads their saved addresses (if any)
   - Checks if they need to create a new address
   - Prepares to show available shipping methods

2. **Address validation**: The system first checks if the shipping address is:
   - Present in the customer's account
   - Valid for shipping (some addresses can't receive shipments)
   - Complete with all required fields

3. Once a user reaches the shipping step in the checkout process:
   - The `shipping` action in `My::CheckoutController` is called
   - The controller calls `@checkout.populate_shipping_options`
      This method:
      - Determines which printer will fulfill the order
      - Contacts shipping carriers for real-time rates
      - Saves the response to show options to the customer
   - Available shipping methods are retrieved and stored in `@estimates`

4. The shipping options population process:

   ```ruby
   def populate_shipping_options(force = false)
     if shipping_address
       populate_printer if force || self.printer.nil?
       set_shipping_options if force || self.shipping_service_response.nil?
       self.save!
       self.reload
     end
   end
   ```

In technical terms (but simplified):

1. The checkout controller calls `populate_shipping_options` on the checkout object
2. The checkout finds the nearest printer that can fulfill the order
3. A shipping service client takes:
   - Printer location
   - Customer's address
   - Items being purchased
   - Currency
4. This client contacts shipping carriers for quotes
5. Results are stored in a `ShippingServiceResponse` object
6. Available shipping methods are sorted and displayed to the customer
7. The cheapest option is pre-selected by default:

   ```ruby
   self.ship_method = response.ship_methods.min_by(&:price)
   ```

## How Shipping Rates Are Calculated

The shipping rates calculations involve these key factors:

### 1. Product Information

- **Weight calculation**: Each book's weight is added up
- **Dimensions**: Physical size affects shipping cost
- **Quantity**: Multiple items may qualify for bulk shipping rates
- **Product type**: Different products (books, magazines, etc.) have different shipping requirements

### 2. Destination Information

- **Country and region**: International shipping costs more than domestic
- **Address type**: Residential addresses vs. business addresses may have different rates
- **Distance from printer**: The further away, the more expensive shipping usually is

### 3. Shipping Carrier Selection

The system contacts shipping providers like:

- UPS
- USPS
- FedEx

Each provider returns:

- Available shipping methods (Ground, Express, etc.)
- Cost for each method
- Estimated delivery dates

## Key Components

### 1. Checkout Model

The `Checkout` model is central to the process. It:

- Stores the selected shipping method (`ship_method`)
- Communicates with the shipping service via `get_shipping_service_response`
- Handles shipping address validation

### 2. Shipping Service Client

`Services::ShippingService::Adapters::Blurby` is the client that:

- Takes the printer name, shipping address, line items and currency
- Returns a `ShippingServiceResponse` containing available shipping methods

```ruby
def get_shipping_service_response
  options = build_shipping_service_request_options
  line_items = cart.shippable_line_items
  currency = cart.currency

  shipping_client = Services::ShippingService::Adapters::Blurby.new(printer.name, shipping_address, line_items, currency, options)
  response = shipping_client.get_shipping_service_response
  # ...
  response
end
```

### 3. Carrier-Specific Services

The system has modules for different carriers:

- `Shipping::UPS::Service`
- `Shipping::USPS::Service`
- `Shipping::FedEx::Service`

Each service makes API calls to the respective carrier using XML requests and parses the response to extract shipping rates.

### 4. ShippingCost Model

The `ShippingCost` model is a simple wrapper around a monetary amount:

```ruby
class ShippingCost
  def initialize(cost)
    @cost = cost
  end

  def cost(weight)
    @cost
  end
end
```

## Rate Calculation Factors

Shipping rates are calculated based on several factors:

1. **Product characteristics**:
   - Weight of the items
   - Quantity of books
   - Product type (magazine, trade book, photo book, etc.)
   - Dimensions

2. **Shipping destination**:
   - Country/region (determines shipping region)
   - Address type (residential vs. PO box)
   - Distance from printer

3. **Delivery methods**:
   - Ground, Second Day, Next Day options via `DeliveryMethod`

## Key Tables

1. **checkouts**
   - `ship_method_id`: Reference to selected shipping method
   - `shipping_address_id`: Reference to shipping address
   - `printer_id`: Reference to selected printer

2. **ship_methods**
   - `name`: Display name
   - `price`: Shipping price
   - `carrier`: Shipping carrier
   - `delivery_date`: Estimated delivery date
   - `sort_key`: For ordering display of shipping methods

3. **shipping_fixed_costs** (legacy system)
   - `delivery_method_id`: Reference to delivery method
   - `price`: Cost in cents
   - `currency_id`: Currency
   - `shipping_region_id`: Reference to shipping region
   - `start_unit_range`/`end_unit_range`: Quantity ranges

## Default Selection

After computing all available shipping methods, the system selects the cheapest option by default:

```ruby
def set_shipping_options
  response = get_shipping_options
  self.estimated_ship_date = response.estimated_ship_date
  self.shipping_service_response = response
  self.ship_method = response.ship_methods.min_by(&:price)
end
```

The shipping options are then displayed to the user sorted by their `sort_key` value:

```ruby
@estimates = @checkout.ship_methods.sort_by(&:sort_key)
```

## When Customer Selects a Method

When a customer chooses a shipping method:

1. The method is saved to their checkout record:

   ```ruby
   @checkout.ship_method = ship_method
   @checkout.save!
   ```

2. The order summary updates to reflect the new shipping cost
3. The system recalculates:
   - Total price
   - Tax (which may be based on the shipping method)
   - Estimated delivery date

## Final Checkout Steps

After shipping is confirmed:

1. Shipping cost becomes part of the final order total
2. Order information includes the selected shipping method and estimated delivery date
3. When the order is placed, the printer receives the shipping details

This whole process ensures customers get accurate shipping costs based on their location, what they're buying, and their delivery preferences, while the system optimizes for the best shipping provider and method.
