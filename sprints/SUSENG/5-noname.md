# SPRINT 5 - NONAME

Advance high-priority marketing initiatives by focusing on actionable investigations—Swatch Kits, Glossy/Matte cover types, and Wire-O binding support—alongside our groomed backlog. At the same time, initiate strategic alignment by drafting a 6–9 month roadmap framework to guide efforts in modernization, sustainability, new product/features, and AfterShip migration, based on evolving team capacity and upcoming resource additions.

## EPIC: Migrate AfterShip Integration to Latest API Version Before Sunset Date

### Description

As part of sustaining engineering efforts for legacy Blurby and MagCloud systems, we must upgrade the AfterShip integration used by the **Tracking Service** to the latest supported version before the **sunset date of October 9th, 2025**. The current legacy API (version 2.0.8, likely V2) will be deprecated and no longer supported, and we’ve received formal notice from AfterShip that continued use may result in service disruptions.

The **Tracking Service** receives callbacks from RPI and other sources and is responsible for forwarding shipping information to AfterShip, which in turn integrates with SailThru via Email Service to notify customers about shipping status. It also powers the public-facing tracking page (`tracking.blurb.com`), which is a branded AfterShip-hosted page.

---

### Problem Statement / Goal

- Ensure continuity of shipping tracking and notifications across Blurby and MagCloud
- Avoid potential service disruptions post-sunset
- Stay compliant with AfterShip’s deprecation timeline

---

### Business or Operational Impact

- High customer experience risk if upgrade is not completed in time (loss of shipment tracking visibility)
- Potential email notification failures due to improper SailThru integrations if callback format changes
- Risk of unsupported production usage if stuck on a deprecated SDK version

---

### Acceptance Criteria

- [ ] Latest AfterShip SDK version (v8+) is integrated into the Tracking Service
- [ ] All current use cases—`create`, `fetch`, and `callback`—are verified against the new API
- [ ] Legacy webhook endpoint `/callback` is validated to ensure compatibility or refactored as needed
- [ ] Unit tests are updated and all pass successfully
- [ ] Integration test (currently disabled) is enabled and passes with real sandbox API key
- [ ] Successful tracking request is visible in AfterShip’s **"Blurby Testing"** sandbox environment
- [ ] No regressions in Sumo Logic / Email Service logs post-deployment
- [ ] Admin credentials and API key are securely stored (e.g., Vault, Keeper)
- [ ] SailThru integration continues to receive proper tracking data via Email Service
- [ ] The branded tracking page (`tracking.blurb.com`) displays correctly and remains accessible

---

### Dependencies

- Access to AfterShip testing/sandbox account with admin key (via Keeper)
- Coordination with DevOps for ECS redeployment (Tracking Service is deployed on ECS)
- AWS Lambda callback integration used by `/callback` endpoint
- SQS engine for batching: verify that message batching is unaffected by SDK/API changes
- Email Service (via SailThru): ensure fields for email notifications are intact
- RDS shared with PDF Processing: verify DB connectivity if schema/connection is affected
- Coordination with Padraic and Craig for status updates and credentials sharing
- Swagger/OpenAPI spec for legacy API as reference baseline

---

### Estimate

- Estimated effort: -- split by:
  - SDK Upgrade + Retrofit: --
  - Testing & Callback Validation: --

---

### Notes

- Abhinav confirmed unit tests are working; integration test is disabled but viable
- The integration should still use the batching engine, SQS, and the Lambda gateway endpoint for callbacks
- Must test both MagCloud and Blurby flows
- This supports both internal tracking (Email Service) and branded public tracking

---

## 🎟️ Ticket 1: Investigate Legacy Blurby + PDF Processing + BookServe Support for Separate Cover Files in Wire-O Flow

### 1. Problem Statement

Blurby currently assumes that the book cover is a single PDF file containing a wraparound design (front + spine + back) on one page. For wire-o binding, we must evaluate whether:

- Blurby and BookServe can accept and validate two cover files (`cover-front.pdf`, `cover-back.pdf`)
- PDF Processing Service and PrintTalk assembly logic can accommodate non-spined layouts
- Any assumptions in BookServe, Project Uploader, or Book config will break with multi-file covers

We need to assess the feasibility and impact of this file structure for supporting wire-o layouts.

### 2. Business/Operational Impact

- Core technical enabler for wire-o MVP (Fall 2025 priority)
- Risks failing the initiative if legacy flow can't handle separate cover files

### 3. Acceptance Criteria

