# Pricing Calculator - Magazines

## Introduction

This document serves as an intermediary between business workflows and the database records within the platform. Please note that most of the terminology used here aligns with the identifiers and naming conventions employed in the database for products, options, and related elements.

## Workflow Steps

1. **Validate Parameters**
    Ensure the following parameters are correctly provided:
    - `pages`: 20 by default
    - `quantity`: 1

2. **Infer Locale**
    Derive the locale based on the language, domain, or URL (commonly inferred from the domain).

3. **Calculate Cover Type Prices**
    Compute prices for each magazine feature calling the presenter method `unified_pricing_page_magazine_price_for` for each type as outlined in the **Get Prices** section:
    - magazine - economy
    - premium magazine

4. **Calculate Additional Page Prices**
    Determine the pricing for extra pages in the standard book.

5. **Structure and Return Results**
    Organize the computed data and send the structured response back to the client.

## Get prices

The `MagazinesPricingTablePresenter` is responsible for calculating magazine prices using the `unified_pricing_page_magazine_price_for` method. The process involves the following steps:

1. **Normalize Page Count**
    Ensures the page count is valid and a multiple of 4 (as magazines require page counts in multiples of 4). If no page count is provided, it defaults to the **minimum pages** for the product type, which is 20 by default, as defined in the **Magazine Configuration** section.

2. **Create Product Specification**
    Constructs a Product Specification object that encapsulates all magazine attributes:
    - **Dimensions**: Determines the appropriate size (typically US Letter size).
    - **Page Count**: Uses the provided page count or defaults to the minimum.
    - **Options**: Defines product options such as:
      - Cover Paper Type: Always `PLUS_COVER`.
      - Coating Type: Always `SATIN`.
      - Cover Type: Always **softcover**.
      - Paper Type: Economy or premium, based on the magazine type.
    - **Product Spec Initialization**: Creates a new Product Specification with these parameters.

3. **Normalize Quantity**
    Ensures the quantity is valid, defaulting to 1 if not specified.

4. **Validate Product Specification**
    Verifies the Product Specification against internal rules to ensure valid combinations of options and features. This validated specification is then used to calculate the base price, excluding taxes. For more details, refer to the **Product Specification Validation** section.

5. **Calculate Base Price**
    Computes the raw price based on the validated specification, considering:
    - Selected currency.
    - Volume discount eligibility.
    - Requested quantity.
    - Bulk discount type for magazines.
    For additional details, see the **Calculate Pricing from Product Specification** section.

6. **Apply Tax**
    Updates the product classification based on the validated specification and recalculates the applicable tax rate. For more information, refer to the **Get Tax Rate** section.

7. **Format Price**
    Determines whether to return the total price or per-unit price.

8. **Localize Price**
    Converts the price into a localized format suitable for display.

## Complementary Information

### Magazine Configuration

#### Standard Magazine

The Standard Magazine is a softcover publication printed on specialized magazine paper stock with letter-sized dimensions (8.5" × 11"). Each magazine features:

- A plus cover with a premium satin coating for an elegant, smooth finish
- Page count ranging from 20 to 240 pages
- Standard letter-size format
- Softcover binding
- Professional magazine-quality paper

They qualify for bulk discounts under the "MAGAZINE" pricing tier.

#### Premium Magazine Variation

The Premium Magazine offers all the features of the Standard Magazine but with an upgraded paper quality:

- Luxurious velvet paper stock instead of standard magazine paper
- The same softcover binding, satin coating, and size constraints as the standard version
- Available in page counts from 20 to 240 pages