# Changes Required in the XSLT Translator

## 1. **Detect Softcover-Wireo Product Type**

````xsl
<!-- Add after the existing curProductType variable around line 8 -->
<xsl:variable name="isSoftcoverWireo">
    <xsl:choose>
        <xsl:when test="contains(translate($curProductType, $smallcase, $uppercase), 'SOFTCOVER-WIREO')">true</xsl:when>
        <xsl:when test="./pt:Request[1]/pt:PurchaseOrder[1]/jdf:JDF[1]/jdf:JDF[contains(@ID,'jdf-book-')]/pt:ResourcePool/pt:BindingIntent/SoftcoverWireoBinding">true</xsl:when>
        <xsl:otherwise>false</xsl:otherwise>
    </xsl:choose>
</xsl:variable>
````

## 2. **Update bindType Variable**

````xsl
<!-- Modify the bindType variable around line 297 -->
<xsl:variable name="bindType">
    <xsl:choose>
        <!-- Add softcover-wireo detection FIRST -->
        <xsl:when test="$isSoftcoverWireo = 'true'">
            <xsl:value-of select="'SoftcoverWireo'" />
        </xsl:when>

        <!-- All existing conditions remain unchanged -->
        <xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
            <xsl:value-of select="'PocketBookDJ'" />
        </xsl:when>
        <!-- ... rest of existing conditions ... -->
    </xsl:choose>
</xsl:variable>
````

## 3. **Update substrateType Variable**

````xsl
<!-- Modify the substrateType variable around line 424 -->
<xsl:variable name="substrateType">
    <xsl:choose>
        <!-- Add softcover-wireo substrate mapping FIRST -->
        <xsl:when test="$isSoftcoverWireo = 'true'">
            <xsl:choose>
                <xsl:when test="contains($paperType,'ECONOMY-TRADE-BW-MATTE')">_EconomyBWMatte</xsl:when>
                <xsl:when test="contains($paperType,'STANDARD-TRADE-BW-MATTE')">_StandardBWMatte</xsl:when>
                <xsl:when test="contains($paperType,'ECONOMY-TRADE-BW-CREAM-MATTE')">_EconomyBWCreamMatte</xsl:when>
                <xsl:otherwise>_EconomyBWMatte</xsl:otherwise>
            </xsl:choose>
        </xsl:when>

        <!-- All existing conditions remain unchanged -->
        <xsl:when test="$isColor='false' and $productID = '5X5-SOFTCOVER'">
            <xsl:value-of select="'_PremGlossy'" />
        </xsl:when>
        <!-- ... rest of existing conditions ... -->
    </xsl:choose>
</xsl:variable>
````

## 4. **Handle Separate Cover and Interior PDFs**

````xsl
<!-- Replace the CoverImage section around line 590 -->
<xsl:choose>
    <xsl:when test="$isSoftcoverWireo = 'true'">
        <!-- For wireo: get cover PDF from cover JDF -->
        <xsl:for-each select="./../../../../pt:JDF/jdf:JDF[contains(@ID,'jdf-cover-')]/pt:ResourcePool/pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec[1]">
            <xsl:element name="CoverImage">
                <xsl:value-of select="./@URL" />
            </xsl:element>
        </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
        <!-- Existing single PDF logic remains unchanged -->
        <xsl:for-each select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$coverRef]/../pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec[1]">
            <xsl:element name="CoverImage">
                <xsl:value-of select="./@URL" />
            </xsl:element>
        </xsl:for-each>
    </xsl:otherwise>
</xsl:choose>

<!-- Replace the Images section around line 600 -->
<Images>
    <xsl:choose>
        <xsl:when test="$isSoftcoverWireo = 'true'">
            <!-- For wireo: get interior PDF from interior JDF -->
            <xsl:for-each select="./../../../../pt:JDF/jdf:JDF[contains(@ID,'jdf-interior-')]/pt:ResourcePool/pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec">
                <xsl:element name="Image">
                    <xsl:attribute name="PageStart">1</xsl:attribute>
                    <xsl:attribute name="PageEnd"><xsl:value-of select="$pageCount" /></xsl:attribute>
                    <xsl:attribute name="Url"><xsl:value-of select="./@URL" /></xsl:attribute>
                    <xsl:attribute name="Rotation">0</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:when>
        <xsl:when test="translate($productType, $smallcase, $uppercase) = 'WALLART'">
            <!-- Existing wallart logic remains unchanged -->
        </xsl:when>
        <xsl:otherwise>
            <!-- Existing single PDF logic remains unchanged -->
            <xsl:for-each select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$textRef]/../pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec">
                <!-- ... existing logic ... -->
            </xsl:for-each>
        </xsl:otherwise>
    </xsl:choose>
</Images>
````

