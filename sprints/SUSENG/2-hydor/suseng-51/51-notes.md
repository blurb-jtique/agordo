# Beta Photobook
## https://www.blurb.com/my/dashboard


# After complete on bookwright online...
## https://www.blurb.com/projects/12469056/add_to_cart
## https://www.blurb.com/bookstore/cart
## https://www.blurb.com/my/checkout/shipping
## https://www.blurb.com/my/checkout/billing
## https://www.blurb.com/my/checkout/place_order
## https://www.blurb.com/my/checkout/order_complete/12199850

Your Order Is Complete.
An order confirmation email has been sent. If you do not see this email in your inbox, check your spam or bulk folder.
Order Number

12199850
How to Cancel

Go to your order details page to cancel your order within three hours of placing it. Learn more in the FAQ.




https://www.blurb.com/projects/12469162/add_to_cart
https://www.blurb.com/bookstore/cart
https://www.blurb.com/my/checkout/shipping
https://www.blurb.com/my/checkout/place_order
https://www.blurb.com/my/checkout/order_complete/12200887

Your Order Is Complete.
An order confirmation email has been sent. If you do not see this email in your inbox, check your spam or bulk folder.
Order Number

12200887
How to Cancel

Go to your order details page to cancel your order within three hours of placing it. Learn more in the FAQ.
Purchases

Notebook 3f9a7e6b1c4d80e2 - pocket and trade book
Notebook 3f9a7e6b1c4d80e2
By Johan Tique
Project Type: Trade Book
Project Option: 6×9 in, 15×23 cm
# of Pages: 72
Set up to sell
Sell your book through Blurb or other retailers
If you want more details about this order, view your Order Status.
Not interested in tips, tricks, and promos via email? Unsubscribe anytime.

/admin/support/orders/release_to_bookserve/12200887 - ajax
## suborders
/admin/shipping/update_suborder_service/63037158?service=rush&value=true
https://www.blurb.com/admin/support/orders/submit_sub_order/63037158


