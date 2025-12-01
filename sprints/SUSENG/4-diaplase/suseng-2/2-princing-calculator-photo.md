# Pricing Calculator - Photo Books

## Introduction

This document serves as an intermediary between business workflows and the database records within the platform. Please note that most of the terminology used here aligns with the identifiers and naming conventions employed in the database for products, options, and related elements.

## Workflow Steps

1. **Validate Parameters**
    Ensure the following parameters are correctly provided:
    - `with_custom_logo_upgrade`: 1 (removes the Blurb logo)
    - `with_pro_book_covering`: 1 (upgrades to linen cover)
    - `with_pro_endsheet`: 1 (upgrades to premium end sheets)
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

5. **Compute Product Option Prices**
    Calculate prices for specific product options, applicable only to photo books:
    - `custom_logo_upgrade`
    - `pro_white_endsheet`
    - `pro_charcoal_linen_covering`

6. **Structure and Return Results**
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

1. Prices are computed by each photo book dimensions that are stored and managed internally in the `product_dimensions` table. The available dimensions include:
    - small_square
    - square
    - portrait
    - landscape
    - big
    - big_square

    ```sql
    -- for small square
    SELECT *
    FROM blurby.product_dimensions
    WHERE booksmart_dimensions = '369x378';
    ```

2. For each dimension, the calculator iterates through the available paper types. These paper types are stored and managed internally in the `product_options` table under the `PaperType` category. The available paper types include:

    - standard
    - premium_matte
    - premium_glossy
    - pro_uncoated_layflat
    - pro_photo_layflat

    ```sql
    SELECT blurby.product_options.*
    FROM blurby.product_options
    WHERE blurby.product_options.type = 'PaperType' AND blurby.product_options.name = 'StandardPaper'
    LIMIT 1;
    ```

3. For each permutation of cover type, dimension, and paper type, the calculator computes the prices using an internal process called `unified_pricing_page_price_for`.

4. During the `unified_pricing_page_price_for` process, the calculator first validates whether the given dimension supports the specified cover type. If the dimension does not support the cover type, the result is marked as "Not available."

5. The calculator then checks the page count for the book. If no page count is provided, it defaults to the **minimum pages** for the product type. By default, the minimum pages are derived from the **square** or **standard book** configuration. The **standard book** is a conceptual definition with the properties outlined in the **Standard Book Configuration** section, where the default minimum page count is 20.
6. The calculator ensures that the quantity is at least 1, which is also the default value.

7. After determining the quantity and page count, the calculator retrieves the product options based on the initial parameters and the combinations of cover type and paper type. If specific conditions are met (e.g., the customer selects upgrades), the most likely options for photo books are:

    - **Paper Type**: Defaults to `standard`.
    - **Colophon**: Defaults to `CLU`.
    - **Endsheet Type**: Defaults to `pro_charcoal`.
    - **Book Covering Type**: Defaults to `pro_charcoal_linen`.

    These options are stored in the `product_options` table (managed internally). For example, to retrieve the endsheet type:

    ```sql
    SELECT blurby.product_options.*
    FROM blurby.product_options
    WHERE blurby.product_options.type = 'EndsheetType' AND blurby.product_options.name = 'ProCharcoalEndsheet'
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

### Standard book configuration

The **Standard Book** is a type of product with the following key properties:

1. **Paper Types**:
   - The Standard Book uses a variety of paper types, including the standard options available for photo books. These are defined by the `PaperType.standard_book_types`.

2. **Endsheet Types**:
   - The endsheets (the pages that attach the book block to the cover) are selected from the photo book-specific options, as defined by `EndsheetType.photo_book_types`.

3. **Cover Types**:
   - The available cover types exclude saddle-stitched covers, ensuring a more premium binding experience. These are defined by `CoverType.COVER_TYPES_WITHOUT_SADDLESTITCH`.

4. **Book Covering Types**:
   - The book coverings (materials used for the outer cover) include all available options, as defined by `BookCoveringType.all`.

5. **Dimensions**:
   - The Standard Book comes in multiple size options:
     - Portrait
     - True 8x10 Portrait
     - Landscape
     - Square
     - Small Square
     - Big (larger format)
     - Big Square
     These dimensions cater to a variety of customer preferences.

6. **Page Limits**:
   - The book has a **minimum of 20 pages** and a **maximum of 440 pages**, making it suitable for both small and large projects.

7. **Photo Book**:
   - This product is specifically designed as a photo book

8. **Default Options**:
   - **Paper Type**: The default paper type is the standard option (`PaperType.standard`).
   - **Cover Type**: The default cover is a softcover (`CoverType.SOFTCOVER`).
   - **Book Covering Type**: The default covering material is standard black linen (`BookCoveringType.standard_black_linen`).
   - **Endsheet Type**: The default endsheet is a standard mid-grey option (`EndsheetType.standard_mid_grey`).
