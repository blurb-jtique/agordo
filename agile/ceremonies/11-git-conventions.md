# Git Conventions: Branching and Committing Best Practices

## 1. Branching Conventions

Clear and consistent branch names improve repository organization and make it easier to understand the purpose of active development lines.

* **Branch Naming Format:**
  * Follow the format: **\<type\>/\<jira-ticket\>-\<short-descriptive-name\>**
  * **\<type\>:** Indicates the nature of the work being done on the branch. Common types include:
    * fix: For bug fixes (e.g., fix/SUSENG-123-resolve-norway-vat-issue)
    * feat: For new features (e.g., feat/SUSENG-45-add-obinding-notebook)
    * chore: For maintenance tasks, build process changes, or other non-functional changes (e.g., chore/SUSENG-78-update-ci-pipeline)
    * refactor: For code refactoring that neither fixes a bug nor adds a feature (e.g., refactor/SUSENG-90-optimize-order-query)
    * docs: For documentation changes (e.g., docs/SUSENG-101-update-readme)
    * spike: For research or investigation tasks (e.g., spike/SUSENG-50-investigate-rails7-upgrade)
  * **\<jira-ticket\>:** The full JIRA ticket ID (e.g., SUSENG-1). This is crucial for linking work directly to the task tracker.
  * **\<short-descriptive-name\>:** A brief, hyphenated, lowercase description of the branch's purpose. It should be concise but clear enough to give context.
  * **Example:** fix/SUSENG-1-pdf-taxes
* **Best Practices for Branches:**
  * **Short-Lived:** Branches should be as short-lived as possible to minimize merge conflicts and integration issues. Aim to integrate work back into the main development line frequently.
  * **Focused:** Each branch should focus on a single task, feature, or bug fix. Avoid bundling unrelated changes into one branch.
  * **Pull from Up-to-Date Master:** Always create new branches from the latest version of your main development branch (e.g., master, sandbox, testbed). Regularly rebase or merge the main development branch into your feature branch to stay updated.
  * **Clean Up:** Delete branches after they have been successfully merged and are no longer needed (both locally and on the remote).

## 2. Commit Message Conventions (Following Conventional Commits)

Well-crafted commit messages are essential for understanding changes, debugging, and generating changelogs. Adhere to the Conventional Commits specification (v1.0.0).

* **Commit Message Format:**
  \<type\>: \<short description\>

  \[optional body: longer description, JIRA ticket\]

  \[optional footer(s)\]

* **\<type\>:** This prefix indicates the kind of change the commit introduces. This aligns with the branch types but can be more granular. Common commit types include:
  * feat: A new feature for the user or system.
  * fix: A bug fix.
  * docs: Documentation only changes.
  * style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.).
  * refactor: A code change that neither fixes a bug nor adds a feature.
  * perf: A code change that improves performance.
  * test: Adding missing tests or correcting existing tests.
  * chore: Changes to the build process or auxiliary tools and libraries such as documentation generation. Also used for dependency updates.
  * ci: Changes to CI configuration files and scripts.
  * build: Changes that affect the build system or external dependencies.
  * revert: If the commit reverts a previous commit.
* **\<short description\>:**
  * A concise summary of the code changes.
  * **Imperative Mood:** Use the imperative mood (e.g., "add feature" not "added feature" or "adds feature").
  * **Lowercase:** Do not capitalize the first letter.
  * **No Period at the End:** Do not end the subject line with a period.
  * **Max Length:** Aim for around 50 characters, but no more tha## 7
* **\[optional body\]:**
  * **Motivation & Context:** Provide more detailed explanatory text after the subject line, preceded by a blank line. Explain the "why" and "what" of the change, not just the "how."
  * **JIRA Ticket Reference:** **Crucially, include the JIRA ticket ID in the body.** This provides a clear link between the code change and the task.
    * Format: Jira: SUSENG-1 (or your team's preferred format).
  * Wrap the body at 72 characters.
* **\[optional footer(s)\]:**
  * Used for additional metadata, such as BREAKING CHANGE: notifications or referencing issues closed by the commit (e.g., Closes \#123).
* **Examples:**
  fix: resolve incorrect VAT calculation for Norway

  Addresses an issue where the reduced VAT rate was being applied
  to physical books in mixed carts for Norwegian customers.
  This change ensures the standard rate is used for physical items.

  Jira: SUSENG-5

  feat: add o-ring binding option for notebooks
  Introduces o-ring binding as a new cover type selectable
  for notebook products in BookWright Online. This change
  updates the product options, pricing (if applicable), and
  ensures correct data is passed to UOS.
  Jira: SUSENG-45
  chore: update Ruby gems to latest patch versions

  Updates several minor gem dependencies to their latest
  stable patch versions to address potential security advisories
  and maintain compatibility.

  Jira: SUSENG-102

  *As per your example:*
  `git commit \-m 'fix: update taxes for print on demand line items' \-m 'Jira: SUSENG-1'`

  *(Note: For multi-line messages with \-m, each \-m creates a new paragraph. For a structured body, it's often easier to commit without \-m to open your configured editor, or use a Git GUI.)*
* **Best Practices for Commits:**
  * **Atomic Commits:** Each commit should represent a single, logical unit of change. Avoid lumping unrelated changes into one commit. This makes history easier to understand, review, and revert if necessary.
  * **Well-Crafted Messages:** Write clear, concise, and informative commit messages. Think about your future self or a new team member trying to understand the change.
  * **Test Before Committing:** Ensure your changes work and don't break existing functionality (run relevant tests).
  * **Commit Early, Commit Often (Locally):** Make small, frequent commits to your local feature branch as you work. You can always squash or rebase them into more logical commits before pushing or creating a pull request.
  * **Reference Issues:** Always reference the relevant JIRA ticket in your commit messages.

## 3. Benefits of These Conventions

* **Improved Readability & Understanding:** A clean, consistent Git history is easier for everyone to read and understand.
* **Enhanced Collaboration:** Clear conventions reduce friction and misunderstandings within the team.
* **Easier Code Reviews:** Well-scoped branches and atomic commits with clear messages make code reviews more efficient and effective.
* **Simplified Debugging:** Makes it easier to pinpoint when and why a change was introduced (e.g., using git bisect).
* **Automated Changelog Generation:** Conventional Commits enable the automatic generation of meaningful changelogs.
* **Better Project Management:** Linking commits and branches to JIRA tickets provides clear traceability from task to code.
* **Smoother Onboarding:** New team members can quickly understand the workflow and project history.
