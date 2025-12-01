# Ebook Pricing Calculation

## Overview

Ebooks and PDFs follow a simplified fixed-price model, unlike physical books, which involve intricate pricing based on factors like materials, dimensions, and page counts. This document outlines the process of determining and displaying prices for these digital products. Note that tax calculations are not included in the pricing model discussed here.

## How Ebook Prices Are Set

The pricing flow for ebooks follows these steps:

1. **Request Handling**: When a customer visits the pricing page, the system determines which currency to use based on their location or explicit selection.

2. **Retrieving Fixed Prices**: For both ebooks and PDFs, the system looks up predefined prices from a database table based on the product type and currency.

3. **One-Time Fee Model**: Ebooks use a "listing fee" model:
   - When an author first publishes an ebook, they pay a one-time fee
   - Once purchased, subsequent copies of the same ebook have a base price of zero
   - Authors can then apply their own markup to set the final selling price

4. **Price Formatting**: The retrieved prices are formatted according to the user's locale settings (e.g., "$9.99" vs "9,99 €") before being displayed on the pricing page.

## Pricing calculation

### Ebook Base Price Calculation

For fixed-layout ebooks, the price is retrieved using `calculate_base_for_ebooks`:

```ruby
def calculate_base_for_ebooks(currency)
  FixedLineItemCurrencyPrice.find_for_line_item_type_and_currency('EbookLineItem', currency).price_with_current_fx_rate
end
```

This method:
- Looks up the fixed price record for an 'EbookLineItem' in the requested currency
- Calls `price_with_current_fx_rate` to get the final price as a Money object

### PDF Book Price Calculation

Similarly, for PDF books, the price is retrieved using `calculate_for_pdf_book`:

```ruby
def calculate_for_pdf_book(currency)
  FixedLineItemCurrencyPrice.find_for_line_item_type_and_currency('PdfLineItem', currency).price_with_current_fx_rate
end
```

This uses the same pattern but searches for 'PdfLineItem' records instead.

### 5. Fixed Price Lookup

Both methods above call `find_for_line_item_type_and_currency` to find the appropriate price record:

```ruby
def self.find_for_line_item_type_and_currency(line_item_type, currency)
  find_by_line_item_type_and_currency_id(line_item_type, currency.iso_id)
end
```

This method:

- Queries the `fixed_line_item_currency_prices` table
- Filters by both the line item type ('EbookLineItem' or 'PdfLineItem') and currency ID
- Returns the matching price record

## Database Structure & Queries

The system retrieves these fixed prices with queries like:

```sql
-- Query to get the Ebook price in USD
SELECT price_in_cents
FROM fixed_line_item_currency_prices
WHERE line_item_type = 'EbookLineItem'
AND currency_id = 'USD'
LIMIT 1;

-- Query to get the PDF price in EUR
SELECT price_in_cents
FROM fixed_line_item_currency_prices
WHERE line_item_type = 'PdfLineItem'
AND currency_id = 'EUR'
LIMIT 1;
```

## The Listing Fee Concept

For ebooks, the system implements a "listing fee" concept:

```
IF ebook has been purchased by anyone THEN
  base_price = 0 (free)
ELSE
  base_price = listing fee from fixed_line_item_currency_prices
END
```

This allows authors to pay once for publishing their ebook, then set their own markup for sales. For example:

1. Author creates an ebook and pays the listing fee ($9.99)
2. Author sets a markup of $5.00
3. Customers see the ebook priced at $5.00 (base price of $0 + $5.00 markup)

## Price Updates and Management

Prices for ebooks and PDFs are managed centrally and can be updated by administrators using `https://www.blurb.com/admin/fixed_prices`. When prices change:

1. New records are added to the `fixed_line_item_currency_prices` table
2. The system automatically picks up the new prices for new purchases
3. No code changes are required when updating prices
