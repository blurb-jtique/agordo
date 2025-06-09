# Example PrintTalk XML for Tradebook with Wireo Binding

Here's an example of what the PrintTalk XML would look like after implementing the "Cover Type Approach" for tradebook with wireo binding:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<pt:PrintTalk timeStamp="2023-09-15T14:30:00-08:00" xmlns:pt="http://www.printtalk.org/schema" xmlns:jdf="http://www.CIP4.org/JDFSchema_1_1">
  <pt:Header>
    <pt:From>
      <pt:Credential>
        <pt:Identity>Blurb</pt:Identity>
      </pt:Credential>
    </pt:From>
    <pt:Sender>
      <pt:Credential>
        <pt:Identity>BookServe</pt:Identity>
      </pt:Credential>
    </pt:Sender>
  </pt:Header>
  <pt:Request>
    <pt:PurchaseOrder AgentID="Blurb1.0" AgentDisplayName="Blurb BookServe 1.3"
                     BusinessID="ORD-123456" WebOrderNumber="EC-987654"
                     LanguageCode="en" Currency="USD" WireoTradeBookCount="1">
      <pt:Pricing>
        <pt:Pricing Item="Total" Price="39.99"/>
        <pt:Pricing Item="Shipping" Price="4.99"/>
        <pt:Pricing Item="Tax" Price="0.00"/>
      </pt:Pricing>

      <jdf:JDF ID="JDF-Root" Status="Waiting" Type="Product-TRADEBOOK" JobID="job-ORD-123456" JobPartID="book-1">
        <pt:ResourcePool>
          <!-- Contact Information -->
          <pt:Contact ID="Contact1" ContactTypes="Shipping">
            <pt:Person FirstName="Jane" FamilyName="Smith">
              <pt:ComChannel ChannelType="Phone" Locator="415-555-9876"/>
              <pt:ComChannel ChannelType="Email" Locator="jane.smith@example.com"/>
            </pt:Person>
            <pt:Address Street="456 Market St" City="San Francisco" Region="CA" PostalCode="94105" CountryCode="USA"/>
          </pt:Contact>

          <!-- Delivery Setup -->
          <pt:DeliveryIntent ID="Delivery1" Class="Intent" Status="Available">
            <pt:Method DataType="NameSpan" Preferred="UPS Ground" OriginalMethod="UPS Ground"/>
            <pt:DropIntent>
              <pt:ContactRef rRef="Contact1"/>
              <pt:DropItemIntent Amount="1">
                <pt:ComponentRef rRef="component-book-1"/>
              </pt:DropItemIntent>
            </pt:DropIntent>
          </pt:DeliveryIntent>

          <!-- Book Components -->
          <pt:Component ID="component-book-1" ComponentType="FinalProduct"
                      DescriptiveName="My Trade Book with Wireo Binding"
                      ProductType="Book"
                      ProductID="tradebook_wireo_6x9"
                      DeclaredValue="39.99"/>

          <pt:Component ID="component-cover-1" ComponentType="Sheet"/>
          <pt:Component ID="component-text-1" ComponentType="Block"/>

          <!-- Binding Intent - The key customization for wireo tradebook -->
          <pt:BindingIntent ID="binding-1" Class="Intent" Status="Available" BindingOrder="Collecting">
            <pt:BindingType DataType="EnumerationSpan" Preferred="6x9wireo-tradebook"/>
            <!-- Custom element for tradebook with wireo binding -->
            <WireoTradeBinding>
              <pt:Jacket DataType="EnumerationSpan" Preferred="No Jacket"/>
            </WireoTradeBinding>
            <pt:SpineWidth DataType="IntegerSpan" Preferred="12"/>
          </pt:BindingIntent>

          <!-- Size Intent -->
          <pt:SizeIntent ID="size-1" Class="Intent" Status="Available">
            <pt:Dimensions DataType="NumberSpan" Preferred="6 9"/>
            <pt:Pages DataType="IntegerSpan" Preferred="180"/>
          </pt:SizeIntent>

          <!-- Media Intent for tradebook paper type -->
          <pt:MediaIntent ID="media-text-1" Class="Intent" Status="Available">
            <pt:FrontCoatings DataType="EnumerationSpan" Preferred="Matte"/>
            <pt:BackCoatings DataType="EnumerationSpan" Preferred="Matte"/>
            <pt:StockType DataType="NameSpan" Preferred="ECONOMY-TRADE-BW-MATTE-PAPER">
              <pt:MediaColor DataType="EnumerationSpan" Preferred="White"/>
            </pt:StockType>
          </pt:MediaIntent>

          <!-- Color Intent -->
          <pt:ColorIntent ID="color-text-1" Class="Intent" Status="Available">
            <pt:ColorStandard DataType="NameSpan" Preferred="MONOCHROME"/>
          </pt:ColorIntent>

          <!-- Art Delivery for Cover -->
          <pt:ArtDeliveryIntent ID="art-cover-1" Class="Intent" Status="Available">
            <pt:ArtDelivery ArtDeliveryType="DigitalNetwork"/>
            <pt:RunList>
              <pt:LayoutElement>
                <pt:FileSpec URL="https://storage.blurb.com/covers/123456_cover.pdf"/>
              </pt:LayoutElement>
            </pt:RunList>
          </pt:ArtDeliveryIntent>

          <!-- Art Delivery for Text -->
          <pt:ArtDeliveryIntent ID="art-text-1" Class="Intent" Status="Available">
            <pt:ArtDelivery ArtDeliveryType="DigitalNetwork"/>
            <pt:RunList>
              <pt:LayoutElement>
                <pt:FileSpec URL="https://storage.blurb.com/texts/123456_text.pdf"/>
              </pt:LayoutElement>
            </pt:RunList>
          </pt:ArtDeliveryIntent>
        </pt:ResourcePool>

        <pt:ResourceLinkPool>
          <pt:ComponentLink rRef="component-cover-1" Usage="Input"/>
          <pt:ComponentLink rRef="component-text-1" Usage="Input"/>
        </pt:ResourceLinkPool>
      </jdf:JDF>
    </pt:PurchaseOrder>
  </pt:Request>
