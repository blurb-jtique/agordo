# **General Guiding Principles for Production Releases**

* **Safety & Stability First:** The primary goal of any production release is to deliver value without compromising the stability or performance of the live environment.
* **Preparedness:** Thorough preparation, including clear communication, comprehensive testing in pre-production environments, and ready rollback plans, is essential.
* **Transparency:** All stakeholders should be adequately informed about upcoming releases, their scope, and their status.
* **Continuous Improvement:** Learn from each release to refine the process, improve monitoring, and enhance rollback procedures.

## **Production Release: Agreed Practices & Best Practices**

These practices assume that the changes have already been merged to the production branch after successfully passing all checks in master and integration environments, as outlined in the "Guidelines for Merging and Releasing."

### 1. Pre-Release Communication & Preparation (The 24-Hour Rule & Template)

* **24-Hour Notification Rule:**
  * **Requirement:** At least 24 hours before a planned production deployment, a formal notification must be sent out.
  * **Audience:** This notification should go to key stakeholders, including relevant business units, customer support, DevOps, the on-call team, and the wider engineering/product teams as appropriate. The primary channel for broad notification is the \#production Slack channel.
* **Use a Standard Release Template for Notification:**
  * **Requirement:** All pre-release notifications must follow an agreed-upon template. This ensures consistency and that all critical information is communicated.
  * **Template Content (Key Elements):**
    * **Release Name/Version:** A clear identifier for the release.
    * **Scheduled Deployment Time & Duration:** When the release will start and the expected timeframe.
    * **JIRA Tickets Included:** A list of all features, bugs, and tasks being deployed.
    * **Purpose/Business Value:** A brief summary of why these changes are being made.
    * **Key Changes:** High-level overview of what is changing.
    * **Potential Impact:** Any anticipated impact on users or system performance (even if minimal).
    * **Deployment Lead/Contact Person:** Who is responsible for overseeing the deployment.
    * **Monitoring Plan:** Briefly, what key metrics or dashboards will be monitored post-deployment.
    * **Rollback Plan Summary:** A brief statement that a rollback plan exists and key steps or trigger conditions for it.
* **Final Go/No-Go Check:**
  * A brief check before the scheduled deployment time to ensure all prerequisites are met, no new critical issues have arisen, and key personnel are ready.

### 2. Deployment Execution

* **Follow Established Pipeline:** Utilize the defined Jenkins pipeline (e.g., "Blurby Prod PL") for deploying to production. This typically involves deployment to an integration (pre-production) environment first, followed by the live production environment.
* **Clear "Release Manager" Role:** The designated "Release Manager" or deployment lead for that specific release is responsible for initiating and overseeing the deployment process through Jenkins.
* **Address Pipeline Issues Promptly:** If the Jenkins pipeline encounters issues (e.g., test failures in integration), these must be addressed before proceeding to the live production deployment. This might involve halting the release, fixing the issue, or executing a documented override if it's a known flaky test (with caution).

### 3. Post-Deployment Verification & Monitoring

* **Immediate Smoke Testing:** Execute automated smoke tests immediately after deployment to verify critical system functionalities.
* **Manual Sanity Checks:** The development team and/or Product Owner should perform targeted manual checks of the deployed changes in the production environment.
* **Intensive Monitoring:**
  * Closely monitor key system health dashboards and metrics (e.g., New Relic, Sumo Logic, CheckMK) for a predefined period post-release.
  * Look for any anomalies, increased error rates, performance degradation, or unexpected behavior related to the deployed changes.
  * The on-call team should be particularly vigilant and aware of what was deployed.
* **Validate Business Objectives:** Where applicable and feasible, confirm that the deployed changes are meeting their intended business objectives or resolving the targeted issues.

### 4. Rollback Plan Execution Readiness

* **Accessible & Understood Plan:** The documented rollback plan must be readily accessible and clearly understood by the deployment lead and the on-call team.
* **Clear Trigger Conditions:** Define clear conditions under which a rollback would be initiated (e.g., critical functionality failure, unacceptable performance degradation, significant increase in error rates).
* **Practice (If Feasible):** For major or high-risk releases, consider practicing parts of the rollback procedure in a non-production environment if possible.
* **Feature Flags (Where Applicable):** If changes were deployed using feature flags, these provide a rapid rollback/mitigation mechanism by toggling the flag off.

### 5. Post-Release Communication (Follow-Up)

* **"All Clear" Notification:** Once the deployment is confirmed stable after the initial monitoring period, send out an "all clear" or "deployment successful" notification to the same channels used for the pre-release announcement.
* **Incident Reporting (If Necessary):** If any issues arose during or after the deployment (even if resolved), ensure they are documented, and an incident report is created if the impact was significant. This feeds into the retrospective and learning process.

**Special Considerations for Our Team:**

* **Release Cadence:** Aim for regular, predictable release windows (e.g., Tuesdays/Wednesdays, aligned with sprint completions) to establish a rhythm and manage stakeholder expectations.
* **On-Call Team Collaboration:** Ensure close communication and information sharing with the on-call team, as they are the first line of defense if issues arise post-release, especially outside of core team working hours. The release template and pre-release communication should explicitly include them.
* **Learning from Incidents:** Any production incident, even minor ones, should be discussed (e.g., in retrospectives or dedicated post-mortems) to identify lessons learned and improve future release practices, monitoring, or rollback procedures.