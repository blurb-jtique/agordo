# Good Practices for Story Point Estimation

Story points are a relative measure of effort, complexity, and uncertainty for completing a Product Backlog Item (PBI). The goal isn't absolute precision but rather a shared understanding and a way to gauge what the team can realistically achieve. Here are some good practices:

1. **Estimate Collaboratively as a Team:**
   * **Shared Understanding:** The entire engineering team (those doing the work) should participate in estimation. This fosters shared understanding, uncovers different perspectives, and leads to more reliable estimates.
   * **Collective Ownership:** The estimate belongs to the team, not an individual.
2. **Focus on Relative Sizing, Not Absolute Time:**
   * **Compare, Don't Calculate Hours:** Story points are not directly convertible to hours or days. Instead, compare the PBI being estimated to previously completed PBIs (reference stories). Ask, "Is this bigger than X (e.g., a 3-pointer) but smaller than Y (e.g., an 8-pointer)?"
   * **Fibonacci Sequence (or Similar):** Use a non-linear scale like the Fibonacci sequence (1, 2, 3, 5, 8, 13, 20...) to reflect the increasing uncertainty and diminishing precision with larger items.
3. **Establish Clear Baseline/Reference Stories:**
   * **Anchor Points:** Identify a few well-understood, previously completed PBIs of different sizes (e.g., a typical 2-pointer, a 5-pointer, an 8-pointer). These serve as reference points for future estimations.
   * **Revisit Baselines:** Periodically review and adjust baseline stories as the team's understanding or context evolves.
4. **Estimate the Whole: Effort, Complexity, Uncertainty (ECU):**
   * **Beyond Coding:** The estimate should encompass *all* the effort required to get the PBI to "Done" according to the Definition of Done (DoD). This includes design (if applicable), development, testing (including writing automated tests), code reviews, merging, and any necessary documentation.
   * **Complexity:** How intricate is the work? Are there many moving parts or tricky logic?
   * **Uncertainty/Risk:** How much is unknown? Are there potential technical hurdles or unclear requirements (though ideally, these are minimized by the DoR)?
5. **Break Down Large Items (Consider Vertical Slicing):**
   * **Feasible within a Sprint:** If a PBI is estimated to be very large (e.g., consistently above 13 or 20 points, or whatever the team deems too big), it's a strong indicator it needs to be split into smaller, more manageable PBIs.
   * **Improved Accuracy:** Smaller items are generally easier to estimate more accurately.
   * **Vertical Slicing (Preferred):** When breaking down features, strive for "vertical slices" of functionality. This means each smaller PBI should deliver a thin slice of end-to-end value, potentially touching all necessary architectural layers (UI, business logic, database). This is often contrasted with "horizontal slicing" (e.g., all UI work in one PBI, all backend in another), which can delay value delivery and feedback. (See section below for more on Vertical Slicing).
6. **Be Intentional and Realistic (Avoid Over-Commitment):**
   * **Consider Capacity & Velocity:** During sprint planning, use the team's historical velocity (average points completed in previous sprints – 3-sprint rolling average) as a guide for how many points to bring into the sprint.
   * **Avoid Overestimation of Capacity:** Don't consistently take on more points than historical data suggests is achievable.
   * **Focus on Sprint Goals:** Ensure the estimated items align with the sprint goals.
7. **Consistency Over Perfection:**
   * **Team's Relative Scale:** The most important thing is that the team is consistent in *its own* relative sizing. It doesn't matter as much if your team's "5" is another team's "8," as long as your "5" is consistently about half the effort/complexity of your "8."
   * **Learn and Adapt:** Estimation is a skill that improves with practice. Don't get bogged down seeking perfect numbers. Use retrospectives to discuss estimation accuracy and refine the process.
