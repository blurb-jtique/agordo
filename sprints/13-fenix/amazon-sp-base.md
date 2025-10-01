# Amazon Seller Partner Issue

## The context

Amazon Seller Partner integration has been active since 2014, spanning over a decade. Blurby's Amazon Feed Submission process enables users to publish their books on Amazon Marketplace through the Seller Partner API. This pipeline converts completed book projects into compliant Amazon listings through an automated workflow.

The process starts by identifying Amazon distribution entries marked as pending or updated. Customer Support may review flagged entries to remove prohibited content (such as links or email addresses) from critical fields like titles, author names, or descriptions.

Once verified, the product_list_river_tasks job prepares the listing data and sends it to ruby-mws, our integration component for Amazon's Marketplace Web Service. The ruby-amazon-service component uploads the book metadata as XML to the Amazon Seller Partner API. Distribution entries are then marked as SUBMITTED, and records are created in the feed_submissions table with identifiers, status information, and related metadata.

To monitor progress, the get_feed_submission_river_tasks job runs hourly, querying Amazon's API for processing status updates. This polling mechanism updates both feed submission records and distribution entries, providing real-time visibility into whether listings have processed successfully, failed, or require intervention.

## The problem

The system is currently encountering FATAL processing status responses from Amazon’s Feed Processing Notifications when synchronizing and managing book metadata. This is due to continued usage of the legacy feed type POST_PRODUCT_DATA, which is part of the deprecated XML-based Feeds API. This feed type was historically used to submit core product metadata—such as title, identifiers (e.g., ISBN), description, and other attributes—typically associated with listing new products like books in the Amazon catalog.

Amazon has officially deprecated support for this and other XML/flat-file-based listing feed types. While the global cutoff date for these feed types is set for July 31, 2025, Amazon has already begun rejecting these submissions for certain accounts or marketplaces. When a POST_PRODUCT_DATA feed is submitted, it is now immediately marked as FATAL, indicating a hard failure that prevents further processing or retries.

This issue reflects a fundamental incompatibility between the legacy feed implementation and the requirements of Amazon’s current Selling Partner API (SP-API) infrastructure. To maintain functionality and ensure successful product listings, it is necessary to transition away from the deprecated feed types and adopt SP-API–compliant mechanisms such as JSON_LISTINGS_FEED or the Listings Items API.

## The Impact and Stats

Considering the problem described above, Blurby executes two main workflows associated with the Amazon Marketplace:

1. Synchronizing and managing book metadata using feeds and listings
2. Managing order placement, shipping, and syncing that information

### Workflow: Synchronizing and managing book metadata (where the issue is impacting the system)

The current integration with Amazon Seller Partner API relies on several action types used to manage book listings and their metadata:

#### 1. **PRODUCT_LIST**

* **Purpose**: Submits core product data (like title, description, identifiers such as ISBN/UPC/ASIN, brand, etc.).
* **Amazon Equivalent**: Corresponds to the `POST_PRODUCT_DATA` feed type—used to create or update product metadata via XML or flat file feeds.

#### 2. **PRODUCT_LIST_INVENTORY**

* **Purpose**: Updates available quantities or inventory levels for products.
* **Amazon Equivalent**: Maps to `POST_INVENTORY_AVAILABILITY_DATA`—the legacy feed for updating stock levels.

#### 3. **PRODUCT_LIST_IMAGE**

* **Purpose**: Uploads or updates product images (e.g., main image, additional view images).
* **Amazon Equivalent**: Matches `POST_PRODUCT_IMAGE_DATA` feed.

#### 4. **PRODUCT_LIST_PRICE**

* **Purpose**: Sets or updates pricing information (such as list price, sale price).
* **Amazon Equivalent**: Corresponds to `POST_PRODUCT_PRICING_DATA` feed.

#### 5. **PRODUCT_FLAT_FILE_INVLOADER**

* **Purpose**: Uses Amazon’s flat file templates to bulk upload new product listings, especially when product details already exist in Amazon’s catalog.
* **Amazon Equivalent**: This aligns with `POST_FLAT_FILE_INVLOADER_DATA`, a flat‑file-based legacy feed type.

#### 6. **PRODUCT_LIST_REMOVE**

* **Purpose**: Deletes or removes product listings from Amazon—either disabling the listing or removing the offer entirely.
* **Amazon Equivalent**: Likely uses similar legacy feeds such as `POST_PRODUCT_OVERRIDES_DATA` or delete operations via Listings Items API, depending on how deletion is implemented.

---

#### Summary Table

