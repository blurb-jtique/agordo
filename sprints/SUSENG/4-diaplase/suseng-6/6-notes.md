# Gift cards report

## Requested columns
- Gift Card Code : method `gift_card.code`
- Original Amount (multi-currency) : method `gift_card.template_amount`
- Outstanding Amount : method `gift_card.amount`
- User Name (who ordered the git card) : method `gift_card.gift_card_line_item.gift_card_order.user.profile_or_user_name`
- User Email (who ordered the git card) : method `gift_card.gift_card_line_item.gift_card_order.user.email.address`
- Order Number : method `gift_card.gift_card_line_item.gift_card_order.id`
- Order Date : method `pretty_date(gift_card.gift_card_line_item.gift_card_order.created_at)`
- Used In Order (what Blurb order used this gift card) : method `gift_card.coupon_uses.select { |cu| !cu.order_id.nil? }.map { |use| use.order_id }.join(', ')`
- Used By (customer name) : method `gift_card.coupon_uses.select { |cu| !cu.order_id.nil? }.map { |use| use.order.user.profile_or_user_name }.join(', ')`
- Usage Date : method `gift_card.coupon_uses.select { |cu| !cu.order_id.nil? }.map { |use| pretty_date(use.order.created_at) }.join(', ')`
- Amount Used : method `gift_card.coupon_uses.select { |cu| !cu.order_id.nil? }.map { |use| use.amount }.join(', ')`
- Amount Remaining (same as Value Remaining; Outstanding Amount) : method `gift_card.coupon_uses.select { |cu| !cu.order_id.nil? }.map { |use| use.coupon_amount - use.amount }.join(', ')`

order not accrued states : 'NEW', 'AUTHORIZED', 'AUTH_FAILED', 'CAPTURED', 'CAPTURE_FAILED', 'AWAITING_FILES', 'CANCELLED', 'CANCELLED_SHIPPABLE'

## Concerns
1. exchange rates conversion : current or past
2. gift cards without currency
3. gift cards with negative values

## Pure SQL
### Full query
```sql
SELECT
    gc.code AS "Gift Card Code",
    (ctc.amount / 100.0) AS "Original Amount",
    (ctc.amount / 100.0 - COALESCE(
        (SELECT SUM(cu_accrued.amount) / 100.0
         FROM coupon_uses cu_accrued
         JOIN orders o_accrued ON cu_accrued.order_id = o_accrued.id
         WHERE cu_accrued.coupon_id = gc.id AND o_accrued.state NOT IN ('NEW','AUTH_FAILED','CANCELLED')),
         0) - COALESCE(gc.voided_amount / 100.0, 0)) AS "Outstanding Amount",
    COALESCE(p.firstname || ' ' || p.lastname, u.username) AS "User Name",
    e.address AS "User Email",
    gco.id AS "Order Number",
    TO_CHAR(gco.created_at, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    NULLIF(STRING_AGG(DISTINCT CASE WHEN o.id IS NOT NULL THEN CAST(o.id AS TEXT) ELSE NULL END, ', '), '') AS "Used In Order",
    NULLIF(STRING_AGG(DISTINCT CASE WHEN o.id IS NOT NULL THEN COALESCE(up.firstname || ' ' || up.lastname, uo.username) ELSE NULL END, ', '), '') AS "Used By",
    NULLIF(STRING_AGG(DISTINCT CASE WHEN o.id IS NOT NULL THEN TO_CHAR(o.created_at, 'YYYY-MM-DD HH24:MI:SS') ELSE NULL END, ', '), '') AS "Usage Date",
    NULLIF(STRING_AGG(DISTINCT CASE WHEN cu.id IS NOT NULL THEN CAST(cu.amount / 100.0 AS TEXT) ELSE NULL END, ', '), '') AS "Amount Used",
    NULLIF(STRING_AGG(DISTINCT CASE WHEN cu.id IS NOT NULL THEN CAST((cu.coupon_amount - cu.amount) / 100.0 AS TEXT) ELSE NULL END, ', '), '') AS "Amount Remaining"
FROM
    coupons gc
JOIN
    gift_card_line_items gcli ON gc.gift_card_line_item_id = gcli.id
JOIN
    gift_card_orders gco ON gcli.gift_card_order_id = gco.id
JOIN
    users u ON gco.user_id = u.id
LEFT JOIN
    profiles p ON u.id = p.user_id
JOIN
    coupon_templates ct ON gc.template_id = ct.id
LEFT JOIN
    coupon_template_currencies ctc ON ct.id = ctc.coupon_template_id AND ctc.id = (
        SELECT MIN(inner_ctc.id)
        FROM coupon_template_currencies inner_ctc
        WHERE inner_ctc.coupon_template_id = ct.id
    )
LEFT JOIN
    emails e ON u.id = e.user_id AND e.deleted_at IS NULL
LEFT JOIN
    coupon_uses cu ON gc.id = cu.coupon_id
LEFT JOIN
    orders o ON cu.order_id = o.id
LEFT JOIN
    users uo ON o.user_id = uo.id
LEFT JOIN
    profiles up ON uo.id = up.user_id
WHERE
    gc.type = 'GiftCard'
GROUP BY
    gc.id, gc.code, ctc.amount, gc.voided_amount, u.username, p.firstname, p.lastname, e.address, gco.id, gco.created_at
ORDER BY
    gco.created_at DESC;
```