## 5. **Update SKU Generation**

````xsl
<!-- Add to the Sku section around line 511 -->
<Sku>
    <xsl:choose>
        <!-- Add softcover-wireo SKU mappings FIRST -->
        <xsl:when test="translate($tmpSKU, $smallcase, $uppercase) = 'SOFTCOVERWIREO_ECONOMYBWMATTE_6BY9'">
            <xsl:value-of select="'SoftcoverWireo_EconomyBWMatte_6by9'"/>
        </xsl:when>
        <xsl:when test="translate($tmpSKU, $smallcase, $uppercase) = 'SOFTCOVERWIREO_STANDARDBWMATTE_6BY9'">
            <xsl:value-of select="'SoftcoverWireo_StandardBWMatte_6by9'"/>
        </xsl:when>
        <xsl:when test="translate($tmpSKU, $smallcase, $uppercase) = 'SOFTCOVERWIREO_ECONOMYBWMATTE_5BY8'">
            <xsl:value-of select="'SoftcoverWireo_EconomyBWMatte_5by8'"/>
        </xsl:when>
        <xsl:when test="translate($tmpSKU, $smallcase, $uppercase) = 'SOFTCOVERWIREO_ECONOMYBWCREAMMATTE_6BY9'">
            <xsl:value-of select="'SoftcoverWireo_EconomyBWCreamMatte_6by9'"/>
        </xsl:when>

        <!-- All existing SKU conditions remain unchanged -->
        <xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_STORYWORTH' and translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKIW_STANDARDMATTE_6BY9'">
            <xsl:value-of select="'PocketBookIW_StandardMatte_6by9_SW'"/>
        </xsl:when>
        <!-- ... rest of existing conditions ... -->
    </xsl:choose>
</Sku>
````

# Example Translated RPI OrderXML Output

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Order xmlns="http://uos.rpiprint.com/xml/RPIOrderXML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://uos.rpiprint.com/xml/RPIOrderXML http://uos.rpiprint.com/xml/RPIOrderXML-1-0.xsd" version="1.0">
  <Sender>Blurb</Sender>
  <CustomerID Division="standard">BookServe</CustomerID>
  <OrderID>BLURB-STD-P-63037159</OrderID>
  <AltOrderID>12200888</AltOrderID>
  <OrderDate>2025-03-17T14:30:00-07:00</OrderDate>
  <Priority></Priority>
  <StatusUrl>https://status-callback.blurb.com/order-status</StatusUrl>
  <Currency>USD</Currency>
  <Destination>
    <DestinationID>Contact2</DestinationID>
    <ShipMethod>UPS Ground</ShipMethod>
    <Language>en</Language>
    <Facility>SEA</Facility>
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
    <TotalRetail>47.98</TotalRetail>
  </Destination>
  <OrderItems>
    <Item>
      <ItemID>book-P-45996522</ItemID>
      <DestinationRef>Contact2</DestinationRef>
      <!-- New softcover-wireo SKU -->
      <Sku>SoftcoverWireo_EconomyBWMatte_6by9</Sku>
      <Quantity>1</Quantity>
      <MediaOption></MediaOption>
      <PageCount>48</PageCount>
      <!-- Cover PDF: 2-page spread from cover JDF -->
      <CoverImage>https://production.builder.blurb.com/pdf-processing/files/P17747559-cover-spread-wireo.pdf?Expires=1747319650</CoverImage>
      <Images>
        <!-- Interior PDF: text content only from interior JDF -->
        <Image PageStart="1" PageEnd="48"
               Url="https://production.builder.blurb.com/pdf-processing/files/P17747559-interior-wireo.pdf?Expires=1747319650"
               Rotation="0"></Image>
      </Images>
      <RetailPrice>42.99</RetailPrice>
      <ItemDescription>My Cookbook with Wire-O Binding</ItemDescription>
    </Item>
  </OrderItems>
</Order>
```

## Key Translation Results

### **SKU Generated**: `SoftcoverWireo_EconomyBWMatte_6by9`
- **SoftcoverWireo**: Binding type (matches Sean's pattern)
- **EconomyBWMatte**: Paper substrate for interior
- **6by9**: Form factor

### **Two Separate PDF Files**:
1. **CoverImage**: 2-page spread PDF (back left, front right)
2. **Images**: Interior text content only (no cover pages)

### **No Spine Calculations**:
The translator doesn't need to handle spine width since wireo binding doesn't use traditional spine measurements.

## Implementation Priority

The XSLT changes should be implemented in this order:

1. **Detection logic** (`isSoftcoverWireo` variable)
2. **bindType updates** to recognize softcover-wireo
3. **SKU mapping** to generate correct RPI SKUs
4. **PDF file handling** to extract from correct JDF sections
5. **Testing** with RPI's staging environment