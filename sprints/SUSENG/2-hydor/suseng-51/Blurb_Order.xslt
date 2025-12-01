<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pt="http://www.printtalk.org/schema" xmlns:jdf="http://www.CIP4.org/JDFSchema_1_1" version="1.0" exclude-result-prefixes="pt jdf">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
	<xsl:template match="pt:PrintTalk">
		<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<Order xmlns="http://uos.rpiprint.com/xml/RPIOrderXML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://uos.rpiprint.com/xml/RPIOrderXML http://uos.rpiprint.com/xml/RPIOrderXML-1-0.xsd" version="1.0">
			<xsl:variable name="curProductType">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/jdf:JDF[1]/@Type" />
			</xsl:variable>
			<xsl:variable name="curService">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@Services" />
			</xsl:variable>
			<xsl:variable name="curDiv">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@Division" />
			</xsl:variable>
			<xsl:variable name="langCode">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@LanguageCode" />
			</xsl:variable>
			<xsl:variable name="facilityCode">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@Facility"/>
			</xsl:variable>
			<xsl:variable name="statusURL">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@StatusURL"/>
			</xsl:variable>
			<xsl:variable name="rushCode">
				<xsl:choose>
					<xsl:when test="contains(translate($curService,$smallcase, $uppercase), 'RUSH')">RUSH</xsl:when>
					<xsl:when test="contains(translate($curProductType,$smallcase, $uppercase), '-REPRINT')">REPRINT</xsl:when>
					<xsl:when test="contains(translate($curService,$smallcase, $uppercase), 'AMAZON')">AMAZON</xsl:when>
					<xsl:otherwise />
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="shipPrice">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/pt:Pricing/pt:Pricing[@Item='Shipping']/@Price" />
			</xsl:variable>
			<xsl:variable name="totalRetail">
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/pt:Pricing/pt:Pricing[@Item='Total']/@Price" />
			</xsl:variable>
			<Sender>
				<xsl:value-of select="./pt:Header[1]/pt:From[1]/pt:Credential[1]/pt:Identity[1]" />
			</Sender>
			<xsl:variable name="CustomerID">
				<xsl:choose>
					<xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_BUZZFEED'">BuzzFeed</xsl:when>
					<xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_23ANDME'">23andMe</xsl:when>
					<xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_STORYWORTH'">Storyworth</xsl:when>
					<xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_GENERICCUSTOMER'">GenericCustomer</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./pt:Header[1]/pt:Sender[1]/pt:Credential[1]/pt:Identity[1]" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="CustomerID">
				<xsl:attribute name="Division">
					<xsl:value-of select="$curDiv" />
				</xsl:attribute>
				<xsl:value-of select="$CustomerID" />
			</xsl:element>
			<OrderID>
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@BusinessID" />
			</OrderID>
			<AltOrderID>
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@WebOrderNumber" />
			</AltOrderID>
			<OrderDate>
				<xsl:value-of select="./@timeStamp" />
			</OrderDate>
			<xsl:variable name="countryName" select="./pt:Request/pt:PurchaseOrder/jdf:JDF/pt:ResourcePool/pt:Contact[@ContactTypes='Shipping']/pt:Address/@CountryCode" />
			<xsl:variable name="contactID" select="./pt:Request/pt:PurchaseOrder/jdf:JDF/pt:ResourcePool/pt:Contact[@ContactTypes='Shipping']/@ID"/>
			<xsl:variable name="shipMethodCheck" select="./pt:Request/pt:PurchaseOrder/jdf:JDF/pt:ResourcePool/pt:DeliveryIntent/pt:DropIntent/pt:ContactRef[@rRef=$contactID]/../../pt:Method[1]/@Preferred" />

			<xsl:variable name="shipCode">
				<xsl:choose>
					<xsl:when test="string-length($shipMethodCheck) &gt; 0 
           and (contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDX1PR') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDXINTE') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'NDSFDX') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDXG')
            or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDXES') or contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDXH') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDX1P') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDXPO')
            or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDX2') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDX2AM') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FDXINTF') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'FIMS')
            or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS NEXT DAY AIR') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS STANDARD') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS GROUND')
            or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS EXPRESS SAVER') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS EXPRESS') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS EXPEDITED') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS SECOND DAY AIR')
            or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS2DAYAM') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS1DAYAM') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS1DAYSAVE') or  contains(translate($shipMethodCheck, $smallcase, $uppercase), 'UPS3DAY'))">
						<xsl:value-of select="'DDP'" />
					</xsl:when>
				</xsl:choose>
			</xsl:variable>

			<Priority>
				<xsl:choose>
					<xsl:when test="translate($facilityCode, $smallcase, $uppercase) = 'EIN'">
						<xsl:if test = "string-length($rushCode) &gt; 0">
							<xsl:value-of select="concat($facilityCode, '-', $rushCode)" />
						</xsl:if>
						<xsl:if test = "string-length($rushCode) = 0">
							<xsl:value-of select="concat($facilityCode, $rushCode)" />
						</xsl:if>
					</xsl:when>
					<xsl:when test="translate($facilityCode, $smallcase, $uppercase) = 'FUJI' and (translate($countryName, $smallcase,$uppercase) = 'CA' or translate($countryName, $smallcase,$uppercase) = 'AU' or translate($countryName, $smallcase,$uppercase) = 'NZ'
							  or translate($countryName, $smallcase,$uppercase) = 'AT' or translate($countryName, $smallcase,$uppercase) = 'BE' or translate($countryName, $smallcase,$uppercase) = 'BG' or translate($countryName, $smallcase,$uppercase) = 'CY'
							  or translate($countryName, $smallcase,$uppercase) = 'CZ' or translate($countryName, $smallcase,$uppercase) = 'DK' or translate($countryName, $smallcase,$uppercase) = 'EE'or translate($countryName, $smallcase,$uppercase) = 'FI'
							  or translate($countryName, $smallcase,$uppercase) = 'FR' or translate($countryName, $smallcase,$uppercase) = 'DE' or translate($countryName, $smallcase,$uppercase) = 'GR' or translate($countryName, $smallcase,$uppercase) = 'HU'
							  or translate($countryName, $smallcase,$uppercase) = 'IE' or translate($countryName, $smallcase,$uppercase) = 'IT' or translate($countryName, $smallcase,$uppercase) = 'LV' or translate($countryName, $smallcase,$uppercase) = 'LT'
							  or translate($countryName, $smallcase,$uppercase) = 'LU' or translate($countryName, $smallcase,$uppercase) = 'MT' or translate($countryName, $smallcase,$uppercase) = 'NL' or translate($countryName, $smallcase,$uppercase) = 'PL'
							  or translate($countryName, $smallcase,$uppercase) = 'PT' or translate($countryName, $smallcase,$uppercase) = 'RO' or translate($countryName, $smallcase,$uppercase) = 'SK' or translate($countryName, $smallcase,$uppercase) = 'SI'
							  or translate($countryName, $smallcase,$uppercase) = 'ES' or translate($countryName, $smallcase,$uppercase) = 'SE' or translate($countryName, $smallcase,$uppercase) = 'UK' or translate($countryName, $smallcase,$uppercase) = 'GB')
            and (translate($shipCode,$smallcase,$uppercase)='DDP')">
						<xsl:if test = "string-length($rushCode) &gt; 0">
							<xsl:value-of select="concat($rushCode, '-DDP')" />
						</xsl:if>
						<xsl:if test = "string-length($rushCode) = 0">
							<xsl:value-of select="concat($rushCode, 'DDP')" />
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$rushCode" />
					</xsl:otherwise>
				</xsl:choose>
			</Priority>
			<StatusUrl>
				<xsl:value-of select="$statusURL" />
			</StatusUrl>
			<Currency>
				<xsl:value-of select="./pt:Request[1]/pt:PurchaseOrder[1]/@Currency" />
			</Currency>
			<xsl:choose>
				<xsl:when test="$rushCode = 'REPRINT'">
					<Resubmit />
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$rushCode = 'AMAZON'">
					<Resubmit />
				</xsl:when>
			</xsl:choose>
			<xsl:for-each select="./pt:Request/pt:PurchaseOrder/jdf:JDF/pt:ResourcePool/pt:Contact[@ContactTypes='Shipping']">
				<xsl:variable name="destRef" select="./@ID" />
				<xsl:variable name="shipMethod" select="./../pt:DeliveryIntent/pt:DropIntent/pt:ContactRef[@rRef=$destRef]/../../pt:Method[1]/@Preferred" />
				<Destination>
					<DestinationID>
						<xsl:value-of select="$destRef" />
					</DestinationID>
					<ShipMethod>
						<xsl:value-of select="$shipMethod" />
					</ShipMethod>
					<Language>
						<xsl:value-of select="$langCode" />
					</Language>
					<Facility>
						<xsl:value-of select="$facilityCode"/>
					</Facility>
					<ShipTo>
						<Name>
							<xsl:value-of select="concat(./pt:Person/@FirstName,' ',./pt:Person/@FamilyName)" />
						</Name>
						<xsl:variable name="companyName" select="./pt:Company/@DescriptiveName" />
						<xsl:choose>
							<xsl:when test="string-length($companyName) &gt; 0">
								<Company>
									<xsl:value-of select="$companyName" />
								</Company>
								<Address1>
									<xsl:value-of select="./pt:Address/@Street" />
								</Address1>
								<Address2>
									<xsl:value-of select="./pt:Address/@ExtendedAddress" />
								</Address2>
							</xsl:when>
							<xsl:otherwise>
								<Address1>
									<xsl:value-of select="./pt:Address/@Street" />
								</Address1>
								<Address2>
									<xsl:value-of select="./pt:Address/@ExtendedAddress" />
								</Address2>
								<Address3 />
							</xsl:otherwise>
						</xsl:choose>
						<City>
							<xsl:value-of select="./pt:Address/@City" />
						</City>
						<State>
							<xsl:value-of select="./pt:Address/@Region" />
						</State>
						<Postal>
							<xsl:value-of select="./pt:Address/@PostalCode" />
						</Postal>
						<xsl:variable name="countryVal" select="./pt:Address/@CountryCode" />
						<xsl:variable name="countryCode">
							<xsl:choose>
								<xsl:when test="string-length($countryVal) &gt; 0">
									<xsl:value-of select="$countryVal" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'USA'" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<Country>
							<xsl:value-of select="$countryCode" />
						</Country>
						<Phone>
							<xsl:value-of select="./pt:Person/pt:ComChannel[@ChannelType='Phone']/@Locator" />
						</Phone>
						<Email>
							<xsl:value-of select="./pt:Person/pt:ComChannel[@ChannelType='Email']/@Locator" />
						</Email>
					</ShipTo>
					<xsl:if test = "string-length($shipPrice) &gt; 0">
						<RetailFreightCost>
							<xsl:value-of select="$shipPrice" />
						</RetailFreightCost>
					</xsl:if>
					<xsl:if test = "string-length($totalRetail) &gt; 0">
						<TotalRetail>
							<xsl:value-of select="$totalRetail"/>
						</TotalRetail>
					</xsl:if>
				</Destination>
			</xsl:for-each>
			<xsl:variable name="totalBooks">
				<xsl:value-of select="sum(./pt:Request/pt:PurchaseOrder/jdf:JDF/pt:ResourcePool/pt:DeliveryIntent/pt:DropIntent/pt:DropItemIntent/@Amount)"/>
			</xsl:variable>

			<OrderItems>
				<xsl:for-each select="./pt:Request/pt:PurchaseOrder/jdf:JDF/pt:ResourcePool/pt:DeliveryIntent/pt:DropIntent/pt:DropItemIntent">
					<xsl:variable name="compRef" select="./pt:ComponentRef/@rRef" />
					<xsl:variable name="itemQty" select="./@Amount" />
					<xsl:variable name="productID" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/../pt:BindingIntent/pt:BindingType/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="productDesc" select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/@DescriptiveName" />
					<xsl:variable name="declaredVal" select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/@DeclaredValue" />
					<xsl:variable name="distMethod" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/@DistributionMethod, $smallcase, $uppercase)" />
					<xsl:variable name="macMethod" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/@ManufactureMethod, $smallcase, $uppercase)" />
					<xsl:variable name="pickProductID" select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/@ProductID" />
					<xsl:variable name="productType" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/@ProductType, $smallcase, $uppercase)" />
					<xsl:variable name="itemVal">
						<xsl:choose>
							<xsl:when test="string-length($declaredVal) &gt; 0 and number($declaredVal) = $declaredVal">
								<xsl:value-of select="format-number($declaredVal,'0.00')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'0'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="itemRef" select="./../../../../pt:JDF[pt:ResourcePool/pt:Component[@ID=$compRef]]/@JobPartID" />
					<xsl:variable name="coverRef" select="./../../../../pt:JDF[pt:ResourcePool/pt:Component[@ID=$compRef]]/pt:ResourceLinkPool/pt:ComponentLink[contains(translate(@rRef,$smallcase,$uppercase),'LITHO') or contains(translate(@rRef,$smallcase,$uppercase),'JACKET')]/@rRef" />
					<xsl:variable name="textRef" select="./../../../../pt:JDF[pt:ResourcePool/pt:Component[@ID=$compRef]]/pt:ResourceLinkPool/pt:ComponentLink[contains(translate(@rRef,$smallcase,$uppercase),'TEXT')]/@rRef" />
					<xsl:variable name="pageCount" select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/../pt:SizeIntent/pt:Pages/@Preferred" />
					<xsl:variable name="paperType" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$textRef]/../pt:MediaIntent/pt:StockType/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="colorType" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$textRef]/../pt:ColorIntent/pt:ColorStandard/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="isColor">
						<xsl:choose>
							<xsl:when test="$paperType='TEXT-NOVEL'">true</xsl:when>
							<xsl:otherwise>false</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="bindType">
						<xsl:choose>
							<xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PocketBookDJ'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PocketBookDJ'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-BW-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PocketBookDJ'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PocketBookDJ'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-CREAM-MATTE-PAPER' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PocketBookDJ'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookIW'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-MATTE-PAPER' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookIW'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-BW-MATTE-PAPER' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookIW'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-PAPER' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookIW'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-70-PAPER' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookIW'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-CREAM-MATTE-PAPER' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookIW'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER'">
								<xsl:value-of select="'PocketBookSC'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PhotoBook'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and contains($productID,'-LITHOWRAP-LAYFLAT')">
								<xsl:value-of select="'PhotoBookWrap_Layflat'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PhotoBookWrap'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and $productID = '5X5-SOFTCOVER'">
								<xsl:value-of select="'PhotoBookPB'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and $productID = '8.5X11-PERFECT' and (contains($pickProductID,'sc_magazine') or contains($pickProductID,'softcover_magazine'))">
								<xsl:value-of select="'EconMagazine'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and $productID = '8.5X11-PERFECT' and (not(contains($pickProductID,'sc_magazine')) or not(contains($pickProductID,'softcover_magazine')))">
								<xsl:value-of select="'Magazine'" />
							</xsl:when>
							<xsl:when test="$isColor='true' and contains($productID,'-HARDCOVER')">
								<xsl:value-of select="'PocketBook'" />
							</xsl:when>
							<xsl:when test="$isColor='true' and contains($productID,'-LITHOWRAP-LAYFLAT')">
								<xsl:value-of select="'PocketBookWrap_Layflat'" />
							</xsl:when>
							<xsl:when test="$isColor='true' and contains($productID,'-LITHOWRAP')">
								<xsl:value-of select="'PocketBookWrap'" />
							</xsl:when>
							<xsl:when test="$isColor='true' and $productID = '5X5-SOFTCOVER'">
								<xsl:value-of select="'PhotoBookPB'" />
							</xsl:when>
							<xsl:when test="$isColor='true' and contains($productID,'-SOFTCOVER')">
								<xsl:value-of select="'PocketBookPB'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and $productID = '9X9-WIREO'">
								<xsl:value-of select="'PhotoBook'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and $productID = '9X9-SOFTCOVER'">
								<xsl:value-of select="'PhotoBookPB'" />
							</xsl:when>
							<xsl:when test="$isColor='false' and contains($productID,'-IMAGEWRAP')">
								<xsl:value-of select="'PhotoBookWrap'" />
							</xsl:when>
							<xsl:when test="contains($pickProductID,'wallart')">
								<xsl:value-of select="'WallArt'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'PhotoBookPB'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="formFactor">
						<xsl:choose>
							<xsl:when test="contains($productID,'5X5')">
								<xsl:value-of select="'_5by5'" />
							</xsl:when>
							<xsl:when test="contains($productID,'7X7')">
								<xsl:value-of select="'_7by7'" />
							</xsl:when>
							<xsl:when test="contains($productID,'8X10')">
								<xsl:value-of select="'_8by10'" />
							</xsl:when>
							<xsl:when test="contains($productID,'10X8')">
								<xsl:value-of select="'_10by8'" />
							</xsl:when>
							<xsl:when test="contains($productID,'11X13')">
								<xsl:value-of select="'_XL'" />
							</xsl:when>
							<xsl:when test="contains($productID,'12X12')">
								<xsl:value-of select="'_12by12'" />
							</xsl:when>
							<xsl:when test="contains($productID,'5X8')">
								<xsl:value-of select="'_5by8'" />
							</xsl:when>
							<xsl:when test="contains($productID,'6X9')">
								<xsl:value-of select="'_6by9'" />
							</xsl:when>
							<xsl:when test="contains($productID,'8.25X10.25')">
								<xsl:value-of select="'_8.25by10.25'" />
							</xsl:when>
							<xsl:when test="contains($productID,'8.5X11')">
								<xsl:value-of select="'_8.5by11'" />
							</xsl:when>
							<xsl:when test="contains($productID,'9X9')">
								<xsl:value-of select="'_9by9'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and  (contains($pickProductID,'20x30') or contains($pickProductID,'30x20'))">
								<xsl:value-of select="'_20x30'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and  (contains($pickProductID,'20x24') or contains($pickProductID,'24x20'))">
								<xsl:value-of select="'_20x24'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and contains($pickProductID,'20x20')">
								<xsl:value-of select="'_20x20'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and  (contains($pickProductID,'16x20') or contains($pickProductID,'20x16'))">
								<xsl:value-of select="'_16x20'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and contains($pickProductID,'12x12')">
								<xsl:value-of select="'_12x12'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and  (contains($pickProductID,'11x14') or contains($pickProductID,'14x11'))">
								<xsl:value-of select="'_11x14'" />
							</xsl:when>
							<xsl:when test="contains($productType,'WALLART') and  (contains($pickProductID,'8x10') or contains($pickProductID,'10x8'))">
								<xsl:value-of select="'_8x10'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'UNKNOWN'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="coatingType" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$textRef]/../pt:MediaIntent/pt:FrontCoatings/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="wallartMaterial" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/../pt:FinishIntent/pt:FinishType/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="substrateType">
						<xsl:choose>
							<xsl:when test="$isColor='false' and $productID = '5X5-SOFTCOVER'">
								<xsl:value-of select="'_PremGlossy'" />
							</xsl:when>
							<xsl:when test="$isColor='true' and $productID = '5X5-SOFTCOVER'">
								<xsl:value-of select="'_PremGlossy'" />
							</xsl:when>
							<xsl:when test="$productID = '8.5X11-PERFECT'">
								<xsl:value-of select="''" />
							</xsl:when>
							<xsl:when test="$paperType = 'TEXT-PREMIUM' and $coatingType = 'GLOSSY' and $CustomerID != '23andMe'">
								<xsl:value-of select="'_PremGlossy'" />
							</xsl:when>
							<xsl:when test="$paperType = 'TEXT-PREMIUM' and $coatingType = 'GLOSSY' and $CustomerID = '23andMe'">
								<xsl:value-of select="'_BlazerGloss'" />
							</xsl:when>
							<xsl:when test="$paperType='TEXT-PRO' and $coatingType = 'LUSTRE'">
								<xsl:value-of select="'_ProPhoto'" />
							</xsl:when>
							<xsl:when test="$paperType='TEXT-PRO' and $coatingType = 'SMOOTH'">
								<xsl:value-of select="'_Eggshell'" />
							</xsl:when>
							<xsl:when test="$paperType = 'TEXT-STANDARD' or $paperType = 'TEXT-STANDARD-LAYFLAT'">
								<xsl:value-of select="''" />
							</xsl:when>
							<xsl:when test="$paperType = 'TEXT-PREMIUM'">
								<xsl:value-of select="'_Premium'" />
							</xsl:when>
							<xsl:when test="$isColor = 'true' and $colorType = 'CMYK'">
								<xsl:value-of select="'_Color'" />
							</xsl:when>
							<xsl:when test="$isColor = 'true' and $colorType = 'MONOCHROME'">
								<xsl:value-of select="'_Monochrome'" />
							</xsl:when>
							<xsl:when test="$paperType='TEXT-PRO' and $coatingType = 'LUSTRE'">
								<xsl:value-of select="'_ProPhoto'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-MATTE-PAPER'">
								<xsl:value-of select="'_StandardMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-MATTE-PAPER'">
								<xsl:value-of select="'_EconomyMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-BW-MATTE-PAPER' and not(contains($bindType,'PocketBookDJ') or contains($bindType,'PocketBookIW')) ">
								<xsl:value-of select="'_StandardMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='STANDARD-TRADE-BW-MATTE-PAPER' and (contains($bindType,'PocketBookDJ') or contains($bindType,'PocketBookIW')) ">
								<xsl:value-of select="'_StandardBWMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-PAPER'">
								<xsl:value-of select="'_EconomyBWMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-MATTE-70-PAPER'">
								<xsl:value-of select="'_EconomyBWMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='ECONOMY-TRADE-BW-CREAM-MATTE-PAPER'">
								<xsl:value-of select="'_EconomyBWCreamMatte'" />
							</xsl:when>
							<xsl:when test="$paperType='PRO-UNCOATED-LAYFLAT'">
								<xsl:value-of select="'_ProUncoated'" />
							</xsl:when>
							<xsl:when test="$paperType='PRO-PHOTO-LAYFLAT'">
								<xsl:value-of select="'_ProPhoto'" />
							</xsl:when>
							<xsl:when test="contains($wallartMaterial,'ACRYLIC')">
								<xsl:value-of select="'_Acrylic'" />
							</xsl:when>
							<xsl:when test="$wallartMaterial = 'CANVAS-MATTE'">
								<xsl:value-of select="'_Canvas'" />
							</xsl:when>
							<xsl:when test="$wallartMaterial = 'METAL-GLOSS'">
								<xsl:value-of select="'_Metal'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('UNKNOWN_PAPER_',$paperType)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="endSheetName" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$compRef]/../pt:BindingIntent/pt:HardCoverBinding/pt:EndSheets/pt:MediaColor/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="endSheetType">
						<xsl:choose>
							<xsl:when test="$endSheetName = ''">
								<xsl:value-of select="''" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$endSheetName" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="caseName" select="translate(./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$coverRef]/../pt:MediaIntent[contains(translate(@ID,$smallcase, $uppercase),'-HARDBOARD')]/pt:StockType/pt:MediaColor/@Preferred,$smallcase, $uppercase)" />
					<xsl:variable name="caseType">
						<xsl:choose>
							<xsl:when test="translate($caseName, ' &#x9;&#xD;&#xA;', '') = 'GUNMETAL'">
								<xsl:value-of select="'_Gunmetal'" />
							</xsl:when>
							<xsl:when test="translate($caseName, ' &#x9;&#xD;&#xA;', '') = 'OATMEAL'">
								<xsl:value-of select="'_Oatmeal'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="''" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="quantityVar">
						<xsl:choose>
							<xsl:when test="$distMethod ='FULFILLMENTSTORAGE'">
								<xsl:value-of select="$itemQty" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$itemQty" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="tmpSKU">
						<xsl:value-of select="concat($bindType,$substrateType,$formFactor,$caseType)" />
					</xsl:variable>
					<Item>
						<ItemID>
							<xsl:value-of select="$itemRef" />
						</ItemID>
						<xsl:if test="$distMethod ='FULFILLMENTSTORAGE' or $macMethod = 'PICKPACK'">
							<PickPackID>
								<xsl:value-of select="$pickProductID" />
							</PickPackID>
						</xsl:if>
						<DestinationRef>
							<xsl:value-of select="./../pt:ContactRef[1]/@rRef" />
						</DestinationRef>
						<Sku>
							<xsl:choose>
								<xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_STORYWORTH' and translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKIW_STANDARDMATTE_6BY9'">
									<xsl:value-of select="'PocketBookIW_StandardMatte_6by9_SW'"/>
								</xsl:when>
								<xsl:when test="translate($curDiv, $smallcase, $uppercase) = 'API_STORYWORTH' and translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKIW_ECONOMYBWMATTE_6BY9'">
									<xsl:value-of select="'PocketBookIW_EconomyBWMatte_6by9_SW'"/>
								</xsl:when>
								<xsl:when test="not(translate($facilityCode, $smallcase, $uppercase) = 'EIN') and translate($macMethod, $smallcase, $uppercase)='PICKPACK' and (translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKPB_MONOCHROME_5BY8' or translate($tmpSKU, $smallcase, $uppercase) = 'POCKETBOOKPB_COLOR_5BY8')">
									<xsl:value-of select="'Insert_980227'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$tmpSKU" />
								</xsl:otherwise>
							</xsl:choose>
						</Sku>
						<Quantity>
							<xsl:value-of select="$quantityVar" />
						</Quantity>
						<xsl:if test="$distMethod ='FULFILLMENTSTORAGE'">
							<StoreQuantity>
								<xsl:value-of select="$itemQty" />
							</StoreQuantity>
						</xsl:if>
						<MediaOption>
							<xsl:value-of select="$endSheetType" />
						</MediaOption>
						<xsl:if test="contains($pickProductID,'wall')">
							<Orientation>
								<xsl:choose>
									<xsl:when test="contains($pickProductID,'landscape')">
										<xsl:value-of select="'Landscape'" />
									</xsl:when>
									<xsl:when test="contains($pickProductID,'portrait')">
										<xsl:value-of select="'Portrait'" />
									</xsl:when>
									<xsl:when test="contains($pickProductID,'square')">
										<xsl:value-of select="'Portrait'" />
									</xsl:when>
								</xsl:choose>
							</Orientation>
						</xsl:if>
						<PageCount>
							<xsl:value-of select="$pageCount" />
						</PageCount>
						<xsl:for-each select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$coverRef]/../pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec[1]">
							<xsl:element name="CoverImage">
								<xsl:value-of select="./@URL" />
							</xsl:element>
						</xsl:for-each>
						<xsl:variable name="wallartRef" select="./../../../../pt:JDF[pt:ResourcePool/pt:Component[@ID=$compRef]]/pt:ResourceLinkPool/pt:ComponentLink[contains(translate(@rRef,$smallcase,$uppercase),'ART')]/@rRef" />
						<Images>
							<xsl:choose>
								<xsl:when test="translate($productType, $smallcase, $uppercase) = 'WALLART'">
									<xsl:for-each select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$wallartRef]/../pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec">
										<xsl:element name="Image">
											<xsl:attribute name="PageStart">
												<xsl:value-of select="'1'" />
											</xsl:attribute>
											<xsl:attribute name="PageEnd">
												<xsl:value-of select="$pageCount" />
											</xsl:attribute>
											<xsl:attribute name="Url">
												<xsl:value-of select="./@URL" />
											</xsl:attribute>
											<xsl:attribute name="Rotation">
												<xsl:value-of select="'0'" />
											</xsl:attribute>
										</xsl:element>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="./../../../../pt:JDF/pt:ResourcePool/pt:Component[@ID=$textRef]/../pt:ArtDeliveryIntent/pt:RunList/pt:LayoutElement/pt:FileSpec">
										<xsl:element name="Image">
											<xsl:attribute name="PageStart">
												<xsl:value-of select="'1'" />
											</xsl:attribute>
											<xsl:attribute name="PageEnd">
												<xsl:value-of select="$pageCount" />
											</xsl:attribute>
											<xsl:attribute name="Url">
												<xsl:value-of select="./@URL" />
											</xsl:attribute>
											<xsl:attribute name="Rotation">
												<xsl:value-of select="'0'" />
											</xsl:attribute>
										</xsl:element>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</Images>
						<xsl:choose>
							<xsl:when test="$itemVal != '0'">
								<RetailPrice>
									<xsl:value-of select="$itemVal" />
								</RetailPrice>
							</xsl:when>
							<xsl:when test="contains(translate($facilityCode, $smallcase, $uppercase),'FUJI') and $itemVal = '0' and string-length($totalRetail) &gt; 0">
								<RetailPrice>
									<xsl:value-of select="format-number($totalRetail div $totalBooks,'#.##')" />
								</RetailPrice>
							</xsl:when>
						</xsl:choose>
						<ItemDescription>
							<xsl:value-of select="$productDesc" />
						</ItemDescription>
					</Item>
				</xsl:for-each>
			</OrderItems>
		</Order>
	</xsl:template>
</xsl:stylesheet>