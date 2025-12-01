# Sprint 1 - Arche
2025-02-12

# Tickets

## SUSENG-4 Norway Shipments Should be Flagged DDP and Not Include VAT Upon Receipt.
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

### Fixing This Issue for Blurby Orders
- Verify Carrier Setup: Check if Norway orders are correctly tagged as DDP with FedEx/DHL/etc.
- Ensure Correct VOEC Compliance: The Norwegian VOEC number should be on all customs documents.
- Cross-Check Checkout Calculations: Confirm that VAT is applied only at checkout, and duties aren't missing from the invoice.
- Coordinate with Product & Finance: Ensure pricing & VAT settings align with the expected DDP setup.

### Example orders
- https://www.blurb.com/admin/support/orders/order_detail/12171462
- https://www.blurb.com/admin/support/orders/order_detail/12171433
- https://www.blurb.com/admin/support/orders/order_detail/12171425
- https://www.blurb.com/admin/support/orders/order_detail/12171614

### DDP confluence links
- https://blurb-books.atlassian.net/wiki/pages/viewpageattachments.action?pageId=984252524&preview=%2F984252524%2F984252531%2FIncoterms%20012020%20EN%20Mainfreight%20(1).pdf
- https://blurb-books.atlassian.net/wiki/spaces/OP/pages/524430/Shipping
- https://blurb-books.atlassian.net/wiki/spaces/OP/pages/524453/RPI+Blurb+Ship+Codes
- https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/88117816/Common+SQL+queries+for+customer+support+LI+Rapid+Response+tickets#Process-for-changing-a-small-amount-of-data-on-production-to-fix-a-live-issue

### James conversation
Hey Jim,

Hope you’re doing well. Johan is doing some work on a ticket where we are flagging shipments to Norway as DDP and we had some questions regarding the process on how these countries are selected. Do you have a list of the countries we currently ship items DDP to?

--

Hi Padraic,

I hope You doing well, it has been a long time since I've caught up with you.

For Layflat books that are produced in the United States and are going to Europe, all shipments should be DDP, which means that any import fees should be billed back to Blurb. The reasoning for this is that we were never able to secure a European printer, and we wanted to be competitive in the European market.

We ship DDP to Australia, Canada, and New Zealand.

Specifically, to Norway, only Layflat books from the United States should be flagged DDP, all other shipments should be DDU, which means the recipient would be responsible for any import fees.

For Norway and Switzerland, any books being shipped out of Paro could be subject to import fees, as they are not part of the EU. Most all other shipments out of Paro, going to European countries, are not subject to import fees, except for the UK now as well. All shipments that are shipped out of Paro go DDU.

I hope this answers your question. I'll have limited availability today and tomorrow morning, but I can jump on a quick call tomorrow afternoon if needed.

Please let me know if you're seeing any variance to the situations outlined above.

Thanks,

Jim

## SUSENG-27 EU VAT Invoices Update
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

### Interesting Links

- https://www.blurb.com/admin/support/orders/order_invoice/12188602 0 VAT ireland

## SUSENG-2 Understanding VAT & Shipping in Pricing Calculator

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

## SUSENG-3 Fix Conflicting VAT Messaging on UK Pricing Calculator

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

## SUSENG-10 Fix Pricing Discrepancy in AU Pricing Calculator

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

## SUSENG-50 Add a new binding type (O-binds) to notebooks in Blurby
### Problem Statement or Goal
Investigate and determine the level of effort required to add a new binding type (O-binds) to notebooks in Blurby.

### Description:
Currently, Blurby does not support multiple binding types for notebooks. The goal of this spike is to analyze the necessary changes to the database, UI, pricing structure, and routing logic required to introduce O-bind as an option for notebooks. This new feature is intended to align with an existing SKU offered by MagCloud and ensure smooth integration with UOS for order fulfillment.

### Business or Operational Impact Understood
- Expands product offerings for Blurb users, increasing customer satisfaction.
- Enables new product feature parity with MagCloud, reducing SKU management complexity.
- Ensures scalability for future binding options within the trade book/notebook category.
- Facilitates product differentiation for education and professional use cases.

### Acceptance Criteria & Success Measures
- Documented the structure and conceptual findings
- Created and documented a PoC

### Dependencies
- Collaboration with Product Team (Laura & Rome) for SKU definition.
- Coordination with UOS Team (Melissa) to map attributes correctly.
- Input from Padraic and Customer Support for user experience considerations.
- Review of pricing and cost structures for binding additions.
- Access to Blurby’s database and SKU management system for analysis.

### Estimate & Size Agreed
- Initial research and documentation: 8 story points.
- Potential follow-up tasks for implementation will be determined post-spike.

### No Major Blockers
- No immediate dependencies blocking initial research.
- Coordination with stakeholders will be required for validation and execution.

### Stakeholder Agreement
- Reviewed by Laura (Product), Rome (Product Research), Melissa (UOS Integration), Padraic (Customer Support).
- Approved for sprint inclusion with research findings to determine next steps.

### Interesting links
- https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/82542644/SKU
- https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/2914451473/Internal+Product+Representation+Discovery
- https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/3676995596/SKUs
-