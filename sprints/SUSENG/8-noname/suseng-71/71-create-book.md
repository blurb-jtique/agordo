# Create book from Blurby to Bookserve

## Complete Process Flow - AddBook.addToBookServe

### 1. **Database Session Initialization & Statistics**

```java
Statistics stats = HibernateUtil.getSessionFactory().getStatistics();
```

- Initializes Hibernate session factory for database operations
- Logs detailed database statistics (connections, transactions, queries, etc.)
- Creates DAO objects for `PublishedBook` and `CoverDesign` tables

### 2. **Object Creation & Photo Print Detection**

```java
PublishedBook book = new PublishedBook();
CoverDesign coverDesign = new CoverDesign();
boolean isPhotoPrint = isPhotoPrint(bookDataMap);
```

- Creates new database entity objects
- Determines if this is a photo print product (different from regular books)
- Sets asset collection ID for non-photo prints

### 3. **Book Metadata Building**

```java
book = buildBookFromMetaData(book, bookDataMap, isPhotoPrint);
```

The `buildBookFromMetaData` method maps all parameters to the `PublishedBook` object:

- **Basic Info**: title, subtitle, author, client GUID
- **Technical**: page count, book size, client version, creation source
- **Color Settings**: `isColor` → `setColor()` (paper color: white/colored)
- **Branding**: custom logo setting (0=Blurb logo, 1=custom logo)
- **Timestamps**: creation and last modified dates
- **Status**: sets initial upload status to `BOOK_NOT_UPLOADED`

### 4. **Client Version Validation**

```java
if (!isPDF(bookDataMap) && notSupportedClient(book, ...)) {
    return Util.status(UNSUPPORTED_VERSION, ...);
}
```

- Checks if client version is supported (for non-PDF uploads)
- PDF uploads bypass version checking
- Sends upgrade notification email if version is too old

### 5. **Page Count Validation**

```java
if (!isPhotoPrint && book.getPageCount() % 2 != 0) {
    return Util.status(CORRUPT_BOOK, "Odd Number of Pages", false);
}
```

- Ensures even number of pages (books are printed in signatures)
- Photo prints are exempt from this rule

### 6. **Duplicate/Incomplete Book Handling**

```java
PublishedBook oldIncompleteInstance = bookDao.getIncompleteBookByClientGUID(book.getClientGUID());
```

**Two scenarios:**

- **New Book**: Saves the book using `bookDao.saveInSteps(book)`
- **Existing Incomplete**: Updates existing incomplete upload using `copyAndUpdateBookFromOtherBook()`

### 7. **Cover Design Creation**

```java
if(!isPhotoPrint) {
    coverDesignDao.saveInSteps(book.getBookGUID(), coverDesign);
}
```

- Creates cover design record (only for regular books, not photo prints)
- Links cover design to the book via book GUID

### 8. **File System Setup**

```java
boolean created = book.getTempBookFolder().mkdirs();
```

- Creates temporary directory structure for book files
- This is where uploaded content will be stored during processing

### 9. **Response Generation**

```java
return Util.status(SUCCESS, book.getBookGUID(), coverDesignGuid, ...);
```

Returns success response containing:

- **Book GUID**: Unique identifier for the book
- **Cover Design GUID**: Unique identifier for cover design
- **Client compatibility info**: Whether client needs updates

## For Your Specific Parameters

With your notebook parameters:

```
{"title"=>"Notebook 3f9a7e6b1c4d80e2", "pageCount"=>72, "customlogo"=>0, "isColor"=>"0", ...}
```

The method will:

1. Create a `PublishedBook` with 72 pages, white paper, Blurb logo
2. Skip version validation (PDF source)
3. Validate 72 pages (even number ✓)
4. Create new book record (assuming no incomplete duplicate)
5. Create cover design with Blurb branding
6. Set up temp folder for the 72-page content
7. Return book and cover design GUIDs for the upload process

## Performance Tracking

The method extensively tracks timing for:

- Session initialization
- Metadata building
- Database operations
- File system operations

This creates a complete book record ready for content upload in the next phase of the process.
