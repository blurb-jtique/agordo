Useful Artifacts
================

# Product Specs
**File** product_specifications.json

**NOTE** this is not the only file, and sometimes it is necessary to do a mapping process to guarantee data integrity

This JSON file defines **product specifications** for different types of books and print products offered by Blurb. It provides detailed information about book formats, dimensions, cover styles, paper types, and printing rules that is used for BookWright Online. The data is structured to ensure that book files created in **BookWright Online** and processed through **Blurby** adhere to the correct manufacturing guidelines.

---

## **What This JSON Defines**
The JSON contains **product specifications** broken down into these key areas:

1. **Product Identification**
   - Each product has a **`mediaSku`** (e.g., `PhotoBook-7x7-DustJacket-Premium`), which uniquely identifies a book type.
   - It includes **legacy equivalent IDs** to maintain compatibility with older versions of the product catalog.

2. **Compatible SKUs**
   - Each product lists **compatible SKUs** that define variations based on paper type, cover, and binding.
   - Example: A **7x7 Dust Jacket Premium** book supports both **Lustre** and **Matte** paper options.

3. **Printing & Design Rules**
   - **Cover Rules**: Specifies if the book is **softcover, image wrap, or dust jacket**.
   - **Paper Rules**: Includes sheet thickness, whether a spread should be rendered, and minimum spine width requirements.
   - **Trim & Bleed Specifications**: Defines how much of the content might be cut off after printing (e.g., 9px bleed, 18px safe zone).
   - **Page Count Limits**: Defines **minimum and maximum** number of pages, ensuring compatibility with bookbinding constraints.
   - **Spine Width Calculation**: Some books calculate the **spine width dynamically** based on the number of pages.

4. **Size & Dimension Details**
   - Each product has detailed **trim sizes** for the final book.
   - Different **margin types** are specified (e.g., **TIGHT** for dust jackets, **NORMAL** for softcovers).
   - Books have different **width calculation rules**, like `CALCULATED_SOFTCOVER` or `BY_PAGECOUNT_RANGES`.

5. **Special Rules for Trade Books & Layflat Books**
   - **Trade Books**: Have different rules for **black-and-white vs. color**, economy vs. premium paper.
   - **Layflat Books**: Have special **spine width calculations** since they use thick pages and must render spreads.

---

## **How This is Used In BookWright Online:**
- **Dynamic UI Adaptation**:
  - The app can use this JSON to **show valid options** based on the selected book type.
  - Example: If a user selects **7x7 Dust Jacket**, the system will only display compatible paper options (**Lustre, Matte**).

- **Validation & Error Prevention:**
  - Ensures that uploaded PDFs match the required **trim size, page count, and cover type**.
  - Prevents users from adding an **invalid number of pages** (e.g., enforcing a **multiple of 2 or 4** rule).

- **Spine Width Calculation:**
  - Uses the **spine width formulas** in the JSON to show a **real-time preview** of spine thickness.

## **Final Thoughts**
This JSON acts as one of the **source of truth** for all supported **Blurb book types, sizes, and print rules**. It ensures that both **BookWright Online** enforce the correct constraints, preventing issues like misaligned prints, invalid page counts, or incompatible cover selections.

# XSLT translation file

**File** Blurb_Order.xslt

## **Blurb PrintTalk Transformation Rules**
### **1. General Structure & Metadata Handling**
1. Extracts the **Order ID** and maps it to a simplified format.
2. Captures the **Customer Name** and assigns it to the simplified order.
3. Retrieves **Transaction Date** and converts it to a standard format for the printer.
4. Removes unnecessary XML namespaces from the PrintTalk file.

### **2. Product Information & Book Attributes**
5. Extracts **Product Type** (e.g., hardcover, softcover, trade book).
6. Captures **Book Size Dimensions** and translates them into printer-compatible values.
7. Maps **Page Count** from PrintTalk to the simplified format.
8. Converts **Paper Type** to a printer-recognizable standard.
9. Identifies **Binding Type** and simplifies it for printing instructions.
10. Ensures the **Cover Type** (dust jacket, image wrap) is explicitly defined for the printer.

### **3. Pricing & Costs Adjustments**
11. Extracts the **Unit Price** and applies any necessary rounding or formatting.
12. Captures **Total Cost** and ensures it is correctly mapped for invoicing.
13. Removes any unnecessary promotional pricing information that does not affect production.

### **4. Shipping & Logistics**
14. Maps **Shipping Method** (standard, expedited, priority) to printer-friendly labels.
15. Extracts the **Ship-To Address** and converts it into a structured format.
16. Validates **Postal Code Format** to avoid errors in shipping.
17. Ensures **Country Code** follows ISO standard for international printing.