### Simplified version with date filtering
```sql
SELECT
    gc.code AS "Gift Card Code",
    (ctc.amount / 100.0) AS "Original Amount",
    (ctc.amount / 100.0 - COALESCE(SUM(cu.amount) / 100.0, 0) - COALESCE(gc.voided_amount / 100.0, 0)) AS "Outstanding Amount",
    gco.user_id AS "User ID",
    gco.id AS "Order Number",
    TO_CHAR(gco.created_at, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    COUNT(DISTINCT o.id) AS "Number of Orders Used In"
FROM
    blurby.coupons gc
JOIN
    blurby.gift_card_line_items gcli ON gc.gift_card_line_item_id = gcli.id
JOIN
    blurby.gift_card_orders gco ON gcli.gift_card_order_id = gco.id
JOIN
    blurby.coupon_templates ct ON gc.template_id = ct.id
LEFT JOIN
    blurby.coupon_template_currencies ctc ON ct.id = ctc.coupon_template_id AND ctc.id = (
        SELECT MIN(inner_ctc.id) FROM blurby.coupon_template_currencies inner_ctc
        WHERE inner_ctc.coupon_template_id = ct.id
    )
LEFT JOIN
    blurby.coupon_uses cu ON gc.id = cu.coupon_id
LEFT JOIN
    blurby.orders o ON cu.order_id = o.id AND o.state NOT IN ('NEW','AUTH_FAILED','CANCELLED')
WHERE
    gc.type = 'GiftCard'
    AND gco.created_at BETWEEN '2023-01-01' AND '2023-06-30'  -- Add date filtering
GROUP BY
    gc.id, gc.code, ctc.amount, gc.voided_amount, gco.user_id, gco.id, gco.created_at
ORDER BY
    gco.created_at DESC
LIMIT 1000;
```