| Action Name                    | Intended Function          | Legacy Amazon Feed Type            | Submissions | Recommendation                             |
| ------------------------------ | -------------------------- | ---------------------------------- | ----------- | ------------------------------------------ |
| PRODUCT_LIST                  | Product metadata upload    | `POST_PRODUCT_DATA`                | 319,757     | Migrate to Listings Items API or JSON feed |
| PRODUCT_LIST_INVENTORY       | Inventory level updates    | `POST_INVENTORY_AVAILABILITY_DATA` | 257,572     | Same as above                              |
| PRODUCT_LIST_IMAGE           | Image upload/update        | `POST_PRODUCT_IMAGE_DATA`          | 257,532     | Same as above                              |
| PRODUCT_LIST_PRICE           | Price updates              | `POST_PRODUCT_PRICING_DATA`        | 257,505     | Same as above                              |
| PRODUCT_FLAT_FILE_INVLOADER | Bulk listing via flat file | `POST_FLAT_FILE_INVLOADER_DATA`    | 257,306     | Same as above                              |
| PRODUCT_LIST_REMOVE          | Remove product listings    | Variants of delete feed types      | 9,218       | Prefer Listings Items API                  |

#### Usage stats (Last 6 Months – Normalized Submission Count)

* **PRODUCT_FLAT_FILE_INVLOADER**: Ranges from **1.0** to **9.3** submissions/day, showing **variable** patterns with intermittent low activity and periodic spikes.
* **PRODUCT_LIST**: Fluctuates between **3.85** and **9.43** submissions/day, maintaining a **variable** but more consistent baseline than other actions.
* **PRODUCT_LIST_IMAGE**: Varies from **1.0** to **9.3** submissions/day, with **variable** activity likely corresponding to specific publishing cycles.
* **PRODUCT_LIST_INVENTORY**: Oscillates between **1.0** and **9.3** submissions/day, indicating **variable** inventory management rather than regular daily updates.
* **PRODUCT_LIST_PRICE**: Shows the same **1.0** to **9.3** range, with **variable** price adjustments possibly triggered by market changes or promotional campaigns.
* **PRODUCT_LIST_REMOVE**: Ranges from **1.43** to **8.75** submissions/day, with **variable** removal activity typically associated with batch delistings or catalog maintenance.

These patterns reveal **cyclical or event-driven updates** rather than consistent daily activity across all action types. It's important to note that PRODUCT_LIST actions don't exclusively represent new book creations but also include metadata updates for existing books and templates. Currently, we're adding approximately 2-3 new books per day to Amazon, with expected increases to about 6 books daily during seasonal peaks.

### Workflow: Amazon Book Order Fulfillment

The **Amazon order fulfillment workflow** operates independently from the metadata synchronization process. This workflow manages how Blurby handles orders placed through Amazon Marketplace, ensuring proper fulfillment and compliance with Amazon's requirements.

#### Order Processing Flow

1. **Order Capture** (NEW state)
  * Blurby polls Amazon for new orders via periodic River jobs
  * Orders are stored in `distribution_amazon_orders` with line items in `distribution_amazon_order_items`
  * Each item's `seller_sku` (matching the book's ISBN) links to Blurby's catalog

2. **Order Acknowledgement** (ACKED state)
  * Blurby confirms receipt of orders to Amazon
  * No production activity starts at this stage

3. **Order Placement** (ORDERED state)
  * Orders are submitted to Blurby's internal printing system
  * Created under the `amazon_order_placer` system user
  * Payment processing is bypassed (set directly to CAPTURED)
  * Production routed to appropriate printer (typically RPI)

4. **Order Shipment** (SHIPPED state)
  * When the printer confirms shipment, order status updates
  * Triggered by printer's shipping notification, not a River job

5. **Amazon Shipment Acknowledgement** (SHIPPED_AND_ACKED state)
  * Shipping confirmation and tracking details sent to Amazon
  * Critical for meeting Amazon's 2-day fulfillment SLA
  * Failure to update within this window risks seller performance penalties

**Note:** The order fulfillment workflow is not currently affected by the Amazon SP-API deprecation issue. Amazon has not announced any changes to the Orders API endpoints, so the SHIPPED_AND_ACKED status and related functionality remain operational.

## Interim Solutions

While developing a permanent solution to address the Amazon SP-API deprecation issue, we propose implementing the following temporary measures:

### Option 1: Manual Synchronization Process (not much suitable)

Implement a manual workflow to synchronize books from Blurby to Amazon. This approach:

- Bypasses Blurby's automated tracking systems
- Requires manual monitoring as entries won't appear in feed_submissions table or automated sync reports
- Allows for continued listing while a permanent solution is developed

### Option 2: Temporary Bulk Upload Component

Develop a lightweight component that:

- Enables bulk uploads of book metadata or fast inidividual books
- Registers Blurby as merchant fulfillment in Amazon's system
- Can be executed daily by the team to maintain synchronization
- Provides a bridge solution while the long-term SP-API integration is being built

Both options allow us to maintain Amazon marketplace functionality while the engineering team works on implementing the proper SP-API integration.
