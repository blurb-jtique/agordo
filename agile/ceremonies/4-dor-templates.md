# Definition of Ready (DoR) Templates

This document outlines the Definition of Ready (DoR) for various ticket types used by the Sustaining Engineering team. A ticket meeting its DoR is considered well-understood, actionable, and ready for sprint planning.

## TEMPLATES

### **1\. DoR for: Feature**

* **Problem Statement or Goal \[REQUIRED\]**
  * **What is the new functionality or enhancement being requested?**
  * **What user or business problem does this feature solve?**
  * **Clear Objective:** Why are we building this? What is the purpose and expected value?
  * **Description:**
    * Is it enhancing an existing workflow?
    * Is it introducing a new capability?
    * Are there mockups or UI/UX designs (where appropriate)? (e.g., *new O-binding option in BookWright Online UI*)
    * Are there HLD architecture designs or workflow diagrams (where appropriate)?
  * *Example: “Users need the ability to select an O-ring binding option for Notebooks to provide a lay-flat experience, improving usability for students and professionals.”*
* **Business or Operational Impact Understood**
  * **What is the anticipated business value (e.g., increased customer satisfaction, new market segment, revenue impact)?**
  * What happens if we implement this feature?
  * What happens if we don't?
  * How does this align with the product roadmap and strategic goals?
  * *Example: “Adding O-ring binding is expected to make Notebooks more competitive, potentially increasing sales in the education and professional segments. Not adding it may mean losing customers to competitors offering this option.”*
* **Acceptance Criteria & Success Measures \[REQUIRED\]**
  * **What does success look like for this feature? How will we measure it?**
  * At least 2–5 bulleted acceptance criteria describing "done" and testable conditions from a user and system perspective.
    * *Example: User can select "Hardcover \- O-Ring Binding" for a 5x8 Notebook.*
    * *Example: The correct SKU for O-Ring binding is sent to UOS.*
    * *Example: The pricing calculator reflects any price adjustments for O-Ring binding.*
  * Include critical quality attribute statements (e.g., performance, security if applicable, usability).
  * *Example: “The O-ring binding option is available in the BookWright Online interface for all applicable Notebook sizes. The selection correctly translates to the print-doc file and is understood by UOS. Orders with O-ring binding are successfully printed and fulfilled.”*
* **Dependencies**
  * Are there dependencies on other teams (e.g., UOS team for translator updates, DevOps for pipeline adjustments)?
  * Are there specific UI/UX designs or assets required?
  * Are there any technical prerequisites (e.g., library versions, service availability)?
  * Confirm access to relevant repos, APIs, and tools.
  * Should the feature coexist with or replace existing functionality?
  * *Example: “Requires UOS team to update the Blurb-to-UOS translation file to recognize the new O-ring binding attribute. Assumes BookWright Online can pass the new attribute via its existing API to Blurby.”*
* **Estimate & Size Agreed \[REQUIRED\]**
  * The team has estimated complexity/story points.
  * If the feature is too large, it has been split into smaller, manageable stories.
* **No Major Blockers**
  * The team has no open questions requiring immediate answers from Product, UX, or other teams that would prevent starting.
  * Necessary environment access or tool setup is confirmed.
* **Stakeholder Agreement**
  * The Product Owner has signed off on the scope, acceptance criteria, and priority.
  * Relevant SMEs (e.g., print operations for new binding types) have been consulted if necessary.
  * *Example: “Product Owner confirms this feature is a priority for the upcoming quarter. Print operations confirm feasibility of O-ring binding with specified materials.”*

### **2\. DoR for: Bug**

* **Problem Statement or Goal \[REQUIRED\]**
  * **What is the bug/failure?** Clearly describe the unexpected or incorrect behavior.
  * **Where is it occurring?** (e.g., Production, Staging, specific service like Blurby, Hemingway, Pricing Calculator).
  * **How-to-Replicate Steps \[REQUIRED\]:** Provide clear, step-by-step instructions to reproduce the bug. Include any specific conditions, data, or user actions.
  * **Actual Result:** What is happening?
  * **Expected Result:** What should be happening?
  * **Link to originating change (if known):** If the bug is suspected to be a regression, link to the PR or ticket of the change that might have introduced it.
  * *Example: “When a user in Norway adds both a physical book (softcover) and a PDF to their cart, the VAT for the physical book is incorrectly calculated using the reduced rate instead of the standard rate.”*
* **Business or Operational Impact Understood**
  * **What is the impact of this bug?** (e.g., incorrect financial calculations, poor user experience, data corruption, blocked workflow).
  * How many users/orders are affected? What is the frequency?
  * What is the severity/priority (e.g., critical, high, medium, low)? This should be set based on risk and impact.
  * Stakeholders (e.g., Finance for tax bugs, Customer Support for UX bugs) confirm urgency.
  * *Example: “This bug leads to incorrect VAT collection for Norwegian customers, potentially causing compliance issues and revenue discrepancies. Affects all Norwegian orders with mixed physical/digital items.”*
