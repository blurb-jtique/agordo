# Definition of Done (DoD) by Ticket Type

This document outlines the specific Definition of Done (DoD) for each ticket type used by the Sustaining Engineering team. Meeting these criteria signifies that the work is complete, of high quality, and delivers on its intended objective.

Refer to the general "Definition of Done (DoD) A Summary" document for overarching principles.

## 1. DoD for: Feature

New functionality or significant enhancement delivering user/business value

**Goal:** The new feature is fully implemented, robustly tested, documented, and provides the agreed-upon value to users.

* **Code & Implementation:**
  * Technical implementation plan (if created) has been followed.
  * Code is written, adheres to team coding standards, and is successfully merged to the main development branch (master/main).
  * Error handling is implemented appropriately.
  * Relevant configurations (environment variables, service settings) are updated and documented.
  * Database changes (if any) are scripted, peer-reviewed, and backward-compatible where feasible.
* **Testing & Quality Assurance:**
  * All Acceptance Criteria (AC) are met and verified.
  * Unit tests are written for new/modified code, meeting coverage goals, and all pass.
  * Automated integration and/or End-to-End (E2E) tests are written/updated for critical paths and pass consistently in the CI/CD pipeline.
  * Manual functional testing (exploratory, edge cases) has been performed and passed in a staging/integration environment.
  * Performance, security, and other relevant Non-Functional Requirements (NFRs) have been considered and met.
  * No new critical or major issues have been introduced.
* **Documentation & Knowledge Transfer:**
  * Technical documentation (e.g., Confluence, READMEs, API specs) is updated to reflect the new feature.
  * A runbook (or updates to an existing one) is created/updated detailing the feature's operation, dependencies, monitoring points, and rollback procedures.
  * Release notes are drafted with a clear description of the feature.
  * Relevant diagrams (architecture, sequence) are updated if significant changes were made.
* **Deployment & Verification:**
  * The feature is successfully deployed to the target environment(s) (e.g., staging, production).
  * Post-deployment verification and smoke tests in the target environment are successful.
  * Monitoring is in place and shows healthy operation of the new feature.
* **Stakeholder Acceptance:**
  * Product Owner has reviewed and formally accepted the feature.

## 2. DoD for: Bug

A fix for a defect or failure in the production system

**Goal:** The identified bug is resolved, the fix is verified, it does not introduce regressions, and the system is restored to correct behavior.

* **Analysis & Implementation:**
  * Root cause of the bug has been identified (where feasible).
  * The fix is implemented, adheres to coding standards, and is merged.
  * Error handling related to the bug's context is reviewed and improved if necessary.
* **Testing & Quality Assurance:**
  * All Acceptance Criteria (confirming the bug is fixed) are met and verified.
  * Unit tests are written/updated to cover the bug scenario and the fix, and all pass.
  * Regression testing (automated and/or manual) is performed to ensure the fix doesn't negatively impact other areas.
  * The fix is tested in a staging/integration environment that closely mirrors production.
  * No new critical or major issues have been introduced by the fix.
* **Documentation & Knowledge Transfer:**
  * The JIRA ticket is updated with details of the fix and how it was tested.
  * If the bug exposed a gap in documentation, relevant documents are updated.
  * Release notes include a clear description of the bug fix.
* **Deployment & Verification:**
  * The bug fix is successfully deployed to production.
  * Post-deployment verification confirms the bug is resolved in production and no new issues are observed.
  * Relevant monitoring is checked to confirm system stability.
* **Stakeholder Acceptance:**
  * The reporter of the bug or the Product Owner confirms the resolution.

## 3. DoD for: Hotfix

An urgent fix for a critical production issue requiring immediate attention

**Goal:** The critical production issue is rapidly resolved or mitigated, system stability is restored, and the immediate risk is contained.

* **Analysis & Implementation (Rapid):**
  * The immediate cause of the critical issue is identified.
  * A targeted fix or mitigation is implemented and merged. Focus is on speed and stability.
  * Code adheres to essential standards, but extensive refactoring is deferred if it delays the fix.
* **Testing & Quality Assurance (Focused & Rapid):**
  * Acceptance Criteria (focused on resolving the critical symptom) are met and verified.
  * Essential unit tests for the fix are written and pass.
  * Targeted testing in a pre-production environment (if time permits) or directly in production (with extreme caution and monitoring) verifies the fix.
  * Critical: Verify the hotfix does not cause immediate, more severe issues.
