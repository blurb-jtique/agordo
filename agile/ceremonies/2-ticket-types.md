# Ticket Type Definitions

## 1. Bug

* **Definition:** Represents a defect, failure, or flaw in the production system that causes it to behave in an unintended or incorrect manner. This could be a deviation from specified requirements or user expectations.
* **Context from Documents:**
  * Directly aligns with the standard "Bug" JIRA issue type.
  * Examples included incorrect VAT rate calculations UI display issues like "ensheet stuff not visible", and problems with PDF uploads or page rendering.
  * It's recommended to link a bug to the recent change that likely introduced it, if identifiable.

## 2. Feature

* **Definition:** Represents a new piece of functionality, an enhancement to existing functionality, or a new product offering that delivers value to the end-user or the business.
* **Context from Documents:**
  * Corresponds to the "Story" JIRA issue type.
  * Encompasses incremental work and new developments.
  * Examples from discussions include adding O-ring binding introducing new cover finishes or the "gift with purchase" functionality.

## 3. Spike

* **Definition:** A time-boxed investigation or research task aimed at reducing uncertainty, understanding a complex problem, exploring technical feasibility, or gathering information necessary to define and estimate a future Feature or Bug. The primary output is knowledge, which might manifest as a document, a proposal, or a recommendation.
* **Context from Documents:**
  * Directly aligns with the "Spike" or "Research Efforts" JIRA issue type.
  * Used for tasks like understanding pricing/shipping/tax complexities r developing a proposal for handling social media image sharing.
  * Spikes may not always have explicit, granular action items at the outset but need a high-level expectation or goal to define their completion. They don't typically receive story points in the same way as Features or Bugs.

## 4. Operations

* **Definition:** A task that involves maintaining or updating the platform or its data, which is often repetitive and does not necessarily involve new code development but is crucial for business continuity or compliance. These tasks require tracking, auditing, and monitoring.
* **Context from Documents:**
  * Examples include updating tax rates, managing exchange rates and data fix-ups.
  * These are often part of the sustaining engineering backlog and are handled within sprints, currently by developers, though there's a desire to potentially shift some to other departments if tools are improved.
  * Could be represented as "Tasks" in JIRA.

## 5. Productivity

* **Definition:** Encompasses tasks aimed at improving the team's efficiency, a system's maintainability, or the developer experience, rather than delivering direct, new value to the end-customer. This includes creating/updating documentation, refining processes, improving local development environments, enhancing test suites, refactoring code, and addressing technical debt.
* **Context from Documents:**
  * Strongly supported for allocation within sprints (e.g., 20-25% capacity for "dev productivity tasks").
  * The modernization effort (upgrading Ruby, Rails, Postgres) has significant productivity benefits.
  * Documenting processes, automating manual steps (like meeting summaries or release notifications), and addressing "technical depth" are key examples (Attachment; Kickoff).

## 6. Hotfix

* **Definition:** An urgent fix addressing a critical issue in the production environment, often discovered post-release or due to unexpected system behavior. The priority is rapid resolution, which may sometimes mean the initial fix isn't the definitive or most elegant long-term solution.
* **Context from Documents:**
  * The need for such fixes is evident from discussions around production incidents, "live issues" and "emergencies"   * Rollback strategies are essential when hotfixes are applied or if an issue is too severe for an immediate fix.
  * These are essentially high-priority, urgent Bugs or Tasks.