* **Acceptance Criteria & Success Measures \[REQUIRED\]**
  * **What does success look like for this fix?**
  * At least 2-3 bulleted acceptance criteria describing the corrected behavior and testable conditions.
    * *Example: VAT for physical books in a Norwegian mixed cart is calculated using the standard rate.*
    * *Example: VAT for digital items in a Norwegian mixed cart continues to use the appropriate (e.g., zero or reduced) rate.*
    * *Example: Existing orders are not negatively impacted by the fix (unless specified as part of a data fixup).*
  * Are there specific logs or monitoring metrics to verify the fix?
  * *Example: “The correct standard VAT rate is applied to physical books for Norwegian customers at checkout, and the reduced/zero rate is applied to digital items in the same order. Invoices reflect the correct tax breakdown.”*
* **Dependencies**
  * Is any specific data or environment setup needed to replicate and test the bug?
  * Are there dependencies on other services or teams for the fix or testing?
  * Confirm access to relevant logs (Sumo Logic), code repositories, and debugging tools.
  * *Example: “Requires access to master environment to replicate checkout flow. No external team dependencies for the fix itself.”*
* **Estimate & Size Agreed \[REQUIRED\]**
  * The team has estimated the complexity/story points for fixing and testing the bug.
* **No Major Blockers**
  * Root cause is understood sufficiently to attempt a fix (or the ticket is a Spike to find the root cause).
  * No immediate blockers from other teams or system access.
* **Stakeholder Agreement**
  * The Product Owner or a designated stakeholder (e.g., Finance, Customer Support Manager) agrees on the priority and the expected outcome of the fix.
  * *Example: “Finance confirms the expected VAT calculation logic. Product Owner agrees this is a high-priority fix for the next sprint.”*

### **3\. DoR for: Spike**

* **Problem Statement or Goal \[REQUIRED\]**
  * **What is the question, uncertainty, or area of research this Spike aims to address?**
  * What information are we trying to gather, or what hypothesis are we trying to validate?
  * **Clear Objective:** Why is this investigation needed? What decisions will it inform?
  * *Example: “Investigate the feasibility and effort required to upgrade the legacy Blurby platform from Rails 2 to Rails 3, identifying major challenges and potential benefits.”*
  * *Example: "Determine the lightest lift to add O-ring binding to Notebooks, exploring options like new SKU vs. extending cover types."* (Kickoff \[8199\])
* **Business or Operational Impact Understood**
  * **What is the potential impact of the knowledge gained from this Spike?**
  * How will the outcome of this Spike help in making future decisions (e.g., roadmap planning, technical strategy, risk mitigation)?
  * What happens if we *don't* do this investigation? (e.g., continued uncertainty, risk of making poor decisions).
  * *Example: “Understanding the Rails upgrade path will inform the long-term modernization strategy for Blurby and resource allocation. Without this, we cannot accurately plan future development or address security risks effectively.”*
* **Acceptance Criteria & Success Measures \[REQUIRED\]**
  * **What are the specific deliverables or outcomes that will signify the completion of this Spike?** (This is crucial for Spikes).
    * This is often a document, a report, a presentation, a proof-of-concept (POC), or a set of recommendations.
    * *Example: A document outlining the major steps, risks, and estimated effort for a Rails 2 to Rails 3 migration.*
    * *Example: A recommendation on the best approach to implement O-ring binding, with a high-level impact assessment.*
    * *Example: A POC demonstrating a specific technical solution is viable.* (Kickoff \[9035\])
  * *Example: “A written report summarizing the findings of the O-ring binding investigation, including a comparison of implementation options and a high-level effort estimate, to be delivered by the end of the sprint.”*
* **Dependencies**
  * What resources, access (e.g., specific codebases, documentation, subject matter experts), or tools are needed for this investigation?
  * Are there interviews or discussions needed with specific individuals or teams?
  * *Example: “Requires access to the legacy Blurby codebase, BookServe codebase, and relevant Confluence documentation. May require discussions with DevOps regarding current infrastructure.”*
* **Estimate & Size Agreed \[REQUIRED\]**
  * **Timebox Agreed:** The team has agreed on a specific timebox for the investigation (e.g., X days/hours). This is the primary "estimate" for a Spike.
  * The effort is managed within the sprint's allocated capacity for unpointed work. Story points are typically not assigned.
* **No Major Blockers**
  * Access to necessary information, systems, or personnel for the investigation is confirmed.