* **Documentation & Knowledge Transfer (Post-Incident Focus):**
  * JIRA ticket updated with the fix details and deployment time.
  * A brief incident report or update is communicated to stakeholders.
  * A **clear rollback plan** for the hotfix was defined and is ready.
  * A follow-up task/story is created for root cause analysis and implementing a more permanent solution if the hotfix was a workaround.
* **Deployment & Verification (Urgent & Monitored):**
  * The hotfix is deployed to production immediately or via an emergency change process.
  * Intensive post-deployment monitoring is conducted to confirm resolution and system stability.
* **Stakeholder Acceptance:**
  * Key stakeholders (e.g., Engineering Lead, Product Lead on call) confirm the system is stabilized.

## 4. DoD for: Spike

Time-boxed investigation to reduce uncertainty or gather knowledge

**Goal:** The research question is answered, and the findings/learnings are clearly documented and shared, enabling future decision-making.

* **Investigation & Analysis:**
  * The defined research questions or objectives of the Spike have been thoroughly investigated.
  * Relevant data has been gathered, and different options/approaches have been explored (if applicable).
* **Deliverables (as defined in DoR for the Spike):**
  * The primary output (e.g., a document, report, presentation, proof-of-concept (POC) code, Miro board) is complete and meets the agreed-upon expectations.
  * POC code (if any) is functional enough to demonstrate the concept and is stored in a designated branch/repo. (Production-level code quality/testing is not typically expected for POCs unless specified as a goal of the Spike).
* **Knowledge Sharing & Recommendations:**
  * Findings, conclusions, and any recommendations are clearly documented.
  * The outcomes of the Spike have been shared with and discussed by the relevant team members/stakeholders.
* **Next Steps Identified:**
  * Based on the Spike's findings, potential next steps (e.g., create new PBIs, refine existing ones, decide against a particular approach) are identified.

## 5. DoD for: Operations

Tasks like updating configurations, data fixups, scheduled maintenance

**Goal:** The operational task is completed accurately, its outcome is verified, and the system remains stable and performs as expected.

* **Execution:**
  * The task has been performed according to the defined procedure or instructions (e.g., runbook, script).
  * Any manual steps have been carefully executed and double-checked if necessary.
* **Verification & Validation:**
  * The successful completion of the task is verified (e.g., exchange rates are updated in the system, data fixup script ran without errors and affected the correct records, tax CSV uploaded and processed).
  * Relevant system logs or monitoring dashboards are checked to confirm successful execution and no adverse effects.
  * If applicable, the stakeholder who requested the task (e.g., Finance) confirms the outcome meets their requirements.
* **Documentation & Auditing:**
  * The JIRA ticket is updated with details of when the task was performed, by whom, and any notable outcomes or issues encountered.
  * If the task involved changes to configurations or data, these changes are logged or auditable.
  * Relevant runbooks or operational guides are updated if the procedure changed.
* **Rollback (If Applicable):**
  * If a rollback plan was defined, it's confirmed to be still valid and understood. For data changes, a backup or reversal method should be confirmed.

## 6. DoD for: Productivity

Tasks improving team efficiency, system health, or developer experience

**Goal:** The intended improvement is implemented, and its benefits are realized or clearly documented for future realization.

* **Implementation:**
  * The productivity task (e.g., documentation created/updated, process automated, refactoring completed, local environment script improved, test suite enhanced) is fully implemented.
  * If code changes were involved (e.g., refactoring, test automation), they adhere to coding standards, are reviewed, and merged. Existing functionality must not be broken.
* **Benefit Realization/Verification:**
  * The intended improvement is observable or verifiable.
    * *Example: New documentation is published on Confluence and reviewed for clarity.*
    * *Example: A previously manual process is now automated, and the automation runs successfully.*
    * *Example: Refactored code passes all existing tests, and new unit tests for the refactoring also pass. Code complexity (if measured) is reduced.*
    * *Example: Local environment setup time is demonstrably faster.*
* **Knowledge Sharing (If Applicable):**
  * If the task involves a new tool, process, or significant documentation, it has been communicated and shared with the relevant team members.
* **Future Maintenance (If Applicable):**
  * If the improvement requires ongoing maintenance (e.g., an automation script), this is documented.