8. **Do Not Point Spikes or (Typically) Productivity Tasks:**
   * **Capacity Allocation:** As discussed, effort for Spikes (time-boxed investigations) and ongoing Productivity tasks (documentation, refactoring, process improvements) should be managed by allocating a portion of the sprint's capacity, rather than assigning story points that count towards velocity.
   * **Velocity Integrity:** This keeps velocity as a measure of delivered, value-producing, and estimated work (Features, Bugs, Operations).
9. **Re-estimate Only When Scope Significantly Changes:**
   * **Original Estimate Stands:** Once a PBI is in a sprint, avoid re-estimating it even if it turns out to be harder or easier than expected. The original estimate is part of the learning process.
   * **Exception:** If the scope of a PBI *fundamentally changes* mid-sprint (e.g., significant new requirements are added or removed), then a re-estimation might be warranted after discussion with the Product Owner.
10. **Use Estimation as a Tool for Discussion, Not a Weapon:**
    * **Uncover Misunderstandings:** Differences in estimates during planning poker or discussion are valuable. They highlight differing assumptions or understanding of the work, prompting further clarification.
    * **Not for Performance Measurement:** Story points should not be used to compare individuals or as a direct measure of individual productivity. They are a team planning tool.

## Understanding Vertical Slicing

When breaking down large features or epics into smaller PBIs (User Stories), the concept of "vertical slicing" is a highly recommended practice. It contrasts with "horizontal slicing."

* **Vertical Slice:**
  * A vertical slice represents a small, end-to-end piece of functionality that delivers demonstrable value to the user or stakeholder.
  * It typically cuts through all necessary architectural layers of the application (e.g., User Interface (UI), Application/Business Logic, Data Access/Database).
  * Each vertical slice should ideally be independently developable, testable, and potentially deployable.
  * **Example:** For an e-commerce feature "Allow users to add items to a shopping cart":
    * *Vertical Slice 1:* User can click an "Add to Cart" button on a product page, and the item (with default quantity 1\) appears in their cart summary (UI change, backend logic to handle cart addition, database update for cart contents).
    * *Vertical Slice 2:* User can see the total number of items in the cart icon in the header update in real-time.
    * *Vertical Slice 3:* User can adjust the quantity of an item already in the cart.
* **Horizontal Slice (Less Preferred for Feature Breakdown):**
  * A horizontal slice focuses on completing all work for a specific technical layer or component across a larger feature.
  * **Example (for the same shopping cart feature):**
    * *Horizontal Slice 1:* Build all UI elements for the shopping cart page.
    * *Horizontal Slice 2:* Develop all backend API endpoints for cart management.
    * *Horizontal Slice 3:* Design and implement the database schema for the shopping cart.
  * **Drawbacks of Horizontal Slicing for Features:**
    * Delays value delivery: No single slice provides usable functionality to the end-user.
    * Integrates risk late: Problems are often found only when trying to connect all the layers.
    * Reduces feedback opportunities: Users can't interact with and provide feedback on working software until all layers are complete.

**Benefits of Vertical Slicing:**

* **Early Value Delivery:** Each slice provides a small piece of working software that can be demonstrated and potentially used.
* **Faster Feedback Loops:** Getting working software in front of stakeholders or users sooner allows for earlier feedback and course correction.
* **Risk Reduction:** Technical and integration risks are tackled earlier and more frequently.
* **Improved Focus and Motivation:** Teams can see tangible progress and deliver value incrementally.
* **Better Testability:** Each slice can be tested end-to-end.
* **Facilitates Prioritization:** Product Owners can prioritize the most valuable slices first.

**How it Relates to Story Point Estimation:**

* When breaking down a large PBI (as per practice \#5), aim to create smaller PBIs that are vertical slices.
* These smaller, value-delivering vertical slices are then estimated using story points.
* This approach helps ensure that the points assigned reflect the effort to deliver a complete piece of functionality, however small.
* Vertical slicing is a good approach, especially for new team members to learn the full stack. It allows developers to work across different layers and understand how they connect.