- [ ] Locate where and how cover PDFs are validated and stored in Blurby project creation flow
- [ ] Identify how PDF Processing handles and references the cover file (single vs. multi-file)
- [ ] Determine whether BookServe can accept cover as two assets, and if not, what logic breaks
- [ ] Document any assumptions in rendering, previewing, or validating single cover pages
- [ ] Propose one or more viable approaches (e.g., dummy spine, separate files, combined flat cover with no spine metadata)
- [ ] Define where adaptation would be required: Book config/spec, Project model, PDF asset validator, etc.

### 4. Dependencies

- Blurby repo (Rails), BookServe, and PDF Processing Service access
- Support from Tim/Eric for build assumptions
- Sample wire-o specs for context from product

### 5. Estimate

- Estimated effort: --

---

## 🎟️ Ticket 2: Prototype XSLT Translator Support for Wire-O PrintTalk Without Spine + Split Cover Pages

### 1. Problem Statement

Once the Blurby system and PrintTalk structure can support front/back covers as separate files, the RPI XSLT translator must be able to convert this structure into a simplified print-ready XML. Unlike traditional photo books with wraparound covers and spine metadata, wire-o bindings:

- Do not include spine
- Should not rely on trim/spine thickness for layout
- May use two separate cover files or a single combined cover with logical split

We need to validate whether the translator can accommodate this format and simulate a print-ready flow.

### 2. Business/Operational Impact

- Translator must be updated or routing to print partners will fail
- Critical for controlled integration test of wire-o manufacturing in RPI

### 3. Acceptance Criteria

- [ ] Update existing wire-o PoC translator to accept simplified PrintTalk format with no spine block
- [ ] Define expected PrintTalk structure for front/back cover format
- [ ] Validate translator logic (XSLT rules) renders proper simplified output for:
  - Front + back as 2 distinct `<Cover>` assets
  - Or: flat single cover with no `<Spine>` element
- [ ] Simulate sandbox PrintTalk job through existing RPI test endpoints
- [ ] Share translator sample with Melissa/team for sandbox testing in integration

### 4. Dependencies

- Current XSLT used for PrintTalk translation in BookServe
- PrintTalk schema samples from BookServe and simplified XML targets
- Melissa/RPI DevOps for print sandbox testing

### 5. Estimate

- Estimated effort: --

---

## 🎟️ SPIKE 1 — Investigate Re-enabling Swatch Kits SKU in Blurby Platform

### 1. Problem Statement / Goal

Swatch Kits were previously offered but disabled around 2021 due to paper sourcing issues. With renewed interest from marketing, we need to assess the technical feasibility of reintroducing Swatch Kits as a product on Blurby.

The SKU may still exist in the database, but it needs confirmation, validation, and potential adjustments in project types, ordering flows, and pricing systems.

### 2. Business / Operational Impact

- Enables professionals and repeat customers to preview paper types, boosting confidence and conversions
- Supports personalization initiatives for premium creators (wedding books, portfolios)
- Visibility: This is a **CEO-priority item**

### 3. Acceptance Criteria

- [ ] Confirm if Swatch Kit SKU still exists in Blurby (DB, BookServe, admin tools)
- [ ] Identify all product dependencies: paper types, pricing, packaging
- [ ] Document how swatch kits were previously handled operationally (fulfillment method, inventory tracking)
- [ ] Validate if legacy pricing and product definitions can be reused
- [ ] List blockers or unknowns from product/ops teams

### 4. Dependencies

- Padraic (legacy SKU knowledge)
- Product/Marketing for updated kit content
- Admin tools (e.g. Capabilities Tool, Holding Bin)

### 5. Estimate

- Estimated effort: --

---

## 🎟️ SPIKE 2 — Evaluate Adding Glossy & Matte Covers to Photobooks & Tradebooks in Blurby

### 1. Problem Statement / Goal

Marketing has requested the ability to offer **glossy covers for photo books** and **matte covers for trade books**. We need to understand:

- If these cover types already exist in legacy systems
- Whether tools (BookWright, BookWright Online, PDF uploader) can support them
- What configuration, UI, or asset changes are needed in Blurby, BookServe, and downstream services

### 2. Business / Operational Impact

- Frequently requested enhancement with high marketing confidence
- May improve customer satisfaction and retention for existing formats

### 3. Acceptance Criteria

- [ ] Identify whether glossy/matte covers are already modeled in DB or SKUs (check MadeBy history if applicable)
- [ ] Define requirements for UI/tool changes (e.g. dropdowns, previews)
- [ ] Determine if these affect trim sizes, spine calculations, or printTalk
- [ ] Evaluate whether tools can support new covers across book types
- [ ] Coordinate with production/print ops to ensure availability and compatibility

### 4. Dependencies

