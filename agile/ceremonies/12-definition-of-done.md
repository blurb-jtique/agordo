# Definition of Done (DoD): A Summary

The Definition of Done (DoD) is a **shared checklist** ensuring every Product Backlog Item (PBI) meets a consistent quality standard before being considered complete and potentially shippable. It's crucial for:

* **Consistent Quality:** Especially important for complex legacy systems like Blurby.
* **Reduced Rework:** Prevents incomplete work from moving forward.
* **Accurate Progress Tracking:** Provides a clear "done" or "not done" status.
* **Better Estimation:** Helps in understanding the full scope of work.
* **Team Collaboration:** Ensures everyone works towards the same completion standards.

**Key Practices for Your Team's DoD:**

* **Team-Owned & Created:** The entire Agile Team (Engineers, Product Owner) collaboratively defines and agrees on the DoD.
* **Comprehensive:** Covers all aspects needed for a high-quality increment, including:
  * Code complete & meets standards.
  * All tests (unit, automated integration/E2E) written and passing.
  * Code reviewed and approved.
  * Merged to the correct branch.
  * Deployed and verified in necessary environments (e.g., integration).
  * Acceptance Criteria (AC) met.
  * Documentation updated.
  * Monitoring and rollback plans considered (especially for production).
  * Product Owner acceptance (for Features/Stories).
* **Clear & Verifiable:** Each criterion must be unambiguous and objectively checkable.
* **Achievable:** The team must be able to consistently meet the current DoD.
* **Visible & Accessible:** Documented (e.g., on Confluence) and readily available.
* **Living Document:** Regularly reviewed and adapted in Sprint Retrospectives based on team experience.
* **Consistent Application:**
  * The entire team is responsible for adherence.
  * DoD activities are integrated throughout development, not just at the end.
  * "Done" means all DoD criteria are met – no "almost done."
  * Quality is non-negotiable; don't compromise the DoD for deadlines.
  * Be transparent if a PBI struggles to meet the DoD.

## ✅ Definition of Ready (DoR)

**What it is:**
A checklist of criteria that a user story or task must meet **before the team can start working on it**.

**Purpose:**
To ensure that backlog items are well-defined, understood, and feasible to start during a sprint.

**Typical DoR Criteria:**

* Clear and concise user story or requirement.
* Acceptance criteria are defined.
* Dependencies are identified and resolved.
* Business value is understood.
* Size is small enough to complete in a sprint.
* Team understands what needs to be done.

**Think of it as:**

> "Are we ready to start this?"

---

## ✅ Definition of Done (DoD)

**What it is:**
A checklist of conditions that must be met **for a product increment or user story to be considered complete**.

**Purpose:**
To ensure consistent quality and completeness before delivering or releasing work.

**Typical DoD Criteria:**

* Code is written, peer-reviewed, and merged.
* Unit and integration tests pass.
* Acceptance criteria are met.
* Documentation is updated.
* Deployed to a test or staging environment.
* Approved by product owner.

**Think of it as:**

> "Is this truly done and ready to deliver?"

---

## Summary Table

| Feature         | Definition of Ready (DoR)      | Definition of Done (DoD)                |
| --------------- | ------------------------------ | --------------------------------------- |
| **When used**   | Before a story enters a sprint | After work on a story is complete       |
| **Purpose**     | Ensure the team can start work | Ensure the work meets quality standards |
| **Focus**       | Clarity and preparedness       | Completion and quality                  |
| **Who uses it** | Product Owner, Team            | Developers, QA, Product Owner           |