</pt:PrintTalk>
```

## Key Customizations for Wireo Tradebook

1. **Purchase Order Attributes**:
   - Added `WireoTradeBookCount="1"` attribute to identify the special binding type

2. **Binding Type Element**:
   - Used `<pt:BindingType Preferred="6x9wireo-tradebook"/>` to specify the format with wireo binding

3. **Custom Binding Element**:
   - Created a `<WireoTradeBinding>` element instead of using standard `<PaperBackBinding>` or `<HardCoverBinding>`

4. **Product ID**:
   - `ProductID="tradebook_wireo_6x9"` to clearly identify the product type

5. **Paper Type**:
   - Used `<pt:StockType Preferred="ECONOMY-TRADE-BW-MATTE-PAPER">` to indicate this is a tradebook paper

When this XML is processed through the XSLT transformation for RPI, it would be converted to their expected format with the appropriate SKU like `PocketBookWireo_EconomyBWMatte_6by9`, allowing RPI to correctly identify and produce the book with the right binding method and paper type.

### Spine Width in PrintTalk XML for Wireo Binding

For a wireo-bound book, there isn't a traditional spine like in perfect-bound or case-bound books. However, the `SpineWidth` element in the PrintTalk XML still serves an important purpose for several reasons:

#### Why SpineWidth is Still Needed for Wireo Binding

1. **Production Requirements**:
   - Even though wireo-bound books don't have a "spine" in the traditional sense, the printer still needs to know how thick the book will be when closed for production planning
   - This affects the size of the wire-o coil that needs to be used

2. **XML Schema Compliance**:
   - The PrintTalk XML schema may require the `SpineWidth` element as part of the `BindingIntent` structure
   - Omitting it could cause validation errors

3. **Packaging Requirements**:
   - The total thickness of the book affects packaging dimensions and shipping calculations

#### How to Handle SpineWidth for Wireo Bindings

Looking at the `createCase()` method in your PrintTalkHelper.java, there's a specific approach for tradebooks:

```java
private Element createCase(Document doc, LineItem item) throws Exception {
    Element ret = doc.createElement("SpineWidth");
    // ...

    if (!isTradeBook) {
        // Standard books use an enumeration approach
        CoverSize coverSize = CoverSizeDao.getCoverSizeByCoverTypeAndBookType(...);
        ret.setAttribute("DataType", "EnumerationSpan");
        ret.setAttribute("Preferred", coverSize.getCasebreak());
    } else {
        // Trade books use a numeric value for spine width
        CoverSize coverSize = CoverSizeDao.getCoverSizeByCoverTypeAndBookTypeAndCoverBindingType(...);
        ret.setAttribute("DataType", "IntegerSpan");
        ret.setAttribute("Preferred", String.valueOf(coverSize.getSpineWidth()));
    }

    return ret;
}
```

For wireo tradebooks:

1. **Keep the SpineWidth element** but modify how it's represented
2. Use `DataType="IntegerSpan"` as you would for tradebooks
3. The value should represent the total thickness of the text block when closed

#### Recommended Approach

For wireo tradebooks, I recommend modifying `createCase()` to include a special case:

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

    if (isWireo) {
        // For wireo binding, use thickness of text block without cover
        // This helps determine the correct wire size needed
        int pageCount = item.getBlurbBook().getPublishedBook().getPageCount();
        double paperThickness = getPaperThicknessPerPage(item.getBookOptions().getGutsPaperType());
        int spineWidthMils = (int)(pageCount * paperThickness);

        ret.setAttribute("DataType", "IntegerSpan");
        ret.setAttribute("Preferred", String.valueOf(spineWidthMils));
    } else if (!isTradeBook) {
        // Standard books use an enumeration approach
        // ...existing code...
    } else {
        // Trade books use a numeric value for spine width
        // ...existing code...
    }

    return ret;
}

// Helper method to determine paper thickness
private double getPaperThicknessPerPage(PaperType paperType) {
    // Paper thickness in mils (thousandths of an inch) per page
    // These are approximate values - adjust based on actual measurements
    switch(paperType.getName()) {
        case "ECONOMY-TRADE-BW-MATTE-PAPER": return 2.0;
        case "STANDARD-TRADE-BW-MATTE-PAPER": return 2.5;
        case "ECONOMY-TRADE-BW-CREAM-MATTE-PAPER": return 2.0;
        default: return 2.0; // Default fallback
    }
}
```

