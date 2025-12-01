# Suggested changes in Bookwright to support Softcover WireO

To support the new `softcover_wireo` cover type in the trade books system, we'll need to make changes in some areas.

## 1. **Database Changes - Product Table**

we need to add new Product records with `equivalentCover = "softcover_wireo"`. Based on the JSON structure, we'll need at least 3 products:

```sql
-- Example new products (adjust PKs as needed)
INSERT [dbo].[Product]
([pk], [type], [subtype], [enabled], [manufacturer], [sizeSKU], [printedWidth], [printedHeight], [ratio], [pageSafetyX], [pageSafetyY], [id], [showGutterSafety], [coverWrapX], [coverWrapY], [coverRatio], [baseCoverPageWidth], [sizeDescription], [minPages], [maxPages], [blurbyLegacySize], [blurbyLegacyCover], [equivalentSize], [equivalentCover])
VALUES
('TradeBook-5x8-SoftCoverWireo-StandardMatte', 0, 2, 1, 'B', 'TradeBook-5x8-SoftCoverWireo-StandardMatte', 5.25, 8.25, [ratio], [safety values...], [new_id], 1, [wrap values...], '5x8', 20, 400, 'pocket_text', 'softcover_wireo', 'pocket_text', 'softcover_wireo'),

('TradeBook-6x9-SoftCoverWireo-StandardMatte', 0, 2, 1, 'B', 'TradeBook-6x9-SoftCoverWireo-StandardMatte', 6.25, 9.25, [ratio], [safety values...], [new_id], 1, [wrap values...], '6x9', 20, 400, 'large_text', 'softcover_wireo', 'large_text', 'softcover_wireo'),

('TradeBook-8x10-SoftCoverWireo-StandardMatte', 0, 2, 1, 'B', 'TradeBook-8x10-SoftCoverWireo-StandardMatte', 8.25, 10.25, [ratio], [safety values...], [new_id], 1, [wrap values...], '8x10', 20, 400, 'standard_portrait_true8x10', 'softcover_wireo', 'standard_portrait_true8x10', 'softcover_wireo');
```

## 2. **Database Changes - ProductPaperType Relationships**

Link the new products to the appropriate paper type. Based on our JSON, first experiment uses "standard_trade_matte_paper":

```sql
-- Link products to TSTCL paper type (standard_trade_matte_paper)
INSERT [dbo].[ProductPaperType] ([productPK], [paperTypeID])
VALUES
('[new_product_pk_1]', 'TSTCL'),
('[new_product_pk_2]', 'TSTCL'),
('[new_product_pk_3]', 'TSTCL');
```

## 3. **Test the Implementation**

After making these changes, test by calling:

```php
// This should now return softcover_wireo products in the result
$controller->actionPrices($pages, 'trade_books');
```

## 4. **Expected Result Structure**

we should see new entries like:

```json
{
  "books": {
    "[new_product_id_1]": {
      "TSTCL": "US $20.63",
      "pk": "TradeBook-5x8-SoftCoverWireo-StandardMatte"
    },
    "[new_product_id_2]": {
      "TSTCL": "US $21.63",
      "pk": "TradeBook-6x9-SoftCoverWireo-StandardMatte"
    },
    "[new_product_id_3]": {
      "TSTCL": "US $23.67",
      "pk": "TradeBook-8x10-SoftCoverWireo-StandardMatte"
    }
  }
}
```

## Summary

The `actionPrices` method will automatically handle the new cover type once we:

1. Add Product records with `equivalentCover = "softcover_wireo"`
2. Link them to appropriate paper types
3. Update the pricing data source to include softcover_wireo
4. Ensure the size/paper combinations match between database and JSON
