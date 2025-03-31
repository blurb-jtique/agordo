# Sprint 1 - Arche
2025-02-12

## Tickets

### SUSENG-5 VAT Rate for Norway Incorrectly Applied at Checkout
check https://blurb-books.atlassian.net/browse/PLAT-2413 to see prevous change that force Norway always uses reduced tax
include Norway into the standard rate countries

**[Blurby Taxes and Tax Rates](https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1128366105/Blurby+Taxes+and+Tax+Rates)**
**[Update Tax Rates and Postal Codes in Blurby](https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/15466621/Update+Tax+Rates+and+Postal+Codes+in+Blurby)**
**[Tax Service](https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/17301719/Tax+Service)**

#### Pull Requests
https://github.com/blurb/blurby/pull/6790
https://github.com/blurb/blurby/pull/6789

#### Comments
Issue Summary:
We recently discovered that while the system displays a 25% VAT rate for Norway, orders are incorrectly being charged at a lower 15% rate. This discrepancy affects purchases made through Blurb and needs to be corrected so customers are charged the proper amount.
Actions Taken:
To address this, we reviewed tax rules and adjusted Norway’s classification so that printed-on-demand (POD) items now apply the standard 25% VAT, while digital items are set at zero rate. This update is managed directly within our tax calculation system, which runs during checkout.
Open Screenshot 2025-02-25 at 13.46.38.png
Screenshot 2025-02-25 at 13.46.38.png
Manual Test:
Order including both POD and digital item, the VAT rate was applied to POD + Shipping
Open Screenshot 2025-02-25 at 13.47.16.png
Screenshot 2025-02-25 at 13.47.16.png
https://master.blurb.com/my/account/order_detail/1355595
Next Steps:
The fix is currently being tested with different order scenarios. Additionally, we may need to review VAT settings for other countries to ensure all tax rates are applied correctly.

### SUSENG-4 Norway Shipments Should be Flagged DDP and Not Include VAT Upon Receipt.
DDP (Delivery Duties Paid) is an international shipping term under Incoterms (International Commercial Terms) that means the seller is fully responsible for delivering goods to the buyer, including covering all import duties, taxes, and customs clearance.

**How DDP Works in Real-World Shipping:**
1. Seller Responsibilities (Full Cost Coverage)
    - Shipping Costs (from warehouse to customer).
    - Import Duties & Taxes (VAT, customs fees, import tariffs).
    - Customs Clearance & Documentation (handling necessary import paperwork).
2. Buyer Responsibilities (Minimal or None)
    - The buyer receives the package without additional fees at delivery.
    - No need to pay customs, VAT, or handling fees at import.

**How DDP is Managed in Shipping & E-Commerce:**
At Checkout:
- The seller calculates and collects all duties & taxes in advance.
- Typically, an integrated tax calculator (e.g., Avalara, Zonos, Shopify Duties) ensures compliance.
- The total amount shown at checkout includes VAT/duties.
Logistics & Carrier Handling:
- The seller works with carriers (DHL, FedEx, UPS, local couriers) to ship under DDP terms (not DDU or DAP).
- The shipping label and customs documentation indicate "DDP - Duties Paid."
Accounting & Compliance:
- For tax compliance, sellers register in VOEC (VAT on E-Commerce) for Norway, IOSS for the EU, or other relevant tax schemes.
- VAT & duty amounts are reported and remitted to local tax authorities by the seller.

**Common Issues with DDP**
1. Carrier Mismatch: The shipping carrier may accidentally classify the package as DDU (Delivery Duties Unpaid) instead of DDP.
2. Incorrect Setup in Seller's System: The seller's platform might fail to apply DDP rules for Norway, leading to double VAT charges.
3. Customs Error: Some customs offices still request VAT even if the VOEC/IOSS number is present.
4. Carrier Service Limitation: Not all shipping services support DDP, requiring explicit carrier agreements.