## Using CTE
### SQL with all fields
```sql
WITH gift_card_info AS (
    SELECT
        gc.id AS gift_card_id,
        gc.code AS gift_card_code,
        ctc.amount / 100.0 AS original_amount,
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
    WHERE gc.type = 'GiftCard' AND gc.created_at BETWEEN '2008-10-27 18:18:46' AND '2008-10-27 21:28:30'
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
), usage_info AS (
    SELECT
        gci.gift_card_id,
        SUM(cu.amount) / 100.0 AS total_used_amount,
        STRING_AGG(DISTINCT CAST(o.id AS TEXT), ', ') AS used_in_orders,
        STRING_AGG(DISTINCT COALESCE(up.firstname || ' ' || up.lastname, uo.username), ', ') AS used_by,
        STRING_AGG(DISTINCT TO_CHAR(o.created_at, 'YYYY-MM-DD HH24:MI:SS'), ', ') AS usage_dates,
        STRING_AGG(DISTINCT CAST(cu.amount / 100.0 AS TEXT), ', ') AS amounts_used,
        STRING_AGG(DISTINCT CAST((cu.coupon_amount - cu.amount) / 100.0 AS TEXT), ', ') AS amounts_remaining
    FROM gift_card_info gci
    LEFT JOIN blurby.coupon_uses cu ON gci.gift_card_id = cu.coupon_id
    LEFT JOIN blurby.orders o ON cu.order_id = o.id AND o.state NOT IN ('NEW','AUTH_FAILED','CANCELLED')
    LEFT JOIN blurby.users uo ON o.user_id = uo.id
    LEFT JOIN blurby.profiles up ON uo.id = up.user_id
    WHERE o.id IS NOT NULL
    GROUP BY gci.gift_card_id
)
SELECT
    gci.gift_card_code AS "Gift Card Code",
    gci.original_amount AS "Original Amount",
    (gci.original_amount - COALESCE(ui.total_used_amount, 0) - gci.voided_amount) AS "Outstanding Amount",
    usi.user_name AS "User Name",
    usi.email_address AS "User Email",
    oi.order_id AS "Order Number",
    TO_CHAR(oi.order_date, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    COALESCE(ui.used_in_orders, '') AS "Used In Order",
    COALESCE(ui.used_by, '') AS "Used By",
    COALESCE(ui.usage_dates, '') AS "Usage Date",
    COALESCE(ui.amounts_used, '') AS "Amount Used",
    COALESCE(ui.amounts_remaining, '') AS "Amount Remaining"
FROM gift_card_info gci
JOIN order_info oi ON gci.gift_card_id = oi.gift_card_id
JOIN user_info usi ON gci.gift_card_id = usi.gift_card_id
LEFT JOIN usage_info ui ON gci.gift_card_id = ui.gift_card_id
ORDER BY oi.order_date DESC
LIMIT 1000;
```

### SQL removing user info
```sql
WITH gift_card_info AS (
    SELECT
        gc.id AS gift_card_id,
        gc.code AS gift_card_code,
        ctc.amount / 100.0 AS original_amount,
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
    WHERE gc.type = 'GiftCard'
), order_info AS (
    SELECT
        gci.gift_card_id,
        gco.id AS order_id,
        gco.created_at AS order_date,
        gco.user_id
    FROM gift_card_info gci
    JOIN blurby.gift_card_orders gco ON gci.gift_card_order_id = gco.id
), usage_info AS (
    SELECT
        gci.gift_card_id,
        SUM(cu.amount) / 100.0 AS total_used_amount,
        STRING_AGG(DISTINCT CAST(o.id AS TEXT), ', ') AS used_in_orders,
        STRING_AGG(DISTINCT CAST(o.user_id AS TEXT), ', ') AS used_by_user_ids,
        STRING_AGG(DISTINCT TO_CHAR(o.created_at, 'YYYY-MM-DD HH24:MI:SS'), ', ') AS usage_dates,
        STRING_AGG(DISTINCT CAST(cu.amount / 100.0 AS TEXT), ', ') AS amounts_used,
        STRING_AGG(DISTINCT CAST((cu.coupon_amount - cu.amount) / 100.0 AS TEXT), ', ') AS amounts_remaining
    FROM gift_card_info gci
    LEFT JOIN blurby.coupon_uses cu ON gci.gift_card_id = cu.coupon_id
    LEFT JOIN blurby.orders o ON cu.order_id = o.id AND o.state NOT IN ('NEW','AUTH_FAILED','CANCELLED')
    WHERE o.id IS NOT NULL
    GROUP BY gci.gift_card_id
)
SELECT
    gci.gift_card_code AS "Gift Card Code",
    gci.original_amount AS "Original Amount",
    (gci.original_amount - COALESCE(ui.total_used_amount, 0) - gci.voided_amount) AS "Outstanding Amount",
    oi.user_id AS "User ID",
    oi.order_id AS "Order Number",
    TO_CHAR(oi.order_date, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    COALESCE(ui.used_in_orders, '') AS "Used In Order",
    COALESCE(ui.used_by_user_ids, '') AS "Used By User IDs",
    COALESCE(ui.usage_dates, '') AS "Usage Date",
    COALESCE(ui.amounts_used, '') AS "Amount Used",
    COALESCE(ui.amounts_remaining, '') AS "Amount Remaining"
FROM gift_card_info gci
JOIN order_info oi ON gci.gift_card_id = oi.gift_card_id
LEFT JOIN usage_info ui ON gci.gift_card_id = ui.gift_card_id
ORDER BY oi.order_date DESC
LIMIT 5000;
```

