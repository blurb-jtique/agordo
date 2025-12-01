
# Pricing Calculator
Intro
records in DB implied
admin tools to configure
example to go
comparison with real purchase

# Understanding the Blurby Pricing Engine

## Introduction

At the core of Blurby's operations is a robust pricing engine designed to transform product specifications into customer-facing prices. This engine supports a wide range of products, including custom photo books with premium upgrades, standardized trade books, magazines, and digital formats. While each product type follows a unique pricing path, they all adhere to shared architectural principles that ensure consistency and scalability.

This documentation series provides an in-depth look at how pricing calculations are implemented in our system:

- **Validation of Product Specifications**: Ensuring that customer-selected configurations are valid and manufacturable.
- **Base Price Determination**: Calculating the starting price for each product type.
- **Markup for Options and Materials**: Accounting for premium materials and additional features in the pricing.
- **Volume Discount Application**: Applying discounts for bulk orders based on quantity thresholds.
- **Tax Calculation**: Determining and applying appropriate tax rates based on product type and customer location.
- **Currency Conversion**: Displaying prices in the customer's preferred currency.

The pricing engine functions as a pipeline, beginning with product specification validation, followed by base price retrieval, applying markups and discounts, and concluding with tax calculations. Understanding this workflow provides clarity on the rationale behind specific pricing rules and their impact on the final price presented to customers.

Whether you're introducing new product offerings, refining pricing strategies, or addressing customer inquiries, this documentation bridges the technical and business aspects of our pricing system to support informed decision-making.

## Documentation Structure

The documentation is organized into product-specific and shared components:

### Product-Specific Pricing Calculators

Each product type has its own unique pricing considerations and logic:

- **[Photo Books - Pricing Calculator](link)**: Explains the calculation of photo book prices across different dimensions, materials, and premium options.
- **[Trade Books - Pricing Calculator](link)**: Details the pricing logic for our professional and economy paper options in standard trade book formats.
- **[Magazines - Pricing Calculator](link)**: Covers the magazine-specific pricing with its unique paper types and binding requirements.
- **[PDF - Pricing Calculator](link)**: Outlines how our simplified digital product pricing works.

### Shared Procedures

These core components work across multiple product types:

- **[Product Specification Validation](link)**: How we ensure that only valid product configurations enter the pricing pipeline.
- **[Calculate Pricing from Product Specification](link)**: The shared algorithm for determining base prices and applying markups.
- **[Get Tax Rate - Print-on-Demand Product](link)**: How appropriate tax rates are calculated based on product type and customer location.
- **[Shipping Service from Checkout Process](link)**: How shipping methods and costs are determined during checkout.

## How to Use This Documentation

When investigating pricing questions or planning changes:

1. Start with the product-specific calculator documentation for your area of interest
2. Reference the shared procedures for deeper understanding of common components
3. Note the interconnections between components (referenced throughout the documentation)
4. Use the code references to locate specific implementations in our codebase

Each section includes technical details about how the code works, but focuses on explaining the business logic and decision points in terms that bridge technical and business considerations. Code snippets, database queries, and workflow diagrams are included to provide a comprehensive understanding of our pricing system.

This documentation serves as both a reference for troubleshooting pricing issues and a guide for understanding the implications of potential pricing changes.

---

The **Pricing Calculator** is a feature that allows users to estimate the cost of designing and printing books based on various customizable options. It is implemented in the `PricingPageController` class, specifically in the `pricing_page_prices` action. This action is responsible for handling requests to the `/pricing_page_prices` route and returning a JSON response containing pricing details for different book configurations.

# Overview of the `pricing_page_prices` Action

1. **Purpose**:
   The `pricing_page_prices` action dynamically calculates and returns pricing information based on user-provided parameters such as page count, quantity, and additional customization options (e.g., custom logo upgrades, premium materials).

