**Tax Rate Fields Required from Avatar for 2025 Update**

### **Line Item Types vs. Searchable Columns**
These columns are used to determine the applicable tax rate based on the line item type and location.

#### **POD Line Item**
- **MagazineTaxRate:** `country_code`
- **CountryTaxRate:** `country_code`
- **ReducedCountryTaxRate:** `country_code`
- **US ZipTaxRate:** `zip_code`
- **CA ReducedProvenceTaxRate:** `state_abbrev`
- **CA ProvenceTaxRate:** `state_abbrev`

#### **Digital Line Item**
- **ReducedCountryTaxRate:** `country_code`
- **CountryTaxRate:** `country_code`
- **US ZipTaxRate:** `zip_code`
- **CA ReducedProvenceTaxRate:** `state_abbrev`

#### **Printable Product Line Item**
- **CountryTaxRate:** `country_code`
- **ReducedCountryTaxRate:** `country_code`
- **US ZipTaxRate:** `zip_code`
- **CA ReducedProvenceTaxRate:** `state_abbrev`
- **CA ProvenceTaxRate:** `state_abbrev`

#### **Swatch Line Item**
- **CountryTaxRate:** `country_code`
- **US ZipTaxRate:** `zip_code`
- **CA ProvenceTaxRate:** `state_abbrev`

---

### **Tax Rate Types**
These are the tax rate categories used in Blurby's tax calculations.
- **CountryTaxRate**
- **ReducedCountryTaxRate**
- **MagazineTaxRate**
- **ReducedZipTaxRate**
- **ZipTaxRate**
- **ProvenceTaxRate**
- **ReducedProvenceTaxRate**

---

### **Available Columns per Tax Type**
These are the columns available for determining the tax rate.

#### **Common/Base Columns**
- `type`
- `total_sales_tax`
- `tax_shipping_and_handling_together`
- `created_at`
- `delete_action`
- `display_name`

#### **International Country Columns**
- `country_name`
- `country_code`

#### **Provence Columns (Canada)**
- `state_abbrev`

#### **ZIP Columns (United States)**
- `zip_code`
- `state_abbrev`
- `county_name`
- `county_number`
- `city_name`
- `state_sales_tax`
- `county_sales_tax`
- `city_sales_tax`

#### **Aggregated Default Columns (for Remaining Cases)**
- `country_name`
- `country_code`
- `display_name`
- `zip_code`
- `state_abbrev`

