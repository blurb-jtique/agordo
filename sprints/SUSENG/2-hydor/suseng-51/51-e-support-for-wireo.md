# Adding Support for Tradebooks with Wireo Binding Type

## PrintTalk helper - first PoC
To add support for tradebooks with a "wireo" binding type, we'll need to make modifications in a few key places. The current system already supports wireo binding for regular books, but may need specific handling for tradebooks.

### Executed Changes

1. **Update `PrintTalkHelper.getPrinterBindingType()` method**

   The current implementation in PrintTalkHelper.java already has special handling for wireo binding, but we should modify it to explicitly support the tradebook + wireo combination:

   ```java
   private String getPrinterBindingType(LineItem item) {
       try {
           Log.info(format("PrintTalkHelper.getPrinterBindingType - GutsPaperType: %s, eccartid: %s",
                   item.getBookOptions().getGutsPaperType().getName().toLowerCase(), item.getOrderItem().getEcCartID()));

           // Check if tradebook with wireo binding
           boolean isTradePaper = item.getBookOptions().getGutsPaperType().isTradePaper();
           boolean isWireo = "wireo".equals(item.getBookOptions().getCoverBindingType().getName());

           if (isTradePaper && isWireo) {
               return "wireo"; // Return wireo for tradebooks with wireo binding
           } else if (isWireo) {
               return "wireo";
           } else if(item.getBlurbBook().isLetter()) {
               return item.getBookOptions().getCoverBindingType().getName();
           } else if (item.getBookOptions().getGutsPaperType().getName().toLowerCase().contains(LAYFLAT_KEYWORD)) {
               return item.getBookOptions().getCoverType().getName() + "-" + LAYFLAT_KEYWORD;
           } else {
               return item.getBookOptions().getCoverType().getName();
           }
       } catch (Exception e) {
           // Error handling...
       }
   }
   ```

2. **Update `PrintTradeBookProcessingData` class**

   Ensure that when the binding type is set for a tradebook, the "wireo" binding type is properly handled:

   ```java
   // In PdfServiceClient.createPrintTradeBookPayload
   processingData.setCoverBindingType(bookOptions.getCoverBindingType().getName());
   ```

3. **Update `createCase` method in PrintTalkHelper.java**

   Add special handling for tradebooks with wireo binding:

   ```java
   private Element createCase(Document doc, LineItem item) throws Exception {
       Element ret = doc.createElement("SpineWidth");
       String bindingType = item.getOrderItem().getBindingType();
       CoverType cT = CoverTypeDao.getCoverTypeByName(bindingType.equalsIgnoreCase("lithowrap") ? "imagewrap" : bindingType);

       boolean isTradeBook = false;
       boolean isWireo = false;

       try {
           isTradeBook = item.getBookOptions().getGutsPaperType().isTradePaper();
           isWireo = "wireo".equals(item.getBookOptions().getCoverBindingType().getName());
       } catch (Exception e) {
           Log.error(format("PrintTalkHelper.createCase - Error determining book properties for eccartid: %s", item.getOrderItem().getEcCartID()));
       }

       if (isTradeBook && isWireo) {
           // Handle tradebook with wireo binding
           ret.setAttribute("DataType", "IntegerSpan");
           ret.setAttribute("Preferred", "0"); // Or appropriate spine width calculation
       } else if (!isTradeBook) {
           // Existing non-tradebook logic
           // ...
       } else {
           // Existing tradebook logic
           // ...
       }

       return ret;
   }
   ```

4. **Update `createBinding` method in PrintTalkHelper.java**

   Ensure that wireo binding for tradebooks is correctly represented in the binding element:

   ```java
   private Element createBinding(Document doc, String id, String title, String author, LineItem item) {
       // Existing code...

       // Update this part to handle tradebook with wireo binding
       boolean isTradePaper = false;
       try {
           isTradePaper = item.getBookOptions().getGutsPaperType().isTradePaper();
       } catch (Exception e) {
           Log.error("Error determining paper type", e);
       }

       String coverBindingType;
       if ("wireo".equals(item.getBookOptions().getCoverBindingType().getName())) {
           // Use WireoBinding instead of PaperBackBinding or HardCoverBinding for wireo
           coverBindingType = "WireoBinding";
       } else if (item.getBookOptions().getCoverBindingType().getName().contains("perfect") ||
               item.getBookOptions().getCoverBindingType().getName().contains("saddle")) {
           coverBindingType = "PaperBackBinding";
       } else {
           coverBindingType = "HardCoverBinding";
       }

       Element hc = doc.createElement(coverBindingType);
       bi.appendChild(hc);

       // Rest of the existing code...
   }
   ```