- Confluence or source control for any historical references (e.g. MadeBy covers)
- BookServe configuration
- Input from Tim, Padraic, and Eric on asset handling
- Product team input for SKU/format rules

### 5. Estimate

- Estimated effort: --

---

## 🎟️ SPIKE 3 — Investigate Feasibility of BOGO / Auto-Applied Promotions via Coupons

### 1. Problem Statement / Goal

Marketing is considering running "Buy One, Get Something" promotions—e.g., 50% off a second copy, or a free extra copy. These may be auto-applied at checkout. We need to assess if:

- Existing **coupon tools** in Blurby support this
- Checkout logic can auto-apply such discounts without user input
- Any changes are required to the order, payment, or eligibility logic

### 2. Business / Operational Impact

- Adds promotional flexibility for sales events and product pushes
- Minimal engineering impact if coupon framework can support this pattern
- Could be reused for other campaigns (e.g., holidays, loyalty)

### 3. Acceptance Criteria

- [ ] Review current state of the coupon engine (min qty rules, auto-application)
- [ ] Identify if BOGO-style coupons were implemented in the past (check Slack or ticket history)
- [ ] Validate if current eligibility logic can handle "same product, second unit" discounts
- [ ] Identify edge cases (e.g., what if a user orders 3, 5, 7 copies?)
- [ ] Document needed updates to coupon admin tool (if any)

### 4. Dependencies

- Coupon tool (admin interface)
- Payment processing logic in BookServe
- Potential impact on analytics or reporting

### 5. Estimate

- Estimated effort: --

---

Here’s a breakdown of **story points**, estimated **days of effort**, and **people needed** for each of the three tickets (#42, #44, #43), based on the effort involved, risks, cross-team coordination, and technical depth.

---

## 🎯 Story Point & Resource Estimates

| Ticket | Title | Story Points | Estimated Days | People Needed |
|--------|-------|---------------|----------------|----------------|
| **#42** | Update US and CA Tax Rates | **3** | **2–3 days** | 👨‍💻 1 engineer (Camilo or Johan)<br>👀 QA/manual tester (partial time) |
| **#44** | Update VAT Taxes | **5** | **3–4 days** | 👨‍💻 1 engineer (Johan recommended due to logic check)<br>👀 1 reviewer (Patrick or Craig to confirm scope regarding prototype logic) |
| **#43** | Update Exchange Rates | **8** | **4–5 days** | 👨‍💻 1 engineer (Johan or paired with Camilo)<br>🔧 1 DevOps support (for Jenkins + server restart)<br>👀 QA/manual tester<br>📊 Finance (Craig coordination)<br>🔁 BI & Platform (to monitor Amazon feeds + alerts) |

---

### 🧾 Ticket #42: Update US and CA Tax Rates

- **Effort**: Straightforward, operational but minimal logic required.
- **Tasks**:
  - Format and load CSVs
  - Test in all environments
  - Validate tax mapping and rounding
- **People**:
  - 1 Developer for upload and test
  - Partial QA for verification
- **Risks**: Low, mostly test burden

---

### 🧾 Ticket #44: Update VAT Taxes in Blurby

- **Effort**: Slightly more than 42 due to logic check around product-level rates
- **Tasks**:
  - Compare existing VAT setup with spreadsheet
  - If needed, propose follow-up ticket for logic refactor
  - Validate current system against expectations
- **People**:
  - Johan recommended due to context
  - One stakeholder to validate interpretation (Craig, Patrick, or Finance)
- **Risks**: Moderate, if rate differentiation becomes a blocker

---

### 🧾 Ticket #43: Update Exchange Rates for April

- **Effort**: High operational complexity, Jenkins + Liquibase + alert tuning
- **Tasks**:
  - Update in both `shipping-service` and `blurby`
  - Coordinate server restart, BI & Marketing notification
  - Validate against Confluence instructions
  - Adjust failing web tests and monitoring thresholds
- **People**:
  - 1 engineer full-time (ideally Johan, familiar with Jenkins & DB)
  - DevOps (Ibrahim) for server restarts + DB oversight
  - QA for test updates
  - Craig to sync with Marketing/BI
- **Risks**: High, if Jenkins fails or alerts aren’t tuned properly

---

## ⏳ Summary

| Ticket | Points | Duration | Critical Collaborators |
|--------|--------|----------|-------------------------|
| **#42** | 3 | 2–3 days | QA, Engineer |
| **#44** | 5 | 3–4 days | Engineer, Product/Finance |
| **#43** | 8 | 4–5 days | Engineer, DevOps, BI, QA, Craig |

Let me know if you want this summarized in a JIRA planning view or Excel-ready format!
