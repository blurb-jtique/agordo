Bookwizard
==========
https://github.com/blurb/bookwizard

Book file storage (the images and book files themselves), communications with Printtalk printers
Bookwizard is a Java service built using the dropwizard framework (Jetty Server, Hibernate as ORM, Jersey for REST and Jackson for JSON) to support the following 3 functions:

1. Centralize the Book Dimension data needed by other services like Bookserve and BookWright.
2. Support all Ingram (also known as Lightning Source Integration - LSI) related communication. - ISBN content submission
3. Printer communication for EDI orders.

*Electronic Data Integration (EDI) refers to a series of batch processes used for order management, particularly in the context of placing orders with Ingram. The EDI process involves three main steps: sending a Purchase Order to Ingram, fetching a Purchase Order Acknowledgement, and obtaining shipping notifications. This communication occurs through an FTP endpoint, utilizing fixed-width file formats to ensure compatibility and efficiency in order management.*

Depends on: Java 7, Dropwizard, Hibernate, maven

When an order is placed, blurby calls either BookWizard' RESTful api place_order or BookServe' SOAP api PlaceOrderForBlurby. BookWizard handles trade books while bookserve handles photobooks and magazines.