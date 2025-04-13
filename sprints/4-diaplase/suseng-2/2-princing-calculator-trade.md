# Pricing Calculator - Trade Books

## Introduction

This document serves as an intermediary between business workflows and the database records within the platform. Please note that most of the terminology used here aligns with the identifiers and naming conventions employed in the database for products, options, and related elements.

## Workflow Steps

1. **Validate Parameters**
    Ensure the following parameters are correctly provided:
    - `pages`: 24
    - `quantity`: 1

2. **Infer Locale**
    Derive the locale based on the language, domain, or URL (commonly inferred from the domain).

3. **Calculate Cover Type Prices**
    Compute prices for each cover type as outlined in the **Get Prices** section:
    - Dustjacket
    - Imagewrap
    - Softcover

4. **Calculate Additional Page Prices**
    Determine the pricing for extra pages in the standard book.

5. **Structure and Return Results**
    Organize the computed data and send the structured response back to the client.

## Get prices

1. Determine the currency to be used for the operation. This is typically derived from the regional domain or a stored cookie.

2. Identify the language based on the locale.

3. Calculate the initial tax rate for the print-on-demand item (refer to the **Get tax rate - pod** section). Note that this value is likely provisional since at this point the calculator does not have the enough information to compute the taxes.

4. Retrieve prices for each cover type (refer to the **Get cover type prices** section). The defined cover types for photo books include:
    - hardcover
    - imagewrap
    - softcover

    Database record `product_options` managed internally

    ```sql
    SELECT *
    FROM blurby.product_options
    WHERE type = 'CoverType';
    ```

## Get cover type prices

1. Prices are computed by each trade book dimensions that are stored and managed internally in the `product_dimensions` table. The available dimensions include:
    - text
    - large_text
    - portrait_true8x10

    ```sql
    -- for portrait_true8x10
    SELECT *
    FROM blurby.product_dimensions
    WHERE booksmart_dimensions = '585x738';
    ```

2. For each dimension, the calculator iterates through the available paper types. These paper types are stored and managed internally in the `product_options` table under the `PaperType` category. The available paper types include:

    - economy_trade_bw_matte
    - economy_trade_matte
    - standard_trade_matte
    - standard_trade_bw_matte

    ```sql
    SELECT blurby.product_options.*
    FROM blurby.product_options
    WHERE blurby.product_options.type = 'PaperType' AND blurby.product_options.name = 'EconomyTradeBWMattePaper'
    LIMIT 1;
    ```

3. For each permutation of cover type, dimension, and paper type, the calculator computes the prices using an internal process called `unified_pricing_page_price_for`.

4. During the `unified_pricing_page_price_for` process, the calculator first validates whether the given dimension supports the specified cover type. If the dimension does not support the cover type, the result is marked as "Not available."

5. The calculator then checks the page count for the book. If no page count is provided, it defaults to the **minimum pages** for the product type. By default, the minimum pages are derived from the **trade book** configuration. The **trade book** is a conceptual definition with the properties outlined in the **Trade Book Configuration** section, where the default minimum page count is 24.

6. The calculator ensures that the quantity is at least 1, which is also the default value.

7. After determining the quantity and page count, the calculator retrieves the product options based on the initial parameters and the combinations of cover type and paper type. If specific conditions are met (e.g., the customer selects upgrades), the most likely options for photo books are:

   - **Paper Type**: Derived directly from the iteration process described in step (2) of this section.

    These options are stored in the `product_options` table (managed internally). For example, to retrieve the endsheet type:

    ```sql
    SELECT blurby.product_options.*
    FROM blurby.product_options
    WHERE blurby.product_options.type = 'PaperType' AND blurby.product_options.name = 'EconomyTradeBWMattePaper'
    LIMIT 1;
    ```

8. The calculator generates a product specification to ensure compliance with internal rules regarding valid combinations of product options and book features. This specification is then used to calculate the base price, excluding taxes. For more details, refer to the **Product Specification Validation** section.

9. After validating the product specification, the calculator calculates the raw price. This includes adjustments for the specified quantity and any applicable volume discounts for photo books. For more information, refer to the **Calculate Pricing from Product Specification** section.

10. With the necessary details in place, the calculator updates the product classification based on the validated product specification. This updated classification is then used to recalculate the tax rate. For details on tax computation, see the **Get tax rate** section.

11. The calculator finalizes the process by performing two key tasks:

    a. Determining whether the requested price is intended for generating the pricing table or calculating the total for a specific combination.

    b. Adding applicable taxes to the computed price, formatting the final value according to the specified currency and language settings.

**Note:** This entire process is repeated for every combination of dimensions, paper types, and cover types.

## Complementary Information

### Trade book configuration

The **Trade Book** is a type of product with the following key properties:

- **Paper Options**: The Trade Book uses specific paper types defined in the system as `trade_types` which likely include options like "economy_trade_bw_matte" (the default paper type)

- **Cover Options**: Customers can choose from three cover types:
  - Image Wrap (where the image covers the entire cover)
  - Softcover (the default option)
  - Hardcover

- **Available Sizes**:
  - 5x8 (standard text size)
  - 6x9 (large text size)
  - 8x10 (portrait true 8x10)

- **Page Count**:
  - Minimum: 24 pages
  - Maximum: 480 pages (more than the Standard Book's 440 pages)

#### Default Settings

When a customer starts creating a Trade Book, these settings are applied automatically:

- Economy black and white matte paper
- Softcover binding
- Standard grey linen covering (for hardcover options)
- Standard white endsheets (the pages connecting the cover to the interior)

#### Business Rules

- **Bulk Discount Category**: Trade Books fall under the 'TRADE' category for bulk discounts
- **CLU Charging**: The code specifies that Trade Books are not charged for "CLU" (likely a specific fee or feature)

This appears to be a product designed for traditional book publishing (likely text-heavy books rather than photo books) with options that would meet Ingram distribution requirements.