5. **Verify XML Schema compliance**

Ensure that the PrintTalk XML schema accepts "WireoBinding" as a valid element. If not, we may need to reuse an existing binding element with appropriate attributes to indicate wireo binding.

By implementing these changes, we'll enable proper support for tradebooks with wireo binding in the PrintTalk XML generation process, ensuring that the books are correctly specified when sent to the print vendor.

## Adding Wire-O Binding as a New Cover Type for TradeBooks - Blurby Support
Below are examples of partial modifications that we need to introduce to add this support of wireo as new cover type

### 1. Add the WIRE_O Cover Type to the CoverType Model

First, add the new cover type constant to our `cover_type.rb` file:

```ruby
class CoverType < ProductOption
  WIRE_O = find_or_create_by_name("WIRE_O")

  # Update this to include the new cover type
  def self.COVER_TYPES_WITHOUT_SADDLESTITCH
    [SOFTCOVER, HARDCOVER, IMAGEWRAP, WIRE_O]
  end

  # we'll need to add the binding type info
  def cover_binding_type
    if self == WIRE_O
      "wire_o"
    elsif # our existing conditions
    end
  end
end
```

### 2. Update TradeBook to Support Wire-O

Modify `trade_book.rb` to include Wire-O in the supported cover types:

```ruby
module Products
  class TradeBook < Book
    def self.cover_types
      [CoverType.SOFTCOVER, CoverType.IMAGEWRAP, CoverType.HARDCOVER, CoverType.WIRE_O]
    end

    # we might need to update other methods that depend on cover types
  end
end
```

### 3. Update BookServe Integration

Make sure the BookServe client can handle Wire-O bindings by updating the binding type mapping in `printer.rb`:

```ruby
def get_api_binding_type_value(cover_binding_type)
  case cover_binding_type
  when 'wire_o'
    'wire-o'  # Use whatever value BookServe expects
  when # our existing binding types
  end
end
```

### 4. Add UI Text

Update our localization files to include descriptions for Wire-O binding:

```yml
# In content/text/en/views/books/add_to_cart.yml
en:
  views:
    books:
      add_to_cart:
        product_option_groups:
          descriptions:
            wire_o: "Twin loop metal wire spine that allows pages to lay flat when open."
```

### 5. Update Holding Bin Rules

If we have holding bin rules that depend on cover types, update them:

```ruby
# In app/models/holding_bin/cover_type_rule.rb
module HoldingBin
  class CoverTypeRule
    def check(order)
      # Make sure Wire-O is properly handled in our rules
      # For example, add "WIRE_O" to our condition checks
    end
  end
end
```

### 6. Add Tests

Add or update tests for the Wire-O binding:

```ruby
# In spec/models/products/trade_book_spec.rb
it "should include wire-o in cover types" do
  TradeBook.cover_types.should include(CoverType.WIRE_O)
end

# In spec/models/holding_bin/cover_type_rule_spec.rb
it "should be able to filter orders with wire-o covers" do
  product = create(:product)
  sub_order = create(:sub_order)
  cover_type = CoverType.WIRE_O
  li = make_line_item(sub_order, product, cover_type)
  sub_order.line_items << li

  rule = CoverTypeRule.create!(:condition => "WIRE_O")
  rule.check(sub_order.order).should be_true
end
```

### 7. Add Pricing Information

We'll need to add pricing data for the new binding type, likely in a pricing CSV file or database table.

### 8. Update BookConfiguration Validation

Ensure the `BookConfiguration` class can validate Wire-O as a valid option for tradebooks.

## Risks and Assumptions for Wire-O Binding Implementation

Based on the code in our workspace, here are the key risks and assumptions for implementing Wire-O binding as a new cover type:

### Technical Risks

1. **Printer Support**: Not all printers in our network may support Wire-O binding. our code in `book_serve_client.rb` submits orders to BookServe, but the printer behind BookServe needs to support this binding type.

2. **Testing Coverage**: Adding a new binding type affects multiple systems (pricing, ordering, user interface, validation). Inadequate testing could lead to orders being accepted but failing at print time.

3. **Validation Rules**: The existing validation logic for book dimensions, page counts, and cover types may not accommodate Wire-O's physical constraints. For example, Wire-O may have different minimum/maximum page counts.

### Business Risks

1. **Pricing Structure**: Wire-O binding could likely has different production costs than other bindings. From `pricing_page_controller.rb`, we'll need to create pricing tiers specific to this binding.

2. **User Experience Impact**: Adding a new option could confuse users if not clearly explained. The YML files suggest we have detailed help text for binding types, which would need expansion.

### Assumptions