## XSLT Modifications for Tradebook with Wire-O Support

To add support for tradebook with wire-o binding in the RPI XSLT translator file, we'll need to make the following changes to `Blurb_Order.xslt`:

```xsl
<!-- 1. Add new variable to detect wireo tradebook from WireoTradeBookCount attribute -->
<xsl:variable name="wireoTradeBookCount">
    <xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@WireoTradeBookCount" />
</xsl:variable>

<!-- 2. Add special condition in the bindType variable for tradebooks with wireo binding -->
<xsl:variable name="bindType">
    <xsl:choose>
        <!-- Add these new conditions at the very beginning of the choose block -->
        <xsl:when test="contains($productID,'-WIREO-TRADEBOOK') or
                      (contains($productID,'-WIREO') and
                       ($paperType='STANDARD-TRADE-MATTE-PAPER' or
                        $paperType='ECONOMY-TRADE-MATTE-PAPER' or
                        $paperType='STANDARD-TRADE-BW-MATTE-PAPER' or
                        $paperType='ECONOMY-TRADE-BW-MATTE-PAPER' or
                        $paperType='ECONOMY-TRADE-BW-CREAM-MATTE-PAPER'))">
            <xsl:value-of select="'PocketBookWireo'" />
        </xsl:when>

        <!-- Existing conditions remain as they are -->
        <xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
            <xsl:value-of select="'PocketBookDJ'" />
        </xsl:when>
        <!-- ... rest of existing conditions ... -->
    </xsl:choose>
</xsl:variable>

<!-- 3. Add special condition in the Sku element for wireo tradebook special overrides -->
<Sku>
    <xsl:choose>
        <!-- Add this new condition at the beginning -->
        <xsl:when test="translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKWIREO_STANDARDBWMATTE_6BY9'">
            <xsl:value-of select="'PocketBookWireo_StandardBWMatte_6by9'"/>
        </xsl:when>
        <xsl:when test="translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKWIREO_ECONOMYBWMATTE_6BY9'">
            <xsl:value-of select="'PocketBookWireo_EconomyBWMatte_6by9'"/>
        </xsl:when>

        <!-- Existing conditions remain as they are -->
        <xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_STORYWORTH' and translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKIW_STANDARDMATTE_6BY9'">
            <xsl:value-of select="'PocketBookIW_StandardMatte_6by9_SW'"/>
        </xsl:when>
        <!-- ... rest of existing conditions ... -->
    </xsl:choose>
</Sku>

<!-- 4. Add special handling for WireoTradeBinding element in bindingType detection -->
<!-- This would go in the part where you extract the binding type, around line 661-664 -->
<xsl:variable name="bindingType">
    <xsl:choose>
        <xsl:when test="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/../pt:BindingIntent/WireoTradeBinding">
            <xsl:value-of select="'wireo-tradebook'"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/../pt:BindingIntent/pt:BindingType/@Preferred"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>
```

