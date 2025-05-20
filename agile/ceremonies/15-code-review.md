# General Guiding Principles for Code Review

* **Collaborative Improvement, Not Criticism:** Code review is a collective effort to enhance code quality, share knowledge, and ensure consistency. It's about improving the product and our skills, not about finding fault with individuals. Maintain "positive vibes" and provide constructive feedback.
* **Shared Responsibility for Quality:** The entire team shares responsibility for the quality of the codebase. Reviews are a key mechanism to uphold this.
* **Early and Frequent Feedback:** Smaller, more frequent reviews are generally more effective than large, infrequent ones.

## Code Review: Practices for Quality & Collaboration

### 1. Overview & Purpose of Code Review

* Code review is a systematic examination of source code by developers other than the author. Its primary goal is to improve code quality by identifying potential issues (bugs, design flaws, security vulnerabilities), ensuring adherence to coding standards, and promoting knowledge sharing within the team.
* It serves as a crucial quality gate before code is merged into main development branches, aiming to catch problems early and maintain the overall health and maintainability of the codebase.

### 2. Why Code Review is Essential for Our Team

* **Ensures Correctness & Robustness:** Verifies that the code meets requirements and is well-architected.
* **Promotes Effectiveness & Performance:** Helps ensure the solution is efficient and performs as expected.
* **Upholds Standards:** Enforces agreed-upon coding standards, naming conventions, and style guides.
* **Enhances Security:** Identifies and helps mitigate potential security vulnerabilities.
* **Improves Maintainability:** Leads to cleaner, more understandable, and easier-to-maintain code.
* **Facilitates Knowledge Sharing:** Spreads knowledge of the codebase and different approaches across the team. This is particularly important given the mix of legacy (Blurby) and new (Blurb 2.0) systems.
* **Develops Skills:** Provides regular feedback that helps all team members sharpen their skills.

### 3. The Code Review Process: A Step-by-Step Approach

Our code review process emphasizes author preparedness and leverages modern tools, followed by collaborative peer review.

* **Step 1: Author's Preparation & Self-Review (Leveraging Tools)**
  * **Adherence to PR Template:** Before submitting a Pull Request (PR), the author ensures the PR template is fully and accurately completed. This provides essential context for reviewers.
  * **Local Testing:** Thoroughly test changes locally, including running all relevant unit and automated tests to ensure they pass.
  * **Self-Review Against Standards:**
    * Review your own code against the team's coding standards, naming conventions, and style guides.
    * Check for clarity, simplicity, and maintainability.
  * **Utilize GitHub Copilot (or similar AI assistants in VS Code/IntelliJ):**
    * **For Code Generation & Suggestions:** Use Copilot during development to explore solutions and generate boilerplate code, always critically evaluating its suggestions.
    * **For Pre-Review Checks:** Before submitting the PR, leverage Copilot's capabilities (or IDE linters/analyzers) to:
      * Identify potential bugs or edge cases.
      * Check for code smells or anti-patterns.
      * Suggest improvements for clarity or efficiency.
      * Ensure adherence to basic formatting and style guidelines.
    * *This step helps catch common issues before peer review, making the process more efficient.*
  * **Ensure PR is Well-Scoped:** Verify the PR addresses a single concern or a small, cohesive set of changes. Avoid overly large PRs.
* **Step 2: Submitting the Pull Request (PR)**
  * Once the author is confident with their self-review and tool-assisted checks, submit the PR.
  * Ensure the PR description (using the template) is comprehensive and links to the relevant JIRA ticket.
  * Assign appropriate reviewers (e.g., team members with context, senior developers, or as per team agreement). The team discussed Dave Ryack and Tyler as potential reviewers for different code types.