1. **Material Compatibility**: We're assuming that all paper types currently offered can be used with Wire-O binding. Some paper types might not work well with this binding method.

5. **Content Margins**: We're assuming that our templates and guidelines for content placement will work with Wire-O, but this binding typically requires wider inner margins to account for the binding holes.

## Implementing Tradebook with Wireo Binding Using Cover Type Approach - Bookserve Support

### Example of critical proposed changes

To implement tradebook with wireo binding by treating it as a special cover type (similar to "imagewrap-wireo"), A recommended approach could be:

## 1. Database Schema Update

First, create a migration script to add the new binding configuration:

```sql
-- Add new cover type entry for imagewrap-wireo
INSERT INTO covertype (name, flaps, public_name, bleed)
VALUES ('imagewrap-wireo', 0, 'Wireo-bound tradebook', 27);

-- Get the new covertype ID
SET @new_covertype_id = LAST_INSERT_ID();

-- Add capabilities for the new cover type with tradebook paper types
INSERT INTO coverbindingtypepapercapability (covertypeid, papergroupid, gutspapertypeid, active)
SELECT @new_covertype_id, p.papergroupid, p.id, 1
FROM papertype p
WHERE p.type LIKE '%trade%';
```

## 2. Modify PrintTalkHelper.java

Add a new condition in `getPrinterBindingType()` to handle the special case:

```java
private String getPrinterBindingType(LineItem item) {
    try {
        // Special case for tradebooks with wireo binding
        if (item.getBookOptions().getGutsPaperType().isTradePaper() &&
            "wireo".equals(item.getBookOptions().getCoverBindingType().getName())) {
            return "wireo-tradebook";  // New binding type identifier for RPI
        } else if ("wireo".equals(item.getBookOptions().getCoverBindingType().getName())) {
            return "wireo";
        }
        // Rest of the existing conditions...
    } catch (Exception e) {
        // Error handling...
    }
}
```

## 3. Modify `createBinding()` in PrintTalkHelper.java to Use Custom Element for Wireo Tradebook

```java
private Element createBinding(Document doc, String id, String title, String author, LineItem item) {
    Element bi = doc.createElement("BindingIntent");
    bi.setAttribute("ID", id);
    bi.setAttribute("Class", "Intent");
    bi.setAttribute("Status", "Available");
    bi.setAttribute("BindingOrder", "Collecting");

    Element e = doc.createElement("BindingType");
    e.setAttribute("DataType", "EnumerationSpan");
    String bindingType = getPrinterBindingType(item);
    e.setAttribute("Preferred", item.getBlurbBook().getPrintTalkBookSize() + bindingType);
    bi.appendChild(e);

    // Determine which binding element to use
    boolean isWireoTradebook = item.getBookOptions().getGutsPaperType().isTradePaper() &&
        "wireo".equals(item.getBookOptions().getCoverBindingType().getName());

    String elementType;
    if (isWireoTradebook) {
        // Create a custom element for wireo tradebooks that RPI will recognize
        elementType = "WireoTradeBinding";
    } else if (item.getBookOptions().getCoverBindingType().getName().contains("perfect") ||
               item.getBookOptions().getCoverBindingType().getName().contains("saddle")) {
        elementType = "PaperBackBinding";
    } else {
        elementType = "HardCoverBinding";
    }

    Element bindingElement = doc.createElement(elementType);
    bi.appendChild(bindingElement);

    // The rest of binding element attributes...
```

## 4. Add Custom Integration with RPI's XSLT

Since RPI's XSLT might not recognize our custom elements, create a bridge in SyncRequest.java to translate the concept:

```java
public String xml4PO(OrderGroup og, PrintVendor printer, Connection db, List<OrderItem> orderItems, StringWriter writer) throws Exception {
    // ... existing code ...

    // Special handling for RPI for wireo tradebooks
    if (RPI_PRINTERS_IDENTITY.equalsIgnoreCase(printer.getIdentity())) {
        po.setAttribute("WireoTradeBookCount", countWireoTradeBooks(orderItems));
    }

    // ... rest of the method ...
}

private String countWireoTradeBooks(List<OrderItem> orderItems) {
    int count = 0;
    for (OrderItem item : orderItems) {
        try {
            LineItem lineItem = new LineItem(db, item, true, null, null, false, false);
            if (lineItem.getBookOptions().getGutsPaperType().isTradePaper() &&
                "wireo".equals(lineItem.getBookOptions().getCoverBindingType().getName())) {
                count++;
            }
        } catch (Exception e) {
            Log.error("Error counting wireo tradebooks", e);
        }
    }
    return String.valueOf(count);
}
```

## 5. Modify SKU Generation

