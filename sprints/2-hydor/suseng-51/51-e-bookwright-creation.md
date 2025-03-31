Photobook creation with web editor
=================================

PhotoBook zzMzcyMTY

# index page
## getUserProjectsJSON
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/getUserProjectsJSON?forLibrary=true
Accept: application/json, text/plain, */*
```
### Response
```json
[{
    "pk": 19915,
    "title": "Gamma Photobook zzMTk5MTU",
    "imageCount": 10,
    "shareID": "5a23478b-8043-4320-9b2a-429275ded9c3",
    "projectType": 0,
    "projectSubType": 0,
    "projectSubTypeName": "Photo Book",
    "projectSize": "5x5",
    "creationTimestamp": "2024-12-23T15:00:52+00:00",
    "modificationTimestamp": "2025-03-13T11:21:55+00:00",
    "projectXMLVersion": 101,
    "pageCount": 20,
    "clientID": 19915,
    "themePK": "                                    ",
    "thumbnailURL": "https:\/\/webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com\/15\/199\/19915\/09d6a009b802d2587e19f2b43deb2128.jpg",
    "productPK": "PhotoBook-5x5-SoftCover-Premium",
    "renderJobs": [{
        "pk": 15445,
        "createdAt": "2025-03-13T11:21:55+00:00",
        "status": "C"
    }]
}, {
    "pk": 36907,
    "title": "Photobook zz2MzY5MDc",
    "imageCount": 0,
    "shareID": "01480cd5-a39b-43da-b483-696372278801",
    "projectType": 0,
    "projectSubType": 0,
    "projectSubTypeName": "Photo Book",
    "projectSize": "7x7",
    "creationTimestamp": "2025-03-14T14:06:25+00:00",
    "modificationTimestamp": "2025-03-14T14:10:20+00:00",
    "projectXMLVersion": 101,
    "pageCount": 20,
    "clientID": 36907,
    "themePK": "                                    ",
    "thumbnailURL": "https:\/\/webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com\/07\/369\/36907\/d8a6a4e18c0eff7f73f08ad79a04977c.jpg",
    "productPK": "PhotoBook-7x7-ImageWrap-Premium",
    "renderJobs": [{
        "pk": 15553,
        "createdAt": "2025-03-14T14:10:20+00:00",
        "status": "C"
    }]
}, {
    "pk": 36557,
    "title": "Beta Photobook",
    "imageCount": 125,
    "shareID": "6f0e12ef-9e37-4f16-b922-3b03bd252e3e",
    "projectType": 0,
    "projectSubType": 0,
    "projectSubTypeName": "Photo Book",
    "projectSize": "8x10",
    "creationTimestamp": "2025-03-12T20:35:33+00:00",
    "modificationTimestamp": "2025-03-14T16:00:54+00:00",
    "projectXMLVersion": 101,
    "pageCount": 24,
    "clientID": 36557,
    "themePK": "                                    ",
    "thumbnailURL": "https:\/\/webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com\/57\/365\/36557\/c9329f65c34a5d57a4b2b8956e889705.jpg",
    "productPK": "PhotoBook-8x10-ImageWrap-ProLine",
    "renderJobs": [{
        "pk": 15562,
        "createdAt": "2025-03-14T16:00:54+00:00",
        "status": "C"
    }]
}, {
    "pk": 18752,
    "title": "Photo Book 5x5 12\/18\/24",
    "imageCount": 0,
    "shareID": "4782bda6-cce6-4e3e-8e33-d602b7920467",
    "projectType": 0,
    "projectSubType": 0,
    "projectSubTypeName": "Photo Book",
    "projectSize": "5x5",
    "creationTimestamp": "2024-12-18T15:14:22+00:00",
    "modificationTimestamp": "2024-12-23T14:50:31+00:00",
    "projectXMLVersion": 101,
    "pageCount": 20,
    "clientID": 18752,
    "themePK": "                                    ",
    "thumbnailURL": "https:\/\/webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com\/52\/187\/18752\/51d4df5f01f5da121c93a49c6367022d.jpg",
    "productPK": "PhotoBook-5x5-SoftCover-Premium"
}, {
    "pk": 18751,
    "title": "Photo Book 5x5 12\/18\/24",
    "imageCount": 0,
    "shareID": "ab7bee82-6e17-45ca-a4c1-8a2b7e5fc942",
    "projectType": 0,
    "projectSubType": 0,
    "projectSubTypeName": "Photo Book",
    "projectSize": "5x5",
    "creationTimestamp": "2024-12-18T15:14:20+00:00",
    "modificationTimestamp": "2025-03-13T11:06:06+00:00",
    "projectXMLVersion": 101,
    "pageCount": 20,
    "clientID": 18751,
    "themePK": "                                    ",
    "thumbnailURL": "https:\/\/webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com\/51\/187\/18751\/6be477ddb33ece7ea6cb12f4953951eb.jpg",
    "productPK": "PhotoBook-5x5-SoftCover-Premium"
}]
```
# Create a project
## prices
The `actionPrices` method returns pricing data based on the number of pages and book type. It does so by:

1. **Fetching Price Data:**
   It calls `BlurbyAPI::getPrices` twice—once normally and once with logo upgrade enabled—to get pricing arrays for the given pages and book type.

2. **Retrieving Product Mapping:**
   It runs a SQL query (using Yii’s `dbLegacy` connection) to obtain a mapping of products and their paper types. This query returns each product’s identifier, enabled status, paper type, and two concatenated fields (`size_paper` and `size_paper_2`) that are later used for matching.

3. **Mapping Prices to Products:**
   For the base pricing data:
   - It loops through the prices for the specified book type.
   - For each cover_type and size (keyed by a size_paper string), it finds matching items in the product mapping where either concatenated size matches and the cover type matches (`equivalentCover`).
   - In case exactly one match is found, it builds an associative array (`$bookResults`) keyed by product ID where each paper type gets its price (or empty if the product is not enabled) and the product’s primary key is stored.

4. **Mapping Logo Upgrade Prices:**
   The same procedure is repeated for the logo upgrade pricing data, populating a separate array (`$bookResults_LogoUpgrade`).

5. **Processing Additional Pages:**
   It then processes additional pages pricing (contained in the `additional_pages` element of the prices array) by matching the size value with the product mapping. If a match is found, the additional page pricing is mapped by product and paper type; otherwise the size value itself is used as a key.

6. **Returning JSON:**
   Finally, it assembles a result array containing:
   - `'books'` (the regular pricing per product),
   - `'books_with_logo_upgrade'` (pricing when the logo upgrade is enabled),
   - `'additional_pages'` (additional page pricing), and
   - `'product_options'` (other price options from the original prices array).

   It then sets the appropriate headers and outputs the result as JSON.

This action essentially translates raw pricing data from the Blurby API and the database into a structured format keyed by product information for use in the front end or further processing.
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/zoomUtils/prices?pages=20&book_type=photo_books
Accept: */*
Accept-Encoding: gzip, deflate, br
```
### Reponse
```json
{
    "books": {
        "0": {
            "PPRLS": "US $12.00",
            "pk": "PhotoBook-5x5-SoftCover-Premium"
        },
        "1": {
            "PPRMT": "US $36.00",
            "pk": "PhotoBook-7x7-DustJacket-Premium",
            "PPRLS": "US $36.00"
        },
        "2": {
            "PMEGG": "US $42.00",
            "pk": "PhotoBook-7x7-DustJacket-ProLine",
            "PMPRL": "US $48.00"
        },
        "3": {
            "PHSTD": "US $32.00",
            "pk": "PhotoBook-7x7-DustJacket-Standard"
        },
        "4": {
            "PPRMT": "US $37.00",
            "pk": "PhotoBook-7x7-ImageWrap-Premium",
            "PPRLS": "US $37.00"
        },
        "5": {
            "PMEGG": "US $46.00",
            "pk": "PhotoBook-7x7-ImageWrap-ProLine",
            "PMPRL": "US $50.00"
        },
        "6": {
            "PHSTD": "US $32.00",
            "pk": "PhotoBook-7x7-ImageWrap-Standard"
        },
        "7": {
            "PPRMT": "US $22.00",
            "pk": "PhotoBook-7x7-SoftCover-Premium",
            "PPRLS": "US $22.00"
        },
        "8": {
            "PMEGG": "US $25.00",
            "pk": "PhotoBook-7x7-SoftCover-ProLine",
            "PMPRL": "US $26.00"
        },
        "9": {
            "PHSTD": "US $17.00",
            "pk": "PhotoBook-7x7-SoftCover-Standard"
        },
        "10": {
            "PPRMT": "US $42.00",
            "pk": "PhotoBook-8x10-DustJacket-Premium",
            "PPRLS": "US $42.00"
        },
        "11": {
            "PMEGG": "US $51.00",
            "pk": "PhotoBook-8x10-DustJacket-ProLine",
            "PMPRL": "US $58.00"
        },
        "12": {
            "PHSTD": "US $38.00",
            "pk": "PhotoBook-8x10-DustJacket-Standard"
        },
        "13": {
            "PPRMT": "US $46.00",
            "pk": "PhotoBook-8x10-ImageWrap-Premium",
            "PPRLS": "US $46.00"
        },
        "14": {
            "PMEGG": "US $53.00",
            "pk": "PhotoBook-8x10-ImageWrap-ProLine",
            "PMPRL": "US $60.00"
        },
        "15": {
            "PHSTD": "US $41.00",
            "pk": "PhotoBook-8x10-ImageWrap-Standard"
        },
        "16": {
            "PPRMT": "US $29.00",
            "pk": "PhotoBook-8x10-SoftCover-Premium",
            "PPRLS": "US $29.00"
        },
        "17": {
            "PMEGG": "US $32.00",
            "pk": "PhotoBook-8x10-SoftCover-ProLine",
            "PMPRL": "US $37.00"
        },
        "18": {
            "PHSTD": "US $24.00",
            "pk": "PhotoBook-8x10-SoftCover-Standard"
        },
        "19": {
            "PPRMT": "US $42.00",
            "pk": "PhotoBook-10x8-DustJacket-Premium",
            "PPRLS": "US $42.00"
        },
        "20": {
            "PMEGG": "US $51.00",
            "pk": "PhotoBook-10x8-DustJacket-ProLine",
            "PMPRL": "US $58.00"
        },
        "21": {
            "PHSTD": "US $38.00",
            "pk": "PhotoBook-10x8-DustJacket-Standard"
        },
        "22": {
            "PPRMT": "US $46.00",
            "pk": "PhotoBook-10x8-ImageWrap-Premium",
            "PPRLS": "US $46.00"
        },
        "23": {
            "PMEGG": "US $53.00",
            "pk": "PhotoBook-10x8-ImageWrap-ProLine",
            "PMPRL": "US $60.00"
        },
        "24": {
            "PHSTD": "US $41.00",
            "pk": "PhotoBook-10x8-ImageWrap-Standard"
        },
        "25": {
            "PPRMT": "US $29.00",
            "pk": "PhotoBook-10x8-SoftCover-Premium",
            "PPRLS": "US $29.00"
        },
        "26": {
            "PMEGG": "US $32.00",
            "pk": "PhotoBook-10x8-SoftCover-ProLine",
            "PMPRL": "US $37.00"
        },
        "27": {
            "PHSTD": "US $24.00",
            "pk": "PhotoBook-10x8-SoftCover-Standard"
        },
        "28": {
            "PPRMT": "US $70.00",
            "pk": "PhotoBook-12x12-DustJacket-Premium",
            "PPRLS": "US $70.00"
        },
        "29": {
            "PMEGG": "US $85.00",
            "pk": "PhotoBook-12x12-DustJacket-ProLine",
            "PMPRL": "US $94.00"
        },
        "30": {
            "PHSTD": "US $64.00",
            "pk": "PhotoBook-12x12-DustJacket-Standard"
        },
        "31": {
            "PPRMT": "US $74.00",
            "pk": "PhotoBook-12x12-ImageWrap-Premium",
            "PPRLS": "US $74.00"
        },
        "32": {
            "PMEGG": "US $88.00",
            "pk": "PhotoBook-12x12-ImageWrap-ProLine",
            "PMPRL": "US $95.00"
        },
        "33": {
            "PHSTD": "US $67.00",
            "pk": "PhotoBook-12x12-ImageWrap-Standard"
        },
        "34": {
            "PPRMT": "US $74.00",
            "pk": "PhotoBook-13x11-DustJacket-Premium",
            "PPRLS": "US $74.00"
        },
        "35": {
            "PMEGG": "US $88.00",
            "pk": "PhotoBook-13x11-DustJacket-ProLine",
            "PMPRL": "US $95.00"
        },
        "36": {
            "PHSTD": "US $68.00",
            "pk": "PhotoBook-13x11-DustJacket-Standard"
        },
        "37": {
            "PPRMT": "US $78.00",
            "pk": "PhotoBook-13x11-ImageWrap-Premium",
            "PPRLS": "US $78.00"
        },
        "38": {
            "PMEGG": "US $91.00",
            "pk": "PhotoBook-13x11-ImageWrap-ProLine",
            "PMPRL": "US $101.00"
        },
        "39": {
            "PHSTD": "US $70.00",
            "pk": "PhotoBook-13x11-ImageWrap-Standard"
        },
        "40": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-Premium"
        },
        "41": {
            "LFPRL": "US $101.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProPhoto"
        },
        "42": {
            "LFEGG": "US $79.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProUncoated"
        },
        "43": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-Premium"
        },
        "44": {
            "LFPRL": "US $117.00",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProPhoto"
        },
        "45": {
            "LFEGG": "US $101.00",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProUncoated"
        },
        "46": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-Premium"
        },
        "47": {
            "LFPRL": "US $117.00",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProPhoto"
        },
        "48": {
            "LFEGG": "US $101.00",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProUncoated"
        },
        "49": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-Premium"
        },
        "50": {
            "LFPRL": "US $159.00",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProPhoto"
        },
        "51": {
            "LFEGG": "US $148.00",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProUncoated"
        },
        "52": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-Premium"
        },
        "53": {
            "LFPRL": "US $170.00",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProPhoto"
        },
        "54": {
            "LFEGG": "US $159.00",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProUncoated"
        }
    },
    "books_with_logo_upgrade": {
        "0": {
            "PPRLS": "US $15.00",
            "pk": "PhotoBook-5x5-SoftCover-Premium"
        },
        "1": {
            "PPRMT": "US $44.00",
            "pk": "PhotoBook-7x7-DustJacket-Premium",
            "PPRLS": "US $44.00"
        },
        "2": {
            "PMEGG": "US $50.00",
            "pk": "PhotoBook-7x7-DustJacket-ProLine",
            "PMPRL": "US $56.00"
        },
        "3": {
            "PHSTD": "US $40.00",
            "pk": "PhotoBook-7x7-DustJacket-Standard"
        },
        "4": {
            "PPRMT": "US $45.00",
            "pk": "PhotoBook-7x7-ImageWrap-Premium",
            "PPRLS": "US $45.00"
        },
        "5": {
            "PMEGG": "US $54.00",
            "pk": "PhotoBook-7x7-ImageWrap-ProLine",
            "PMPRL": "US $58.00"
        },
        "6": {
            "PHSTD": "US $40.00",
            "pk": "PhotoBook-7x7-ImageWrap-Standard"
        },
        "7": {
            "PPRMT": "US $26.25",
            "pk": "PhotoBook-7x7-SoftCover-Premium",
            "PPRLS": "US $26.25"
        },
        "8": {
            "PMEGG": "US $29.25",
            "pk": "PhotoBook-7x7-SoftCover-ProLine",
            "PMPRL": "US $30.25"
        },
        "9": {
            "PHSTD": "US $21.25",
            "pk": "PhotoBook-7x7-SoftCover-Standard"
        },
        "10": {
            "PPRMT": "US $51.50",
            "pk": "PhotoBook-8x10-DustJacket-Premium",
            "PPRLS": "US $51.50"
        },
        "11": {
            "PMEGG": "US $60.50",
            "pk": "PhotoBook-8x10-DustJacket-ProLine",
            "PMPRL": "US $67.50"
        },
        "12": {
            "PHSTD": "US $47.50",
            "pk": "PhotoBook-8x10-DustJacket-Standard"
        },
        "13": {
            "PPRMT": "US $56.25",
            "pk": "PhotoBook-8x10-ImageWrap-Premium",
            "PPRLS": "US $56.25"
        },
        "14": {
            "PMEGG": "US $63.25",
            "pk": "PhotoBook-8x10-ImageWrap-ProLine",
            "PMPRL": "US $70.25"
        },
        "15": {
            "PHSTD": "US $51.25",
            "pk": "PhotoBook-8x10-ImageWrap-Standard"
        },
        "16": {
            "PPRMT": "US $35.00",
            "pk": "PhotoBook-8x10-SoftCover-Premium",
            "PPRLS": "US $35.00"
        },
        "17": {
            "PMEGG": "US $38.00",
            "pk": "PhotoBook-8x10-SoftCover-ProLine",
            "PMPRL": "US $43.00"
        },
        "18": {
            "PHSTD": "US $30.00",
            "pk": "PhotoBook-8x10-SoftCover-Standard"
        },
        "19": {
            "PPRMT": "US $51.50",
            "pk": "PhotoBook-10x8-DustJacket-Premium",
            "PPRLS": "US $51.50"
        },
        "20": {
            "PMEGG": "US $60.50",
            "pk": "PhotoBook-10x8-DustJacket-ProLine",
            "PMPRL": "US $67.50"
        },
        "21": {
            "PHSTD": "US $47.50",
            "pk": "PhotoBook-10x8-DustJacket-Standard"
        },
        "22": {
            "PPRMT": "US $56.25",
            "pk": "PhotoBook-10x8-ImageWrap-Premium",
            "PPRLS": "US $56.25"
        },
        "23": {
            "PMEGG": "US $63.25",
            "pk": "PhotoBook-10x8-ImageWrap-ProLine",
            "PMPRL": "US $70.25"
        },
        "24": {
            "PHSTD": "US $51.25",
            "pk": "PhotoBook-10x8-ImageWrap-Standard"
        },
        "25": {
            "PPRMT": "US $35.00",
            "pk": "PhotoBook-10x8-SoftCover-Premium",
            "PPRLS": "US $35.00"
        },
        "26": {
            "PMEGG": "US $38.00",
            "pk": "PhotoBook-10x8-SoftCover-ProLine",
            "PMPRL": "US $43.00"
        },
        "27": {
            "PHSTD": "US $30.00",
            "pk": "PhotoBook-10x8-SoftCover-Standard"
        },
        "28": {
            "PPRMT": "US $86.00",
            "pk": "PhotoBook-12x12-DustJacket-Premium",
            "PPRLS": "US $86.00"
        },
        "29": {
            "PMEGG": "US $101.00",
            "pk": "PhotoBook-12x12-DustJacket-ProLine",
            "PMPRL": "US $110.00"
        },
        "30": {
            "PHSTD": "US $80.00",
            "pk": "PhotoBook-12x12-DustJacket-Standard"
        },
        "31": {
            "PPRMT": "US $90.75",
            "pk": "PhotoBook-12x12-ImageWrap-Premium",
            "PPRLS": "US $90.75"
        },
        "32": {
            "PMEGG": "US $104.75",
            "pk": "PhotoBook-12x12-ImageWrap-ProLine",
            "PMPRL": "US $111.75"
        },
        "33": {
            "PHSTD": "US $83.75",
            "pk": "PhotoBook-12x12-ImageWrap-Standard"
        },
        "34": {
            "PPRMT": "US $91.00",
            "pk": "PhotoBook-13x11-DustJacket-Premium",
            "PPRLS": "US $91.00"
        },
        "35": {
            "PMEGG": "US $105.00",
            "pk": "PhotoBook-13x11-DustJacket-ProLine",
            "PMPRL": "US $112.00"
        },
        "36": {
            "PHSTD": "US $85.00",
            "pk": "PhotoBook-13x11-DustJacket-Standard"
        },
        "37": {
            "PPRMT": "US $95.50",
            "pk": "PhotoBook-13x11-ImageWrap-Premium",
            "PPRLS": "US $95.50"
        },
        "38": {
            "PMEGG": "US $108.50",
            "pk": "PhotoBook-13x11-ImageWrap-ProLine",
            "PMPRL": "US $118.50"
        },
        "39": {
            "PHSTD": "US $87.50",
            "pk": "PhotoBook-13x11-ImageWrap-Standard"
        },
        "40": {
            "LFPLS": "US $68.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-Premium"
        },
        "41": {
            "LFPRL": "US $109.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProPhoto"
        },
        "42": {
            "LFEGG": "US $87.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProUncoated"
        },
        "43": {
            "LFPLS": "US $80.25",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-Premium"
        },
        "44": {
            "LFPRL": "US $127.25",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProPhoto"
        },
        "45": {
            "LFEGG": "US $111.25",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProUncoated"
        },
        "46": {
            "LFPLS": "US $80.25",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-Premium"
        },
        "47": {
            "LFPRL": "US $127.25",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProPhoto"
        },
        "48": {
            "LFEGG": "US $111.25",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProUncoated"
        },
        "49": {
            "LFPLS": "US $126.75",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-Premium"
        },
        "50": {
            "LFPRL": "US $175.75",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProPhoto"
        },
        "51": {
            "LFEGG": "US $164.75",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProUncoated"
        },
        "52": {
            "LFPLS": "US $137.50",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-Premium"
        },
        "53": {
            "LFPRL": "US $187.50",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProPhoto"
        },
        "54": {
            "LFEGG": "US $176.50",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProUncoated"
        }
    },
    "additional_pages": {
        "0": {
            "PPRMT": "US $0.00",
            "PPRLS": "US $0.31"
        },
        "1": {
            "PPRMT": "US $0.40",
            "PPRLS": "US $0.40"
        },
        "2": {
            "PMPRL": "US $0.55",
            "PMEGG": "US $0.48"
        },
        "3": {
            "PHSTD": "US $0.26"
        },
        "4": {
            "PPRMT": "US $0.40",
            "PPRLS": "US $0.40"
        },
        "5": {
            "PMPRL": "US $0.55",
            "PMEGG": "US $0.48"
        },
        "6": {
            "PHSTD": "US $0.26"
        },
        "7": {
            "PPRMT": "US $0.40",
            "PPRLS": "US $0.40"
        },
        "8": {
            "PMPRL": "US $0.55",
            "PMEGG": "US $0.48"
        },
        "9": {
            "PHSTD": "US $0.26"
        },
        "10": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "11": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "12": {
            "PHSTD": "US $0.33"
        },
        "13": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "14": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "15": {
            "PHSTD": "US $0.33"
        },
        "16": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "17": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "18": {
            "PHSTD": "US $0.33"
        },
        "19": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "20": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "21": {
            "PHSTD": "US $0.33"
        },
        "22": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "23": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "24": {
            "PHSTD": "US $0.33"
        },
        "25": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "26": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "27": {
            "PHSTD": "US $0.33"
        },
        "28": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "29": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "30": {
            "PHSTD": "US $0.70"
        },
        "31": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "32": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "33": {
            "PHSTD": "US $0.70"
        },
        "34": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "35": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "36": {
            "PHSTD": "US $0.70"
        },
        "37": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "38": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "39": {
            "PHSTD": "US $0.70"
        },
        "40": {
            "LFPLS": "US $1.68"
        },
        "41": {
            "LFPRL": "US $3.95"
        },
        "42": {
            "LFEGG": "US $3.05"
        },
        "43": {
            "LFPLS": "US $1.85"
        },
        "44": {
            "LFPRL": "US $3.95"
        },
        "45": {
            "LFEGG": "US $3.05"
        },
        "46": {
            "LFPLS": "US $1.85"
        },
        "47": {
            "LFPRL": "US $3.95"
        },
        "48": {
            "LFEGG": "US $3.05"
        },
        "49": {
            "LFPLS": "US $2.52"
        },
        "50": {
            "LFPRL": "US $4.95"
        },
        "51": {
            "LFEGG": "US $4.20"
        },
        "52": {
            "LFPLS": "US $2.52"
        },
        "53": {
            "LFPRL": "US $4.95"
        },
        "54": {
            "LFEGG": "US $4.20"
        },
        "standard_portrait_premium_matte_layflat_paper": "US $1.10",
        "standard_portrait_true8x10_premium_matte_layflat_paper": "US $1.10",
        "standard_landscape_premium_matte_layflat_paper": "US $1.10",
        "square_premium_matte_layflat_paper": "US $1.10",
        "small_square_pro_medium_gloss_paper": "US $0.00",
        "small_square_pro_uncoated_paper": "US $0.00",
        "small_square_standard_paper": "US $0.00",
        "small_square_standard_layflat_paper": "US $0.00",
        "small_square_premium_matte_layflat_paper": "US $0.00",
        "small_square_pro_uncoated_layflat_paper": "US $0.00",
        "small_square_pro_photo_layflat_paper": "US $0.00",
        "large_format_landscape_premium_matte_layflat_paper": "US $1.50",
        "large_square_premium_matte_layflat_paper": "US $1.50"
    },
    "product_options": {
        "custom_logo_upgrade": "25%",
        "pro_white_endsheet": "US $3.00",
        "pro_charcoal_linen_covering": "US $6.00"
    }
}
```
## productOptions
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/productOptions?id=19
Accept: */*
Accept-Encoding: gzip, deflate, br
```
### Response
```json
{
    "ImageWrap": {
        "enabled": true,
        "paperTypes": [
            {
                "enabled": false,
                "id": "LFEGG",
                "productPK": "LayflatPhotoBook-10x8-ImageWrap-ProUncoated",
                "productID": 48
            },
            {
                "enabled": false,
                "id": "LFPLS",
                "productPK": "LayflatPhotoBook-10x8-ImageWrap-Premium",
                "productID": 46
            },
            {
                "enabled": false,
                "id": "LFPRL",
                "productPK": "LayflatPhotoBook-10x8-ImageWrap-ProPhoto",
                "productID": 47
            },
            {
                "enabled": false,
                "id": "MGECO"
            },
            {
                "enabled": false,
                "id": "MGPRM"
            },
            {
                "enabled": true,
                "id": "PHSTD",
                "productPK": "PhotoBook-10x8-ImageWrap-Standard",
                "productID": 24
            },
            {
                "enabled": true,
                "id": "PMEGG",
                "productPK": "PhotoBook-10x8-ImageWrap-ProLine",
                "productID": 23
            },
            {
                "enabled": true,
                "id": "PMPRL",
                "productPK": "PhotoBook-10x8-ImageWrap-ProLine",
                "productID": 23
            },
            {
                "enabled": true,
                "id": "PPRLS",
                "productPK": "PhotoBook-10x8-ImageWrap-Premium",
                "productID": 22
            },
            {
                "enabled": true,
                "id": "PPRMT",
                "productPK": "PhotoBook-10x8-ImageWrap-Premium",
                "productID": 22
            },
            {
                "enabled": false,
                "id": "TECBW"
            },
            {
                "enabled": false,
                "id": "TECCL"
            },
            {
                "enabled": false,
                "id": "TECCR"
            },
            {
                "enabled": false,
                "id": "TSTBW"
            },
            {
                "enabled": false,
                "id": "TSTCL"
            }
        ]
    },
    "DustJacket": {
        "enabled": true,
        "paperTypes": [
            {
                "enabled": false,
                "id": "LFEGG"
            },
            {
                "enabled": false,
                "id": "LFPLS"
            },
            {
                "enabled": false,
                "id": "LFPRL"
            },
            {
                "enabled": false,
                "id": "MGECO"
            },
            {
                "enabled": false,
                "id": "MGPRM"
            },
            {
                "enabled": true,
                "id": "PHSTD",
                "productPK": "PhotoBook-10x8-DustJacket-Standard",
                "productID": 21
            },
            {
                "enabled": true,
                "id": "PMEGG",
                "productPK": "PhotoBook-10x8-DustJacket-ProLine",
                "productID": 20
            },
            {
                "enabled": true,
                "id": "PMPRL",
                "productPK": "PhotoBook-10x8-DustJacket-ProLine",
                "productID": 20
            },
            {
                "enabled": true,
                "id": "PPRLS",
                "productPK": "PhotoBook-10x8-DustJacket-Premium",
                "productID": 19
            },
            {
                "enabled": true,
                "id": "PPRMT",
                "productPK": "PhotoBook-10x8-DustJacket-Premium",
                "productID": 19
            },
            {
                "enabled": false,
                "id": "TECBW"
            },
            {
                "enabled": false,
                "id": "TECCL"
            },
            {
                "enabled": false,
                "id": "TECCR"
            },
            {
                "enabled": false,
                "id": "TSTBW"
            },
            {
                "enabled": false,
                "id": "TSTCL"
            }
        ]
    },
    "SoftCover": {
        "enabled": true,
        "paperTypes": [
            {
                "enabled": false,
                "id": "LFEGG"
            },
            {
                "enabled": false,
                "id": "LFPLS"
            },
            {
                "enabled": false,
                "id": "LFPRL"
            },
            {
                "enabled": false,
                "id": "MGECO"
            },
            {
                "enabled": false,
                "id": "MGPRM"
            },
            {
                "enabled": true,
                "id": "PHSTD",
                "productPK": "PhotoBook-10x8-SoftCover-Standard",
                "productID": 27
            },
            {
                "enabled": true,
                "id": "PMEGG",
                "productPK": "PhotoBook-10x8-SoftCover-ProLine",
                "productID": 26
            },
            {
                "enabled": true,
                "id": "PMPRL",
                "productPK": "PhotoBook-10x8-SoftCover-ProLine",
                "productID": 26
            },
            {
                "enabled": true,
                "id": "PPRLS",
                "productPK": "PhotoBook-10x8-SoftCover-Premium",
                "productID": 25
            },
            {
                "enabled": true,
                "id": "PPRMT",
                "productPK": "PhotoBook-10x8-SoftCover-Premium",
                "productID": 25
            },
            {
                "enabled": false,
                "id": "TECBW"
            },
            {
                "enabled": false,
                "id": "TECCL"
            },
            {
                "enabled": false,
                "id": "TECCR"
            },
            {
                "enabled": false,
                "id": "TSTBW"
            },
            {
                "enabled": false,
                "id": "TSTCL"
            }
        ]
    }
}
```
# Editor page
## GetToken
```
:method: POST
:scheme: https
:authority: build.blurb.com
:path: /php-api/zoomUtils/getToken
Accept: */*
```
## GetProjectAsJson
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/getProjectAsJson?projectPK=37211&include=header,sections,imagesWithUsage,productInfo,warnings&spread=first
Accept: application/json, text/plain, */*
```
### Response - Blank photobook project
```json
{
    "productInfo": {
        "minPages": 20,
        "maxPages": 440,
        "wrappedCover": true,
        "showWrappedText": false,
        "clientRenderingWidth": 2700,
        "clientRenderingDPI": 300,
        "subtypeDescription": "Photo Book",
        "ratio": 0.857291305853,
        "printedHeight": 8.25,
        "printedWidth": 9.625,
        "coverWidth": 21.373333333333335,
        "resolutionFactor": {
            "printedWidth": 2887.5,
            "printDPI": 300,
            "resolutionWarningDPI": 150
        },
        "availableSizes": [
            {
                "id": 24,
                "coverWrapX": 0.019119,
                "coverWrapY": 0.0190543,
                "safetyX": 0.024935064935064935,
                "safetyY": 0.02181818181818182,
                "showGutterSafety": true,
                "baseCoverPageWidth": 20.13888888888889
            }
        ],
        "spineSizes": [
            {
                "size": 0.45833333333333326,
                "pages": 72,
                "flap": 0
            },
            {
                "size": 0.5694444444444445,
                "pages": 146,
                "flap": 0
            },
            {
                "size": 0.75,
                "pages": 220,
                "flap": 0
            },
            {
                "size": 0.9166666666666665,
                "pages": 294,
                "flap": 0
            },
            {
                "size": 1.097222222222222,
                "pages": 368,
                "flap": 0
            },
            {
                "size": 1.236111111111111,
                "pages": 440,
                "flap": 0
            }
        ],
        "coverColors": [
            {
                "id": "0",
                "name": "",
                "color": null,
                "active": true
            }
        ],
        "dustJacket": false
    },
    "sections": {
        "e6d25b4669b8df4ae276b36027415b2d": {
            "sectionID": "e6d25b4669b8df4ae276b36027415b2d",
            "title": "",
            "type": 3,
            "isMovable": 0,
            "isReady": 0,
            "isLocked": 0,
            "portraitPageLayout": "",
            "sortOrder": 0,
            "fontName": "",
            "fontSize": 0,
            "fontColor": "",
            "fontJustification": "",
            "portraitLayoutVersion": 0,
            "dateLastModified": "2025-03-15 23:02:31.000000",
            "spreads": [
                {
                    "id": "42af0ec275213c2d0cbfde38c3c10d93",
                    "pageCount": 1,
                    "pages": [
                        {
                            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 2,
                            "ratioBase": 2,
                            "ratio": 0.841235184028,
                            "pageType": "C",
                            "pageNumber": null
                        }
                    ]
                }
            ],
            "numPages": 0
        },
        "27c136d37683be570c8a9f1baf9cdf11": {
            "sectionID": "27c136d37683be570c8a9f1baf9cdf11",
            "title": "",
            "type": 2,
            "isMovable": 0,
            "isReady": 0,
            "isLocked": 0,
            "portraitPageLayout": "",
            "sortOrder": 1,
            "fontName": "",
            "fontSize": 0,
            "fontColor": "",
            "fontJustification": "",
            "portraitLayoutVersion": 0,
            "dateLastModified": "2025-03-15 23:02:31.000000",
            "spreads": [
                {
                    "id": "687c3a468a0bf2d49c0cefcb737d15c2",
                    "pageCount": 1,
                    "pages": [
                        {
                            "pageID": "074836d87a1ceeb0b6bda627f935e0ff",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "C",
                            "pageNumber": [
                                1
                            ]
                        },
                        {
                            "pageID": "717d206ef08645139bae8c0135d3f3d2",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                2
                            ]
                        }
                    ]
                },
                {
                    "id": "f2469986dff439675165636051385ead",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "6d110a47d2b3ae6d53fd5e10f4a5c061",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                3
                            ]
                        },
                        {
                            "pageID": "6c4e3929187dc856b82b4cfeaf958b60",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                4
                            ]
                        }
                    ]
                },
                {
                    "id": "41a5b5346e4af9cc3fec9e507bd314b4",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "8305743f05539ab1a009f9be527bf7f6",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                5
                            ]
                        },
                        {
                            "pageID": "7a54ee67297b3ce757f1fd5ec74d6283",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                6
                            ]
                        }
                    ]
                },
                {
                    "id": "d099789cdf739bbf86e58619bd0635de",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "1df3d6e2058d2018ca7651ee14cc8d50",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                7
                            ]
                        },
                        {
                            "pageID": "d87133a7b38ba739226e1965ed671cc1",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                8
                            ]
                        }
                    ]
                },
                {
                    "id": "b1f875487d361ce5cd6df7124a1dedc8",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "9a27528e1682ace0a9e3f07de0ccf9ff",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                9
                            ]
                        },
                        {
                            "pageID": "4023034f29b4c7f1f1f9fe8a9bf29651",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                10
                            ]
                        }
                    ]
                },
                {
                    "id": "6451d31de75d051b90ba5514e1e42054",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "ee263382a3c0b981797d61de36dee641",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                11
                            ]
                        },
                        {
                            "pageID": "1beddbc004744afa0fd40b149dd2ad2a",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                12
                            ]
                        }
                    ]
                },
                {
                    "id": "87e0f4bb1082a8f069a348bd2e64f9c6",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "140cdee088ae1c2bf3157f3a0026c5f7",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                13
                            ]
                        },
                        {
                            "pageID": "1ed3f8ad87ad55383591417b8f56be7a",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                14
                            ]
                        }
                    ]
                },
                {
                    "id": "57b852f98d9a1e98ab40ac5e49ad2e5f",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "9306733b82e5669b33accc655371db37",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                15
                            ]
                        },
                        {
                            "pageID": "5902117a717e4bd3f898e9cc2a5f3820",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                16
                            ]
                        }
                    ]
                },
                {
                    "id": "518f653414dd0423b02db4f70a43438d",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "9fdde89f84bb00ace3fea98dbf19c006",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                17
                            ]
                        },
                        {
                            "pageID": "e0bf5d782f8c25a001ab5d531602ab14",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                18
                            ]
                        }
                    ]
                },
                {
                    "id": "e2f322d941d6d4e28ad961ccb47a1319",
                    "pageCount": 2,
                    "pages": [
                        {
                            "pageID": "9f3b5770a9aab84178a9c7ab6514db89",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                19
                            ]
                        },
                        {
                            "pageID": "4b17cfecacfb56de01f7aa26fe936a43",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                20
                            ]
                        }
                    ]
                },
                {
                    "id": "4b08b74b7f33413b799f53ef217f5144",
                    "pageCount": 1,
                    "pages": [
                        {
                            "pageID": "f30ac2cd7e2792e1f20dffb3141a066d",
                            "name": null,
                            "pageIndex": 0,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "P",
                            "pageNumber": [
                                21
                            ]
                        },
                        {
                            "pageID": "93cff2911cebdcaa305ad6d35b8ba6fd",
                            "name": null,
                            "pageIndex": 1,
                            "thumbnailURL": null,
                            "lastModified": "2025-03-15 23:02:31.000000",
                            "dateLastModified": "20250315230231.000000",
                            "lastModifiedBy": null,
                            "numBlankPages": 1,
                            "ratioBase": 1,
                            "ratio": 0.857291305853,
                            "pageType": "C",
                            "pageNumber": [
                                22
                            ]
                        }
                    ]
                }
            ],
            "numPages": 20
        }
    },
    "currentSection": "e6d25b4669b8df4ae276b36027415b2d",
    "pageItems": {
        "6bb2096e6ee2112516d33280e6ff4d4e": {
            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
            "styles": [],
            "image_rotation": 0,
            "width": 0.97774780849629,
            "height": 0.83020903573837,
            "image_width": 0.97774780849629,
            "image_height": 0.83020903573837,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "graphicItem",
            "text": "",
            "positionX": 0,
            "positionY": 0,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "6bb2096e6ee2112516d33280e6ff4d4e",
            "filters": [
                {}
            ],
            "rotation": 0,
            "spineShift": 0
        },
        "5c1530223e37be24ed510534925f1eee": {
            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
            "styles": [],
            "image_rotation": 0,
            "width": 0.97774780849629,
            "height": 0.83020903573837,
            "image_width": 0.97774780849629,
            "image_height": 0.83020903573837,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "graphicItem",
            "text": "",
            "positionX": 1.0222521915037,
            "positionY": 0,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "5c1530223e37be24ed510534925f1eee",
            "filters": [
                {}
            ],
            "rotation": 0,
            "spineShift": 0
        },
        "369268e5afacc63a88fe5537b721c3d1": {
            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
            "styles": [],
            "image_rotation": 0,
            "width": 0.8631888009613,
            "height": 0.70831863897417,
            "image_width": 0.8631888009613,
            "image_height": 0.70831863897417,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "richText",
            "text": "",
            "positionX": 0.061275748216389,
            "positionY": 0.060945198382099,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "369268e5afacc63a88fe5537b721c3d1",
            "filters": [
                {}
            ],
            "rotation": 0,
            "spineShift": 0,
            "fill": "rgb(0,0,0)",
            "verticalAlign": "top",
            "fontSize": 16,
            "fontFamily": "Archivo",
            "fontAlignment": null,
            "textAlign": "left",
            "maxChars": 0
        },
        "464a8787002455326917bc5f11802386": {
            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
            "styles": [],
            "image_rotation": 0,
            "width": 0.3639903640753,
            "height": 0.02049898853675,
            "image_width": 0.3639903640753,
            "image_height": 0.042279163857047,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "richText",
            "text": "",
            "positionX": 1.0120689655172,
            "positionY": 0.43944861097528,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "464a8787002455326917bc5f11802386",
            "filters": [
                {}
            ],
            "rotation": 90,
            "spineShift": 0,
            "fill": "rgb(0,0,0)",
            "verticalAlign": "top",
            "fontSize": 16,
            "fontFamily": "Archivo",
            "fontAlignment": null,
            "textAlign": "center",
            "maxChars": 0
        },
        "6dcae2bbcf45bee9ec49cb89d2402ca2": {
            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
            "styles": [],
            "image_rotation": 0,
            "width": 0.3639903640753,
            "height": 0.02049898853675,
            "image_width": 0.3639903640753,
            "image_height": 0.042279163857047,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "richText",
            "text": "",
            "positionX": 1.0120689655172,
            "positionY": 0.04956169925826,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "6dcae2bbcf45bee9ec49cb89d2402ca2",
            "filters": [
                {}
            ],
            "rotation": 90,
            "spineShift": 0,
            "fill": "rgb(0,0,0)",
            "verticalAlign": "top",
            "fontSize": 16,
            "fontFamily": "Archivo",
            "fontAlignment": null,
            "textAlign": "center",
            "maxChars": 0
        },
        "23ade04bdcf70e8b4a9130b7a85b6ff5": {
            "pageID": "7f8ec68181fad4cd1caa07272ccd6728",
            "styles": [],
            "image_rotation": 0,
            "width": 0.8631888009613,
            "height": 0.70831863897417,
            "image_width": 0.8631888009613,
            "image_height": 0.70831863897417,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "richText",
            "text": "",
            "positionX": 1.0715392063734,
            "positionY": 0.060945198382099,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "23ade04bdcf70e8b4a9130b7a85b6ff5",
            "filters": [
                {}
            ],
            "rotation": 0,
            "spineShift": 0,
            "fill": "rgb(0,0,0)",
            "verticalAlign": "top",
            "fontSize": 16,
            "fontFamily": "Archivo",
            "fontAlignment": null,
            "textAlign": "left",
            "maxChars": 0
        }
    },
    "pages": {
        "7f8ec68181fad4cd1caa07272ccd6728": {
            "id": "7f8ec68181fad4cd1caa07272ccd6728",
            "pageType": "C",
            "canAddCaption": true,
            "canAddImage": true,
            "canChangeLayout": true,
            "canMoveCaption": true,
            "canMoveImage": true,
            "canSetBackground": true,
            "layoutLocked": false,
            "ratio": 0.841235184028,
            "ratioBase": 2,
            "background": {
                "graphicItem": null,
                "color": 16777215
            },
            "pageItems": [
                "6bb2096e6ee2112516d33280e6ff4d4e",
                "5c1530223e37be24ed510534925f1eee",
                "369268e5afacc63a88fe5537b721c3d1",
                "464a8787002455326917bc5f11802386",
                "6dcae2bbcf45bee9ec49cb89d2402ca2",
                "23ade04bdcf70e8b4a9130b7a85b6ff5"
            ],
            "currentLayout": "c7cd08f92c2d4dc2975e108b224fc81e",
            "pageNumber": null,
            "dateLastModified": "20250315230231.000000",
            "lastModifiedBy": null
        }
    },
    "images": {},
    "project": {
        "projectPK": 37211,
        "projectID": "e43b5536-a478-411d-9db1-6ac9912159d8",
        "name": "Photo Book 10x8 03/15/25",
        "numPages": 20,
        "numImages": 0,
        "projectXMLVersion": 101,
        "captionVersion": 1,
        "spineCaptionVersion": 1,
        "createdDate": "2025-03-15 23:02:31",
        "modifiedDate": "2025-03-15 23:02:31.000000",
        "type": 0,
        "subtype": 24,
        "cover": "0",
        "theme": "",
        "style": 0,
        "ratio": 0.857291,
        "layoutsFixed": false,
        "lastModified": "20250315230231.000000",
        "lastAutoPublished": "0",
        "causeID": null,
        "permissions": {
            "inviteAdviser": true,
            "orderProject": true,
            "deleteProject": true,
            "changePrice": true,
            "manageStore": true,
            "createStorefront": true,
            "manageCovers": true,
            "viewSkippleFlagged": true,
            "canDeleteTeamLayout": true,
            "manageIndex": true,
            "viewPrice": true,
            "manageProjectMetadata": true,
            "manageTeam": true,
            "manageSections": true,
            "editPortraitRules": true,
            "addDeletePages": true,
            "viewOrderStatus": true,
            "viewStorefront": true,
            "addNote": true,
            "deleteNote": true,
            "canRequestProof": true,
            "canRequestPhotos": true,
            "addImage": true,
            "deleteImage": true,
            "editImageMetadata": true,
            "moveCopyImage": true,
            "editPortraitMetadata": true,
            "imagePending": true,
            "manageSkipplePhotos": true,
            "manageAds": true,
            "sendSkippleNotifications": true,
            "openProject": true,
            "viewSectionManagement": true,
            "viewImageManagement": true,
            "showCustomMessageInMessageCenter": true,
            "sectionPermissions": {
                "e6d25b4669b8df4ae276b36027415b2d": {
                    "canPreview": true,
                    "canEdit": true,
                    "canViewStatus": true,
                    "canReorderPages": true,
                    "canAddImages": true,
                    "canDeleteImages": true,
                    "canEditImageMetadata": true,
                    "canLock": true,
                    "canMarkReady": true
                },
                "27c136d37683be570c8a9f1baf9cdf11": {
                    "canPreview": true,
                    "canEdit": true,
                    "canViewStatus": true,
                    "canReorderPages": true,
                    "canAddImages": true,
                    "canDeleteImages": true,
                    "canEditImageMetadata": true,
                    "canLock": true,
                    "canMarkReady": true
                }
            }
        },
        "previewSize": 24,
        "managementType": 0,
        "metaData": null,
        "paperTypeID": "PHSTD",
        "projectAuthor": null,
        "thumbnailUrl": null,
        "sections": [
            "e6d25b4669b8df4ae276b36027415b2d",
            "27c136d37683be570c8a9f1baf9cdf11"
        ],
        "pages": [
            "7f8ec68181fad4cd1caa07272ccd6728"
        ],
        "images": [],
        "product": {
            "size": "10x8",
            "description": "Photo Book",
            "pk": "PhotoBook-10x8-ImageWrap-Standard",
            "id": 24
        },
        "warnings": {
            "lowResolution": [],
            "emptyWell": [],
            "spelling": []
        },
        "shareID": "ca2ba864-4476-4655-a50a-b27aab2a3eb1"
    },
    "executionTime": 0.12240910530090332,
    "outerExecutionTime": 0.05463695526123047
}
```
## prices
See [Create a project > prices](#create-a-project-prices)
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/zoomUtils/prices?pages=20&book_type=photo_books
Accept: */*
```
### Response
```json
{
    "books": {
        "0": {
            "PPRLS": "US $12.00",
            "pk": "PhotoBook-5x5-SoftCover-Premium"
        },
        "1": {
            "PPRMT": "US $36.00",
            "pk": "PhotoBook-7x7-DustJacket-Premium",
            "PPRLS": "US $36.00"
        },
        "2": {
            "PMEGG": "US $42.00",
            "pk": "PhotoBook-7x7-DustJacket-ProLine",
            "PMPRL": "US $48.00"
        },
        "3": {
            "PHSTD": "US $32.00",
            "pk": "PhotoBook-7x7-DustJacket-Standard"
        },
        "4": {
            "PPRMT": "US $37.00",
            "pk": "PhotoBook-7x7-ImageWrap-Premium",
            "PPRLS": "US $37.00"
        },
        "5": {
            "PMEGG": "US $46.00",
            "pk": "PhotoBook-7x7-ImageWrap-ProLine",
            "PMPRL": "US $50.00"
        },
        "6": {
            "PHSTD": "US $32.00",
            "pk": "PhotoBook-7x7-ImageWrap-Standard"
        },
        "7": {
            "PPRMT": "US $22.00",
            "pk": "PhotoBook-7x7-SoftCover-Premium",
            "PPRLS": "US $22.00"
        },
        "8": {
            "PMEGG": "US $25.00",
            "pk": "PhotoBook-7x7-SoftCover-ProLine",
            "PMPRL": "US $26.00"
        },
        "9": {
            "PHSTD": "US $17.00",
            "pk": "PhotoBook-7x7-SoftCover-Standard"
        },
        "10": {
            "PPRMT": "US $42.00",
            "pk": "PhotoBook-8x10-DustJacket-Premium",
            "PPRLS": "US $42.00"
        },
        "11": {
            "PMEGG": "US $51.00",
            "pk": "PhotoBook-8x10-DustJacket-ProLine",
            "PMPRL": "US $58.00"
        },
        "12": {
            "PHSTD": "US $38.00",
            "pk": "PhotoBook-8x10-DustJacket-Standard"
        },
        "13": {
            "PPRMT": "US $46.00",
            "pk": "PhotoBook-8x10-ImageWrap-Premium",
            "PPRLS": "US $46.00"
        },
        "14": {
            "PMEGG": "US $53.00",
            "pk": "PhotoBook-8x10-ImageWrap-ProLine",
            "PMPRL": "US $60.00"
        },
        "15": {
            "PHSTD": "US $41.00",
            "pk": "PhotoBook-8x10-ImageWrap-Standard"
        },
        "16": {
            "PPRMT": "US $29.00",
            "pk": "PhotoBook-8x10-SoftCover-Premium",
            "PPRLS": "US $29.00"
        },
        "17": {
            "PMEGG": "US $32.00",
            "pk": "PhotoBook-8x10-SoftCover-ProLine",
            "PMPRL": "US $37.00"
        },
        "18": {
            "PHSTD": "US $24.00",
            "pk": "PhotoBook-8x10-SoftCover-Standard"
        },
        "19": {
            "PPRMT": "US $42.00",
            "pk": "PhotoBook-10x8-DustJacket-Premium",
            "PPRLS": "US $42.00"
        },
        "20": {
            "PMEGG": "US $51.00",
            "pk": "PhotoBook-10x8-DustJacket-ProLine",
            "PMPRL": "US $58.00"
        },
        "21": {
            "PHSTD": "US $38.00",
            "pk": "PhotoBook-10x8-DustJacket-Standard"
        },
        "22": {
            "PPRMT": "US $46.00",
            "pk": "PhotoBook-10x8-ImageWrap-Premium",
            "PPRLS": "US $46.00"
        },
        "23": {
            "PMEGG": "US $53.00",
            "pk": "PhotoBook-10x8-ImageWrap-ProLine",
            "PMPRL": "US $60.00"
        },
        "24": {
            "PHSTD": "US $41.00",
            "pk": "PhotoBook-10x8-ImageWrap-Standard"
        },
        "25": {
            "PPRMT": "US $29.00",
            "pk": "PhotoBook-10x8-SoftCover-Premium",
            "PPRLS": "US $29.00"
        },
        "26": {
            "PMEGG": "US $32.00",
            "pk": "PhotoBook-10x8-SoftCover-ProLine",
            "PMPRL": "US $37.00"
        },
        "27": {
            "PHSTD": "US $24.00",
            "pk": "PhotoBook-10x8-SoftCover-Standard"
        },
        "28": {
            "PPRMT": "US $70.00",
            "pk": "PhotoBook-12x12-DustJacket-Premium",
            "PPRLS": "US $70.00"
        },
        "29": {
            "PMEGG": "US $85.00",
            "pk": "PhotoBook-12x12-DustJacket-ProLine",
            "PMPRL": "US $94.00"
        },
        "30": {
            "PHSTD": "US $64.00",
            "pk": "PhotoBook-12x12-DustJacket-Standard"
        },
        "31": {
            "PPRMT": "US $74.00",
            "pk": "PhotoBook-12x12-ImageWrap-Premium",
            "PPRLS": "US $74.00"
        },
        "32": {
            "PMEGG": "US $88.00",
            "pk": "PhotoBook-12x12-ImageWrap-ProLine",
            "PMPRL": "US $95.00"
        },
        "33": {
            "PHSTD": "US $67.00",
            "pk": "PhotoBook-12x12-ImageWrap-Standard"
        },
        "34": {
            "PPRMT": "US $74.00",
            "pk": "PhotoBook-13x11-DustJacket-Premium",
            "PPRLS": "US $74.00"
        },
        "35": {
            "PMEGG": "US $88.00",
            "pk": "PhotoBook-13x11-DustJacket-ProLine",
            "PMPRL": "US $95.00"
        },
        "36": {
            "PHSTD": "US $68.00",
            "pk": "PhotoBook-13x11-DustJacket-Standard"
        },
        "37": {
            "PPRMT": "US $78.00",
            "pk": "PhotoBook-13x11-ImageWrap-Premium",
            "PPRLS": "US $78.00"
        },
        "38": {
            "PMEGG": "US $91.00",
            "pk": "PhotoBook-13x11-ImageWrap-ProLine",
            "PMPRL": "US $101.00"
        },
        "39": {
            "PHSTD": "US $70.00",
            "pk": "PhotoBook-13x11-ImageWrap-Standard"
        },
        "40": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-Premium"
        },
        "41": {
            "LFPRL": "US $101.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProPhoto"
        },
        "42": {
            "LFEGG": "US $79.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProUncoated"
        },
        "43": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-Premium"
        },
        "44": {
            "LFPRL": "US $117.00",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProPhoto"
        },
        "45": {
            "LFEGG": "US $101.00",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProUncoated"
        },
        "46": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-Premium"
        },
        "47": {
            "LFPRL": "US $117.00",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProPhoto"
        },
        "48": {
            "LFEGG": "US $101.00",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProUncoated"
        },
        "49": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-Premium"
        },
        "50": {
            "LFPRL": "US $159.00",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProPhoto"
        },
        "51": {
            "LFEGG": "US $148.00",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProUncoated"
        },
        "52": {
            "LFPLS": "",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-Premium"
        },
        "53": {
            "LFPRL": "US $170.00",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProPhoto"
        },
        "54": {
            "LFEGG": "US $159.00",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProUncoated"
        }
    },
    "books_with_logo_upgrade": {
        "0": {
            "PPRLS": "US $15.00",
            "pk": "PhotoBook-5x5-SoftCover-Premium"
        },
        "1": {
            "PPRMT": "US $44.00",
            "pk": "PhotoBook-7x7-DustJacket-Premium",
            "PPRLS": "US $44.00"
        },
        "2": {
            "PMEGG": "US $50.00",
            "pk": "PhotoBook-7x7-DustJacket-ProLine",
            "PMPRL": "US $56.00"
        },
        "3": {
            "PHSTD": "US $40.00",
            "pk": "PhotoBook-7x7-DustJacket-Standard"
        },
        "4": {
            "PPRMT": "US $45.00",
            "pk": "PhotoBook-7x7-ImageWrap-Premium",
            "PPRLS": "US $45.00"
        },
        "5": {
            "PMEGG": "US $54.00",
            "pk": "PhotoBook-7x7-ImageWrap-ProLine",
            "PMPRL": "US $58.00"
        },
        "6": {
            "PHSTD": "US $40.00",
            "pk": "PhotoBook-7x7-ImageWrap-Standard"
        },
        "7": {
            "PPRMT": "US $26.25",
            "pk": "PhotoBook-7x7-SoftCover-Premium",
            "PPRLS": "US $26.25"
        },
        "8": {
            "PMEGG": "US $29.25",
            "pk": "PhotoBook-7x7-SoftCover-ProLine",
            "PMPRL": "US $30.25"
        },
        "9": {
            "PHSTD": "US $21.25",
            "pk": "PhotoBook-7x7-SoftCover-Standard"
        },
        "10": {
            "PPRMT": "US $51.50",
            "pk": "PhotoBook-8x10-DustJacket-Premium",
            "PPRLS": "US $51.50"
        },
        "11": {
            "PMEGG": "US $60.50",
            "pk": "PhotoBook-8x10-DustJacket-ProLine",
            "PMPRL": "US $67.50"
        },
        "12": {
            "PHSTD": "US $47.50",
            "pk": "PhotoBook-8x10-DustJacket-Standard"
        },
        "13": {
            "PPRMT": "US $56.25",
            "pk": "PhotoBook-8x10-ImageWrap-Premium",
            "PPRLS": "US $56.25"
        },
        "14": {
            "PMEGG": "US $63.25",
            "pk": "PhotoBook-8x10-ImageWrap-ProLine",
            "PMPRL": "US $70.25"
        },
        "15": {
            "PHSTD": "US $51.25",
            "pk": "PhotoBook-8x10-ImageWrap-Standard"
        },
        "16": {
            "PPRMT": "US $35.00",
            "pk": "PhotoBook-8x10-SoftCover-Premium",
            "PPRLS": "US $35.00"
        },
        "17": {
            "PMEGG": "US $38.00",
            "pk": "PhotoBook-8x10-SoftCover-ProLine",
            "PMPRL": "US $43.00"
        },
        "18": {
            "PHSTD": "US $30.00",
            "pk": "PhotoBook-8x10-SoftCover-Standard"
        },
        "19": {
            "PPRMT": "US $51.50",
            "pk": "PhotoBook-10x8-DustJacket-Premium",
            "PPRLS": "US $51.50"
        },
        "20": {
            "PMEGG": "US $60.50",
            "pk": "PhotoBook-10x8-DustJacket-ProLine",
            "PMPRL": "US $67.50"
        },
        "21": {
            "PHSTD": "US $47.50",
            "pk": "PhotoBook-10x8-DustJacket-Standard"
        },
        "22": {
            "PPRMT": "US $56.25",
            "pk": "PhotoBook-10x8-ImageWrap-Premium",
            "PPRLS": "US $56.25"
        },
        "23": {
            "PMEGG": "US $63.25",
            "pk": "PhotoBook-10x8-ImageWrap-ProLine",
            "PMPRL": "US $70.25"
        },
        "24": {
            "PHSTD": "US $51.25",
            "pk": "PhotoBook-10x8-ImageWrap-Standard"
        },
        "25": {
            "PPRMT": "US $35.00",
            "pk": "PhotoBook-10x8-SoftCover-Premium",
            "PPRLS": "US $35.00"
        },
        "26": {
            "PMEGG": "US $38.00",
            "pk": "PhotoBook-10x8-SoftCover-ProLine",
            "PMPRL": "US $43.00"
        },
        "27": {
            "PHSTD": "US $30.00",
            "pk": "PhotoBook-10x8-SoftCover-Standard"
        },
        "28": {
            "PPRMT": "US $86.00",
            "pk": "PhotoBook-12x12-DustJacket-Premium",
            "PPRLS": "US $86.00"
        },
        "29": {
            "PMEGG": "US $101.00",
            "pk": "PhotoBook-12x12-DustJacket-ProLine",
            "PMPRL": "US $110.00"
        },
        "30": {
            "PHSTD": "US $80.00",
            "pk": "PhotoBook-12x12-DustJacket-Standard"
        },
        "31": {
            "PPRMT": "US $90.75",
            "pk": "PhotoBook-12x12-ImageWrap-Premium",
            "PPRLS": "US $90.75"
        },
        "32": {
            "PMEGG": "US $104.75",
            "pk": "PhotoBook-12x12-ImageWrap-ProLine",
            "PMPRL": "US $111.75"
        },
        "33": {
            "PHSTD": "US $83.75",
            "pk": "PhotoBook-12x12-ImageWrap-Standard"
        },
        "34": {
            "PPRMT": "US $91.00",
            "pk": "PhotoBook-13x11-DustJacket-Premium",
            "PPRLS": "US $91.00"
        },
        "35": {
            "PMEGG": "US $105.00",
            "pk": "PhotoBook-13x11-DustJacket-ProLine",
            "PMPRL": "US $112.00"
        },
        "36": {
            "PHSTD": "US $85.00",
            "pk": "PhotoBook-13x11-DustJacket-Standard"
        },
        "37": {
            "PPRMT": "US $95.50",
            "pk": "PhotoBook-13x11-ImageWrap-Premium",
            "PPRLS": "US $95.50"
        },
        "38": {
            "PMEGG": "US $108.50",
            "pk": "PhotoBook-13x11-ImageWrap-ProLine",
            "PMPRL": "US $118.50"
        },
        "39": {
            "PHSTD": "US $87.50",
            "pk": "PhotoBook-13x11-ImageWrap-Standard"
        },
        "40": {
            "LFPLS": "US $68.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-Premium"
        },
        "41": {
            "LFPRL": "US $109.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProPhoto"
        },
        "42": {
            "LFEGG": "US $87.00",
            "pk": "LayflatPhotoBook-7x7-ImageWrap-ProUncoated"
        },
        "43": {
            "LFPLS": "US $80.25",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-Premium"
        },
        "44": {
            "LFPRL": "US $127.25",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProPhoto"
        },
        "45": {
            "LFEGG": "US $111.25",
            "pk": "LayflatPhotoBook-8x10-ImageWrap-ProUncoated"
        },
        "46": {
            "LFPLS": "US $80.25",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-Premium"
        },
        "47": {
            "LFPRL": "US $127.25",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProPhoto"
        },
        "48": {
            "LFEGG": "US $111.25",
            "pk": "LayflatPhotoBook-10x8-ImageWrap-ProUncoated"
        },
        "49": {
            "LFPLS": "US $126.75",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-Premium"
        },
        "50": {
            "LFPRL": "US $175.75",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProPhoto"
        },
        "51": {
            "LFEGG": "US $164.75",
            "pk": "LayflatPhotoBook-12x12-ImageWrap-ProUncoated"
        },
        "52": {
            "LFPLS": "US $137.50",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-Premium"
        },
        "53": {
            "LFPRL": "US $187.50",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProPhoto"
        },
        "54": {
            "LFEGG": "US $176.50",
            "pk": "LayflatPhotoBook-13x11-ImageWrap-ProUncoated"
        }
    },
    "additional_pages": {
        "0": {
            "PPRMT": "US $0.00",
            "PPRLS": "US $0.31"
        },
        "1": {
            "PPRMT": "US $0.40",
            "PPRLS": "US $0.40"
        },
        "2": {
            "PMPRL": "US $0.55",
            "PMEGG": "US $0.48"
        },
        "3": {
            "PHSTD": "US $0.26"
        },
        "4": {
            "PPRMT": "US $0.40",
            "PPRLS": "US $0.40"
        },
        "5": {
            "PMPRL": "US $0.55",
            "PMEGG": "US $0.48"
        },
        "6": {
            "PHSTD": "US $0.26"
        },
        "7": {
            "PPRMT": "US $0.40",
            "PPRLS": "US $0.40"
        },
        "8": {
            "PMPRL": "US $0.55",
            "PMEGG": "US $0.48"
        },
        "9": {
            "PHSTD": "US $0.26"
        },
        "10": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "11": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "12": {
            "PHSTD": "US $0.33"
        },
        "13": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "14": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "15": {
            "PHSTD": "US $0.33"
        },
        "16": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "17": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "18": {
            "PHSTD": "US $0.33"
        },
        "19": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "20": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "21": {
            "PHSTD": "US $0.33"
        },
        "22": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "23": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "24": {
            "PHSTD": "US $0.33"
        },
        "25": {
            "PPRMT": "US $0.45",
            "PPRLS": "US $0.45"
        },
        "26": {
            "PMPRL": "US $0.61",
            "PMEGG": "US $0.54"
        },
        "27": {
            "PHSTD": "US $0.33"
        },
        "28": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "29": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "30": {
            "PHSTD": "US $0.70"
        },
        "31": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "32": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "33": {
            "PHSTD": "US $0.70"
        },
        "34": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "35": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "36": {
            "PHSTD": "US $0.70"
        },
        "37": {
            "PPRMT": "US $0.84",
            "PPRLS": "US $0.84"
        },
        "38": {
            "PMPRL": "US $0.99",
            "PMEGG": "US $0.92"
        },
        "39": {
            "PHSTD": "US $0.70"
        },
        "40": {
            "LFPLS": "US $1.68"
        },
        "41": {
            "LFPRL": "US $3.95"
        },
        "42": {
            "LFEGG": "US $3.05"
        },
        "43": {
            "LFPLS": "US $1.85"
        },
        "44": {
            "LFPRL": "US $3.95"
        },
        "45": {
            "LFEGG": "US $3.05"
        },
        "46": {
            "LFPLS": "US $1.85"
        },
        "47": {
            "LFPRL": "US $3.95"
        },
        "48": {
            "LFEGG": "US $3.05"
        },
        "49": {
            "LFPLS": "US $2.52"
        },
        "50": {
            "LFPRL": "US $4.95"
        },
        "51": {
            "LFEGG": "US $4.20"
        },
        "52": {
            "LFPLS": "US $2.52"
        },
        "53": {
            "LFPRL": "US $4.95"
        },
        "54": {
            "LFEGG": "US $4.20"
        },
        "standard_portrait_premium_matte_layflat_paper": "US $1.10",
        "standard_portrait_true8x10_premium_matte_layflat_paper": "US $1.10",
        "standard_landscape_premium_matte_layflat_paper": "US $1.10",
        "square_premium_matte_layflat_paper": "US $1.10",
        "small_square_pro_medium_gloss_paper": "US $0.00",
        "small_square_pro_uncoated_paper": "US $0.00",
        "small_square_standard_paper": "US $0.00",
        "small_square_standard_layflat_paper": "US $0.00",
        "small_square_premium_matte_layflat_paper": "US $0.00",
        "small_square_pro_uncoated_layflat_paper": "US $0.00",
        "small_square_pro_photo_layflat_paper": "US $0.00",
        "large_format_landscape_premium_matte_layflat_paper": "US $1.50",
        "large_square_premium_matte_layflat_paper": "US $1.50"
    },
    "product_options": {
        "custom_logo_upgrade": "25%",
        "pro_white_endsheet": "US $3.00",
        "pro_charcoal_linen_covering": "US $6.00"
    }
}
```
## GetLayouts
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/layouts/getLayouts?productID=24&productID=24
Accept: application/json, text/plain, */*
```
## GetSavedLayouts
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/getSavedLayouts?productID=24
Accept: application/json, text/plain, */*
```
## GetRendererPageJSON
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/getRendererPageJSON?projectPK=37211&pageID=7f8ec68181fad4cd1caa07272ccd6728
Accept: application/json, text/plain, */*
```
## update
```
:method: POST
:scheme: https
:authority: build.blurb.com
:path: /php-api/ZoomProjectChanges/update
Accept: application/json, text/plain, */*
```
### Response
```json
{
    "resultCode": 0,
    "result": {
        "changeRequestID": "128C3D9B-0B87-4EEC-AC52-6B11FAE34822",
        "changes": [
            {
                "type": "NAME_CHANGED",
                "changes": {
                    "name": "Photo Book 10x8 03/15/25",
                    "author": "Johan Tique"
                }
            }
        ]
    }
}
```