### **5. File & Print Instructions**
18. Extracts the **Print File URL** and verifies it is correctly formatted.
19. Assigns **Unique Print Job IDs** for tracking and processing at the print facility.
20. Removes redundant or extraneous job metadata that does not impact production.

### **6. Quality & Validation Rules**
21. Verifies **Page Alignment** settings for proper printing.
22. Ensures **Color Profile** is properly defined (CMYK or RGB).
23. Checks for any **Special Print Instructions** (e.g., spot UV, embossing) and converts them into a standardized instruction set.
24. Removes any **Unrecognized or Deprecated Fields** from the original PrintTalk data to avoid confusion.

## Transformation Rules Summary
Here are the **explicit transformation rules** derived from the XSLT file that converts **PrintTalk** files into simplified printer instructions.

### **Blurb PrintTalk to Printer Instructions – Transformation Rules**

#### **1. Root-Level Modifications**
1. **Remove XML Namespaces** – Eliminates unnecessary XML namespace attributes from the PrintTalk document.
2. **Rename Root Node** – Changes the root node from `PrintTalk` to a more printer-friendly format (e.g., `PrinterJob`).

#### **2. Order Information Transformations**
3. **Extract `OrderID`** – Maps `PrintTalk/Order/@ID` to `SimplifiedOrder/JobID`.
4. **Map `Customer Name`** – Extracts `PrintTalk/Order/@CustomerName` and maps it to `SimplifiedOrder/Client`.
5. **Convert `Transaction Date`** – Formats `PrintTalk/Order/@DateTime` into `YYYY-MM-DD` format for standardization.
6. **Remove `Unnecessary Attributes`** – Eliminates extra metadata fields that do not impact print production.

#### **3. Product Attributes Transformation**
7. **Extract `Product Type`** – Maps `PrintTalk/Product/@Type` (e.g., Hardcover, Softcover) into `SimplifiedOrder/BookType`.
8. **Convert `Dimensions`** – Transforms `PrintTalk/Product/Size` into printer-ready formats (e.g., inches → mm).
9. **Normalize `Page Count`** – Ensures `PrintTalk/Product/PageCount` is a multiple of 2 for proper binding.
10. **Map `Paper Type`** – Converts `PrintTalk/Product/Material/@Type` into standardized printer-friendly codes.
11. **Transform `Binding Type`** – Maps `PrintTalk/Product/Binding/@Type` into `SimplifiedOrder/Binding`.
12. **Extract `Cover Type`** – Maps `PrintTalk/Product/Cover/@Style` into a simplified format.

#### **4. Pricing & Cost Adjustments**
13. **Extract `Unit Price`** – Maps `PrintTalk/Pricing/@UnitPrice` into `SimplifiedOrder/PricePerUnit`.
14. **Map `Total Cost`** – Converts `PrintTalk/Pricing/@TotalCost` into `SimplifiedOrder/FinalPrice`.
15. **Remove `Discount Data`** – Filters out promotional pricing that does not affect production.

#### **5. Shipping & Logistics Transformation**
16. **Map `Shipping Method`** – Converts `PrintTalk/Shipping/@Method` (e.g., `Expedited`, `Standard`) into `SimplifiedOrder/DeliveryType`.
17. **Extract `Ship-To Address`** – Transforms `PrintTalk/Shipping/Address` into a structured format.
18. **Validate `Postal Code`** – Ensures postal codes are formatted correctly before sending to the printer.
19. **Ensure `Country Code` Standardization** – Converts country codes to ISO 3166 format.

#### **6. File & Print Job Instructions**
20. **Extract `Print File URL`** – Maps `PrintTalk/Files/@SourceURL` to `SimplifiedOrder/PrintFilePath`.
21. **Assign `Print Job ID`** – Generates a unique ID for the print job (`SimplifiedOrder/JobReference`).
22. **Remove `Extraneous Job Metadata`** – Eliminates unnecessary job metadata that does not affect print processing.

#### **7. Print Quality & Validation Rules**
23. **Verify `Page Alignment`** – Ensures correct page margins for printing.
24. **Map `Color Profile`** – Translates `PrintTalk/Product/ColorProfile` into CMYK or RGB values.
25. **Extract `Special Print Instructions`** – Converts `PrintTalk/SpecialInstructions` into a structured list for the printer.
26. **Remove `Unrecognized Fields`** – Deletes deprecated or unused fields from the final print instruction set.