2. **Input Parameters**:
   The action accepts several parameters via the query string:
   - `pages`: The number of pages in the book.
   - `quantity`: The number of copies to be printed.
   - `with_custom_logo_upgrade`: Whether to include a custom logo upgrade.
   - `with_pro_book_covering`: Whether to include a ProLine book covering.
   - `with_pro_endsheet`: Whether to include ProLine end sheets.
   - `price_option`: Specifies the type of pricing calculation (e.g., total price).
   - `book_type`: Determines which pricing logic to apply

3. **Routing Logic**:
   Based on the `book_type` parameter, the action determines which pricing logic to apply:
   - **Photo Books**: Uses `photo_books_pricing_page_prices.jsonp.erb`.
   - **Trade Books**: Uses `trade_books_pricing_page_prices.jsonp.erb`.
   - **Magazines**: Uses `magazines_pricing_page_prices.jsonp.erb`.
   - **Ebooks**: Uses `ebooks_pricing_page_prices.jsonp.erb`.
   - **Default**: Returns pricing for all available book types.

4. **Validation**:
   The `bad_request?` method ensures that the input parameters are valid:
   - Numeric values (e.g., `pages`, `quantity`) must be integers.
   - Boolean values (e.g., `with_custom_logo_upgrade`) must be true/false.
   - `quantity` must be greater than zero.

5. **Pricing Calculation**:
   The action delegates the pricing calculation to helper methods and presenters:
   - **Photo Books**: Uses `photo_book_price_hash`.
   - **Trade Books**: Uses `trade_book_price_hash`.
   - **Magazines**: Uses `magazine_price_hash`.
   - **Ebooks**: Uses `ebook_price_hash`.
   - **Additional Options**: Includes additional page prices, swatch prices, and product option prices.

6. **Caching**:
   To optimize performance, the calculated pricing data is cached using `RedisCache` with a unique cache key based on the input parameters.

7. **Output**:
   The action returns a JSON response containing detailed pricing information for the requested book type and configuration. This data is used to populate the pricing calculator UI, as shown in the attached image.

# Price Computation for Photo Books - Detailed Analysis

## Core Components of the Pricing System

The photo book pricing system is a complex calculation engine that considers multiple variables to determine the final price. Let's analyze how this works:

## 1. Data Flow for Price Calculation

When a request comes to `/pricing_page_prices` (with or without `book_type=photo_books`), the following process occurs:

1. **Controller Entry Point**: `PricingPageController#pricing_page_prices` routes to `show_prices`
2. **Parameter Collection**: The controller extracts key options from params:
   - `pages`: Number of pages in the book
   - `quantity`: Number of copies
   - `with_custom_logo_upgrade`: Whether to include custom logo (boolean)
   - `with_pro_endsheet`: Whether to include premium endsheets (boolean)
   - `with_pro_book_covering`: Whether to include premium covering (boolean)
   - `price_option`: How to display the price (e.g., `total_price`)

3. **Price Calculation**: The controller calls `prices(options, book_type)` which:
   - Uses Redis caching with a cache key based on all parameters
   - Loads appropriate presenters via `get_presenters`
   - For photo books, returns `photo_book_price_hash(options).merge(product_option_price_hash)`

## 2. Price Determinants

The final price of a photo book depends on these factors:

### a) Physical Characteristics

- **Dimension**: Different sizes have different base prices

  ```ruby
  # Product dimensions available for photo books
  ProductDimension.photo_books  # small_square, square, standard_portrait, etc.
  ```

  examples:

  ```ruby
  [
    { orientation: "SQUARE", preview_page_dimensions: "264x264", preview_cover_dimensions: "303x303", key: "small_square" },
    { orientation: "SQUARE", preview_page_dimensions: "418x418", preview_cover_dimensions: "450x433", key: "square" },
    { orientation: "PORTRAIT", preview_page_dimensions: "335x425", preview_cover_dimensions: "361x440", key: "standard_portrait" },
    { orientation: "LANDSCAPE", preview_page_dimensions: "422x362", preview_cover_dimensions: "450x376", key: "standard_landscape" },
    { orientation: "LANDSCAPE", preview_page_dimensions: "421x362", preview_cover_dimensions: "450x380", key: "large_landscape" },
    { orientation: "SQUARE", preview_page_dimensions: "855x864", preview_cover_dimensions: "889x882", key: "large_square" }
  ]
  ```

