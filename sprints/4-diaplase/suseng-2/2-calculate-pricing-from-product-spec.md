# Calculate Pricing from Product Specification

Once a valid product specification is created, the pricing calculator needs to calculate the exact price for the product. This process involves determining the base price for the book configuration and applying all applicable markups, options, and discounts. The `calculate_for_spec` method in the `Pricing::ProductCalculator` class is the central component that handles this complex pricing logic.

## Pricing Workflow

1. **Setup Calculation Parameters**
    - The system extracts the requested quantity from the options (defaulting to 1 if not specified).
    - It determines whether volume discounts should be applied based on the `apply_volume_discount` parameter.
    - It confirms that the product specification contains at least a cover type, which is required for pricing calculations.

2. **Retrieve Base Price**
    - The base price is determined by calling the `get_base_price` method, which calculates the fundamental cost of the book configuration.
    - This base price includes:
      - The cost for the selected dimension (e.g., square, portrait, landscape)
      - The cost for the selected cover type (e.g., hardcover, softcover, imagewrap)
      - The cost for the minimum number of pages for that book type
      - The cost for additional pages beyond the minimum

    The `base_prices` and `page_prices` tables serve as the primary source for this operation and is maintained internally. The latest updates to this table were applied on August 15, 2023 presummably using `PricingChanges::PriceChange` internally. Below is an example query used to retrieve a specific base price:

    ```sql
    SELECT *
    FROM blurby.base_prices
    WHERE product_type = 'Products::StandardBook'
    AND cover_type_id = 1
    AND paper_type_id = 5
    AND product_dimension_id = 3
    AND currency_id = 'USD'
    LIMIT 1;
    ```

    And below is an example query used to retrieve the price per page from the table. Note that the base price already includes the cost of a book with the minimum number of pages. Therefore, the system calculates the additional cost by subtracting the minimum page count from the total number of pages specified in the product configuration.

    ```sql
    SELECT *
    FROM blurby.page_prices
    WHERE product_type = 'Products::StandardBook'
    AND paper_type_id = 5
    AND product_dimension_id = 3
    AND currency_id = 'USD'
    AND low_page_count <= 40
    AND high_page_count >= 40
    LIMIT 1;
    ```

    **NOTE:** There must always be at least one record available for both the base price and the page price corresponding to the target features specified in the product configuration (specification).

3. **Apply Option Pricing**
   - For each option in the product specification (cover types, paper types, endsheets, etc.), the system calculates additional costs:

     ```ruby
     product_spec.options.each do |option|
       # Calculate pricing for each option
     end
     ```

   - The system handles two different pricing scenarios for options:
     a. **Fixed Price Options**: If the option has a fixed price (typically for inventory books and not affecting pricing calculator), that price is directly added to the total.
     b. **Markup-Based Options**: For most options, the system applies a percentage or fixed markup based on the option's configuration.

4. **Special Handling for Custom Logo Upgrades**
   - Custom logo upgrades (Colophon options) receive special treatment (strategy), however **trade books** are not being charged for CLU:

     ```ruby
     strategy = if option.product_option.is_a?(Colophon)
                  Pricing::Strategy::CLUMarkupLookup.new
                else
                  Pricing::Strategy::MarkupLookup.new
                end
     ```

   - This distinction ensures that the correct pricing strategy is used for calculating the markup for removing the Blurb logo from the book.

5. **Option Markup Calculation**
    - For each product option, the `ProductOptionMarkupCalculator` determines the appropriate markup:

     ```ruby
     product_option_markup = Pricing::ProductOptionMarkupCalculator.new(option, product_spec, currency).markup(strategy)
     cost_in_cents += product_option_markup.cents
     ```

    - The markup calculation depends on the `markup_type` column defined in the `product_options` table. Each product option's markup type determines whether the calculation is based on a fixed amount, a percentage of the base price, or another predefined strategy.
      - Some options (like premium paper) use percentage-based markups of the base price
      - Other options (like pro endsheets) apply fixed-amount markups
      - The appropriate markup strategy is determined by the option's configuration

6. **Quantity Multiplication**
   - After all markups are applied, the total cost is multiplied by the requested quantity:

     ```ruby
     cost_in_cents *= quantity
     ```

   - This creates a linear price scaling for multiple copies of the same book

7. **Volume Discount Application**
   - If volume discounts are enabled, the system calculates the appropriate discount based on quantity thresholds and product type:

     ```ruby
     if apply_volume_discount
       # substracting the discount from `cost_in_cents`
       cost_in_cents -= AutoAssignedCoupon.discount_by_quantity_and_price_and_type(
         quantity,
         Money.new(cost_in_cents, currency),
         opts[:bulk_discount_type]
       ).cents
     end
     ```

     the source of this process is the tables `coupon_templates` and `coupons`, below is an example for photo books and templates:

     ```sql
     SELECT ct.*
     FROM blurby.coupon_templates ct
     WHERE ct.applies_to = 'BULK_DISCOUNT_PHOTO'  -- Using the bulk_discount_type parameter
     AND ct.enabled = true
     AND ct.auto_assigned = true
     AND (ct.starts_on IS NULL OR ct.starts_on <= CURRENT_DATE)
     AND (ct.ends_on IS NULL OR ct.ends_on >= CURRENT_DATE)
     ORDER BY ct.target_min_quantity ASC;
     ```

     Fining coupon where quantity falls within the target range, in this example 15 units

     ```sql
     SELECT c.*
     FROM blurby.coupons c
     JOIN blurby.coupon_templates ct ON c.template_id = ct.id
     WHERE ct.applies_to = 'BULK_DISCOUNT_PHOTO'
     AND ct.enabled = true
     AND ct.auto_assigned = true
     AND (ct.starts_on IS NULL OR ct.starts_on <= CURRENT_DATE)
     AND (ct.ends_on IS NULL OR ct.ends_on >= CURRENT_DATE)
     AND (15 >= ct.target_min_quantity)  -- Example quantity of 15
     AND (15 <= ct.target_max_quantity OR ct.target_max_quantity IS NULL)
     LIMIT 1;
     ```

     Getting the discount percentage or fixed amount

     ```sql
     SELECT
     ct.calc_type,  -- PERCENT or FIXED
     ctc.amount,    -- The discount amount
     c.code
     FROM blurby.coupons c
     JOIN blurby.coupon_templates ct ON c.template_id = ct.id
     LEFT JOIN coupon_template_currencies ctc ON ct.id = ctc.coupon_template_id AND ctc.currency_iso_id = 'USD'
     WHERE c.id = 13845079;  -- Using the coupon ID found in previous query
     ```

   - Common volume discount tiers for photo books include:
     - 20% off for 10-20 units
     - 25% off for 50+ units

8. **Final Price Construction**
   - The final price is constructed as a Money object in the requested currency:

     ```ruby
     Money.new(cost_in_cents, currency)
     ```

   - This ensures proper currency formatting and exchange rate handling

## Special Pricing Cases

1. **Fixed Currency Pricing**
   - Certain products may have fixed prices that override the calculated price
   - The system checks for these fixed prices during the base price calculation
   - If a fixed price is found and is less than the calculated price, the fixed price is used

2. **Error Handling**
   - If pricing data is missing for a given product specification, a `MissingPricingDataError` is raised
   - This typically happens when trying to price an unsupported combination of options

3. **API-Specific Pricing**
   - Partners with specific API keys may have custom pricing configurations
   - The system checks for these during the base price lookup
