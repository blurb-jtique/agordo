# Important Agreements and Processes Executed - Go Big

## Pricing Update

### Pricing Update Process from Admin Tools

Pricing updates in Blurby are managed through AdminTools using CSV files that update three main components simultaneously:

1. **Base Pricing**
2. **Page Pricing**
3. **Markup Pricing**

Reference CSV examples can be found in the `db/data/reference/pricing/` directory.

#### Sample CSV Format Examples

**Base Pricing CSV**
```csv
cover_type,product_type,product_dimension,paper_type,api_key,currency_id,price
Hardcover,Products::ChickenSoupBook,square,PremiumGlossPaper,,AUD,4595
Hardcover,Products::ChickenSoupBook,square,PremiumGlossPaper,,CAD,4595
...
```

**Page Pricing CSV**
```csv
paper_type,product_type,low_page_count,high_page_count,product_dimension,api_key,currency_id,fractional_cents
EconomyTradeBWCreamMattePaper,Products::TradeBook,0,24,pocket_text,,AUD,0
EconomyTradeBWCreamMattePaper,Products::TradeBook,0,24,pocket_text,,CAD,0
...
```

**Markup Pricing CSV**
```csv
markup_type,api_key,currency_id,markup_value
Custom Logo,,AUD,0.25
Custom Logo,,CAD,0.25
...
```

#### Implementation Details

The import process is handled by `lib/pricing_changes/price_change.rb`. Note that this process replaces all existing pricing records in the database with the data from the CSV files, which requires careful validation of the input data.

### Pricing Update Process from DB Migration

Another approach to update pricing is through database migrations. This process can support individual updates to each DB table. Below is how to perform updates for both base prices and page prices.

#### Step 1: Extract Current Pricing Data

First, extract the information from the database using these SQL queries:

For base prices export:

```SQL
SELECT
  bp.id,
  co.name AS cover_type,
  bp.product_type,
  pd.description_i18n_key AS product_dimension,
  po.name AS paper_type,
  ak.name AS api_key,
  bp.currency_id,
  bp.price
FROM blurby.base_prices bp
JOIN blurby.product_options co ON bp.cover_type_id = co.id
JOIN blurby.product_dimensions pd ON bp.product_dimension_id = pd.id
JOIN blurby.product_options po ON bp.paper_type_id = po.id
LEFT JOIN blurby.api_keys ak ON bp.api_key_id = ak.id;
```

For page prices export:

```SQL
SELECT
  pp.id,
  po.name AS paper_type,
  pp.product_type,
  pp.low_page_count,
  pp.high_page_count,
  pd.description_i18n_key AS product_dimension,
  ak.name AS api_key,
  pp.currency_id,
  pp.fractional_cents
FROM blurby.page_prices pp
JOIN blurby.product_options po ON pp.paper_type_id = po.id
JOIN blurby.product_dimensions pd ON pp.product_dimension_id = pd.id
LEFT JOIN blurby.api_keys ak ON pp.api_key_id = ak.id;
```

#### Step 2: Creating and Executing Migration Scripts

After exporting the current pricing records, use this project here and follow these steps to create migration scripts:

1. **Duplicate the Original Records** - Keep a copy of the original data for backup and rollback purposes
2. **Make Currency Updates** - Modify the USD currency values for the records you want to update
3. **Generate Migration Scripts** - Use the pricing updater project to automatically create update and rollback SQL scripts

The pricing updater project has the following structure:

```
├── Gemfile
├── README.md
├── pricing_updater.rb
├── data/
│   ├── exchanges_rates.csv
│   ├── updates/
│   │   ├── pricing_updates - base_prices_master.csv
│   │   ├── pricing_updates - base_prices_integration.csv
│   │   ├── pricing_updates - base_prices_production.csv
│   │   ├── pricing_updates - page_prices_master.csv
│   │   ├── pricing_updates - page_prices_integration.csv
│   │   └── pricing_updates - page_prices_production.csv
│   ├── root/
│   │   ├── blurb_master_base_prices.csv
│   │   ├── blurb_integration_base_prices.csv
│   │   ├── blurb_production_base_prices.csv
│   │   ├── blurb_master_page_prices.csv
│   │   ├── blurb_integration_page_prices.csv
│   │   └── blurb_production_page_prices.csv
│   └── sql/ (generated output)
│       └── rollback/ (rollback scripts)
```