These changes will:

1. Detect the special `WireoTradeBookCount` attribute in the PrintTalk XML
2. Add special handling for wireo binding when combined with tradebook paper types
3. Map this combination to a new SKU pattern "PocketBookWireo_[PaperType]_[FormFactor]"
4. Detect the presence of `WireoTradeBinding` element in the XML

This ensures that when the PrintTalk XML contains the wireo binding information for tradebooks, it will be properly translated to the correct SKU in RPI's order format.

The modifications are designed to preserve all existing functionality while adding support for the new binding type. These changes assume that RPI has agreed to support the "PocketBookWireo" binding type and has the appropriate manufacturing capability configured.

### Difference Between Trade Books and Pocket Books in PrintTalk Integration

Looking at the codebase, particularly [`BlurbBook.java`](bookserve_core/src/main/java/com/blurb/bookserve/books/BlurbBook.java ) and [`PrintTalkHelper.java`]PrintTalkHelper.java ), I can explain the key differences between trade books and pocket books and why the examples use "PocketBook" in the SKUs:

#### Trade Books vs. Pocket Books

##### Size Difference

```java
// From BlurbBook.java
public String getBlurbBookType() {
    if (bookType.equalsIgnoreCase("5by8")) return KIND_POCKET;
    // ...
    if (bookType.equalsIgnoreCase("6by9")) return KIND_TRADE;
    // ...
}
```

1. **Trade Books** (6x9 inches):
   - Standard size for non-fiction, academic books, and many fiction titles
   - Called "trade" because they're the traditional size sold in bookstores
   - In the system, these use `KIND_TRADE`

2. **Pocket Books** (5x8 inches):
   - Smaller format books, similar to mass market paperbacks
   - More compact and typically less expensive to produce
   - In the system, these use `KIND_POCKET`

#### Why PocketBook in SKUs?

The reason the examples used "PocketBook" in the SKUs despite talking about tradebooks with wireo binding is because of how RPI's XSLT transformation works:

1. **In the XSLT mapping logic**, there's a pattern where different binding types map to product lines rather than physical dimensions:

   ```xsl
   <xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
       <xsl:value-of select="'PocketBookDJ'" />
   </xsl:when>
   ```

2. **"PocketBook" is a product line designation**, not necessarily indicating the physical size:
   - `PocketBookDJ` = Hardcover books with dust jacket (could be trade size)
   - `PocketBookIW` = Books with image wrap (could be trade size)
   - `PocketBookPB` = Paperback books (could be trade size)
   - `PocketBookWireo` = Wireo-bound books (could be trade size)

3. **Looking at the binding type detection** in [`PrintTalkHelper.java`]PrintTalkHelper.java ):

   ```java
   <xsl:variable name="bindType">
       <xsl:choose>
           <xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
               <xsl:value-of select="'PocketBookDJ'" />
           </xsl:when>
           <xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
               <xsl:value-of select="'PocketBookDJ'" />
           </xsl:when>
           <!-- Many more mappings... -->
       </xsl:choose>
   </xsl:variable>
   ```

   Even though these are trade papers (`ECONOMY-TRADE-BW-MATTE-PAPER`), they map to product lines starting with "PocketBook"

#### The Critical Distinction in PrintTalk XML

For RPI's system, the important elements are:

1. **Paper Type**: Indicates if it's trade paper (`ECONOMY-TRADE-BW-MATTE-PAPER`)
2. **Form Factor**: The actual size (like `_6by9` for trade books)
3. **Binding Type**: How the book is bound (`PocketBookWireo`)

