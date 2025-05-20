# Release Notes Templates by Ticket Type

These templates are designed for internal communication (e.g., in the \#production Slack channel, team updates, or sprint review summaries) to concisely convey what has been completed and deployed for each ticket type.

## 1. Template for: Feature

* **Feature Released:** \[Name of Feature or Enhancement\]
* **JIRA Ticket(s):** \[SUSENG-XXX, SUSENG-YYY\]
* **Purpose:** Briefly, what new capability or value does this feature provide to users or the business?
  * *(Corresponds to "Why are we making this change?" from Deployment Plan)*
* **Key Changes:** 1-2 bullet points summarizing the main functional changes.
* **Impact (if any):** Note any significant impact on users, existing workflows, or system performance.
* **Monitoring/Performance Notes (Optional):** Briefly note key metrics observed post-deployment or if new monitoring was established. (e.g., "Post-release monitoring shows stable API response times," "New Relic dashboard X updated for this feature.")
* **Rollback Consideration (Optional):** Mention if a specific rollback strategy (e.g., feature flag) was part of the release. (e.g., "Released via feature flag 'XYZ', can be disabled if issues arise.")
* **Deployment Date:** \[Date\]
* **Notes (Optional):** Link to detailed documentation if available, or any quick callouts.

**Example:**

* **Feature Released:** O-Ring Binding Option for Notebooks (Phase 1\)
* **JIRA Ticket(s):** SUSENG-45, SUSENG-105
* **Purpose:** Allows users to select an O-ring binding for specific notebook sizes in BookWright Online, offering a lay-flat experience.
* **Key Changes:**
  * "Hardcover \- O-Ring Binding" option available for 5x8 Notebooks.
  * Pricing updated to reflect the new binding type.
* **Impact:** New product option available for customers. UOS translation updated.
* **Monitoring/Performance Notes:** Order creation for O-Ring binding monitored via Sumo Logic query \[query\_link\]; initial performance nominal.
* **Rollback Consideration:** Feature is directly integrated; standard service rollback procedures apply.
* **Deployment Date:** 2025-05-20

## 2. Template for: Bug Fix

* **Bug Fix:** \[Brief Description of Bug Fixed\]
* **JIRA Ticket(s):** \[SUSENG-XXX\]
* **Problem Solved:** What incorrect behavior or issue was resolved?
  * *(Corresponds to "Why are we making this change?" from Deployment Plan)*
* **Resolution:** Briefly, what was the fix?
* **Impact:** Users should now experience \[correct behavior\].
* **Verification & Monitoring Notes (Optional):** How was the fix verified in production? Any specific metrics monitored? (e.g., "Confirmed via test orders in prod; error rates for VAT calculation returned to zero.")
* **Deployment Date:** \[Date\]

**Example:**

* **Bug Fix:** Incorrect VAT calculation for Norway mixed carts.
* **JIRA Ticket(s):** SUSENG-5
* **Problem Solved:** Physical books in mixed carts for Norwegian customers were being charged a reduced VAT rate instead of the standard rate.
* **Resolution:** Updated tax logic to apply the standard VAT rate to physical items in Norwegian mixed carts.
* **Impact:** Correct VAT is now applied for Norwegian customers, ensuring compliance.
* **Verification & Monitoring Notes:** Verified with 3 test orders in production. Monitored TaxService logs in Sumo; no new errors observed.
* **Deployment Date:** 2025-05-20

## 3. Template for: Hotfix

* **Hotfix Deployed:** \[Critical Issue Addressed\]
* **JIRA Ticket(s):** \[SUSENG-XXX\] (if applicable, or link to incident report)
* **Urgent Problem Solved:** What critical production issue was resolved or mitigated?
* **Resolution:** Brief description of the emergency fix applied.
* **Impact & Status:** System stability restored. \[Mention if further investigation or a permanent fix is pending\].
* **Monitoring Outcome:** Key metrics observed post-hotfix (e.g., "Error rates dropped from X% to Y%," "System response times normalized").
* **Rollback Action (if any performed, or if primary mitigation):** (e.g., "Initial rollback to previous version X executed," "Feature flag 'ABC' disabled to mitigate").
* **Deployment Time:** \[Date and Time\]

**Example:**

* **Hotfix Deployed:** Bookstore 500 errors on book detail pages.
* **JIRA Ticket(s):** SUSENG-210
* **Urgent Problem Solved:** Resolved intermittent 500 errors preventing users from viewing book details in the public bookstore.
* **Resolution:** Applied targeted cache invalidation for affected book entities.
* **Impact & Status:** Bookstore stability restored. Root cause analysis points to stale cache after recent metadata update (SUSENG-212).
* **Monitoring Outcome:** New Relic shows 500 error rate for /bookstore/book/{id} endpoint dropped to \<0.1% within 5 minutes of deploy.
* **Rollback Action:** Initial attempt to rollback via feature flag was not sufficient; cache invalidation was the effective fix.
* **Deployment Time:** 2025-05-19, 14:30 UTC

## 4. Template for: Operations Task Completion (Internal Note)

* **Operational Task Completed:** \[Name of Task\]
* **JIRA Ticket(s):** \[SUSENG-XXX\]
* **Purpose:** Why was this task performed? (e.g., monthly update, compliance).
* **Outcome:** What is the new state of the system/data?
* **Verification:** How was successful completion verified?
* **Monitoring Outcome (if applicable):** Any key metrics checked to confirm system health post-task.
* **Rollback Performed (if applicable):** Note if a rollback was necessary during the task.
* **Completion Date & Time:** \[Date and Time\]

**Example:**

* **Operational Task Completed:** Monthly Exchange Rate Update \- May 2025.
* **JIRA Ticket(s):** SUSENG-112
* **Purpose:** To apply the latest exchange rates for all supported currencies.
* **Outcome:** May 2025 exchange rates are now active in Blurby and Shipping Service.
* **Verification:** Finance confirmed rates via test orders; system logs show successful update.
* **Monitoring Outcome:** No adverse impact observed on order processing metrics post-update.
* **Completion Date & Time:** 2025-05-02, 10:00 UTC

## 5. Template for: Productivity Task Completion (Internal Note)

*(Direct production monitoring/rollback notes are less common for pure productivity tasks unless the task itself involved a deployment, e.g., a major refactor of a production service. The focus is usually on the benefit achieved.)*

* **Productivity Improvement:** \[Description of Improvement Implemented\]
* **JIRA Ticket(s):** \[SUSENG-XXX\]
* **Pain Point Addressed:** What inefficiency or team challenge did this solve?
* **Benefit/Outcome:** How does this improve the team's way of work, system health, or developer experience?
* **Completion Date:** \[Date\]
* **Documentation (if any):** Link to new/updated process docs, scripts, etc.

**Example:**

* **Productivity Improvement:** Documented Blurby Deployment Process for Hemingway.
* **JIRA Ticket(s):** SUSENG-95
* **Pain Point Addressed:** Lack of clear, consolidated documentation for Hemingway deployments, making it difficult for new team members and increasing risk.
* **Benefit/Outcome:** New Confluence page details the step-by-step Hemingway deployment process, including pipeline stages and common troubleshooting, reducing errors and onboarding time.
* **Completion Date:** 2025-05-10
* **Documentation:** \[Link to Confluence: Hemingway Deployment Guide\]