## Using temporary tables
### with all fields
```sql
-- Step 1: Set work parameters for large operation
SET work_mem = '256MB';  -- Increased for string operations

-- Step 2: Create and populate gift card info table
CREATE TEMP TABLE tmp_gift_card_info AS (
    SELECT
        gc.id AS gift_card_id,
        gc.code AS gift_card_code,
        ctc.amount / 100.0 AS original_amount,
        gc.voided_amount / 100.0 AS voided_amount,
        gcli.gift_card_order_id,
        gcli.id AS gift_card_line_item_id
    FROM
        blurby.coupons gc
    JOIN blurby.gift_card_line_items gcli ON gc.gift_card_line_item_id = gcli.id
    JOIN blurby.coupon_templates ct ON gc.template_id = ct.id
    LEFT JOIN blurby.coupon_template_currencies ctc ON ct.id = ctc.coupon_template_id
        AND ctc.id = (SELECT MIN(inner_ctc.id) FROM blurby.coupon_template_currencies inner_ctc
                       WHERE inner_ctc.coupon_template_id = ct.id)
    WHERE gc.type = 'GiftCard'
);

-- Create index on gift card ID for faster joins
CREATE INDEX idx_tmp_gc_id ON tmp_gift_card_info(gift_card_id);

-- Step 3: Create and populate order info
CREATE TEMP TABLE tmp_order_info AS (
    SELECT
        gci.gift_card_id,
        gco.id AS order_id,
        gco.created_at AS order_date,
        gco.user_id
    FROM tmp_gift_card_info gci
    JOIN blurby.gift_card_orders gco ON gci.gift_card_order_id = gco.id
);

CREATE INDEX idx_tmp_order_gc_id ON tmp_order_info(gift_card_id);
CREATE INDEX idx_tmp_order_user_id ON tmp_order_info(user_id);

-- Step 4: Create user info table
CREATE TEMP TABLE tmp_user_info AS (
    SELECT
        oi.gift_card_id,
        COALESCE(p.firstname || ' ' || p.lastname, u.username) AS user_name,
        e.address AS email_address
    FROM tmp_order_info oi
    JOIN blurby.users u ON oi.user_id = u.id
    LEFT JOIN blurby.profiles p ON u.id = p.user_id
    LEFT JOIN blurby.emails e ON u.id = e.user_id AND e.deleted_at IS NULL
);

CREATE INDEX idx_tmp_user_gc_id ON tmp_user_info(gift_card_id);

-- Step 5: Create usage info table
CREATE TEMP TABLE tmp_usage_info AS (
    SELECT
        gci.gift_card_id,
        SUM(cu.amount) / 100.0 AS total_used_amount,
        STRING_AGG(DISTINCT CAST(o.id AS TEXT), ', ') AS used_in_orders,
        STRING_AGG(DISTINCT COALESCE(up.firstname || ' ' || up.lastname, uo.username), ', ') AS used_by,
        STRING_AGG(DISTINCT TO_CHAR(o.created_at, 'YYYY-MM-DD HH24:MI:SS'), ', ') AS usage_dates,
        STRING_AGG(DISTINCT CAST(cu.amount / 100.0 AS TEXT), ', ') AS amounts_used,
        STRING_AGG(DISTINCT CAST((cu.coupon_amount - cu.amount) / 100.0 AS TEXT), ', ') AS amounts_remaining
    FROM tmp_gift_card_info gci
    LEFT JOIN blurby.coupon_uses cu ON gci.gift_card_id = cu.coupon_id
    LEFT JOIN blurby.orders o ON cu.order_id = o.id AND o.state NOT IN ('NEW','AUTH_FAILED','CANCELLED')
    LEFT JOIN blurby.users uo ON o.user_id = uo.id
    LEFT JOIN blurby.profiles up ON uo.id = up.user_id
    WHERE o.id IS NOT NULL
    GROUP BY gci.gift_card_id
);

CREATE INDEX idx_tmp_usage_gc_id ON tmp_usage_info(gift_card_id);

-- Step 6: Query the final results with pagination
SELECT
    gci.gift_card_code AS "Gift Card Code",
    gci.original_amount AS "Original Amount",
    (gci.original_amount - COALESCE(ui.total_used_amount, 0) - gci.voided_amount) AS "Outstanding Amount",
    usi.user_name AS "User Name",
    usi.email_address AS "User Email",
    oi.order_id AS "Order Number",
    TO_CHAR(oi.order_date, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    COALESCE(ui.used_in_orders, '') AS "Used In Order",
    COALESCE(ui.used_by, '') AS "Used By",
    COALESCE(ui.usage_dates, '') AS "Usage Date",
    COALESCE(ui.amounts_used, '') AS "Amount Used",
    COALESCE(ui.amounts_remaining, '') AS "Amount Remaining"
FROM tmp_gift_card_info gci
JOIN tmp_order_info oi ON gci.gift_card_id = oi.gift_card_id
JOIN tmp_user_info usi ON gci.gift_card_id = usi.gift_card_id
LEFT JOIN tmp_usage_info ui ON gci.gift_card_id = ui.gift_card_id
ORDER BY oi.order_date DESC
LIMIT 1000 OFFSET 0;

-- For next batch, just change the OFFSET value
-- OFFSET 1000, OFFSET 2000, etc.
```

