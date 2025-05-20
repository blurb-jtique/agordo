# Guidelines for Merging and Releasing

## Phase 1: Merging to master (Staging/Integration)

The master branch acts as your primary staging and integration environment. All new features and fixes must go through master before being considered for production.

1. **PR Completion & Approval (Feature Branch \-\> master):**
   * **DoD Met:** The Pull Request (PR) from the feature branch (e.g., feat/SUSENG-45-add-obinding-notebook) to master must meet all criteria of the "Code Review: Practices for Quality & Collaboration" document. This includes:
     * Thorough self-review by the author (including use of GitHub Copilot/linters).
     * Successful peer code review and approval (at least one mandatory approval).
     * All automated checks (CI pipeline: build, unit tests, static analysis) passing on the feature branch.
   * **PR Template Complete:** The PR description is comprehensive, linking to the JIRA ticket and detailing changes, testing, and documentation.
2. **Merge Strategy to master:**
   * **Team Agreement:** Decide on a consistent merge strategy (e.g., squash and merge, rebase and merge, or merge commit). Squash and merge is often preferred for keeping the master branch history clean with one commit per feature/fix.
   * **Resolve Conflicts:** The author is responsible for resolving any merge conflicts cleanly.
3. **Post-Merge Verification on master:**
   * **Automated Deployment to master Environment:** The merge to master should automatically trigger a deployment to your master (staging/sandbox) environment via the Jenkins pipeline (e.g., the "Blurby PL" pipeline).
   * **Run Full Test Suite:** The CI pipeline for master must execute the full suite of automated tests:
     * Unit Tests
     * Integration Tests (API tests, Web tests)
   * **All Tests Passing:** All automated tests on the master environment must pass. Address any failures immediately.
   * **Manual Sanity Checks/Exploratory Testing:**
     * The developer, and potentially a QA resource or another team member (like Padraic, as discussed), should perform sanity checks and exploratory testing of the new feature/fix in the master environment.
     * This is an opportunity to catch issues not covered by automated tests.

## Phase 2: Preparing for Production Release (Promoting master to production)

Once changes are stable and thoroughly verified on master, they can be prepared for release to production.

1. **Decision to Release:**
   * The Product Owner, in consultation with the team, decides which features/fixes from master are ready and prioritized for the next production release.
   * Consider the overall stability of master and the business impact of the changes.
2. **Create a Release Candidate (PR from master \-\> production):**
   * Open a new Pull Request to merge the current state of master into the production branch.
   * **PR Description:** Clearly list all JIRA tickets (features, bugs, tasks) included in this release. This forms the basis of your release notes.
   * **No New Code:** This PR should *only* contain commits already merged and tested on master. No new development work should be added directly to this release PR.
3. **Final Review & Approval for Production:**
   * **Stakeholder Review (if needed):** Depending on the nature of the changes, key stakeholders (e.g., Product Owner, relevant business unit leads) may perform a final review or UAT in the master environment (acting as staging).
   * **Code Freeze (Consideration):** For significant releases, consider a short code freeze on master while the release candidate is being prepared and reviewed to prevent last-minute changes from destabilizing the release.
   * **Release Approval:** One or more designated approvers (e.g., Tech Lead, Engineering Manager, Product Owner) must formally approve the PR to production.

## Phase 3: Merging to production and Deployment

This is the final step to make changes live.

1. **Merge to production Branch:**
   * Once approved, merge the PR from master into production.
   * Use a consistent merge strategy (often a direct merge commit is fine here, as master should already have a clean history if squashing was used earlier).
2. **Production Deployment via Jenkins:**
   * The merge to production (or a manual trigger thereafter, as discussed for Blurby) initiates the production deployment pipeline (e.g., "Blurby Prod PL").
   * This pipeline will deploy the code to the integration environment first (which acts as a pre-production environment for Blurby) and run automated tests.
   * If all tests pass on integration, the pipeline (potentially with a manual gate/approval, as was the case with the "green arrow and clock") proceeds to deploy to the live production environment.
3. **Post-Production Deployment Verification:**
   * **Smoke Tests:** Automated smoke tests should run immediately after deployment to production to verify critical functionalities.
   * **Manual Sanity Checks:** The development team and/or Product Owner should perform quick manual checks of the deployed features/fixes in the production environment.
   * **Monitoring:** Closely monitor system health (New Relic, Sumo Logic, CheckMK dashboards) for any unexpected errors, performance degradation, or issues.
   * **Communication:** Announce the successful completion of the release in the designated channels (e.g., Slack \#production channel).
4. **Rollback Plan Readiness:**
   * Always have a documented and understood rollback plan in case of critical issues post-deployment. This was a key discussion point for your team.
   * The plan should detail steps to revert to the previous stable version quickly.

## Special Considerations

* **Cherry-Picking (Avoid if Possible):**
  * The PDF mentions git cherry-pick for applying specific fixes. While sometimes necessary for hotfixes directly to production (bypassing the full master flow if urgent), this should be an exception, not the rule, as it can lead to branches diverging.
  * The team's move to synchronize master and production for Blurby aims to reduce the need for cherry-picking.
* **Hotfixes:**
  * For urgent production issues (Hotfix ticket type), a streamlined process might be needed. This could involve creating a hotfix branch from production, applying the fix, getting rapid review and testing, and merging directly back to production.
  * **Crucially:** Any hotfix merged to production *must* also be merged back into master immediately to prevent regressions.
* **Flaky Tests & Manual Overrides:**
  * The team acknowledged issues with flaky tests sometimes blocking deployments, requiring manual overrides in Jenkins. While a workaround, the long-term goal should be to stabilize these tests.
* **Release Cadence:**
  * The team discussed aiming for regular Tuesday/Wednesday releases for Blurby, aligned with sprint completions.