* **Stakeholder Agreement**
  * The Product Owner or relevant stakeholder agrees on the importance and objectives of the Spike.
  * There's a shared understanding of what questions the Spike aims to answer and its timebox.
  * *Example: “Product Owner agrees that understanding the Rails upgrade path is critical before committing to large-scale modernization efforts and approves a 3-day timebox for this Spike.”*

### **4\. DoR for: Operations**

* **Problem Statement or Goal \[REQUIRED\]**
  * **What is the operational task to be performed?** (e.g., update exchange rates, apply new tax CSV, perform a data fixup).
  * **Why is this task necessary?** (e.g., monthly schedule, compliance requirement, resolve data inconsistency).
  * **Clear Objective:** What is the expected state of the system/data after this task is completed?
  * Is this a recurring task or a one-off?
  * *Example: “Update the monthly exchange rates in Blurby and Shipping Service based on the latest file provided by Finance.”* (Kickoff \[7170\]-\[7180\])
* **Business or Operational Impact Understood**
  * **What is the impact of performing this task?** (e.g., ensures correct pricing, maintains tax compliance, corrects data for reporting).
  * What are the risks if this task is *not* performed or is performed incorrectly? (e.g., financial errors, customer dissatisfaction, legal issues).
  * Who is the primary stakeholder or requester for this task (e.g., Finance, Customer Support)?
  * *Example: “Failure to update exchange rates will lead to incorrect pricing for international customers and discrepancies in financial reporting.”*
* **Acceptance Criteria & Success Measures \[REQUIRED\]**
  * **What signifies the successful completion of this operational task?**
  * Clear, verifiable steps or outcomes.
    * *Example: New exchange rates are active in the Blurby production environment.*
    * *Example: A sample of orders placed after the update shows the correct new rates being applied.*
    * *Example: Finance confirms the rates are updated as expected.*
  * Are there specific monitoring checks or reports to validate success?
  * Is there a rollback plan if something goes wrong? (Especially for data updates).
  * *Example: “The new exchange rates for April 2025 are successfully loaded and verified in the Blurby production system. Finance confirms rates are correct via test orders.”*
* **Dependencies**
  * **Are all necessary inputs available?** (e.g., the CSV file for tax updates, the list of records for a data fixup, credentials for specific tools).
  * Are there specific tools or scripts to be used? Is access to them confirmed?
  * Is there a specific maintenance window or timing required for this task?
  * Does this task require coordination with other teams (e.g., DevOps for a deployment, Finance for validation)?
  * *Example: “Requires the latest exchange rate CSV file from Finance. Task to be performed during off-peak hours if it involves a service restart.”*
* **Estimate & Size Agreed \[REQUIRED\]**
  * The team has estimated the complexity/story points for the task, including any preparation and verification.
* **No Major Blockers**
  * All input data/files are available and validated.
  * Access to necessary systems and tools is confirmed.
  * Any required approvals are in place.
* **Stakeholder Agreement**
  * The requesting stakeholder (e.g., Finance lead) has confirmed the necessity and timing of the task.
  * There's agreement on the expected outcome and validation process.
  * *Example: “Finance has provided the exchange rate file and confirmed the update is due by EOD Tuesday.”*

### **5\. DoR for: Productivity**

* **Problem Statement or Goal \[REQUIRED\]**
  * **What specific process, tool, documentation, or piece of technical debt is being addressed?**
  * **What is the current pain point or inefficiency this task aims to solve for the team or system?**
  * **Clear Objective:** How will completing this task improve the team's way of work, system health, or developer experience?
  * *Example: “The current local development setup for Blurby is slow and unreliable, taking 3-4 minutes to restart the server after minor changes, significantly impacting developer iteration speed.”* (Kickoff \[9035\]-\[9045\])
  * *Example: "Document the Blurby deployment process for Bookshare and Hemingway to ensure consistency and aid new team member onboarding."* (Attachment \[260\]-\[266\])
* **Business or Operational Impact Understood**
  * **What is the anticipated benefit of this productivity improvement?** (e.g., faster development cycles, reduced errors, easier onboarding, improved system stability, better maintainability).
  * While not directly customer-facing, how does this indirectly benefit the product or business in the long run?
  * *Example: “A faster local development environment will reduce developer waiting time, allowing for quicker bug fixing and feature development, ultimately leading to faster delivery of value.”*
* **Acceptance Criteria & Success Measures \[REQUIRED\]**
  * **What does success look like for this productivity improvement? How will we know it's achieved?**
  * Clear, verifiable outcomes.
    * *Example: Local Blurby server restart time is reduced to under 1 minute.*
    * *Example: A Confluence page documenting the Hemingway deployment process is created, reviewed, and published.*
    * *Example: The identified technical debt in the OrderProcessor module is refactored according to agreed-upon standards, and all existing tests pass.*
  * Are there any metrics that can be used to measure the improvement (e.g., time saved, reduction in certain types of errors)?
  * *Example: “The new deployment documentation for Hemingway is published on Confluence and has been successfully used by at least one other team member to perform a test deployment.”*