### without user info
```SQL
-- Step 1: Set work parameters for large operation
SET work_mem = '128MB';  -- Adjust based on your server resources

-- Step 2: Create and populate gift card info table
CREATE TEMP TABLE tmp_gift_card_info AS (
    SELECT
        gc.id AS gift_card_id,
        gc.code AS gift_card_code,
        ctc.amount / 100.0 AS original_amount,
        gc.voided_amount / 100.0 AS voided_amount,
        gcli.gift_card_order_id,
        gcli.id AS gift_card_line_item_id
    FROM
        blurby.coupons gc
    JOIN blurby.gift_card_line_items gcli ON gc.gift_card_line_item_id = gcli.id
    JOIN blurby.coupon_templates ct ON gc.template_id = ct.id
    LEFT JOIN blurby.coupon_template_currencies ctc ON ct.id = ctc.coupon_template_id
        AND ctc.id = (SELECT MIN(inner_ctc.id) FROM blurby.coupon_template_currencies inner_ctc
                       WHERE inner_ctc.coupon_template_id = ct.id)
    WHERE gc.type = 'GiftCard'
);

-- Create index on gift card ID for faster joins
CREATE INDEX idx_tmp_gc_id ON tmp_gift_card_info(gift_card_id);

-- Step 3: Create and populate order info
CREATE TEMP TABLE tmp_order_info AS (
    SELECT
        gci.gift_card_id,
        gco.id AS order_id,
        gco.created_at AS order_date,
        gco.user_id
    FROM tmp_gift_card_info gci
    JOIN blurby.gift_card_orders gco ON gci.gift_card_order_id = gco.id
);

CREATE INDEX idx_tmp_order_gc_id ON tmp_order_info(gift_card_id);

-- Step 4: Create usage info table
CREATE TEMP TABLE tmp_usage_info AS (
    SELECT
        gci.gift_card_id,
        SUM(cu.amount) / 100.0 AS total_used_amount,
        STRING_AGG(DISTINCT CAST(o.id AS TEXT), ', ') AS used_in_orders,
        STRING_AGG(DISTINCT CAST(o.user_id AS TEXT), ', ') AS used_by_user_ids,
        STRING_AGG(DISTINCT TO_CHAR(o.created_at, 'YYYY-MM-DD HH24:MI:SS'), ', ') AS usage_dates,
        STRING_AGG(DISTINCT CAST(cu.amount / 100.0 AS TEXT), ', ') AS amounts_used,
        STRING_AGG(DISTINCT CAST((cu.coupon_amount - cu.amount) / 100.0 AS TEXT), ', ') AS amounts_remaining
    FROM tmp_gift_card_info gci
    LEFT JOIN blurby.coupon_uses cu ON gci.gift_card_id = cu.coupon_id
    LEFT JOIN blurby.orders o ON cu.order_id = o.id AND o.state NOT IN ('NEW','AUTH_FAILED','CANCELLED')
    WHERE o.id IS NOT NULL
    GROUP BY gci.gift_card_id
);

CREATE INDEX idx_tmp_usage_gc_id ON tmp_usage_info(gift_card_id);

-- Step 5: Query the final results with pagination
SELECT
    gci.gift_card_code AS "Gift Card Code",
    gci.original_amount AS "Original Amount",
    (gci.original_amount - COALESCE(ui.total_used_amount, 0) - gci.voided_amount) AS "Outstanding Amount",
    oi.user_id AS "User ID",
    oi.order_id AS "Order Number",
    TO_CHAR(oi.order_date, 'YYYY-MM-DD HH24:MI:SS') AS "Order Date",
    COALESCE(ui.used_in_orders, '') AS "Used In Order",
    COALESCE(ui.used_by_user_ids, '') AS "Used By User IDs",
    COALESCE(ui.usage_dates, '') AS "Usage Date",
    COALESCE(ui.amounts_used, '') AS "Amount Used",
    COALESCE(ui.amounts_remaining, '') AS "Amount Remaining"
FROM tmp_gift_card_info gci
JOIN tmp_order_info oi ON gci.gift_card_id = oi.gift_card_id
LEFT JOIN tmp_usage_info ui ON gci.gift_card_id = ui.gift_card_id
ORDER BY oi.order_date DESC
LIMIT 1000 OFFSET 0;

-- For next batch, just change the OFFSET value
-- OFFSET 1000, OFFSET 2000, etc.
```

