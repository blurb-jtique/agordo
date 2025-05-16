# Existing material
## Blurby onboarding
**Index of services**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/39092231/Blurb+Overview
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/587726903/Platform+Onboarding+-+Rails
**Legacy architecture**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/26345496/Web+Architecture
**Tech debt risk profiles**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1974501753/Tech+Debt+Risk+Profiles
**Bookserve local environment**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/780042769/Setting+Up+Local+Bookserve+Environment+using+the+docker+Repo
**Bookserve workflows**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/86771570/BookServe+workflows
**Hemingway Requirements for Rewrite**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/2263285842/Hemingway+Requirements+for+Rewrite
**Deploying replacements**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/740491278/Deploying+replacements
**Deploying Front-end Apps**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1573124/Deploying+Front-end+Apps
**Blurby Order, SubOrder, and LineItems State Machine Flow**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/724598808/Blurby+Order+SubOrder+and+LineItems+State+Machine+Flow
**Deploy internal**
https://github.blurb.com/devops/deploy/blob/pdx/bin/blurby-update-tax-rates-postal-codes.sh

## Exchange Rates
[Update Exchange Rates](https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1572992/Update+Exchange+Rates)

## Ingram
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1971847193/Ingram+Error+Code+Reference+for+Content+Submissions
https://blurb-books.atlassian.net/wiki/spaces/OP/pages/22937660/Ingram+LSI
https://blurb-books.atlassian.net/wiki/pages/viewpageattachments.action?pageId=1002570062&preview=%2F1002570062%2F1002570069%2FIngram%20Technical%20and%20Organizational%20Security%20Measures%209-26-18.pdf
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1856045268/Manually+Correct+and+Reimport+Ingram+Sales+Files
https://blurb-books.atlassian.net/browse/PLAT-1086
https://blurb-books.atlassian.net/wiki/pages/viewpageattachments.action?pageId=1002570062&preview=%2F1002570062%2F1000407376%2FIngram%20Client%20DPA%201-2020.pdf
**Bulk Deactivation of Ingram ISBNs in Blurby Database**
https://blurb-books.atlassian.net/wiki/spaces/DEVOPS/pages/3626729479/Bulk+Deactivation+of+Ingram+ISBNs+in+Blurby+Database

## Deployment
**Continuous Delivery / Deployment from Master with PR integration tests - DEPRECATED**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/29458452/Continuous+Delivery+Deployment+from+Master+with+PR+integration+tests+-+DEPRECATED
**Release Process - DEPRECATED**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1572938/Release+Process+-+DEPRECATED


## network troubleshooting
**Vagrant VPN and DNS issues**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1090322436/Running+the+Blurby+Development+Environment+Using+Vagrant
**Hemingway issues with transcompilation**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1467711505/Using+Hemingway+in+Vagrant
## MAC toruble shooting
**Catalina upgrades**
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1579286529/Mac+OS+X+Catalina+Upgrade+Troubleshooting+Guide


# Debugging
ssh "johan.tique"@pdx-core-engjump01.blurb.com # access via LDAP
https://github.blurb.com/devops/deploy/blob/pdx/bin/blurby.sh # access via LDAP

sc.add_category("development", true).add_item("ab546075b564", "/admin/support/base", 'index')

# preparing local test environment
**20250504**

psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test -f 202502121550-blurb_dev.sql
psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test -f db/data/data_for_test.sql

psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test_b -f db/development_structure.sql

psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test_b -f ~/202502180919-blurb_production.sql
psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test_b -f db/data/data_for_test.sql | grep error

## for testing locally utm and postgres 11 - one shot

psql -U postgres
DROP DATABASE blurb_test_b;
psql -U postgres -f ~/11_202505041046-blurb_test_b.sql | grep error

# creating test db

## Mac postgres 11
## postgres 11
psql -p 25432 -d postgres -U postgres
DROP DATABASE blurb_test_b;
CREATE DATABASE blurb_test_b OWNER postgres;

psql -U postgres -f ~/11_202505041046-blurb_test_b.sql | grep error

## postgres 11
psql -h 192.168.64.1 -p 25432 -d postgres -U postgres
DROP DATABASE blurb_test_b;
CREATE DATABASE blurb_test_b OWNER postgres;

psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test_b -f ~/202502191733-blurb_staging.sql
psql -h 192.168.64.1 -p 25432 -U postgres -d blurb_test_b -f db/data/data_for_test.sql | grep error

## postgres 15
psql -h 192.168.64.1 -p 35432 -d postgres -U postgres
DROP DATABASE blurb_test_b;
CREATE DATABASE blurb_test_b OWNER postgres;1

psql -h 192.168.64.1 -p 35432 -U postgres -d 23blurb_test_b -f ~/202502191733-blurb_staging.sql
psql -h 192.168.64.1 -p 35432 -U postgres -d blurb_test_b -f db/data/data_for_test.sql | grep error

# line 341 databases.rake
RAILS_ENV=test bundle exec rake blurby:test:prepare / not needed

# Testing
RAILS_ENV=test bundle exec spec spec/models/pod_line_item_spec.rb

## Debugging

```
ActiveRecord::StatementInvalid in 'PodLineItem sale_settled? should return false if sale is not settled'
PG::NotNullViolation: ERROR:  null value in column "currency_id" violates not-null constraint
DETAIL:  Failing row contains (280, null, 385, 1000, 10, null, NEW, 1000, 0, 0, null, null, null, null, PRINTER_TO_CUSTOMER, null, PodLineItem, null, null, null, 2025-02-22 18:46:32.767318, 2025-02-22 18:46:32.767318, null, null).
: INSERT INTO "line_items" ("sub_order_id", "product_id", "price", "quantity", "ship_tracking_number", "state", "price_usd", "initial_price", "initial_price_usd", "custom_cover_id", "currency_id", "cover_design_id", "guts_id", "production_method", "ebook_id", "line_item_type", "pdf_book_id", "isbn_id", "shipment_notification_queued_on", "created_at", "updated_at", "tax_rate_id", "printable_product_id") VALUES(NULL, 385, 1000, 10, NULL, 'NEW', 1000, 0, 0, NULL, NULL, NULL, NULL, 'PRINTER_TO_CUSTOMER', NULL, 'PodLineItem', NULL, NULL, NULL, '2025-02-22 18:46:32.767318', '2025-02-22 18:46:32.767318', NULL, NULL) RETURNING "id"
```


#########

# Deploying to master
# Deploying to production
# Authorizing the final step

###