* **Dependencies**
  * Are there specific tools, technologies, or knowledge required to complete this task?
  * Does this task depend on any other ongoing work or require coordination with other teams (e.g., DevOps for infrastructure changes related to local environments)?
  * *Example: “Investigating local environment improvements may require input from DevOps on current VM configurations or Docker best practices.”*
* **Estimate & Size Agreed \[REQUIRED\]**
  * **Effort/Time Considered:** The team has considered the effort required for this improvement.
  * This is typically managed within the sprint's allocated capacity for productivity tasks (e.g., 20-25%). Story points are generally not assigned unless the task is exceptionally large, well-defined, and delivers a distinct, significant internal improvement.
* **No Major Blockers**
  * Access to relevant code, documentation, or systems is confirmed.
  * Any necessary approvals for architectural changes (if applicable for tech debt) are obtained.
* **Stakeholder Agreement**
  * The team (and Product Owner, if there's a significant time investment impacting feature work) agrees on the value and priority of this productivity improvement.
  * For process documentation, key individuals who will use the documentation agree on its scope and purpose.
  * *Example: “The engineering team agrees that improving local server restart time is a high-priority productivity enhancement for the upcoming sprint's allocated productivity capacity.”*

### **6\. DoR for: Hotfix**

* **Problem Statement or Goal \[REQUIRED\]**
  * **What is the critical production issue that needs immediate attention?** Clearly describe the failure and its current impact.
  * **Where is it occurring?** (Specific service, URL, user segment).
  * **When was it first detected?**
  * **How-to-Replicate (if known and safe):** If easily reproducible without further damage.
  * **Clear Objective:** Stabilize the system and restore correct functionality as quickly as possible. A temporary workaround might be acceptable initially if a full fix is complex.
  * *Example: “The Blurb public bookstore is experiencing intermittent 500 errors when loading book detail pages, preventing users from viewing or purchasing books. First detected 10 minutes ago.”*
* **Business or Operational Impact Understood \[URGENT ASSESSMENT\]**
  * **What is the immediate and ongoing impact?** (e.g., % of users affected, revenue loss, data corruption risk, reputational damage).
  * This assessment is critical for determining the urgency and allowable effort for the hotfix.
  * Who are the key stakeholders that need to be informed (e.g., Head of Engineering, Product Lead, Customer Support Lead)?
  * *Example: “High impact: Potentially all users attempting to view book details are affected. Significant revenue loss if unresolved. Customer support is receiving increased complaints.”*
* **Acceptance Criteria & Success Measures \[REQUIRED \- FOCUSED ON IMMEDIATE RESOLUTION\]**
  * **What specific outcome indicates the immediate crisis is resolved?**
  * Focus on restoring core functionality and stability.
    * *Example: Book detail pages load successfully without 500 errors for 99.9% of requests.*
    * *Example: The identified incorrect data causing the issue is corrected or an interim fix prevents further corruption.*
  * What specific monitoring (e.g., New Relic, Sumo Logic error rates) will be used to confirm the fix?
  * Is there an immediate rollback plan if the hotfix fails or worsens the situation? **This is critical.**
  * *Example: “The bookstore book detail pages are consistently returning 200 OK status. Error rates in Sumo Logic for this endpoint return to baseline levels. Rollback plan involves reverting the last deployed commit X.”*
* **Dependencies \[ASSESSED FOR SPEED\]**
  * What is the quickest path to diagnosis and fix?
  * Are key personnel with necessary system knowledge and access available *now*?
  * Are there any immediate dependencies that would slow down the hotfix (e.g., waiting for an external team)?
  * *Example: “Requires immediate access to production logs and potentially database access for diagnosis. Lead Ruby developer and DevOps on-call are engaged.”*
* **Estimate & Size Agreed \[TIME-CRITICAL ASSESSMENT\]**
  * Focus is on immediate effort to stabilize. A full, permanent fix might be a separate, planned ticket.
  * The team agrees on the immediate actions and a very short timebox for the initial fix attempt.
* **No Major Blockers \[FOR IMMEDIATE ACTION\]**
  * Key personnel are available.
  * Essential system access is confirmed.
* **Stakeholder Agreement \[IMMEDIATE & FOCUSED\]**
  * Key stakeholders (e.g., Engineering Lead, Product Lead on call) agree on the immediate course of action and the definition of "stabilized."
  * Communication plan to wider stakeholders is active.
  * *Example: “Head of Engineering has authorized an emergency deployment if a fix is identified. Customer Support is aware and managing external communications.”*