- **Cover Type**: Three types with different pricing

  ```ruby
  CoverType.HARDCOVER   # Dustjacket
  CoverType.IMAGEWRAP   # Image printed directly on cover
  CoverType.SOFTCOVER   # Paperback-style
  ```

- **Paper Type**: Multiple options with varying quality and price points

  ```ruby
  PHOTO_BOOK_PAPERS = [
    PaperType.standard,
    PaperType.premium_matte,
    PaperType.premium_glossy,
    PaperType.pro_uncoated,
    PaperType.pro_medium_gloss,
    # Layflat options
    PaperType.standard_layflat,
    PaperType.premium_matte_layflat,
    PaperType.pro_uncoated_layflat,
    PaperType.pro_photo_layflat
  ]
  ```

### b) Premium Options

These are additional upgrades that affect the price:

- **Custom Logo Upgrade**: (25% price increase as shown in the JSON output)
- **Pro White Endsheet**: $3.00 additional
- **Pro Charcoal Linen Covering**: $6.00 additional

### c) Quantity-Based Factors

- **Page Count**: Base price is for minimum pages; additional pages add cost
- **Quantity**: Bulk discounts apply to larger orders (referenced by `bulk_discount_type`)

## 3. The Core Pricing Logic

The actual price calculation happens in `unified_pricing_page_price_for` method, which:

1. **Validates configuration** - Checks if the dimension supports the cover type
2. **Creates product specification** - Builds a `ProductSpec` object with all attributes
3. **Calculates base price** - Uses `Pricing::ProductCalculator.calculate_for_spec` with parameters:

   ```ruby
   Pricing::ProductCalculator.calculate_for_spec(ps, currency,
     quantity: quantity,
     apply_volume_discount: true,
     bulk_discount_type: bulk_discount_type
   )
   ```

4. **Applies tax** - Uses `price_presenter` to add appropriate taxes based on location

## 4. Pricing Special Cases

Several special conditions affect pricing or availability:

- **"Not Available" Combinations**: Some combinations are invalid and display as "Not Available"

  ```ruby
  # Example from the code
  if dimension.small_square? && !cover_type.is_softcover?
    return not_available_tag
  end
  ```

- **Layflat Papers**: Layflat options generally have higher prices and specific compatibility rules

  ```ruby
  # Example from the JSON response
  "square_standard_layflat_paper": "US $60.00", # Available for imagewrap
  "square_standard_layflat_paper": "<span class=\"disabled\">Not Available</span>", # Not available for dustjacket
  ```

- **Additional Page Pricing**: Each additional page has a separate price based on the dimension and paper type

  ```ruby
  # From the JSON output
  "standard_portrait_premium_paper": "US $0.45", # Cost per additional page
  ```

## 5. Regional Considerations

Prices include taxes for certain regions:

```ruby
def include_tax_in_prices?
  country = address.country
  country.australia? || country.european_union?
end
```

## 6. Caching Strategy

The system uses Redis to cache price calculations:

```ruby
RedisCache.get(generate_cache_key_for_pricing_page_prices_request(options, book_type), REDIS_CMS_PRICE_TTL) {
  # Price calculation logic
}
```

# Photo Book Pricing Calculator: How it Works

The photo book pricing calculator is a sophisticated system that determines prices based on multiple factors, processing complex rules to deliver accurate pricing to customers. Let me explain how it works from a technical perspective.

## Core Process Flow

The pricing calculation process follows these key steps:

