# Initial Analysis of `actionPrices` Method

## Method Overview

The `actionPrices` method is designed to fetch pricing information for book products and transform it into a structured format that maps database products to their corresponding prices from an external pricing API.

## Step-by-Step Execution Flow

### Step 1: Fetch Pricing Data from External API

```php
$prices = BlurbyAPI::getPrices($pages, $book_type, false);
$prices_LogoUpgrade = BlurbyAPI::getPrices($pages, $book_type, true);
```

- Makes two API calls to get regular pricing and logo upgrade pricing
- For `book_type = "trade_books"`, retrieves pricing structure with cover types: `dustjacket`, `imagewrap`, `softcover`
- Each cover type contains size/paper combinations with their respective prices

### Step 2: Build Product-Paper Mapping from Database

```php
$sizePaperMap = $db->createCommand("select Product.id, Product.pk, Product.enabled, paperTypeID, equivalentCover, CONCAT(blurbyLegacySize, '_', PaperType.blurbyLegacyID) as size_paper_2, CONCAT(equivalentSize, '_',  PaperType.blurbyLegacyID) as size_paper from Product inner join ProductPaperType on Product.pk = ProductPaperType.productPK inner join PaperType on ProductPaperType.paperTypeID = PaperType.id")->queryAll(true);
```

This creates a comprehensive mapping table with:

- **Product.id**: Numeric database ID used as result keys
- **Product.pk**: Product SKU for identification
- **paperTypeID**: Paper type code (e.g., TECBW, TECCL, TSTCL)
- **equivalentCover**: Cover type for matching (e.g., "dustjacket", "imagewrap", "softcover")
- **size_paper**: Combination of `equivalentSize_paperBlurbyLegacyID`
- **size_paper_2**: Alternative combination using `blurbyLegacySize_paperBlurbyLegacyID`

### Step 3: Process Regular Book Pricing

```php
$book_type_prices = $prices[$book_type];
foreach($book_type_prices as $cover_type => $cover_types) {
    foreach($cover_types as $size_paper => $price) {
        $sizePaper = array_filter($sizePaperMap, function($value) use(&$size_paper, &$cover_type) {
            return ($size_paper === $value['size_paper'] || $size_paper === $value['size_paper_2']) && $cover_type === $value['equivalentCover'];
        });

        if (count($sizePaper) === 1) {
            foreach($sizePaper as $sp) {
                if (!array_key_exists($sp['id'], $bookResults)) {
                    $bookResults[$sp['id']] = [];
                }
                $bookResults[$sp['id']][$sp['paperTypeID']] = $sp['enabled'] ? $price : '';
                $bookResults[$sp['id']]['pk'] = $sp['pk'];
            }
        }
    }
}
```

**Matching Logic:**

- Iterates through each cover type and size/paper combination from the API
- Filters the `sizePaperMap` to find exact matches on both:
  - Size/paper combination (`size_paper` OR `size_paper_2`)
  - Cover type (`equivalentCover`)
- Only processes entries with exactly one match (avoiding ambiguity)
- Groups results by Product.id, with paper types as sub-keys
- Only includes prices for enabled products

### Step 4: Process Logo Upgrade Pricing

Identical logic to Step 3, but processes the logo upgrade pricing data and stores results in `$bookResults_LogoUpgrade`.

### Step 5: Process Additional Pages Pricing

```php
$additionalPages = $prices['additional_pages'];
foreach($additionalPages as $size_paper=> $value) {
    $sizePaper = array_filter($sizePaperMap, function($value) use(&$size_paper) {
        return ($size_paper === $value['size_paper'] || $size_paper === $value['size_paper_2']);
    });

    if (count($sizePaper) > 0) {
        foreach($sizePaper as $sp) {
            $additionalPagesResults[$sp['id']][$sp['paperTypeID']] = $value;
        }
    } else {
        $additionalPagesResults[$size_paper] = $value;
    }
}
```

**Key Difference:**

- Doesn't require cover type matching (only size/paper)
- Allows multiple matches (`count($sizePaper) > 0`)
- Falls back to preserving original JSON keys for unmatched entries

### Step 6: Construct Final Response

```php
$result = [];
$result['books'] = $bookResults;
$result['books_with_logo_upgrade'] = $bookResults_LogoUpgrade;
$result['additional_pages'] = $additionalPagesResults;
$result['product_options'] = $prices['product_options'];
```

## Trade Books Compatibility

The method is fully compatible with `book_type = "trade_books"` and handles:

**Cover Types:**

- `dustjacket` → matches products with `equivalentCover = "dustjacket"`
- `imagewrap` → matches products with `equivalentCover = "imagewrap"`
- `softcover` → matches products with `equivalentCover = "softcover"`

**Size/Paper Combinations:**

- Successfully maps complex combinations like `pocket_text_economy_trade_bw_matte_paper`
- Handles multiple size variations (5x8, 6x9, 8x10)
- Supports various paper types (Economy BW, Economy Color, Standard, etc.)

## Result Structure

**Final JSON Structure:**

```json
{
  "books": {
    "[product_id]": {
      "[paper_type_code]": "[price]",
      "pk": "[product_sku]"
    }
  },
  "books_with_logo_upgrade": {
    // Same structure as books
  },
  "additional_pages": {
    "[product_id]": {
      "[paper_type_code]": "[additional_page_price]"
    },
    // Unmapped entries preserve original JSON keys
    "[original_size_paper_key]": "[price]"
  },
  "product_options": "[api_product_options]"
}
```

## Key Features

1. **Robust Matching**: matching criteria ensure accurate product-price mapping
2. **Flexible Paper Types**: Supports multiple paper types per product
3. **Enabled Product Filtering**: Only returns prices for active products
5. **Extensible Design**: Easily supports new cover types by adding database records
