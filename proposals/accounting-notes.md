# Assessment of Rod’s Notes on Blurby Accounting vs. Transcript Information

## Transaction Data and SQL Query Use
- **Rod’s Notes:** Kathy Yee from Finance runs a **SQL Server Query (Main_ME_RevQuery)** that exports data as an XLS file. This report is the foundation for revenue reconciliation with credit card and PayPal transactions.
- **Our meeting insights:**
  - This aligns with what we discussed regarding finance’s reliance on SQL queries for reporting.
  - There is an identified need to expand data granularity from transaction-level reporting to order/line-item-level reporting, something Finance wants but I understood correctly is deprioritized for now in Blurb 2.0.

## Author Purchase Identification Issues
- **Rod’s Notes:**
  - There is no clear author identification in the main transaction report.
  - Kathy has to infer NAP (Non-Author Purchase) versus author purchases based on the Set Your Price (SYP) margin.
  - If a profit is recorded, it is likely an NAP; if it’s $0, it is likely an author purchase.
- **Our meeting insights:**
  - This method is still inconsistent and prone to misclassification.
  - There have been past discussions about modifying the transaction data model to explicitly mark author purchases, but it remains an open issue.
  - The Blurby Admin tool is used for manual review and author payment processing, which adds operational overhead.

## Ingram & Amazon Data Handling
- **Rod’s Notes:**
  - Data must be manually retrieved from Amazon & Ingram seller portals.
  - The ingestion process into Blurby is unclear but appears to be managed by BI.
- **Our meeting insights:**
  - We confirmed that Blurby stores this data separately from direct Blurby transactions.
  - There is an opportunity to automate data ingestion instead of relying on manual retrieval.
  - The process is delayed compared to Blurby’s internal transactions, meaning payments to authors take longer.

## Blurb_SYP_Statement_by_Period Report
- **Rod’s Notes:**
  - Chris Birkeland and BI developed this report to parse author payments.
  - Further investigation is needed on how it functions and how accurate it is.
- **Our meeting insights:**
  - This report is mentioned, but it’s unclear if it fully aligns with Finance’s needs.
  - There may be redundancy or inefficiencies in using multiple reports instead of consolidating them.

### **Recommendations for Clarifications & Improvements**
1. Validate whether the current transaction report can be expanded to include order/line-item granularity for Finance.
2. Investigate opportunities for explicitly marking author purchases in transaction data.
3. Review how Ingram & Amazon data is stored and see if automation is possible to eliminate manual downloads.
4. Assess the Blurb_SYP_Statement_by_Period report for effectiveness and overlap with other reports.
5. Determine if BI can consolidate reporting efforts to reduce redundancy and manual work.