```xml
<pt:PrintTalk timeStamp="2023-07-25T15:30:00-08:00" xmlns:pt="http://www.printtalk.org/schema" xmlns:jdf="http://www.CIP4.org/JDFSchema_1_1">
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
                     BusinessID="BS-STD-123456" WebOrderNumber="EC123456"
                     LanguageCode="en" Currency="USD">
      <pt:Pricing Item="Total order" Price="45.99">
        <pt:Pricing Item="Total" Price="42.99"/>
        <pt:Pricing Item="Shipping" Price="3.00"/>
        <pt:Pricing Item="Tax" Price="0.00"/>
      </pt:Pricing>

      <jdf:JDF ID="JDF-Root" Status="Waiting" Type="Product-STANDARD" JobID="job-BS-STD-123456">
        <pt:ResourcePool>
          <!-- Contact Information -->
          <pt:Contact ID="Contact2" ContactTypes="Shipping">
            <pt:Person FirstName="John" FamilyName="Doe">
              <pt:ComChannel ChannelType="Phone" Locator="415-555-1234"/>
              <pt:ComChannel ChannelType="Email" Locator="john.doe@example.com"/>
            </pt:Person>
            <pt:Address Street="123 Main St" City="San Francisco" Region="CA" PostalCode="94105" CountryCode="USA"/>
          </pt:Contact>

          <!-- Delivery Setup -->
          <pt:DeliveryIntent ID="Delivery1" Class="Intent" Status="Available">
            <pt:Method DataType="NameSpan" Preferred="UPS Ground" OriginalMethod="UPS Ground"/>
            <pt:DropIntent>
              <pt:ContactRef rRef="Contact2"/>
              <pt:DropItemIntent Amount="1">
                <pt:ComponentRef rRef="component-book-BS-STD-123456"/>
              </pt:DropItemIntent>
            </pt:DropIntent>
          </pt:DeliveryIntent>

          <!-- Book Component -->
          <pt:Component ID="component-book-BS-STD-123456" ComponentType="FinalProduct" DescriptiveName="Trade Book with Wireo Binding"/>

          <!-- Cover Component -->
          <pt:Component ID="component-cover-BS-STD-123456" ComponentType="Sheet"/>

          <!-- Text Component -->
          <pt:Component ID="component-text-BS-STD-123456" ComponentType="Block"/>

          <!-- Binding Intent for Tradebook with Wireo -->
          <pt:BindingIntent ID="binding-BS-STD-123456" Class="Intent" Status="Available" BindingOrder="Collecting">
            <pt:BindingType DataType="EnumerationSpan" Preferred="6x9wireo"/>
            <WireoBinding>
              <pt:Jacket DataType="EnumerationSpan" Preferred="No Jacket"/>
            </WireoBinding>
            <pt:SpineWidth DataType="IntegerSpan" Preferred="15"/>
          </pt:BindingIntent>

          <!-- Size Intent -->
          <pt:SizeIntent ID="size-BS-STD-123456" Class="Intent" Status="Available">
            <pt:Dimensions DataType="NumberSpan" Range="6.0 9.0" Preferred="6 9"/>
            <pt:Pages DataType="IntegerSpan" Preferred="200"/>
          </pt:SizeIntent>

          <!-- Media Intent for Paper Type -->
          <pt:MediaIntent ID="media-text-BS-STD-123456" Class="Intent" Status="Available">
            <pt:FrontCoatings DataType="EnumerationSpan" Preferred="Uncoated"/>
            <pt:BackCoatings DataType="EnumerationSpan" Preferred="Uncoated"/>
            <pt:StockType DataType="NameSpan" Preferred="ECONOMY-TRADE-BW-MATTE-PAPER">
              <pt:MediaColor DataType="EnumerationSpan" Preferred="White"/>
              <pt:USWeight DataType="NumberSpan" Preferred="70"/>
              <pt:Grade DataType="IntegerSpan" Preferred="1"/>
            </pt:StockType>
          </pt:MediaIntent>

          <!-- Color Intent -->
          <pt:ColorIntent ID="color-text-monochrome-BS-STD-123456" Class="Intent" Status="Available">
            <pt:ColorStandard DataType="NameSpan" Preferred="Monochrome"/>
            <pt:ColorICCStandard DataType="NameSpan" Preferred="SMPT"/>
          </pt:ColorIntent>

          <!-- Art Delivery for Cover -->
          <pt:ArtDeliveryIntent ID="art-cover-BS-STD-123456" Class="Intent" Status="Available">
            <pt:ArtDelivery ArtDeliveryType="DigitalNetwork"/>
            <pt:RunList>
              <pt:LayoutElement>
                <pt:FileSpec URL="https://storage.example.com/cover_123456.pdf" FileVersion="1.0" FileSize="12345678" CheckSum="abcd1234" checksum="abcd1234"/>
              </pt:LayoutElement>
            </pt:RunList>
          </pt:ArtDeliveryIntent>

          <!-- Art Delivery for Text -->
          <pt:ArtDeliveryIntent ID="art-text-BS-STD-123456" Class="Intent" Status="Available">
            <pt:ArtDelivery ArtDeliveryType="DigitalNetwork"/>
            <pt:RunList>
              <pt:LayoutElement>
                <pt:FileSpec URL="https://storage.example.com/text_123456.pdf" FileVersion="1.0" FileSize="87654321" CheckSum="wxyz9876" checksum="wxyz9876"/>
              </pt:LayoutElement>
            </pt:RunList>
          </pt:ArtDeliveryIntent>
        </pt:ResourcePool>

        <pt:ResourceLinkPool>
          <pt:ComponentLink rRef="component-cover-BS-STD-123456" Usage="Input"/>
          <pt:ComponentLink rRef="component-text-BS-STD-123456" Usage="Input"/>
        </pt:ResourceLinkPool>
      </jdf:JDF>
    </pt:PurchaseOrder>
  </pt:Request>
</pt:PrintTalk>
```