#### Fixing This Issue for Blurby Orders
- Verify Carrier Setup: Check if Norway orders are correctly tagged as DDP with FedEx/DHL/etc.
- Ensure Correct VOEC Compliance: The Norwegian VOEC number should be on all customs documents.
- Cross-Check Checkout Calculations: Confirm that VAT is applied only at checkout, and duties aren't missing from the invoice.
- Coordinate with Product & Finance: Ensure pricing & VAT settings align with the expected DDP setup.

### SUSENG-7 Enable backward compatibility for Ruby gems that enable Postgres connection for Blurby
given the legcay blurby system basedon Rails 2, Ruby 1.9.3 migrate from postgres 11 to postgres 15
SQL compatibility - trace features and changelog - introduce tweaks
did DBA and devops analyse the feasbility?

Legacy Rails 2 + Ruby 1.9.3 → PostgreSQL 15 migration. Requires dependency analysis, backward compatibility fixes, and DBA/DevOps coordination.

### SUSENG-27 EU VAT Invoices Update
Scope of the Issue & Solution

Scope of the Issue:
1. Incorrect VAT Information on Invoices
  - Orders shipped from RPI-EU (Netherlands) are still using the old VAT number (IT 10481991007) instead of the correct VAT number (NL826445640B01).
  - This affects all invoices generated for EU customers when RPI-EU fulfills the order.
2. Manual Work & Risk of Errors
  - Customer support (CS) manually updates VAT numbers when customers request invoices.
  - Risk of human errors, leading to inconsistent VAT details across invoices.
  - Time-consuming process for CS teams.
3. Regulatory Compliance & Tax Reporting Risks
  - The old VAT number is expired and should not be used for tax filings.
  - Failure to update invoices may create reporting discrepancies with EU tax authorities.

Solution Approach:
1. Update Blurby's Invoice System to Use the Correct VAT Number
  - Identify where VAT numbers are stored & retrieved in Blurby's invoicing system.
  - Replace the old VAT number with NL826445640B01 for all future orders shipping from RPI-EU.
  - Ensure that only orders shipping from RPI-EU are affected by this change (not orders fulfilled elsewhere).
2. Decide on Handling Past Invoices (Historical Data)
  - Option 1: Do NOT retroactively change past invoices (most common approach in tax compliance).
  - Invoices are legal documents; modifying past ones could create compliance risks.
  - Instead, provide a manual fix for past orders upon customer request.
  - Option 2: Apply VAT number correction to all past invoices
  - Only if EU tax authorities allow this update retroactively.
  - Would require reissuing affected invoices and potentially notifying customers.
  - Could impact historical tax filings & reconciliation reports.
3. Automate Invoice Generation & Prevent Manual Edits
  - Ensure that new invoices automatically pull the correct VAT number.
  - Remove the need for manual VAT updates by CS, reducing errors.
  - Consider adding an admin override option for CS in case of specific customer disputes.
4. Validate with Finance & Legal Teams
  - **Confirm that changing VAT details on invoices does NOT require customer notification.**
  - **Ensure that updating VAT does NOT alter VAT amounts (only the VAT number).**

Implications of Changing VAT Number

1. Impact on Past Invoices
  - Legal & Compliance Considerations:
    - Invoices are often legally locked after issuance.
    - Retroactively modifying invoices might cause regulatory issues.
  - Accounting & Tax Filings:
    - If old invoices have been used for tax declarations, changing them could trigger audits.
    - Need confirmation from Finance on whether adjustments are permitted.

2. Impact on Upcoming Invoices
  - System Logic Update:
    - Future invoices must automatically use NL826445640B01 for shipments from RPI-EU.
  - Risk of Overwriting Other VAT Settings:
    - **Ensure changes do NOT affect non-EU shipments or blur VAT rules for other regions.**

3. **Does Changing VAT Number Affect VAT Amounts?**
  - No, unless VAT rate rules have changed.
  - If same VAT rate applies, changing only the VAT number does NOT affect total order value.
  - If VAT rates differ by country, verify that the system still applies correct VAT rates based on the destination.

Next Steps & Action Items

