# Deployment Workflow

To keep the `master` and `production` branches in **Blurby** aligned while maintaining a **clean, conflict-free, and secure Git history** — especially as more contributors join — it's important to establish lightweight but effective **Git workflow rules** and **review standards**.

Based on the pipeline diagram and the current workflow situation, here's a **recommended strategy** for managing the process effectively:

---

## Progressive Development Principles

### 0. **Iterative and Safe Implementation Strategy**

Before diving into the technical workflow, it's crucial to establish development principles that minimize risk and maximize confidence in our releases:

* **Break down features into small, testable chunks** that can be independently deployed and validated
* **Each increment should be production-ready** — avoid leaving incomplete features that could impact users
* **Design for progressive rollout** — implement features that can be safely tested in master/sandbox before full production deployment

#### Feature Flag Strategy

* **Use feature flags liberally** for new functionality, especially user-facing changes
* **Toggle features at the application level** rather than branching code paths extensively
* **Plan flag lifecycle** — document when flags should be removed after successful rollout
* **Test both flag states** — ensure the application works correctly with features both enabled and disabled

#### Demo and Validation Workflow

* **Always demonstrate new features on master/sandbox first** before production promotion
* **Conduct stakeholder demos using the sandbox environment** to validate functionality and gather feedback
* **Use master/sandbox as the primary integration testing environment** for cross-feature compatibility
* **Validate performance and stability** in the sandbox environment under realistic load conditions

This approach ensures that by the time code reaches production, it has been thoroughly validated through multiple stages of progressively realistic environments.

---

## Suggested Git Workflow Strategy

### 1. **Adopt a "GitHub Flow" variant with hardening for production**

Since we already have a separation between `master` (for integration/staging) and `production`, we can keep this setup, but use a stricter promotion path:

* **Development always happens on feature branches**, branched off `master`.
* PRs are merged to `master` **only** after CI passes and review approval.
* **Releases to `production` must be made via PRs from `master` → `production`**, and only after tagging a release candidate.

This adds a deliberate pause for final checks.

---

## Code Review and Merging Policy

### 2. **Enable Protected Branch Rules**

Set rules in GitHub (or our VCS):

* Protect both `master` and `production`
* Enforce:

  * Status checks (e.g., build, unit/integration tests)
  * At least 1 or 2 reviewers for PRs
  * No force pushes
  * No direct commits

This prevents accidental merges and enforces review discipline.

### 3. **Use Rebase & Merge for Clean History**

To avoid clutter from merge commits:

* Encourage contributors to **rebase onto latest `master` before merging**
* Use **“Rebase & Merge”** instead of “Create a merge commit”
* Alternatively, squash commits per PR to reduce noise

This results in a linear, readable history, especially useful when cherry-picking into `production`.

---

## Production Safety

### 4. **Gate the Production Branch**

To safely promote changes from `master` to `production`:

* Always create a **Release PR**: `master` → `production`
* Name PRs like: `Release v1.2.3 - 2025-07-04`
* Run full CI again in this PR, especially end-to-end and smoke tests
* Consider tagging the release commit (e.g., `v1.2.3`) before or after merge

This ensures `production` has only tested, promoted code.

---

## CI Alignment and Flaky Tests

### 5. **Address Flaky Tests Before Promotions**

In our pipeline workflow, some tests are marked as flaky — these can:

* Cause failed builds for clean code
* Prevent merges to production

**Solutions:**

* Quarantine flaky tests (exclude from blocking PRs, run as optional)
* Track them in a dashboard
* Fix or stabilize them before they become required again

This avoids blocking PRs unnecessarily while maintaining accountability.

---

## Local and Pre-Merge Testing

### 6. **Encourage Local `testbed` Usage**

Ensure developers:

* Use the `testbed` VM to mimic CI behavior (Ruby 1.9, Postgres 11, Rails 2)
* Run relevant subsets of tests locally before pushing

Automating this with pre-push Git hooks or a makefile wrapper could improve consistency.

---

## Summary of Steps

| Action                                 | Who             | Tools/Policy                                   |
| -------------------------------------- | --------------- | ---------------------------------------------- |
| Branch off `master`                    | Developer       | Naming convention: `feature/xxx`, `bugfix/yyy` |
| Submit PR to `master`                  | Developer       | CI required, reviewer approval                 |
| Merge using **Rebase & Merge**         | Reviewer        | Clean linear history                           |
| Promote `master` → `production` via PR | Release Manager | Run E2E/smoke tests                            |
| Protect `master` and `production`      | Admin           | GitHub branch protection rules                 |
| Tag releases                           | Release Manager | `git tag -a v1.2.3`                            |
