# **Pull Request (PR) Best Practices & Template Guide**

**Intention of the Pull Request Template:**

The Pull Request (PR) template serves as a standardized communication tool for developers submitting code changes for review and merging. Its primary intentions are to:

1. **Provide Context:** Ensure reviewers have all necessary information to understand the *why* and *what* of the changes without extensive external research.
2. **Facilitate Effective Reviews:** Guide reviewers by highlighting the problem solved, the impact, how the solution meets acceptance criteria, and how it was tested.
3. **Ensure Quality & Completeness:** Act as a checklist to confirm that key aspects of the Definition of Done (DoD) (like testing and documentation) have been addressed before merging.
4. **Improve Traceability:** Clearly link the code changes back to the original problem or requirement (e.g., JIRA ticket) and document the solution's impact.
5. **Streamline Onboarding & Knowledge Sharing:** Help new team members understand the expected level of detail for changes and serve as a historical record for future reference.

## Using the Pull Request Template: Section by Section Guide & Practices

Our PR template is structured to capture essential information. Here’s how to approach each section:

### **\# Pull Request**

*(This is the title of your PR. It should be clear and follow Git commit conventions for the summary line if possible, e.g., fix(SUSENG-123): Resolve incorrect VAT for Norway or feat(SUSENG-45): Add O-binding option)*

### **\#\# Problem Statement**

* **Purpose:** Clearly articulate the issue being addressed or the goal of the new feature. This should align directly with the JIRA ticket.
* **Content Guidance:**
  * **Link to JIRA Ticket:** **\[REQUIRED\]** Always include a direct link to the primary JIRA ticket this PR addresses (e.g., Resolves: \[SUSENG-123\](link-to-jira-ticket)).
  * Briefly describe the problem (for bugs) or the objective (for features/tasks).
  * Use the provided questions as prompts:
    * Is this fixing a defect? (If so, what was the defect?)
    * Resolving a security vulnerability? (If so, what was the vulnerability?)
    * Enhancing a workflow? (If so, what workflow and how?)
  * **Diagrams:** For complex changes, especially those involving architectural modifications or new workflows, including or linking to diagrams (sequence, architecture) is highly encouraged to improve understanding.

### **\#\# Business Impact**

* **Purpose:** Explain the significance of this change from a business, operational, or user perspective. This helps reviewers understand the priority and potential consequences.
* **Content Guidance:**
  * **Risk Level:** Briefly state the risk associated with the problem being solved (e.g., financial, compliance, UX, performance).
  * **Implications:** What happens if this change is made (benefits)? What happens if it's *not* made (continued risks/problems)?
  * This section should echo the "Business or Operational Impact Understood" part of your Definition of Ready (DoR).

### **\#\# Acceptance Criteria**

* **Purpose:** List the specific, measurable outcomes that this PR achieves. These should directly correspond to the Acceptance Criteria defined in the JIRA ticket.
* **Content Guidance:**
  * **\[REQUIRED\]** Copy the Acceptance Criteria from the JIRA ticket here as a checklist.
  * Reviewers will use this to confirm the PR delivers the agreed-upon functionality.
  * Mark each criterion as met by the changes in this PR.

### **\#\# Dependencies**

* **Purpose:** Highlight any dependencies this PR has or any external impacts it might cause.
* **Content Guidance:**
  * List any dependencies on other teams, services, or upcoming PRs.
  * Specify the environments used for testing (e.g., local, dev, master/integration environment).
  * Note any specific library versions, API contracts, or configuration changes this PR relies on or introduces.

### **\#\# Technical Details**

#### **\#\#\# Changes Made**

* **Purpose:** Provide a technical summary of the changes implemented in this PR.
* **Content Guidance:**
  * Briefly list the key technical modifications (e.g., "Updated OrderService to handle O-binding SKU," "Refactored TaxCalculator for clarity," "Added new endpoint /api/v2/books/{id}/binding-options").
  * Focus on the "what" and "where" of the changes at a high level. Detailed line-by-line explanations belong in code comments or the commit messages themselves.
  * If there are significant architectural decisions, briefly mention them and link to more detailed documentation if it exists.

#### **\#\#\# Testing**

* **Purpose:** Detail the testing efforts undertaken to ensure the quality and correctness of the changes. This is a critical part of meeting the Definition of Done.
* **Content Guidance:**
  * **\[REQUIRED\]** Confirm that unit tests have been added or updated for the new/modified code and that they pass. Mention coverage if relevant.
  * **\[REQUIRED\]** Confirm that manual testing (functional, exploratory, edge cases) has been completed in an appropriate environment.
  * Mention if any new automated integration or E2E tests were added or if existing ones were updated and passed.
  * Briefly describe any specific scenarios tested manually that are critical or were edge cases.

### **\#\# Documentation**

* **Purpose:** Ensure that all necessary documentation has been updated to reflect the changes made in this PR.
* **Content Guidance:**
  * Check off items as applicable:
    * **Updated README/Wiki/Confluence:** For technical documentation, architectural changes, or new service information.
    * **Updated runbook:** Especially important for operational changes, new features affecting support, or anything requiring specific monitoring or rollback procedures.
    * **Relevant stakeholders notified:** E.g., notifying DevOps of a config change, or Product about a feature being ready for review.

### **\#\# Additional Notes**

* **Purpose:** A space for any other relevant information that doesn't fit neatly into the above categories.
* **Content Guidance:**
  * Any specific instructions for reviewers (e.g., "Please pay close attention to the changes in PaymentService.java").
  * Known limitations or areas for future improvement related to this PR.
  * Screenshots or GIFs demonstrating UI changes (if applicable and not already in JIRA).
  * Any context that might help a reviewer understand a particularly complex piece of code.

**General Best Practices for Creating and Managing PRs:**

1. **Keep PRs Small and Focused:**
   * Each PR should ideally address a single concern (one feature, one bug fix). This makes them easier and faster to review.
   * Avoid large, monolithic PRs with many unrelated changes.
2. **Write Clear Commit Messages:**
   * Follow the team's Git commit conventions (e.g., Conventional Commits). Atomic commits with clear messages make the PR's history understandable.
3. **Self-Review Before Submitting:**
   * Before requesting a review, re-read your own code and the PR description as if you were the reviewer. Catch typos, clarify comments, and ensure the changes make sense.
4. **Request Reviews from Appropriate Team Members:**
   * Tag relevant reviewers who have context or expertise in the area of code being changed. The team discussed Tyler and Dave Ryack as potential reviewers for different types of code.
5. **Respond to Feedback Promptly and Constructively:**
   * Engage with reviewer comments. If you disagree, explain your reasoning respectfully.
6. **Ensure the PR Meets the Definition of Done (DoD):**
   * Before marking a PR as ready to merge, verify that all relevant criteria from your team's DoD have been satisfied by the work within the PR. The PR template itself acts as a partial checklist for this.
