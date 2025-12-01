# Meeting Summary & Key Takeaways

Over a 60-minute call on the upcoming Gift With Purchase (GWP) test, the team aligned on goal, scope, principal risks, and possible technical approaches for surfacing the free-notebook offer to customers. Below is a consolidated summary, organized into Strategic Considerations, Key Insights, Agreements, "Don'ts", Next Actions, and Open Questions.

1. **Key Findings & Strategic Considerations**

  1. User-facing Messaging Is Critical
    - Without clear "you're getting a free notebook" cues, the promo may fail as an incentive.
    - Priority placements: cart page, mini-cart preview, checkout step, order details; invoice/receipt line-item is nice-to-have.
  2. Multiple Implementation Paths (least → most workable)
    - Auto-add notebook to cart on sign-in (feature-flagged "Congratulations, you've qualified for a free notebook!")
    - Swatch-Kit pick-&-pack SKU workflow (reuse bookmark-insert hack)
    - Hack automatic coupons (excluding wall-art customers)
    - Static text on cart page ("Free notebook with purchase — while supplies last")
    - PDF auto-cart add (risky: attaches per item, not per order)
  3. Fulfillment & Inventory Complexity
  Notebooks printed in Seattle, staged at RPI sites (Atlanta, Rochester, etc.) and PhotoCreate AUS; Ingram-fulfilled trade books are an edge case.
    - Mixing photo vs.trade books in one cart may break routing logic.
    - Always include a "while supplies last" disclaimer in messaging.
  4. Feature-Flagged, Time-Limited Launch
    - 5-day window: September 22–29, feature-flag controls on/off; automatic rollback post-promo.
2. **Key Insights**

- Early Visibility Drives Uptake: Pre-fill the cart (and mini-cart) so customers immediately see the notebook—reserving stock early and setting clear expectations.
- Leverage Existing Fulfillment: Reuse the bookmark-insert SKU workflow via a temporary notebook SKU; no new routing or picker training required.
- Inventory Traceability: Stage notebooks per facility; the Inventory Service handles reservation and depletion—no front-end stock counter needed.
- Messaging Hierarchy: Highest impact—cart → simple checkout banner → order confirmation → email details → invoice line-item. Site banners/product pages for broad awareness.

3. **Agreements**

- Keep it simple & fast: Favor minimal UI changes and clear messaging.
- Reuse Swatch-Kit SKU workflow for automatically including notebooks in pick-and-pack.
- Include all blurby.com book orders; exclude distribution partners by default (wall-art, Fuji, Marathon/LSI, Office Depot/Linemark/BNB).
- No opt-outs: every qualifying order receives one notebook.

4. **Don'ts**

- No heavy UI overhaul: Avoid complex cart or checkout redesign—use line-item injection and minimal banners.
- Don't use PDF hacks: They tie gifts to each book, not each order, complicating bundles.
- Don't mix photo/trade shipments without confirming routing logic; don't insert notebooks into unsupported partner workflows.
- Don't over-commit stock: Rely on back-end reservation and "while supplies last" copy rather than real-time front-end counters.

5. **Next Actions**

  1. Feasibility Spike
    - Engineering to evaluate all five paths (auto-add sign-in, Swatch-Kit SKU, coupon hack, static text, PDF add).
    - Estimate effort, risk, and data integrity for each.
  2. Confirm Fulfillment Flows
    Ann to validate:
    - Temporary SKU creation & ingestion at RPI, PhotoCreate AUS, Eindhoven (EU).
    - Handling Ingram-fulfilled trade books and Fuji orders (no native bookmark workflow).
    - Manual-fallback process for partner channels with low volume.
  3. Define Messaging Specs
    - Marketing to draft copy for cart, mini-cart, checkout banner, confirmation page, email, and invoice/receipt line-item (nice-to-have).
  4. Feature Flag Setup
    - Decide on start/end timestamps and monitoring alerts for stock depletion thresholds.
  5. Follow-up Meeting
    - Review spike outcomes, finalize UI approach, and assign rollout owners.

6. **Open Questions**

- Fuji: No bookmark workflow—manual pick-&-pack or exclude?
- Partner readiness: Notify partners ahead of promo or explicitly exclude them?
- Office Depot/Linemark: Is there a bookmark-insert SKU workflow available?
- Ingram/Australia: Fast-follow separate shipment vs.including notebooks via Ingram?