Therefore, a tradebook (6x9) with wireo binding and economy paper would be:

```text
PocketBookWireo_EconomyBWMatte_6by9
```

Where:

- `PocketBookWireo` = Product line (not physical size)
- `EconomyBWMatte` = Paper type
- `_6by9` = Actual size (trade book size)

This naming convention in RPI's system is somewhat confusing because "PocketBook" doesn't literally mean a pocket-sized book, but rather refers to a product line or manufacturing process designation in their system.

## Example of Translated PrintTalk XML for RPI with Wireo Tradebook Support

Here's an example of how the PrintTalk XML for a tradebook with wireo binding would be translated by RPI's XSLT into their native order format:

### RPI OrderXML (After XSLT Transformation)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Order xmlns="http://uos.rpiprint.com/xml/RPIOrderXML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://uos.rpiprint.com/xml/RPIOrderXML http://uos.rpiprint.com/xml/RPIOrderXML-1-0.xsd" version="1.0">
  <Sender>Blurb</Sender>
  <CustomerID Division="standard">BookServe</CustomerID>
  <OrderID>ORD-123456</OrderID>
  <AltOrderID>EC-987654</AltOrderID>
  <OrderDate>2023-09-15T14:30:00-08:00</OrderDate>
  <Priority></Priority>
  <StatusUrl>https://status-callback.blurb.com/order-status</StatusUrl>
  <Currency>USD</Currency>
  <Destination>
    <DestinationID>Contact1</DestinationID>
    <ShipMethod>UPS Ground</ShipMethod>
    <Language>en</Language>
    <Facility>ATL</Facility>
    <ShipTo>
      <Name>Jane Smith</Name>
      <Address1>456 Market St</Address1>
      <Address2></Address2>
      <City>San Francisco</City>
      <State>CA</State>
      <Postal>94105</Postal>
      <Country>USA</Country>
      <Phone>415-555-9876</Phone>
      <Email>jane.smith@example.com</Email>
    </ShipTo>
    <RetailFreightCost>4.99</RetailFreightCost>
    <TotalRetail>39.99</TotalRetail>
  </Destination>
  <OrderItems>
    <Item>
      <ItemID>book-1</ItemID>
      <DestinationRef>Contact1</DestinationRef>
      <!-- This is the newly supported SKU for wireo tradebooks -->
      <Sku>PocketBookWireo_EconomyBWMatte_6by9</Sku>
      <Quantity>1</Quantity>
      <MediaOption></MediaOption>
      <PageCount>180</PageCount>
      <CoverImage>https://storage.blurb.com/covers/123456_cover.pdf</CoverImage>
      <Images>
        <Image PageStart="1" PageEnd="180" Url="https://storage.blurb.com/texts/123456_text.pdf" Rotation="0"></Image>
      </Images>
      <RetailPrice>39.99</RetailPrice>
      <ItemDescription>My Trade Book with Wireo Binding</ItemDescription>
    </Item>
  </OrderItems>
</Order>
```

### Key Aspects of the Translation

1. **SKU Generation**:
   - The most important aspect is the SKU `PocketBookWireo_EconomyBWMatte_6by9`
   - This combines the binding type (`PocketBookWireo`), paper type (`EconomyBWMatte`), and format (`6by9`)

2. **Item Classification**:
   - Even though this is a tradebook with wireo binding, it's classified under the `PocketBookWireo` product line
   - This allows RPI to use their existing manufacturing workflow with the correct binding type

3. **Media Options and Finishings**:
   - No special media options are specified since standard tradebook paper is used
   - The wireo binding is fully communicated through the SKU

4. **Page Count**:
   - The page count is preserved (180 pages)
   - For wireo binding, this is particularly important as it affects the spine width and wire size

This translation ensures that RPI's production system receives all necessary information to produce a tradebook with wireo binding. The SKU is the primary carrier of this information, combining product type, paper type, and size in a format that RPI's systems understand.

The resultant printed output would be a 6x9 inch book with economy black and white matte paper, bound with wireo binding - creating a book that lays flat when opened, while maintaining the paper quality and dimensions of a standard tradebook.
