# Grooming Best Practices & Agenda

## **1. Purpose and Goal of Grooming:**

* **Primary Goal:** To thoroughly prepare Product Backlog Items (PBIs) (stories, bugs, tasks, etc.) so they are well-understood, actionable, and meet the team's **Definition of Ready (DoR)**, which includes having clear Acceptance Criteria (AC) and a Definition of Done (DoD), *before* Sprint Planning.
* **Efficiency in Planning:** This preparation allows Sprint Planning to be more efficient, focusing on the team's capacity, sprint goals, and selecting work, rather than defining or deeply analyzing the work itself.
* **Investment:** Significant effort and thoughtful discussion should be invested in grooming to ensure items are truly "ready" according to the team's DoR.

## **2. Timing and Cadence:**

* **Frequency:** Hold at least one dedicated grooming session per sprint.
* **Scheduling:**
  * Conduct grooming sessions *before* sprint planning (e.g., grooming on a Monday if planning is on Wednesday).
  * Consider regular, potentially weekly, backlog refinement sessions to maintain backlog health and prepare for the main grooming/estimation session.

## **3. Preparation & Readiness for Grooming:**

* **Roadmap Context (Dependency):**
  * Have an initial version of the roadmap for the next three sprints available. This provides context for prioritizing and understanding the strategic importance of items.
  * Be intentional with current sprint goals in light of this roadmap and a \~3-sprint outlook.
* **Stakeholder Input:** Ensure necessary stakeholders (Product Managers, finance, legal, etc.) have provided input or are present if their information is critical for the ticket's clarity and its ability to meet the DoR. Tickets lacking essential information may not be groom-able.
* **Ticket Detail:** Items brought to grooming should not be "sparse." They should have enough initial detail to facilitate a productive discussion and assessment against the DoR.
* **Pre-Session Review (Implied):** Team members should ideally have some familiarity with the tickets to be discussed to contribute more effectively.

## **4. Key Activities During Grooming:**

* **Ticket Discussion & Refinement:**
  * Clarify requirements, scope, and ensure a shared understanding of the work involved.
  * Identify dependencies, potential blockers, risks, and any ambiguities.
* **Classification and Grouping:** Learn to effectively classify (e.g., bug, feature, spike, operations, productivity, hotfix using the team's agreed-upon ticket types) and group related tickets to identify themes or larger initiatives.
* **Estimation:**
  * Estimate the effort for tickets (e.g., using story points on a Fibonacci scale). This applies primarily to Feature, Bug, and Operations tickets. Spike and Productivity tasks are generally managed via capacity allocation and time-boxing.
  * Strive for **consistent estimation sizing** across the team.
  * **Avoid overestimation**; focus on realistic assessments of complexity and effort.
* **Ensuring Definition of Ready (DoR) is Met:**
  * **Crucial Step:** Verify that each PBI being groomed meets all aspects of the team's **Definition of Ready** for its specific ticket type. This includes confirming clarity, feasibility, testability, known dependencies, and stakeholder alignment as outlined in the DoR templates.
* **Defining Acceptance Criteria (AC) and Definition of Done (DoD):**
  * **Mandatory for "Ready" Items:** All tickets considered "groomed" and ready for sprint planning must have clear Acceptance Criteria (AC) and a well-defined Definition of Done (DoD).
  * The **DoD** should detail what it means for the work on *this specific PBI* to be complete (e.g., code changes implemented, specific tests passed, documentation updated, SQL scripts written, rollback plan documented).
  * **AC** should clearly state the conditions that must be met for the user story or task to be accepted by the Product Owner.
* **Prioritization:**
  * Focus on grooming **high-priority tickets first**, especially those aligned with the current roadmap, sprint goals, and strategic vision.
* **Handling Uncertainty & Spikes:**
  * If a high-priority ticket has too much uncertainty to be estimated or to meet the DoR for an implementation ticket type, **convert it to a Spike ticket.**
  * Spike tickets are for investigation/research to reduce uncertainty. Their DoR will focus on the clarity of the research question and expected deliverables (usually a well-structured document or POC).
* **Addressing Productivity Tasks:**
  * Identify and acknowledge Productivity tasks (e.g., tech debt, small improvements, automation of manual processes).
  * Ensure they meet the DoR for a Productivity task (clear objective, anticipated benefit, defined success measure). While the actual capacity allocation (e.g., 20-25%) is a sprint planning decision, grooming is where these items can be discussed and made ready.

## **5. Participants:**

* **Product Managers/Owners:** Essential for providing business context, clarifying requirements, defining acceptance criteria from a user perspective, making prioritization calls, and confirming stakeholder alignment.
* **Development Team (Engineers):** Crucial for technical understanding, feasibility assessment, identifying dependencies, effort estimation, and collaboratively defining the technical aspects of the DoD.
* **Other Stakeholders (as needed):** For specific items requiring their expertise or approval to meet the DoR.

## **6. Outcomes of a Successful Grooming Session:**

* A set of Product Backlog Items that are **"Ready"** for Sprint Planning, meaning they:
  * Meet all criteria of the team's **Definition of Ready (DoR)** for their respective ticket types.
  * Are clear, understood, and actionable.
  * Have agreed-upon effort estimates (for pointed items).
  * Have well-defined Acceptance Criteria (AC) and a comprehensive Definition of Done (DoD).
* Increased shared understanding of the upcoming work across the team.
* Identification of items needing further clarification or research (which may have been converted to Spikes with their own DoR met for the investigation itself).

**High-Level Agenda Items for a Grooming Session:**

1. **Quick Review of Sprint Goals/Roadmap Context** (if not recently covered, to guide prioritization).
2. **Process High-Priority Tickets (Assess against DoR):**
   * For each ticket:
     * Discuss purpose, requirements, and scope.
     * Define/Refine Acceptance Criteria.
     * Estimate effort (story points for Features, Bugs, Operations; confirm timebox for Spikes).
     * Define the Definition of Done.
     * Identify and address any immediate questions or blockers preventing it from meeting the DoR.
     * Confirm all DoR criteria are met.
3. **Address Tickets with Uncertainty:**
   * Decide if they can be clarified to meet the DoR for an implementation ticket or if they should become Spike tickets.
   * If creating a Spike, define its research goal, deliverables, and timebox to meet the DoR for a Spike.
4. **Review Lower Priority Items (Time Permitting):** If ready and capacity allows, groom other items against their respective DoR.
5. **Confirm Readiness:** Briefly verify that the set of groomed items collectively meets the team's criteria for being "ready" for sprint planning.

**Considerations for Sprint Planning (Informed by Grooming):**

* **Capacity and Velocity:** Be intentional about how many items/points are brought into a sprint. Use the velocity from the last three rolling sprints as a guide to refine this threshold (e.g., starting with a cap like 50 points and adjusting). Only "Ready" items (DoR met) should be considered.
* **Productivity Tasks:** Ensure a portion of the sprint capacity is considered for Productivity tasks (which have met their DoR) identified and prepared during grooming.