✅ Technical Investigation: Identify where VAT numbers are stored & pulled for invoices.
✅ Update System for New Orders: Apply VAT number change to future invoices only.
✅ Decision on Past Invoices: Consult Finance on legal feasibility of retroactive VAT changes.
✅ Prevent Manual Errors: Automate VAT updates in invoices to eliminate CS interventions.
✅ Test & Validate: Ensure changes do not introduce new errors in VAT calculation or invoice formatting.

### SUSENG-26 Determine File Formats for new Avalara Tax Updates used by Blurb Admin Tools

Analysis of the Tax Rate File Update Ticket

Overview of the Ticket

This ticket is about finalizing the correct file format for US and Canadian tax rate updates in the Blurb Support Tools (https://www.blurb.com/admin/tax_rates).

Avalara has provided multiple sample tax rate files with different levels of data granularity, and the Blurb team needs to determine:
1. Which data format should be used for tax calculations.
2. Which tax rate file (highest or lowest per zip) should be implemented based on Finance's decision.
3. How to integrate this into Blurb's tax rate system to ensure accurate taxation.

Key Areas to Address

1. **Tax Rate File Format Finalization**
- Avalara has provided multiple versions of the tax rate file.
- The file format must align with Blurb's existing system, meaning it should only contain necessary fields and exclude unnecessary data.
- Comparison of provided files:
- RPI custom format.xlsx → Proposed file format after Avalara & Blurb's discussion.
- IspiReplacement03-01-23Full.xlsx → Complete dataset (contains all tax rate data).
- IspiReplacement03-01-23Highest per zip.xlsx → Uses the highest tax rate per zip code.
- IspiReplacement03-01-23lowest.xlsx → Uses the lowest tax rate per zip code.
🟢 Action Item:
Compare the RPI custom format.xlsx with Blurb's current format and confirm if it meets requirements or needs modifications.

2. **Selecting the Correct Tax Rate Calculation Method**
- Some US zip codes have multiple tax rates (due to state, county, and city tax variations).
- Blurb must decide whether to charge customers based on the highest or lowest tax rate:
- Highest rate per zip: Ensures Blurb does not undercharge tax but risks overcharging some customers.
- Lowest rate per zip: Ensures Blurb does not overcharge, but risks undercharging in certain areas.
🟢 Action Item:
Finance must confirm which file to use (highest or lowest tax rate per zip).

3. **Blurb System & Historical Data Integration**
- The last tax update process is documented in two PLAT tickets.
- Two additional Excel files (Tax Rate Fields used in Blurb.xlsx and Current Tax Rates.xlsx) contain:
- Previously used tax rate fields.
- Current tax rate data structure in Blurb.
🟢 Action Item:
Check past PLAT tickets and verify if:
- Historical formats were different.
- Any past issues arose with Avalara tax rates.

4. **Removing Legacy Tax Concepts**
- Blurb previously had Reduced vs. Standard US/Canada/Magazine tax rates.
- Now, there are only "Standard" tax rates (except for a few reduced International VAT rates, which can be manually updated).
🟢 Action Item:
Confirm that all references to reduced tax rates are removed from Blurb's system.

Potential Challenges & Risks

✅ File Format Compatibility – Ensure Blurb's tax calculation system can correctly ingest Avalara's new file format.
✅ Accuracy of Tax Rate Selection – Choosing between highest/lowest per zip impacts customer taxation.
✅ Data Validation & Testing – Ensure the new file format does not introduce calculation errors or regressions in tax logic.
✅ Finance Alignment – If Finance delays deciding between highest/lowest per zip, it could delay implementation.

Next Steps & Recommendations
1. Compare Avalara's proposed file format with Blurb's existing system (RPI format vs. Blurb's current structure).
2. Consult Finance to confirm which tax rate file (highest or lowest) should be used.
3. Check past PLAT tickets to identify any issues in prior tax updates.
4. Ensure tax rate changes don't break existing invoicing logic.
5. Remove legacy tax concepts (Reduced vs. Standard tax rates).
6. Validate & Test:
  - Ensure that the new tax rate file correctly calculates VAT and sales tax in the checkout process.
  - Run test transactions in a staging environment before deploying to production.

Conclusion
  - This is a high-impact tax update affecting all US & Canada orders.
  - The main decision point is Finance confirming the highest/lowest tax rate per zip choice.
  - Once confirmed, the technical work involves updating Blurb's tax system to use the new Avalara file format.

#### Comments
**Line Item Types vs searchable columns (the columns used to get the tax rate)**
- POD line item
MagazineTaxRate: country_code
CountryTaxRate: country_code
ReducedCountryTaxRate: country_code
US ZipTaxRate: zip_code
CA ReducedProvenceTaxRate: state_abbrev
CA ProvenceTaxRate: state_abbrev
- Digital line item
ReducedCountryTaxRate: country_code
CountryTaxRate: country_code
US ZipTaxRate: zip_code
CA ReducedProvenceTaxRate: state_abbrev
- Printable product line item
CountryTaxRate: country_code
ReducedCountryTaxRate: country_code
US ZipTaxRate: zip_code
CA ReducedProvenceTaxRate: state_abbrev
CA ProvenceTaxRate: state_abbrev
- Swatch line item
CountryTaxRate: country_code
US ZipTaxRate: zip_code
CA ProvenceTaxRate: state_abbrev

**Tax Rate Types**
CountryTaxRate
ReducedCountryTaxRate
MagazineTaxRate
ReducedZipTaxRate
ZipTaxRate
ProvenceTaxRate
ReducedProvenceTaxRate

**Available Columns per Tax type**
common/base columns    = ['type', 'total_sales_tax', 'tax_shipping_and_handling_together', 'created_at', 'delete_action', 'display_name']
internatinal country columns   = ['country_name', 'country_code']
provence columns (Canada) = ['state_abbrev']
ZIP columns (US)  = ['zip_code', 'state_abbrev', 'county_name', 'county_number', 'city_name', 'state_sales_tax', 'county_sales_tax', 'city_sales_tax']
aggregated default columns (for remaining cases) = ['country_name', 'country_code', 'display_name', 'zip_code', 'state_abbrev']

### SUSENG-2 Understanding VAT & Shipping in Pricing Calculator

Description:

Blurb's Pricing Calculator currently displays a single total price, which may include VAT and shipping costs. This lack of transparency may:
	1.	Cause customer confusion if they see a higher price than expected at checkout.
	2.	Lead to pricing inconsistencies between the pricing table, invoices, and actual checkout costs.
	3.	Impact sales by deterring potential customers who see a higher upfront cost.

This ticket aims to analyze how VAT and shipping are computed and displayed, and then propose a solution to break out product, shipping, and tax costs for better customer clarity.

Problem Statement:
	•	The Pricing Calculator (on-site) vs. Invoice vs. Checkout Price may show different values due to the inclusion/exclusion of VAT and shipping costs.
	•	Customers may be misled or confused by the displayed total price.
	•	The checkout process may cause "sticker shock", leading to cart abandonment.
	•	Lack of clarity in cost breakdown (product price vs. VAT vs. shipping) creates an inconsistent customer experience.

Business Impact & Risks:

✅ Improves customer trust and transparency in pricing.
✅ Reduces cart abandonment rates by setting clear price expectations early.
✅ Aligns Pricing Calculator with invoices and actual checkout calculations.
❌ Risk: If the calculation logic is not properly understood, changes may introduce new pricing display errors.
❌ Risk: Changing the display format may require design/UI updates on the Pricing Calculator.

Acceptance Criteria & Deliverables:

Step 1: Understand VAT & Shipping Calculations (Investigation Phase)
	•	Identify how VAT & Shipping costs are currently calculated in the Pricing Calculator.
	•	Compare the Pricing Calculator's outputs to actual invoices and checkout totals.
	•	Determine if VAT is always included, conditionally included, or displayed separately based on region.
	•	Check for any past documentation from Vai and Nick outlining previous pricing logic.

Step 2: Propose & Document Clear Calculation Rules
	•	Define the exact formula for Product Price, VAT, and Shipping computation.
	•	Ensure VAT is calculated correctly based on customer location, product type, and applicable tax rates.
	•	Ensure shipping rates are correctly applied based on weight, location, and shipping method.
	•	Document findings for internal reference.

Step 3: Implement Transparent Pricing Display (Engineering Task - Future Sprint)
	•	Modify the Pricing Calculator UI to display Product Price, Shipping, and VAT separately.
	•	Ensure total price is still clearly visible to avoid confusion.
	•	Verify the checkout page, invoices, and pricing table remain consistent.
	•	Validate changes do not conflict with international tax regulations (VOEC, IOSS, etc.).

Sub-Tasks (If Needed)

1️⃣ [SUSENG-2.1] Extract & Analyze VAT/Shipping Logic from Pricing Calculator Code
	•	Review backend logic for how VAT & shipping are computed and displayed.
	•	Identify inconsistencies between pricing table, checkout, and invoices.

2️⃣ [SUSENG-2.2] Compare Pricing Calculator Results to Actual Invoices
	•	Select test cases for different regions (US, EU, UK, Norway).
	•	Validate if VAT and shipping calculations match what customers are actually charged.

3️⃣ [SUSENG-2.3] Locate & Review Past Documentation (Vai & Nick's Work)
	•	Search Confluence, Jira, and Slack archives for past pricing formula references.
	•	Confirm if pricing assumptions have changed since 2022 (Cornerstone project impact?).

4️⃣ [SUSENG-2.4] Propose Updated Pricing Display Format
	•	Draft mockups or wireframes for separating Product, VAT, and Shipping in Pricing Calculator.
	•	Ensure alignment with checkout page format.

5️⃣ [SUSENG-2.5] Validate & Test Proposed Pricing Changes in Staging
	•	Ensure price breakdown is accurate and clear for customers.
	•	Verify VAT & shipping amounts match actual charges on invoices.

6️⃣ [SUSENG-2.6] Deploy & Monitor
	•	Roll out the updated Pricing Calculator with clear cost separation.
	•	Track customer response & support inquiries for confusion or issues.

Dependencies:

🔹 Past Pricing Documentation (from Vai & Nick) – Needed to validate previous logic.
🔹 Finance/Tax Team Input – Ensure VAT handling is compliant with VOEC, IOSS, & local tax rules.
🔹 Engineering Input – Changes may require UI/UX updates to the Pricing Calculator.

Priority:

📌 High – Directly impacts customer experience & checkout conversion rates.

### SUSENG-3 Fix Conflicting VAT Messaging on UK Pricing Calculator

The UK Pricing Calculator currently displays contradictory VAT information, leading to customer confusion.
	•	One section states:
    "Total includes VAT, however does not include shipping."
	•	Another section states:
    "Prices displayed are calculated per unit and do not include taxes and shipping."*

This conflict creates uncertainty for customers about whether VAT is included in the total price. Additionally, Blurb may not be charging VAT for UK orders at all, which requires verification.

This ticket aims to:
	1.	Clarify the VAT policy for UK pricing.
	2.	Standardize the message on the UK Pricing Calculator to align with actual tax practices.

Problem Statement:
	•	Confusing messaging about VAT on the UK Pricing Calculator.
	•	Unclear whether VAT is being charged for UK orders.
	•	Potential legal & compliance risk if VAT handling is incorrect.

Business Impact & Risks:

✅ Improves customer trust and eliminates confusion.
✅ Ensures Blurb's UK VAT compliance is correct & transparent.
✅ Standardizes pricing information across all customer touchpoints.
❌ Risk: If VAT is actually not being charged for UK orders, this could indicate a compliance issue requiring immediate action.
❌ Risk: Leaving the conflicting message unresolved could lead to customer complaints, refunds, or order abandonment.

Acceptance Criteria & Deliverables:

Step 1: Verify Current VAT Handling in UK Orders
	•	Confirm if VAT is being charged or not for UK orders at checkout.
	•	Check checkout, invoices, and order records for UK customers to verify VAT treatment.

Step 2: Standardize VAT Messaging on the Pricing Calculator
	•	Update UK Pricing Calculator text to accurately reflect VAT inclusion/exclusion.
	•	Ensure messaging is consistent across all pricing tables & checkout pages.
	•	Confirm that the updated message aligns with UK VAT compliance.

Step 3: Implement & Validate Changes in Staging
	•	Verify that the new message displays correctly on the UK Pricing Calculator.
	•	Ensure VAT is accurately represented at checkout & invoices.
	•	Cross-check updates with CS team & Finance to prevent further inconsistencies.

Sub-Tasks (If Needed)

1️⃣ [SUSENG-3.1] Investigate VAT Calculation for UK Orders
	•	Review UK orders to determine if VAT is currently charged at checkout.
	•	Confirm UK VAT settings in Blurb's pricing & tax system.

2️⃣ [SUSENG-3.2] Identify All Customer-Facing VAT Messages
	•	Review pricing tables, checkout pages, and invoices to identify VAT-related text.
	•	Ensure consistency across UK and EU customer touchpoints.

3️⃣ [SUSENG-3.3] Propose & Approve Updated VAT Message
	•	Draft a clear, standardized VAT message for the UK Pricing Calculator.
	•	Get approval from Finance & Product teams.

4️⃣ [SUSENG-3.4] Implement Messaging Update on UK Pricing Calculator
	•	Modify the UK Pricing Calculator UI text to remove conflicting statements.
	•	Ensure the update is properly formatted & displays correctly.

5️⃣ [SUSENG-3.5] Validate Changes in Staging & Deploy
	•	Test updated VAT message in staging environment.
	•	Verify no new errors or conflicts appear in checkout & invoices.
	•	Deploy to production once confirmed.

Dependencies:

🔹 Finance Confirmation → Need to verify if VAT is charged for UK orders.
🔹 Product/Marketing Review → Approve new VAT messaging.
🔹 Engineering Implementation → UI update for Pricing Calculator text.

Priority:

📌 High – Customer-facing issue that directly affects sales transparency & VAT compliance.

### SUSENG-10 Fix Pricing Discrepancy in AU Pricing Calculator

The Pricing Calculator is generating higher estimates than the actual cart price for Australian orders.

Example:
	•	Product: 33x28cm Large Landscape, Hardcover, Dust Jacket, Premium Lustre, 124 pages.
	•	Pricing Calculator Estimate: AUD $183.92
	•	Cart Price: AUD $167.20
	•	Difference: AUD $16.72 (overestimated)

This discrepancy can create sticker shock, leading to cart abandonment or incorrect bulk order quotes from the LOS (Large Order Services) team.

This initiative aims to:
	1.	Identify the cause of the discrepancy.
	2.	Align Pricing Calculator estimates with actual cart pricing.

Problem Statement:
	•	The Pricing Calculator overestimates prices for AU orders.
	•	Customers may abandon orders early due to seeing higher estimated costs.
	•	Large Order Services (LOS) may provide inaccurate quotes based on incorrect estimates.

Business Impact & Risks:

✅ Higher checkout completion rates as customers see accurate, lower prices earlier.
✅ More accurate bulk order quotes from LOS.
✅ Improved customer trust and transparency.
❌ Risk: If pricing logic is incorrect, similar issues may exist in other regions.
❌ Risk: Upcoming AU vendor changes could introduce new pricing adjustments.

Acceptance Criteria & Deliverables:

Step 1: Investigate Pricing Calculation for AU Orders
	•	Compare Pricing Calculator logic vs. Cart price logic to identify discrepancies.
	•	Verify whether VAT, shipping, or discounts are applied differently in calculator vs. cart.
	•	Check if AU vendor pricing or markup differences contribute to the issue.

Step 2: Ensure Pricing Calculator Matches Cart Prices
	•	Align pricing formulas across the calculator and checkout system.
	•	Ensure correct currency conversion & regional pricing adjustments.
	•	Validate that any discounts or promotional pricing apply consistently across both systems.

Step 3: Test & Validate Fix in Staging
	•	Confirm Pricing Calculator matches cart prices for various AU products.
	•	Validate calculations across different:
	•	Product types (e.g., Hardcover vs. Softcover).
	•	Page counts & materials (e.g., Premium Lustre vs. Standard).
	•	Shipping methods (Express vs. Standard).
	•	Ensure no unexpected price changes for other regions (US, EU, UK, etc.).

Sub-Tasks (If Needed)

1️⃣ [SUSENG-10.1] Extract & Analyze AU Pricing Logic from Calculator & Cart
	•	Review how prices are generated & modified in both systems.
	•	Identify potential inconsistencies in VAT, shipping, or discounts.

2️⃣ [SUSENG-10.2] Check Impact of AU Vendor Changes on Pricing
	•	Determine if the current AU vendor pricing structure affects this discrepancy.
	•	Assess whether an upcoming vendor change could resolve or worsen the issue.

3️⃣ [SUSENG-10.3] Align Pricing Calculator & Cart Pricing Formulas
	•	Ensure that both systems calculate prices the same way.
	•	Apply corrections if one system rounds values differently than the other.

4️⃣ [SUSENG-10.4] Test Pricing Fix Across Different Order Scenarios
	•	Validate that pricing is correct for different book sizes, formats, and page counts.
	•	Test across multiple regions to ensure no new discrepancies arise.

5️⃣ [SUSENG-10.5] Deploy Fix & Monitor Pricing Accuracy
	•	Roll out the updated Pricing Calculator logic.
	•	Monitor customer feedback & LOS team reports for further inconsistencies.

Dependencies:

🔹 Finance/Tax Team: Verify correct VAT handling for AU orders.
🔹 LOS Team: Ensure bulk order pricing remains accurate & consistent.
🔹 Engineering: Address any issues introduced by the AU vendor change.

Priority:

📌 High – Customer-facing issue that impacts purchase decisions & bulk order accuracy.

## Estimation
### **Refined T-Shirt Estimations for Each SUSENG Ticket**

| **Ticket #**   | **Title** | **Complexity Factors** | **T-Shirt Estimate** |
|--------------|-----------------------------------|-------------------------------------------------|----------------|
| **SUSENG-4**  | **Norway Shipments Should be Flagged DDP & Not Include VAT Upon Receipt** | Mostly a configuration & compliance update, minor engineering work required. Needs testing for checkout calculations. | 🟢 **Small (S)** |
| **SUSENG-5**  | **VAT Rate for Norway Incorrectly Applied at Checkout** | Affects tax calculations; requires review of PLAT-2413, possible system-wide impact if tax rates are applied incorrectly. | 🟡 **Medium (M)** |
| **SUSENG-7**  | **Enable backward compatibility for Ruby gems to support Postgres 15** | Legacy Rails 2 + Ruby 1.9.3 → PostgreSQL 15 migration. Requires dependency analysis, backward compatibility fixes, and DBA/DevOps coordination. | 🔴 **X-Large (XL)** |
| **SUSENG-27** | **EU VAT Invoices Update** | Updating VAT logic for invoicing. Needs Finance approval for retroactive changes, careful handling to avoid compliance issues. | 🟡 **Medium (M)** |
| **SUSENG-26** | **Determine File Formats for Avalara Tax Updates** | Requires Finance decision on tax file format, integration with Blurb's admin tools, validation of tax calculations. | 🟡 **Medium (M)** |
| **SUSENG-2**  | **Understanding VAT & Shipping in Pricing Calculator** | Investigative effort with potential UI/logic updates. Impacts transparency for customers & requires extensive validation. | 🟡 **Medium (M)** |
| **SUSENG-3**  | **Fix Conflicting VAT Messaging on UK Pricing Calculator** | Simple UI fix but requires verification of VAT compliance for UK orders. | 🟢 **Small (S)** |
| **SUSENG-10** | **Fix Pricing Discrepancy in AU Pricing Calculator** | Pricing logic misalignment in Calculator vs. Cart. Vendor pricing changes add complexity, requires detailed validation. | 🔴 **Large (L)** |

---

### **Breakdown of the Most Complex Tickets**

#### **🔴 SUSENG-7 – Enable Backward Compatibility for PostgreSQL Migration (X-Large)**
- **Why?**
  - Migrating from **PostgreSQL 11 → 15** requires **dependency tracing & adjustments** for legacy Rails 2 + Ruby 1.9.3.
  - **Breaking changes** in PostgreSQL must be handled to ensure compatibility.
  - Requires **DBA & DevOps collaboration** for risk mitigation.

---

#### **🔴 SUSENG-10 – Fix Pricing Discrepancy in AU Pricing Calculator (Large)**
- **Why?**
  - The **Pricing Calculator & Cart logic don't match**, likely due to vendor pricing, tax, or currency conversion inconsistencies.
  - Requires detailed **investigation & formula realignment** to match prices across systems.
  - **Vendor pricing changes** may introduce additional complexities.

---

#### **🟡 SUSENG-5 – VAT Rate for Norway Incorrectly Applied at Checkout (Medium)**
- **Why?**
  - Affects tax calculation at checkout, which means **potential compliance risks**.
  - Needs review of **previous changes (PLAT-2413)** to ensure tax rates are applied correctly.
  - Must be tested against **checkout, invoices, and order records**.

---

### **Engineering Hour Estimates Based on a Senior Developer (Recently Onboarded)**

Since the developer is **senior** but **new to the project**, the estimates factor in:
✅ **Onboarding time** – Some learning curve expected.
✅ **Investigation effort** – Reviewing legacy code, tax rules, and system logic.
✅ **Implementation complexity** – Whether changes affect multiple systems or require deep debugging.
✅ **Testing & Validation** – Ensuring fixes do not introduce regressions.

---

### **Estimated Engineering Hours Per Ticket**

| **Ticket #**   | **Title** | **T-Shirt Size** | **Estimated Engineering Hours** |
|--------------|-----------------------------------|----------------|----------------|
| **SUSENG-4**  | **Norway Shipments Should be Flagged DDP & Not Include VAT Upon Receipt** | 🟢 **Small (S)** | **12-16 hours** (2 days) |
| **SUSENG-5**  | **VAT Rate for Norway Incorrectly Applied at Checkout** | 🟡 **Medium (M)** | **24-32 hours** (3-4 days) |
| **SUSENG-7**  | **Enable backward compatibility for Ruby gems to support Postgres 15** | 🔴 **X-Large (XL)** | **80-100 hours** (2-3 weeks) |
| **SUSENG-27** | **EU VAT Invoices Update** | 🟡 **Medium (M)** | **32-40 hours** (4-5 days) |
| **SUSENG-26** | **Determine File Formats for Avalara Tax Updates** | 🟡 **Medium (M)** | **32-40 hours** (4-5 days) |
| **SUSENG-2**  | **Understanding VAT & Shipping in Pricing Calculator** | 🟡 **Medium (M)** | **40-48 hours** (5-6 days) |
| **SUSENG-3**  | **Fix Conflicting VAT Messaging on UK Pricing Calculator** | 🟢 **Small (S)** | **12-16 hours** (2 days) |
| **SUSENG-10** | **Fix Pricing Discrepancy in AU Pricing Calculator** | 🔴 **Large (L)** | **60-72 hours** (1.5-2 weeks) |

---

### **Total Estimated Engineering Effort**
👨‍💻 **Sum of all tasks:** **292 - 364 hours** (~**8-9 weeks of work**)
⏳ **Considering onboarding time**, expect **10 weeks total** for all tickets if handled by one senior dev.

---

### **Priority & Scheduling Suggestions**
- **Week 1-2:** 🟢 **Quick wins** (SUSENG-4, SUSENG-3) → Small tasks to gain project familiarity.
- **Week 3-4:** 🟡 **Medium tasks** (SUSENG-5, SUSENG-27, SUSENG-26) → Tax logic & invoicing fixes.
- **Week 5-6:** 🟡 **More complex tax-related tasks** (SUSENG-2) → Deep dive into Pricing Calculator issues.
- **Week 7-9:** 🔴 **Large Tasks (SUSENG-10, SUSENG-7)** → AU pricing & PostgreSQL migration (heavy tasks).

---

### **Next Steps**
Would you like a **Gantt chart or roadmap** to visualize the workload timeline? 🚀