Add a special case in `generateProductId` to create distinct SKUs for wireo tradebooks:

```java
public static String generateProductId(LineItem item, BookserveSettingDAO bookserveSettingDAO) {
    // Check for wireo tradebook
    try {
        if (item.getBookOptions().getGutsPaperType().isTradePaper() &&
            "wireo".equals(item.getBookOptions().getCoverBindingType().getName())) {
            return item.getOrderItem().getCoverDesignGUID() + "_" + item.getOrderItem().getBookGUID() + "_" +
                   "wireotrade_" + item.getBookOptions().getGutsPaperType().getAbbrType();
        }
    } catch (Exception e) {
        Log.error("Error generating product ID for wireo tradebook", e);
    }

    // Existing logic...
}
```

## 6. Coordination with RPI's System

The critical part is coordinating with RPI to ensure they recognize and properly handle this new binding type. This requires:

1. Communication with RPI about the new binding type
2. Create a test book with this binding and validate with RPI in their test environment
3. Agreement on the SKU format that will be generated (e.g., `PocketBookWireo_StandardBWMatte_6by9`)

## 7. Update RPI's Map in the XSLT

Request RPI to add a new mapping in their XSLT for wireo tradebooks:

```xml
<xsl:when test="$paperType='STANDARD-TRADE-BW-MATTE-PAPER' and contains($productID,'-WIREO')">
    <xsl:value-of select="'PocketBookWireo'" />
</xsl:when>
```

This approach uses a "trick" where we're representing wireo binding as a specialized cover type rather than just a binding type. This should work as an initial implementation with RPI's systems while maintaining the logical relationship between tradebooks and wireo binding in your codebase.

### Risks Identified

1. **XML Schema Compatibility**
   - Risk: The PrintTalk XML schema might not accept "WireoBinding" as a valid element
   - Mitigation: Verify XML schema or use existing binding elements with attributes to indicate wireo

2. **RPI Print Capability**
   - Risk: RPI might not physically support wireo binding with some tradebook paper types
   - Mitigation: Obtain written confirmation from RPI about this capability before implementation
   - Risk: Special paper weights or sizes might not work with wireo binding
   - Mitigation: Create comprehensive test matrix of all supported combinations

3. **Database Constraints**
   - Risk: Existing database constraints might prevent tradebook-wireo combinations
   - Mitigation: Carefully review schema and create proper migrations

4. **XSLT Transformation**
   - Risk: RPI's XSLT transformation might not properly handle the combination
   - Mitigation: Test XML output against RPI's processor with sample cases

5. **Regression Testing**
   - Risk: Changes could affect existing binding types
   - Mitigation: Extensive regression testing of all binding types

### Clarifications Needed

1. **RPI Production Confirmation**
   - Which are tradebook/notebook paper types that are physically compatible with wireo binding in RPI's production process?
   - What are the exact SKUs RPI expects for these combinations? - dive into custom translators
   - Are there weight or size limitations for this binding type?

2. **PrintTalk Schema**
   - Is "WireoBinding" a valid element in the PrintTalk schema to be created into RPI?
   - If not, what is could be a correct XML representation for wireo binding?

4. **Product Pricing**
   - What is the pricing structure for tradebooks with wireo binding?
   - Are there special surcharges compared to standard tradebook bindings?

5. **Testing Requirements**
   - What specific test cases should be added to the test suite?

# Implementation Approach - Roadmap

## Second PoC (1 week)
1. Modify the translation XSLT file to include new SKU and constraints related to Wire-O.
2. Implement initial code changes in Bookserve to force a notebook to be printed with Wire-O.
3. Validate changes against the sandbox environment.
4. Validate changes against the production environment.
5. Refine initial estimation based on validation results.

## Common Documentation
1. Document SKU impact.
2. Outline possible arrangements of new features.
3. Document the new workflow.

## Bookwright Online
1. Implement and test code changes on the master branch.
2. Update database records.
3. Deploy to production with careful monitoring.

## Bookserve (2-3 weeks)
1. Begin with database migrations to support the new combination.
2. Implement necessary code changes.
3. Add unit tests for XML generation.
4. Create test books for RPI to confirm production capability.
5. Perform end-to-end testing with RPI's test environment.
6. Document the new capability for internal teams.
7. Deploy to production with careful monitoring.

## Blurby (2-3 weeks)
1. Implement and test code changes on the master branch.
2. Update pricing information.
3. Update database records.
4. Implement clear validation rules specific to Wire-O's constraints.
5. Add feature flags to support a limited release for printer validation.
6. Update all client-facing text to explain the Wire-O binding option clearly.
7. Document the new capability for internal teams.
8. Deploy to production with careful monitoring.
