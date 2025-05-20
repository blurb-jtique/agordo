# Release Notes Templates by Ticket Type

These templates are designed for internal communication (e.g., in the \#production Slack channel, team updates, or sprint review summaries) to concisely convey what has been completed and deployed for each ticket type.

## **GitHub Release Description Content Template**

This template is for creating the main body of a GitHub Release. It provides a consolidated summary of all changes included in the release, linking back to individual JIRA tickets.

**Format:**

```markdown
# Release [YYYY-MM-DD]

This release includes the following updates:

| Status | Issue | Summary | Dev |
| -- | -- | -- | -- |
| Done | [JIRA-ID-1] | [Brief summary of feature/fix 1] | @[github-username-dev1] |
| Done | [JIRA-ID-2] | [Brief summary of feature/fix 2] | @[github-username-dev2] |
| Done | [JIRA-ID-3] | [Brief summary of operations task] | @[github-username-dev3] |

**Key Highlights (Optional):**
* [Notable Feature/Improvement 1]
* [Significant Bug Fix 2]

**Notes: (Optional)**
* For detailed information on each item, please refer to the respective JIRA tickets.
* Deployment successfully completed at [Time UTC] on [Date].
```

**Guidance for Use:**

* **\# Release \[YYYY-MM-DD\]**: Use the date of the release.
* **Status**: Typically "Done" for items included in a release.
* **Issue**: The full JIRA ticket ID (e.g., SUSENG-88). This should be a link to the JIRA ticket.
* **Summary**: A very brief, one-line summary of what was done for that ticket. This can be derived from the "Feature Released," "Bug Fix," or "Purpose" section of the individual ticket release notes.
* **Dev**: The GitHub username(s) of the primary developer(s) for that ticket.
* **Key Highlights**: Use this optional section to call out 1-3 of the most significant changes in the release for quick visibility.
* **Notes**: Include any other relevant information, such as the successful deployment timestamp.

**Example (Based on your provided snippet):**

```markdown
# Release 2025-05-12

This release includes the following updates:

Status | Issue | Summary | Dev
-- | -- | -- | --
Done | [SUSENG-88](link-to-jira/SUSENG-88) | Enable Feature Flag to control OG image caching for bookstore | @blurb-jtique
Done | [SUSENG-92](link-to-jira/SUSENG-92) | Update Norway VAT calculation for physical books | @blurb-candres
Done | [SUSENG-112](link-to-jira/SUSENG-112) | Perform May 2025 monthly exchange rate update | @blurb-tstark

**Key Highlights:**
* Resolved critical OG image caching issue impacting bookstore performance.
* Ensured VAT compliance for Norwegian customers.

**Notes:**
* For detailed information on each item, please refer to the respective JIRA tickets.
* Deployment successfully completed at 16:00 UTC on 2025-05-12.
```

## 1. Template for: Feature

* **Feature Released:** \[Name of Feature or Enhancement\]
* **JIRA Ticket(s):** \[SUSENG-XXX, SUSENG-YYY\] and PR \(PR#XXX\)
* **Change Operator(s):** \[Name(s) of person/people who executed the deployment\]
  * *(Captures "Who is making this change?" from Deployment Plan)*
* **Platform On-Call (if involved):** \[Name or Team\]
* **DevOps On-Call (if involved):** \[Name or Team\]
* **Purpose:** Briefly, what new capability or value does this feature provide to users or the business?
* **Key Changes:** 1-2 bullet points summarizing the main functional changes.
* **Key Risks Considered:** Briefly note any major risks that were considered and mitigated during this deployment. (e.g., "Risk of initial performance dip mitigated by phased rollout," "Low risk due to isolated changes.")
  * *(Captures essence of "What risks are we concerned about?" from Deployment Plan)*
* **Impact (if any):** Note any significant impact on users, existing workflows, or system performance.
* **Monitoring/Performance Notes (Optional):** Briefly note key metrics observed post-deployment or if new monitoring was established. (e.g., "Post-release monitoring shows stable API response times," "New Relic dashboard X updated for this feature.")
* **Rollback Consideration (Optional):** Mention if a specific rollback strategy (e.g., feature flag) was part of the release. (e.g., "Released via feature flag 'XYZ', can be disabled if issues arise.")
* **Deployment Date:** \[Date\]
* **Notes (Optional):** Link to detailed documentation if available, or any quick callouts.

**Example:**

* **Feature Released:** O-Ring Binding Option for Notebooks (Phase 1\)
* **JIRA Ticket(s):** SUSENG-45 (PR#8945), SUSENG-105 (PR#8946)
* **Change Operator(s):** Johan Tique
* **Platform On-Call:** Michelle Dea
* **DevOps On-Call:** Tom Miyake
* **Purpose:** Allows users to select an O-ring binding for specific notebook sizes in BookWright Online, offering a lay-flat experience.
* **Key Changes:**
  * "Hardcover \- O-Ring Binding" option available for 5x8 Notebooks.
  * Pricing updated to reflect the new binding type.
* **Key Risks Considered:** Minor risk of UOS translation issues, mitigated by pre-deployment testing with Melissa's team.
* **Impact:** New product option available for customers. UOS translation updated.
* **Monitoring/Performance Notes:** Order creation for O-Ring binding monitored via Sumo Logic query \[query\_link\]; initial performance nominal.
* **Rollback Consideration:** Feature is directly integrated; standard service rollback procedures apply.
* **Deployment Date:** 2025-05-20

## 2. Template for: Bug Fix

* **Bug Fix:** \[Brief Description of Bug Fixed\]
* **JIRA Ticket(s):** \[SUSENG-XXX\] and PR \(PR#XXX\)
* **Change Operator(s):** \[Name(s) of person/people who executed the deployment\]
* **Platform On-Call (if involved):** \[Name or Team\]
* **DevOps On-Call (if involved):** \[Name or Team\]
* **Problem Solved:** What incorrect behavior or issue was resolved?
* **Resolution:** Briefly, what was the fix?
* **Risks Considered (Optional, if fix was complex or high-impact):** (e.g., "Risk of unintended side-effects in related modules, mitigated by targeted regression testing.")
* **Impact:** Users should now experience \[correct behavior\].
* **Verification & Monitoring Notes (Optional):** How was the fix verified in production? Any specific metrics monitored? (e.g., "Confirmed via test orders in prod; error rates for VAT calculation returned to zero.")
* **Deployment Date:** \[Date\]

**Example:**

* **Bug Fix:** Incorrect VAT calculation for Norway mixed carts.
* **JIRA Ticket(s):** SUSENG-5 (PR#8945)
* **Change Operator(s):** Camilo Andres
* **Platform On-Call:** Michelle Dea
* **DevOps On-Call:** Tom Miyake
* **Problem Solved:** Physical books in mixed carts for Norwegian customers were being charged a reduced VAT rate instead of the standard rate.
* **Resolution:** Updated tax logic to apply the standard VAT rate to physical items in Norwegian mixed carts.
* **Risks Considered:** Low risk; change isolated to Norway tax calculation.
* **Impact:** Correct VAT is now applied for Norwegian customers, ensuring compliance.
* **Verification & Monitoring Notes:** Verified with 3 test orders in production. Monitored TaxService logs in Sumo; no new errors observed.
* **Deployment Date:** 2025-05-20

## 3. Template for: Hotfix

* **Hotfix Deployed:** \[Critical Issue Addressed\]
* **JIRA Ticket(s):** \[SUSENG-XXX\] (if applicable, or link to incident report)  and PR \(PR#XXX\)
* **Change Operator(s):** \[Name(s) of person/people who executed the deployment\]
* **Platform On-Call (if involved):** \[Name or Team\]
* **DevOps On-Call (if involved):** \[Name or Team\]
* **Urgent Problem Solved:** What critical production issue was resolved or mitigated?
* **Resolution:** Brief description of the emergency fix applied.
* **Key Risks (Addressed or Introduced):** (e.g., "Addressed critical site outage risk. Fix introduces minor risk of X, to be monitored.")
* **Impact & Status:** System stability restored. \[Mention if further investigation or a permanent fix is pending\].
* **Monitoring Outcome:** Key metrics observed post-hotfix (e.g., "Error rates dropped from X% to Y%," "System response times normalized").
* **Rollback Action (if any performed, or if primary mitigation):** (e.g., "Initial rollback to previous version X executed," "Feature flag 'ABC' disabled to mitigate").
* **Deployment Time:** \[Date and Time\]

**Example:**

* **Hotfix Deployed:** Bookstore 500 errors on book detail pages.
* **JIRA Ticket(s):** SUSENG-210 (PR#8945)
* **Change Operator(s):** Johan Tique
* **Platform On-Call:** Michelle Dea
* **DevOps On-Call:** Tom Miyake
* **Urgent Problem Solved:** Resolved intermittent 500 errors preventing users from viewing book details in the public bookstore.
* **Resolution:** Applied targeted cache invalidation for affected book entities.
* **Key Risks:** Addressed critical risk of bookstore unavailability. Fix is low risk, focused on cache management.
* **Impact & Status:** Bookstore stability restored. Root cause analysis points to stale cache after recent metadata update (SUSENG-212).
* **Monitoring Outcome:** New Relic shows 500 error rate for /bookstore/book/{id} endpoint dropped to \<0.1% within 5 minutes of deploy.
* **Rollback Action:** Initial attempt to rollback via feature flag was not sufficient; cache invalidation was the effective fix.
* **Deployment Time:** 2025-05-19, 14:30 UTC

## 4. Template for: Operations Task Completion (Internal Note)

* **Operational Task Completed:** \[Name of Task\]
* **JIRA Ticket(s):** \[SUSENG-XXX\] and PR \(PR#XXX\)
* **Task Operator(s):** \[Name(s) of person/people who performed the task\]
* **Platform On-Call (if involved):** \[Name or Team\]
* **DevOps On-Call (if involved):** \[Name or Team\]
* **Purpose:** Why was this task performed? (e.g., monthly update, compliance, data fixup).
* **Outcome:** What is the new state of the system/data?
* **Risks Considered (if applicable for the task):** (e.g., "Risk of data corruption during fixup mitigated by pre-task backup and small batch processing.")
* **Verification:** How was successful completion verified?
* **Monitoring Outcome (if applicable):** Any key metrics checked to confirm system health post-task.
* **Rollback Performed (if applicable):** Note if a rollback was necessary during the task.
* **Completion Date & Time:** \[Date and Time\]

**Example:**

* **Operational Task Completed:** Monthly Exchange Rate Update \- Ma 5.
* **JIRA Ticket(s):** SUSENG-112 (PR#8945)
* **Task Operator(s):** Craig S.
* **Platform On-Call:** Michelle Dea
* **DevOps On-Call:** Tom Miyake
* **Purpose:** To apply the latest exchange rates for all supported currencies.
* **Outcome:** May 2025 exchange rates are now active in Blurby and Shipping Service.
* **Risks Considered:** Minimal risk; standard monthly data load procedure.
* **Verification:** Finance confirmed rates via test orders; system logs show successful update.
* **Monitoring Outcome:** No adverse impact observed on order processing metrics post-update.
* **Completion Date & Time:** 2025-05-02, 10:00 UTC

## 5. Template for: Productivity Task Completion (Internal Note)

*(Direct production Change Operator, Risks, Monitoring/Rollback notes are less common for pure productivity tasks unless the task itself involved a deployment of a shared tool or a major refactor of a production service. The focus is usually on the benefit achieved.)*

* **Productivity Improvement:** \[Description of Improvement Implemented\]
* **JIRA Ticket(s):** \[SUSENG-XXX\] and PR \(PR#XXX\)
* **Implementer(s):** \[Name(s) of person/people who implemented the improvement\]
* **Pain Point Addressed:** What inefficiency or team challenge did this solve?
* **Benefit/Outcome:** How does this improve the team's way of work, system health, or developer experience?
* **Completion Date:** \[Date\]
* **Documentation (if any):** Link to new/updated process docs, scripts, etc.

**Example:**

* **Productivity Improvement:** Documented Blurby Deployment Process for Hemingway.
* **JIRA Ticket(s):** SUSENG-95 (PR#8945)
* **Implementer(s):** Johan Tique, Camilo Andres
* **Pain Point Addressed:** Lack of clear, consolidated documentation for Hemingway deployments, making it difficult for new team members and increasing risk.
* **Benefit/Outcome:** New Confluence page details the step-by-step Hemingway deployment process, including pipeline stages and common troubleshooting, reducing errors and onboarding time.
* **Completion Date:** 2025-05-10
* **Documentation:** \[Link to Confluence: Hemingway Deployment Guide\]