* **Step 3: Peer Review**
  * **Reviewer(s) Examination:** Designated reviewers examine the code changes.
  * **Focus Areas (see section 4 below):** Reviewers concentrate on aspects like design, correctness, complexity, tests, maintainability, security, performance, and documentation.
  * **Provide Constructive Feedback:**
    * Be specific with comments. Explain *why* a change is suggested.
    * Offer suggestions for improvement rather than just pointing out flaws.
    * Ask clarifying questions if something is unclear.
    * Maintain a respectful and collaborative tone ("Positive vibes").
  * **Timeliness:** Reviewers should aim to provide feedback in a timely manner to avoid blocking the author.
  * **Scope of Review:**
    * **Recommended Limit:** To maintain review quality, aim to review manageable chunks of code (e.g., under 500 Lines of Code (LoC) per session, ideally not spending more than an hour at a time without a break). This helps maintain focus and effectiveness.
* **Step 4: Discussion & Iteration**
  * The author reviews the feedback and engages in a discussion with the reviewers if needed.
  * The author makes necessary changes based on the feedback and pushes updates to the PR.
  * This can be an iterative process.
* **Step 5: Approval & Merge**
  * Once reviewers are satisfied and have approved the PR (e.g., at least one mandatory approval, as per your template), and all CI checks are passing, the PR can be merged into the target branch by an authorized team member.
  * Ensure merge requirements (e.g., squash commits, rebase) are followed as per team agreement.

### 4. What to Look For During a Code Review (Reviewer's Checklist)

This checklist is based on your provided information and general best practices:

* **Design and Business Needs Compliance:**
  * Does the code correctly implement the requirements outlined in the JIRA ticket and PR description?
  * Is the solution well-architected and does it fit within the existing system design?
  * Is it an effective and performant solution for the given requirements?
* **Naming:**
  * Are variables, functions, classes, and modules named clearly, consistently, and according to team conventions?
* **Tests:**
  * Are there sufficient unit tests for new/modified code? Do they cover key scenarios and edge cases?
  * Are existing tests updated if necessary? Do all tests pass?
  * Is automated testing (integration, E2E) adequate for the change?
* **Complexity:**
  * Is the code unnecessarily complex? Can it be simplified while maintaining functionality? (Think SOLID, DRY, KISS principles).
  * Is the code easy to understand and follow?
* **Maintainability & Other Quality Attributes:**
  * Is the code clean, readable, and well-formatted according to team standards?
  * Are there adequate comments where necessary (explaining complex logic or "why," not just "what")?
  * Does the code avoid introducing technical debt?
  * Consider other relevant quality attributes like scalability, reusability.
* **Security (According to the case):**
  * Are there any potential security vulnerabilities introduced (e.g., SQL injection, XSS, improper handling of sensitive data)?
  * Does the code follow security best practices?
* **Performance (According to the case):**
  * Are there any obvious performance bottlenecks?
  * Is the code efficient in terms of resource usage (CPU, memory, database queries)?
* **Documentation:**
  * Has relevant documentation (technical docs, runbooks, READMEs, changelogs) been updated as per the PR template and DoD?
* **Adherence to Conventions:**
  * Does the code follow all agreed-upon coding standards, style guides, and project conventions?
* **Error Handling:**
  * Is error handling robust and user-friendly (where applicable)? Are errors logged appropriately?
* **PR Description Quality:**
  * Is the PR template filled out completely and clearly? Does it provide enough context?

### 5. Best Practices for Authors and Reviewers

* **For Authors:**
  * **Prepare Thoroughly:** Submit clean, well-tested code with a comprehensive PR description.
  * **Be Open to Feedback:** View reviews as an opportunity to learn and improve.
  * **Respond Respectfully:** Engage in discussions constructively.
* **For Reviewers:**
  * **Be Thorough but Efficient:** Aim for a balance.
  * **Be Constructive and Kind:** Offer suggestions, ask questions, and maintain a positive tone.
  * **Focus on Important Issues:** Prioritize feedback on significant problems over minor stylistic preferences (unless they violate agreed standards).
  * **Automate What Can Be Automated:** Rely on linters and static analysis tools for basic style and syntax checks, allowing human reviewers to focus on logic, design, and more complex issues.