1. **Request Handling**: When a user interacts with the pricing calculator, a request is sent to the `pricing_page_prices` endpoint
2. **Parameter Validation**: The controller validates input parameters (pages, quantity, options)
3. **Caching Check**: The system checks Redis cache for existing calculations with the same parameters
4. **Component Assembly**: If not cached, the appropriate presenters and calculators are loaded
5. **Configuration Analysis**: The system determines all valid combinations of book formats, dimensions, cover types, and paper types
6. **Price Calculation**: For each valid combination, a detailed price calculation is performed
7. **Tax Application**: Regional tax rules are applied based on user location
8. **Response Formatting**: Prices are formatted into a structured JSON response

## Critical Parameters in the Process

1. **Book Specifications**:
   - **Pages**: Number of pages (20-440, must be even)
   - **Dimensions**: Small Square (5×5"), Square (7×7"), Portrait (8×10"), etc.
   - **Cover Types**: Softcover, Hardcover (Dustjacket), Imagewrap
   - **Paper Types**: Standard, Premium, Pro Medium Gloss, Layflat options

2. **Pricing Factors**:
   - **Base Price**: Starting price for minimum page count
   - **Per-Page Cost**: Additional cost for pages beyond minimum
   - **Premium Options**: Custom logo (25% markup), Pro endsheets ($3), etc.
   - **Quantity**: Volume discounts for larger orders

3. **Regional Variables**:
   - **Currency**: USD, EUR, GBP, etc.
   - **Tax Rules**: VAT for EU, GST for Australia, etc.

## Deep Dive: Price Calculation

The core calculation happens in `Pricing::ProductCalculator.calculate_for_spec`:

1. **Base Price Lookup**:

   ```ruby
   cost_in_cents = get_base_price(product_spec, currency).cents
   ```

2. **Option Markup Addition**:

   ```ruby
   product_spec.options.each do |option|
     # Apply markups using appropriate strategy
     product_option_markup = ProductOptionMarkupCalculator.new(...).markup(strategy)
     cost_in_cents += product_option_markup.cents
   end
   ```

3. **Quantity & Volume Discounts**:

   ```ruby
   cost_in_cents *= quantity

   if apply_volume_discount
     cost_in_cents -= AutoAssignedCoupon.discount_by_quantity_and_price_and_type(...)
   end
   ```

4. **Tax Application** (in PricePresenter):

   ```ruby
   def price(money)
     money + tax_amount_to_display(money)
   end
   ```

## Practical Example

For a 20-page 7×7" Square Imagewrap book with Premium paper:

1. **Controller** receives request with `pages=20`, `book_type=photo_books`
2. **PhotoBooksPricingTablePresenter** handles price calculation
3. **ProductSpec** is built for Square, Imagewrap, Premium paper
4. **ProductCalculator** determines:
   - Base price: $32.00
   - Per-page costs: $0.00 (minimum pages)
   - Option markup: $5.00 for Premium paper
5. **PricePresenter** adds applicable taxes
6. **Result** is cached in Redis and returned: "US $37.00"

This sophisticated pricing system ensures accurate, consistent pricing across thousands of possible book configurations while maintaining high performance through strategic caching.

Similar code found with 1 license type

## Routes

### pricing page

```
/pricing_page_prices?pages=24&with_custom_logo_upgrade=0&with_pro_book_covering=0&with_pro_endsheet=0&quantity=1 params: {"pages"=>"20", "with_custom_logo_upgrade"=>"0", "with_pro_book_covering"=>"0", "with_pro_endsheet"=>"0", "quantity"=>"1", "controller"=>"pricing_page", "action"=>"pricing_page_prices"}
```

### volume pricing

```
/api/v4/volume_prices.json params: {"controller"=>"api/volume_prices", "action"=>"index", "apiversion"=>"v4", "format"=>"json"}
```

### printable product prices

```
/api/v1/printable_product_prices?quantity=1 params: {"quantity"=>"1", "controller"=>"pricing_page", "action"=>"printable_products_pricing_page_prices", "apiversion"=>"v1"}
```