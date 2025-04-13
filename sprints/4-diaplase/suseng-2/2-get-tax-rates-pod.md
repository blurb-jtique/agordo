# Get tax rate - print-on-demand product

The tax rate for print-on-demand (POD) products is determined based on the customer's shipping address and the product's classification. The system evaluates multiple factors, including the country, state, and specific tax rules for the product type. This process ensures compliance with regional tax regulations and provides accurate pricing for the customer.

## Workflow Steps

1. **Validate Input Parameters**
    - The system determines the address based on the locale or domain using `RegionalSite.regional_site_for_locale(locale)`. For the pricing calculator, this defaults to an empty address located in the country associated with the specified locale or domain.

2. **Determine Context**
    - For pricing calculations, the query condition ensures that only active tax rates are retrieved, ordered in descending order by their creation date.

3. **Evaluate Product-Specific Tax Rules**
    - If the product is classified as a magazine and the magazine tax rate is applicable, fetch the `MagazineTaxRate` for the country.
    - If the product is a trade book or photo book and the country applies a standard tax rate for such products, fetch the `CountryTaxRate`.

4. **Determine Tax Rate by Country**
   - **United States**: Fetch the `ZipTaxRate` based on the ZIP code (excluding the "plus-four" extension).
   - **Australia**: Fetch the `CountryTaxRate` for the country.
   - **Canada**: Fetch the `ReducedProvenceTaxRate` for the state. If unavailable, fall back to the `ProvenceTaxRate`.
   - **European Union**:
     - If the query is for pricing calculations and the country applies a standard rate (France, Germany, Spain, and Norway), fetch the `CountryTaxRate`.
     - Otherwise, fetch the `ReducedCountryTaxRate`. If unavailable, fall back to the `CountryTaxRate`.
   - **Other Countries**: Fetch the `ReducedCountryTaxRate`. If unavailable, fall back to the `CountryTaxRate`.

5. **Fallback to Zero Tax Rate**
   - If no applicable tax rate is found, default to the `ZeroTaxRate`.

## Example Scenarios

1. **United States & Canada**
    - In pricing calculator, it is unable to compute taxes due to insufficient information for determining the required tax location granularity.

2. **European Union**
    - A customer in Germany purchasing a trade book:
      - The system checks if Germany applies a standard tax rate for trade books.
      - If so, it fetches the `CountryTaxRate`. Otherwise, it fetches the `ReducedCountryTaxRate`.

3. **Fallback**
    - A customer in a country with no specific tax rules:
      - The system fetches the `ReducedCountryTaxRate`. If unavailable, it defaults to the `CountryTaxRate`.
      - If no rates are found, the tax rate defaults to zero.

**Note:** All tax rates referenced in this document are stored in the `tax_rates` table. This table is regularly updated and managed through the [Admin Tools](https://www.blurb.com/admin/tax_rates).

## SQL Queries

The following queries illustrate how tax rates are fetched based on the conditions:

- **Fetch ZIP Tax Rate (United States)**:

  ```sql
  SELECT *
  FROM zip_tax_rates
  WHERE zip_code = '90210' AND created_at <= 'order_created_at' AND (deleted_at IS NULL OR deleted_at >= 'order_created_at')
  ORDER BY created_at DESC
  LIMIT 1;
  ```

- **Fetch Reduced Provence Tax Rate (Canada)**:

  ```sql
  SELECT *
  FROM reduced_provence_tax_rates
  WHERE state_abbrev = 'ON' AND created_at <= 'order_created_at' AND (deleted_at IS NULL OR deleted_at >= 'order_created_at')
  ORDER BY created_at DESC
  LIMIT 1;
  ```

- **Fetch Country Tax Rate (European Union)**:

  ```sql
  SELECT *
  FROM country_tax_rates
  WHERE country_code = 'DE' AND created_at <= 'order_created_at' AND (deleted_at IS NULL OR deleted_at >= 'order_created_at')
  ORDER BY created_at DESC
  LIMIT 1;
  ```