Blurby Overview
===============
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/39092231/Blurb+Overview
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/90677112/Blurby
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/587726903/Platform+Onboarding+-+Rails

# Context
- **Blurby**
Blurby is the legacy Rails 2 monolithic application that represents the bulk of the www.blurb.com web experience. Blurby is where customer-facing microservice integrations are placed. It is largely maintained by the Rails side of the Platform team and serves both Platform and Web Teams.
This is the first and **main app** that runs the www.blurb.com website. Currently handles order processing and checkout, bookstore pages, user-specific pages (dashboard and author profile) and seller settings (APIs).

- **River**
River is our background job scheduler. It handles job creation requests from the application machines and job assignment requests from the backend worker machines. It is a Tomcat web-service with a Redis backend.

- **Legacy Applications**
These are written in Java and serve as the backend communications between Blurb and our printers (who handle the physical part of printing and shipping the book). All orders, both from Blurb users and from our print partners, are eventually routed to Bookserve or Bookwizard.
  - Bookserve – Book file storage (the images and book files themselves), communications with Printtalk printers
  - Bookwizard – ISBN content submission, communications with EDI printers
  - Portkey – File transport from the customer's computer to Blurb's file storage

# Creation Tools
## Desktop Clients
- Booksmart (Java)
- Bookwright (C++, Qt)
## 3rd Party Desktop Clients
- Lightroom 4,5,6 - Built in to the base application. Used by mostly amatuer and pro photographers.
- Indesign Plugin - Our most professional integration.
- Photoshop Plugin
## Browser
- ~~Bookify - DEAD (Flex/Flash)~~
- PDF Uploader 3.0 (HTML5/js) - Upload a PDF from any source! Easy to convert Word files to fit this.
  - Calls Blurby API, Bookserve Uploader, Portkey Blob, queues a Job on River that is picked up by
- MagCloud uploader
- emachine
- webbuilder
## Mobile
- ~~Samsung (Galaxy S4-S5) - 3rd Party checkout via Blurb. Uses Bookify renderer.~~
- ~~MagCloud app - retired~~
- iOS Blurb Mobile (Stories)
- ~~iOS  (Stories + Print)~~
- ~~Blurb Mobile (2016)~~

# Platform
## Blurby (Ruby 1.9, Rails 2, Passenger)
- **TODO: define all the workflows implied in Blurby**
- API Handles auth, users, books, and other user objects via ActiveRecord in the DB
- Worker - Processes jobs off river queue.
## Bookserve (Tomcat 6, Java 7, Maven, Apache) - Workflows
- **Core - Handles book, printer communication (PrintTalk)**
- Uploader - Upload of book assets for Booksmart as well as creates book upload objects for the other desktop tools (Booksmart)
- Renderer - Renders books into covers and guts PDFs.
- PdfWorkflow - Does pdf transformation to make books ready for print.
- Bookshow - Renders split book assets into preview images for frontend
- Java worker - Processes certain jobs off the river queue.
- ~~Printserve (Nginx) - Host to expose book files to printers and CS. CNAME TO Bookserve apache~~
## Bookwizard (Dropwizard Framework, Jetty, Java 7, Maven)
- Book_size API
- Ingram communication (Content Submission, EDI ordering workflow) (Could be split into microservices in the future)
## Portkey (Tomcat 6, Java 7, Maven, Amazon S3) - Photo, Media, and Blob upload. (Bookwright, Bookify, Mobile, Ebook)
## River (Tomcat 6, Java 7, Redis, Maven) - Work queue management.
## Microservices (Tomcat 8, Java 8, Gradle)
SLC services hosts
Feature-Service
Shipping-Service
Email-Service
Payment-Service
Printer-Management-Service
Tax-Service
Metrics-Service
Auth-Service
TODO: Fill in new services
AWS (Elastic Beanstalk with individual Postgres DBs)
Upload-Service (PDF Uploader 3, API partners (Buzzfeed etc))
PDF-Processing-Service
Web:
Website (HTML5, React)
Adhoc (HTML5, React)

## Frontend:
Blurby (Ruby 1.9, Rails 2, Passenger)(again) - Anything account or ecom related
Website & AdHoc (Nginx) - Static web pages.
Bookshare (HTML5/js/etc) - replacement for Bookshow run bookshow servers
Hemingway (HTML5/EmberJS/etc) - App for setting books up for sale or distribution
Dashboard (HTML5/React)
FrontEndSpas - For all (eventually) of blurb's frontend single page apps
Pricing - React app that shows users our prices
Buildkit - Blurb look and feel and handles responsiveness
ReactKit - React components for look and feel

## Database:
Main Database
Postgres (9.2)
Reports Database (eventlogger data going into archive01)
Postgres (9.4)
Redis
Drupal
MySQL (Percona Server 5.5)
Wordpress (blog)
MySQL (Percona Server 5.5)
Analytics
Vertica (datawarehouse)
source for microstrategy and tableau
Postgres (ctevents, visitation)

Other:
Booksmartdump/Crashreports - Takes stack traces and posts them to eventlogger as a json document store in postgres
Eventlogger - Takes events and throws them into a postgres DB.