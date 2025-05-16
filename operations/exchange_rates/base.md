# Exchange rate update

To know in depth about the process follow this guide https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1572992/Update+Exchange+Rates

## Tickets

### Update the web-tests on both Master & Integration

Step-by-step guide: Jenkins job to update exchange rates in Blurby

Master & Integration

Get the new .csv file of exchange rates from Finance (here is an example file)
Notify everyone on the Slack #master-integration channel prior to running the job
Wait until the end of the workday to kick off the Jenkins job - it slows down web-tests and therefore the blurby pipeline
Log in to Jenkins and go to: http://jenkins.blurb.com/job/blurby-update-exchange-rates/
Click 'Build with Parameters' - select your environment from the dropdown and select the csv file
Let it run (possibly overnight) - it eats up a lot of memory and a ton of river jobs, which slows down the ability to run web-tests, etc.
Check back that it ran successfully
Update the web-tests (see below) and link the web-test PR in the #master-integration Slack channel
Make sure this runs on both Master & Integration
Update the web tests

When we update exchange rates on master and integration we need to update some web tests since they have some hard-coded values. The web tests places to update are as follows:
get_exchange_rate_from_usd_to_other_currency
get_exchange_rate_from_other_currency_to_usd
DISTRIBUTOR_FEE_BY_LOCALE