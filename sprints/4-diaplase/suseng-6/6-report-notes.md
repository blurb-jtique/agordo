# Gift cards report
This comprehensive analysis examines the outstanding gift cards in our system, revealing approximately **$819,653.13** in unredeemed value across **25,118** gift cards. This report provides insights into the inactive gift card program's financial impact, customer usage patterns, and potential accounting considerations.

[REPORT](https://docs.google.com/spreadsheets/d/10fxVYOTWian99SpH7FkRbMbu87rdAbyriRJa1vKQwOk/edit?usp=sharing)

## Data Collection Methodology
Data was extracted using a batch-processing approach with date-range filtering across three time periods:

- 2008-10-30 to 2011-09-23: 10,006 records
- 2011-09-23 to 2014-01-10: 10,152 records
- 2014-01-10 to 2023-07-28: 4,963 records

Common Table Expressions (CTEs) were used to organize queries efficiently and avoid duplication when handling complex relationships between orders, users, and profiles.

## Requested columns
- **Gift Card Code**: Unique identifier for each gift card (gift_card.code)
- **Original Amount**: Initial value in original currency (gift_card.template_amount)
- **Outstanding Amount**: Current remaining balance (gift_card.amount)
- **User Information**: Name and email of purchaser
- **Order Details**: Order ID and date of purchase
- **Usage History**: Orders where the gift card was applied, user who redeemed, usage dates
- **Financial Tracking**: Amounts used and remaining per transaction

**ORDER NOT ACCRUED STATES** : 'NEW', 'AUTHORIZED', 'AUTH_FAILED', 'CAPTURED', 'CAPTURE_FAILED', 'AWAITING_FILES', 'CANCELLED', 'CANCELLED_SHIPPABLE'

## Results

- **Total Gift Cards:** 25118
- **Total Outstanding Value:** ~ USD 819,653.13

## Concerns
1. **Currency Conversion:** Determining appropriate exchange rates (current vs. historical)
2. **Negative Value Cards:** Identified cards with negative balances
3. **Data Consistency:** Uncovered inconsistent order values and anomalous entries
4. **Missing Currency Data:** Cards without specified template currency
5. **Database Integrity:** Additional validation required for complete data consistency

## Recommended Next Steps
1. **Payment Validation:** Cross-reference gift card purchases and redemptions with payment processing records
2. **Account Activity Analysis:** Examine inactive/active status of gift card holders
3. **Edge Case Investigation:** Further analysis of unusual patterns and special cases

## SQL QUERY used - Date filter + LIMIT
**Method used**
Batch-based querying using date ranges can be achieved by modifying the date filter in the SQL query. The use of Common Table Expressions (CTEs) ensures better organization and readability of the queries. To handle special conditions in orders, users, and profiles, the logic for computing coupon use totals is duplicated within the query structure, minimizing the risk of data duplication or inconsistencies.

```sql
WITH gift_card_info AS (
    SELECT
        gc.created_at as created_at,
        gc.id AS gift_card_id,
        gc.code AS gift_card_code,
        ctc.amount / 100.0 AS original_amount,
        ctc.currency_iso_id AS currency,
        gc.voided_amount / 100.0 AS voided_amount,
        gcli.gift_card_order_id,
        gcli.id AS gift_card_line_item_id
    FROM
        blurby.coupons gc
    JOIN blurby.gift_card_line_items gcli ON gc.gift_card_line_item_id = gcli.id
    JOIN blurby.coupon_templates ct ON gc.template_id = ct.id
    LEFT JOIN blurby.coupon_template_currencies ctc ON ct.id = ctc.coupon_template_id AND ctc.id = (
        SELECT MIN(inner_ctc.id) FROM blurby.coupon_template_currencies inner_ctc
        WHERE inner_ctc.coupon_template_id = ct.id)
    WHERE gc.type = 'GiftCard' AND gc.created_at BETWEEN '2008-10-30 16:33:00' AND '2010-06-24 11:05:21'
), order_info AS (
    SELECT
        gci.gift_card_id,
        gco.id AS order_id,
        gco.created_at AS order_date,
        gco.user_id
    FROM gift_card_info gci
    JOIN blurby.gift_card_orders gco ON gci.gift_card_order_id = gco.id
), user_info AS (
    SELECT
        oi.gift_card_id,
        COALESCE(p.firstname || ' ' || p.lastname, u.username) AS user_name,
        e.address AS email_address
    FROM order_info oi
    JOIN blurby.users u ON oi.user_id = u.id
    LEFT JOIN blurby.profiles p ON u.id = p.user_id
    LEFT JOIN blurby.emails e ON u.id = e.user_id AND e.deleted_at IS NULL
),
coupon_use_totals AS (
    SELECT
        cu.coupon_id AS gift_card_id,
        SUM(cu.amount) / 100.0 AS total_used_amount
    FROM
        blurby.coupon_uses cu
    JOIN
        blurby.orders o ON cu.order_id = o.id
        AND o.state NOT IN ('NEW', 'AUTHORIZED', 'AUTH_FAILED', 'CAPTURED',
                           'CAPTURE_FAILED', 'AWAITING_FILES', 'CANCELLED', 'CANCELLED_SHIPPABLE')
    WHERE
        cu.coupon_id IN (SELECT gift_card_id FROM gift_card_info)
    GROUP BY
        cu.coupon_id
),
usage_info AS (
    SELECT
        gci.gift_card_id,
        cut.total_used_amount,
        STRING_AGG(DISTINCT CAST(o.id AS TEXT), ', ') AS used_in_orders,
        STRING_AGG(DISTINCT COALESCE(up.firstname || ' ' || up.lastname, uo.username), ', ') AS used_by,
        STRING_AGG(DISTINCT TO_CHAR(o.created_at, 'YYYY-MM-DD HH24:MI:SS'), ', ') AS usage_dates,
        STRING_AGG(DISTINCT CAST(cu.amount / 100.0 AS TEXT), ', ') AS amounts_used,
        STRING_AGG(DISTINCT CAST((cu.coupon_amount - cu.amount) / 100.0 AS TEXT), ', ') AS amounts_remaining
    FROM gift_card_info gci
    LEFT JOIN coupon_use_totals cut ON gci.gift_card_id = cut.gift_card_id
    LEFT JOIN blurby.coupon_uses cu ON gci.gift_card_id = cu.coupon_id
    LEFT JOIN blurby.orders o ON cu.order_id = o.id
        AND o.state NOT IN ('NEW', 'AUTHORIZED', 'AUTH_FAILED', 'CAPTURED',
                           'CAPTURE_FAILED', 'AWAITING_FILES', 'CANCELLED', 'CANCELLED_SHIPPABLE')
    LEFT JOIN blurby.users uo ON o.user_id = uo.id
    LEFT JOIN blurby.profiles up ON uo.id = up.user_id
    WHERE o.id IS NOT NULL
    GROUP BY gci.gift_card_id, cut.total_used_amount
)
SELECT
    gci.created_at AS "Created At",
    gci.gift_card_code AS "Gift Card Code",
    gci.currency AS "Currency",
    gci.original_amount AS "Original Amount",
    gci.voided_amount AS "Voided Amount",
    (gci.original_amount - COALESCE(ui.total_used_amount, 0) - gci.voided_amount) AS "Outstanding Amount",
    usi.user_name AS "User Name",
    usi.email_address AS "User Email",
    oi.order_id AS "Order Number",
    TO_CHAR(oi.order_date, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    COALESCE(ui.used_in_orders, '') AS "Used In Orders",
    COALESCE(ui.used_by, '') AS "Used By",
    COALESCE(ui.usage_dates, '') AS "Usage Dates",
    COALESCE(ui.amounts_used, '') AS "Amounts Used",
    COALESCE(ui.amounts_remaining, '') AS "Amounts Remaining"
FROM gift_card_info gci
JOIN order_info oi ON gci.gift_card_id = oi.gift_card_id
JOIN user_info usi ON gci.gift_card_id = usi.gift_card_id
LEFT JOIN usage_info ui ON gci.gift_card_id = ui.gift_card_id
ORDER BY gci.created_at asc
LIMIT 12000;
```

### 3 batches used - 25118 gift cards

- 2008-10-30 16:33:00 - 2011-09-23 08:36:52 : 10006
- 2011-09-23 08:36:52 - 2014-01-10 13:42:56 : 10152
- 2014-01-10 13:42:56 - 2023-07-28 11:00:00 : 4963