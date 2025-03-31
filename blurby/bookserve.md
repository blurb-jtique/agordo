Bookserve
=========
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1573083/Bookserve
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/86771570/BookServe+workflows
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/1573103/How+to+-+For+Bookserve+and+Bookwizard
https://blurb-books.atlassian.net/wiki/spaces/TEC/pages/746029090/BookServe+Setup

In a nutshell, bookserve is everything between Blurb and our Printers. The bookserve repository contains multiple projects supporting the daily operation of our company. This includes book upload, preflight, pdf processing, order management and administration, printer integration, alerts and more.
It also is in charge if book file storage (the images and book files themselves), communications with Printtalk printers

# Java Project

## AddBookServlet
The `AddBookServlet` class is a Java Servlet that handles HTTP requests to add book metadata to a book serving system.

Here's a breakdown of what the class does:

*   **Extends `HttpServlet`:** This indicates that it's a servlet designed to handle HTTP requests.
*   **`init()` and `destroy()`:** These methods are lifecycle methods for the servlet. `init()` is called when the servlet is initialized, and `destroy()` is called when the servlet is taken out of service. They log messages to indicate when these events occur.
*   **`doGet()`:** This method handles HTTP GET requests. It simply calls the `doPost()` method to handle the request.
*   **`doPost()`:** This method handles HTTP POST requests. It's the core of the servlet and performs the following steps:
    *   It retrieves book metadata from the request parameters using the `retrieveMetaData()` method.
    *   It calls the `AddBook.addToBookServe()` method to add the book to the book serving system.
    *   It determines if the book creation source is PDF or JPEG.
    *   It sets the response content type to "text/plain".
    *   It sends a response to the client, either by writing a JSON response to the output stream or by setting the response status code and message.
    *   It logs the execution time of the servlet.
*   **`retrieveMetaData()`:** This method retrieves book metadata from the request parameters and stores it in a `Map`. It iterates over a predefined set of parameters (e.g., `AUTHOR`, `TITLE`, `PAGE_COUNT`) and retrieves their values from the request.
*   **`returnResp()`:** This method creates a `JSONObject` containing the book GUID and cover design GUID.
*   **`isPdfOrJpegCreationSource()`:** This method checks if the book creation source is PDF or JPEG.

In summary, the `AddBookServlet` class receives HTTP requests containing book metadata, processes the metadata, adds the book to a book serving system, and sends a response to the client.
The `AddBookServlet` class is a Java Servlet that handles HTTP requests to add book metadata to a book serving system.

Here's a breakdown of what the class does:

*   **Extends `HttpServlet`:** This indicates that it's a servlet designed to handle HTTP requests.
*   **`init()` and `destroy()`:** These methods are lifecycle methods for the servlet. `init()` is called when the servlet is initialized, and `destroy()` is called when the servlet is taken out of service. They log messages to indicate when these events occur.
*   **`doGet()`:** This method handles HTTP GET requests. It simply calls the `doPost()` method to handle the request.
*   **`doPost()`:** This method handles HTTP POST requests. It's the core of the servlet and performs the following steps:
    *   It retrieves book metadata from the request parameters using the `retrieveMetaData()` method.
    *   It calls the `AddBook.addToBookServe()` method to add the book to the book serving system.
    *   It determines if the book creation source is PDF or JPEG.
    *   It sets the response content type to "text/plain".
    *   It sends a response to the client, either by writing a JSON response to the output stream or by setting the response status code and message.
    *   It logs the execution time of the servlet.
*   **`retrieveMetaData()`:** This method retrieves book metadata from the request parameters and stores it in a `Map`. It iterates over a predefined set of parameters (e.g., `AUTHOR`, `TITLE`, `PAGE_COUNT`) and retrieves their values from the request.
*   **`returnResp()`:** This method creates a `JSONObject` containing the book GUID and cover design GUID.
*   **`isPdfOrJpegCreationSource()`:** This method checks if the book creation source is PDF or JPEG.

In summary, the `AddBookServlet` class receives HTTP requests containing book metadata, processes the metadata, adds the book to a book serving system, and sends a response to the client.