# FINAL QUERY - Date filter + LIMIT
## Batch structure (just changing the date filter is needed)
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

## Timestamps

### 5 batches
> 1-5001      : 2008-10-30 16:34:28.640 - 2010-06-24 11:05:20.207
2008-10-30 16:33:00 - 2010-06-24 11:05:21

> 5002-10000  : 2010-06-24 12:22:33.078 - 2011-09-23 08:36:51.981
2010-06-24 11:05:21 - 2011-09-23 08:36:52

> 10001-15000 : 2011-09-23 08:59:23.043 - 2012-12-16 20:10:56.909
2011-09-23 08:36:52 - 2012-12-16 20:10:58

> 15001-20141 : 2012-12-16 20:18:06.484 - 2014-01-10 13:42:54.641
2012-12-16 20:10:58 - 2014-01-10 13:42:56

> 20142-25099 : 2014-01-10 15:03:53.087 - 2023-07-28 10:23:24.297
2014-01-10 13:42:56 - 2023-07-28 11:00:00

### 3 batches

- 2008-10-30 16:33:00 - 2011-09-23 08:36:52 : 10006
- 2011-09-23 08:36:52 - 2014-01-10 13:42:56 : 10152
- 2014-01-10 13:42:56 - 2023-07-28 11:00:00 : 4963