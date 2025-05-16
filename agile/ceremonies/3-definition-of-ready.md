# Definition of Ready (DoR)

## 1. Overview & Purpose

* The Definition of Ready (DoR) is a shared understanding and agreement between the Product Owner (and other stakeholders) and the Engineering team on the criteria a Product Backlog Item (PBI) – such as a User Story, Bug, or Feature – must meet before it can be considered ready to be pulled into an upcoming Sprint.
* Its purpose is to ensure that PBIs are **clear, concise, feasible, testable, and actionable**, enabling the team to efficiently plan sprints and consistently deliver valuable Product Increments. It helps in defining "just enough" upfront analysis, preventing both under-preparation and over-analysis.

## 2. Why a DoR is Important for This Team

* **Smoother Sprint Planning:** A clear DoR ensures that Sprint Planning sessions are focused on commitment and task breakdown, rather than lengthy analysis or clarification of PBIs.
* **Reduced Ambiguity & Waste:** It promotes a shared understanding of what needs to be done, minimizing misunderstandings, rework, and "investigation waste" during the sprint.
* **Improved Predictability:** When items meet the DoR, the team can more confidently forecast what can be achieved in a sprint.
* **Backlog Readiness:** It helps maintain a healthy and "workable" backlog, especially for high-priority items.

## 3. Criteria for a "Ready" Product Backlog Item

A Product Backlog Item is considered "Ready" for Sprint Planning when it generally meets the following (aligned with INVEST principles and team discussions):

* **Clear & Understood:**
  * **PBI Clearly Stated:** The objective and intent of the PBI are well-defined and understood by both the Product Owner and the Engineering team.
  * **Acceptance Criteria (AC) Defined:** Specific, measurable, achievable, relevant, and time-bound (SMART, if applicable) acceptance criteria are documented, outlining how the completion of the PBI will be validated.
  * **Stakeholder Alignment (When Applicable):** Necessary inputs or clarifications from relevant stakeholders (e.g., Product, Marketing, Finance, Legal, other dev teams like DevOps) have been obtained or are clearly identified as needed.

* **Actionable & Feasible:**
  * **Small Enough:** The PBI is granular enough to be realistically completed within a single sprint by the team. If too large, it should be broken down during grooming.
  * **Dependencies Identified:** Any dependencies on other tasks, teams, or external factors are identified. Ideally, critical dependencies are resolved, or a clear plan to manage them exists.
  * **Technical Approach Considered (High-Level):** For features or complex bugs, a high-level technical approach or feasibility has been discussed (unless it's a Spike intended for this very purpose).

* **Estimable:**
  * **Effort Estimated:** The PBI has been discussed sufficiently for the Engineering team to provide an effort estimate (e.g., using story points).

* **Testable:**
  * The Acceptance Criteria provide a clear basis for testing and verifying the PBI.
  * Consideration has been given to how the PBI will be tested (though detailed test case creation happens during the sprint).

* **Definition of Done (DoD) Understood:**
  * While the DoD applies to the *completion* of work, a "Ready" item implies that the team understands how the standard team/product DoD will apply to this specific PBI.
  * For clarity, an initial outline of what "done" means for *this specific item* (e.g., specific outputs, code changes, DB scripts) should be clear, or it's confirmed the team's standard DoD is sufficient.

* **Alignment with Sprint Goals/Roadmap (Contextual):**
  * The PBI's relevance to the current product roadmap and potential upcoming sprint goals is understood.

## 4. How to Create and Use the DoR

* **Collaborative Creation:** The DoR should be created and agreed upon by the entire Agile Team (Product Owner and Engineers).
* **Visibility:** Make the DoR easily accessible and visible to the team.
* **Application:**
  * The DoR is primarily used during **Backlog Refinement (Grooming)** sessions. PBIs are assessed against the DoR.
  * It also serves as a checklist before items are formally pulled into **Sprint Planning.**
* **Iteration and Adaptation:**
  * The DoR is not static. It should be revisited and adapted during **Sprint Retrospectives** based on the team's experiences. If "unready" items are frequently slipping into sprints and causing issues, the DoR might need adjustment.
  * Start with a "good-enough" DoR and refine it iteratively.

## 5. Key Considerations

* **Templates:** The team has discussed using templates for Definition of Ready. This can help standardize the information captured.
* **Addressing Uncertainty:** If a PBI has too much uncertainty but is high priority, it should be converted to a **Spike** to gain clarity before it can meet the DoR for implementation.
* **Varying Detail:** The level of detail required to meet the DoR might vary. For teams with deep domain knowledge and established relationships, the DoR might be lighter. For new teams or complex areas, more explicit detail might be needed.
* **"When Applicable":** Not all criteria in a DoR checklist will apply to every PBI type (e.g., a bug might have different "readiness" needs than a new feature). Use "when applicable" where appropriate.

**General DoR Principles (Applicable to all types unless specified):**

* **Clarity:** The purpose and expected outcome are clear to both Product and Engineering.
* **Feasibility:** The work is realistically achievable within a sprint (or is a Spike to determine feasibility).
* **Testability:** There's a clear way to verify the work is done correctly.
* **Dependencies Known:** Critical dependencies are identified.
* **Estimated/Effort Considered:** Effort has been discussed and estimated (for pointed items) or considered within capacity allocation (for unpointed items).
* **No Major Blockers:** No known immediate blockers that prevent work from starting.
* **Stakeholder Alignment:** Key stakeholders are aware and in agreement on the scope and priority.

## Strategy for Estimating and Tracking Effort for Unpointed Work (Spikes & Productivity Tasks)**

A common challenge is accounting for valuable work like Spikes and Productivity tasks that aren't typically estimated with story points, without distorting velocity or losing track of the effort involved. The core principle is: **Velocity measures the rate of delivering *value-producing, pointed items*. Spikes and ongoing Productivity work are investments in future velocity or team health, and their effort should be managed through capacity allocation.**

Here’s how to approach this:

1. **Explicit Capacity Allocation:**
   * Before sprint planning, the team decides on a portion of its total capacity to allocate to unpointed Spikes and Productivity tasks (e.g., 20-25% for productivity tasks, or a specific time budget).
   * This allocated capacity is then *subtracted* from the team's total available capacity for the sprint *before* pulling in pointed Features and Bugs.
   * **Result:** Velocity (based on points) remains a "clean" measure of delivered, estimated value. Effort for Spikes/Productivity is accounted for by the reduced capacity for pointed items.
2. **Time-Boxing for Spikes:**
   * Spikes are typically time-boxed (e.g., "This Spike is time-boxed to 2 days").
   * Progress is tracked against the timebox and the defined deliverables (e.g., a research document).
   * The agreed-upon timebox contributes to the overall capacity allocated for unpointed work.
3. **Managing Productivity Tasks:**
   * Allocate a general time budget or capacity percentage for ongoing productivity tasks.
   * While generally not pointed, if a specific productivity task is unusually large or delivers a significant, well-defined internal improvement, the team might opt to point it. The default is management within the allocated capacity.
   * Ensure these tasks are visible on the sprint backlog/board.
4. **Separate Tracking and Review (for visibility, not velocity):**
   * Track the *completion count* of Spikes and significant Productivity tasks each sprint.
   * During Sprint Retrospectives, discuss the appropriateness of allocated capacity, whether Spikes met objectives, and if Productivity tasks are yielding benefits. This helps adjust future allocations.
5. **Focus on Outcomes:**
   * **Spikes:** Value is in knowledge gained, uncertainty reduced, or risk mitigated.
   * **Productivity:** Value is in improved team efficiency, better code quality, or a healthier system.