The generated SQL scripts in the `sql/` directory can be executed to apply the pricing updates, while the rollback scripts provide a safety mechanism to revert changes if needed.

## Printer API Integration Examples

Below are example requests for interacting with the printer service in Blurby:

### Get All Active Printers

```
GET https://pdx-printer-management-service-master.vip.blurb.com/printer-management-service/admin/printer?includeInactive=false
```

### Retrieve Printer by ID

```
GET https://pdx-printer-management-service-master.vip.blurb.com/printer-management-service/admin/printer/2
```

### Find Printer Based on Capacity Requirements

```
POST http://pdx-printer-management-service-prod.vip.blurb.com/printer-management-service/printer
```

Request body:
```json
{
  "jobs": [
  {
    "printSpec": {
    "bookTrim": "6x9",
    "cover": "softcover",
    "paperType": "70#-trade-white",
    "bindType": "wireobound",
    "linen": null,
    "endsheet": null,
    "coverPaperType": "90#-uncoated-cover",
    "coverCoatingType": "matte-lam",
    "coverInk": "1-sided-4/0",
    "textInk": "full-color-4/4"
    },
    "printMethod": "pod-indigo",
    "printServices": [],
    "contentCreationSource": "bookwright"
  }
  ],
  "shipToCountry": "us",
  "shipToState": "wa"
}
```

## Decisions and workflow responsibilities

### WireO Binding

### WireO Binding

- Notebooks with softcover were designed to support wire-o binding, with this product type classified as `softcover_wireo` in the system.
- In the Printer service API, the `wireobound` parameter indicates a printer's capability to handle wire-o bindings.
- For paper weight, Blurby uses 90# and 100# for wire-o covers, while Bookserve and UOS actually implement 130# Chorus Art paper, with Bookserve overriding Blurby's specifications when a `softcover_wireo` product is processed.
- Creation tools communicate wire-o binding requirements by specifying `softcover_wireo` as the product type in the JSON payload.
- For pre-flight validation purposes, `softcover_wireo` products follow the same validation rules as regular `softcover` tradebooks/notebooks regarding pages, sizes, and other specifications.
- When generating printtalk files, Bookserve uses the `BindingType` field with a `wireo` suffix to identify these bindings.
- UOS implemented a dedicated SKU format for wire-o products structured as: `BKPH_SCIW_WRO_8.000x10.000IN_130C_MT_40_70T_UNC_44`, which is generated by the XLST translator.

### GWP (Gift With Purchase)

- GWP inherits many behaviors from Swatchkit but was created as a completely different item with its own life cycle.
- GWP allows any product in the Blurby catalog to be offered as a gift; however, the current implementation supports only one gift per order.
- The title, description, and image for GWP are static and override the content of the selected book.
- GWP is identified in UOS using "Gift Product" and "sc_novel_*" markers.
- GWP is added at the cart level and remains visible throughout the order.
- GWP does not affect coupon calculations or participate in their computations.
- GWP is exempt from printer or shipping rules.
- For the Go Big experiment, GWP was implemented as a printed book with sufficient inventory maintained at each UOS facility for insertion during the fulfillment process.

### Laminates

- Laminates utilize the existing `CoatingType` product options, making this feature dynamic.
- Laminate options are available only for StandardBooks (photo books and variants) and Tradebooks (notebooks and variants).
- Configuration of laminates is restricted to the author add-to-cart interface in the dashboard and is not available in the bookstore experience.
- Printer-supported laminate types include `gloss-lam` and `matte-lam`.
- In UOS, laminate specifications use the `FrontCoating` tag in the cover JDF section, with values `Glossy` and `Matte` translating to `GL` and `MT` respectively in the new SKU format.
