Photobook edition with web editor
=================================

PhotoBook zzMzcyMTY

# editor page
## ImageUploading
```
:method: POST
:scheme: https
:authority: build.blurb.com
:path: /dot-net-api/api/UserImageUpload/upload
Accept: application/json, text/plain, */*
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9
Cache-Control: no-cache
Connection: keep-alive
Content-Length: 1039686
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryZk0WsAIF8t3BMMIm
```
### Response
```json
{
    "pk": 0,
    "accountID": "97f6c1dc-a86a-4aa5-b7c8-c07626787339",
    "clientID": "4ff87ad0-cd39-47ab-9d14-84d9410cb16e",
    "filePath": "9/7/f/6/97f6c1dc-a86a-4aa5-b7c8-c07626787339/4/f/f/4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg",
    "fileHash": "E4F9DCA05B9DF7C8F4B482D8D3F5AD3D",
    "creationTimestamp": "0001-01-01T00:00:00",
    "fileSize": 3208311,
    "bucketID": 1,
    "thumbFilePath": "9/7/f/6/97f6c1dc-a86a-4aa5-b7c8-c07626787339/4/f/f/t_4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg",
    "thumbFileSize": 3550,
    "thumbBucketID": 2,
    "hiresFilePath": "9/7/f/6/97f6c1dc-a86a-4aa5-b7c8-c07626787339/4/f/f/h_4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg",
    "hiresFileSize": 3208311,
    "hiresBucketID": 2,
    "width": 3000,
    "height": 4000,
    "dateTaken": "2023-07-25T13:01:24",
    "fileName": "20230725_130124.jpg",
    "source": "customer"
}
```
## ProjectUpdate after uploading an image
```
:method: POST
:scheme: https
:authority: build.blurb.com
:path: /php-api/ZoomProjectChanges/update
Accept: application/json, text/plain, */*
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9
Cache-Control: no-cache
Connection: keep-alive
Content-Length: 798
Content-Type: application/json
```
### Response
```json
{
    "resultCode": 0,
    "result": {
        "changeRequestID": "70F03C54-7DF9-4DC9-9CBF-12B8B2CEF922",
        "changes": [
            {
                "type": "IMAGE_ADDED",
                "changes": {
                    "imageID": "4ff87ad0-cd39-47ab-9d14-84d9410cb16e",
                    "dateTaken": "2023-07-25T13:01:24",
                    "filename": "20230725_130124.jpg",
                    "filehash": "E4F9DCA05B9DF7C8F4B482D8D3F5AD3D",
                    "width": 3000,
                    "height": 4000,
                    "orientation": 1,
                    "serverImage": "0",
                    "missingImage": 0,
                    "dateLastModified": "1980-01-01T05:00:00.000Z",
                    "showInMediaTray": "true",
                    "imageType": "n",
                    "sections": [
                        "a225c6a9712ebbccfce6f3297029728d"
                    ],
                    "thumbPath": "https://s3-us-west-1.amazonaws.com/webeditor-prod-storagesta-bucketsworkimagebuckete1-wq34bl4418v0/2/e/6/3/2e639838-d4a9-4017-a8ae-9e5542ef49c7/4/f/f/t_4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg?AWSAccessKeyId=AKIA2OAJTSPU5RR3QX6Z&Expires=1768521600&Signature=ACFLbx2YcE3V%2F9dU6%2BseajPiVvM%3D",
                    "highResPath": "https://s3-us-west-1.amazonaws.com/webeditor-prod-storagesta-bucketsworkimagebuckete1-wq34bl4418v0/2/e/6/3/2e639838-d4a9-4017-a8ae-9e5542ef49c7/4/f/f/h_4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg?AWSAccessKeyId=AKIA2OAJTSPU5RR3QX6Z&Expires=1768521600&Signature=U%2BuK9rVTHDMV138sZPJbvKcqsLE%3D"
                }
            },
            {
                "type": "IMAGE_ADDED",
                "changes": {
                    "imageID": "4ff87ad0-cd39-47ab-9d14-84d9410cb16e",
                    "dateTaken": "2023-07-25 13:01:24",
                    "dateLastModified": "2025-03-15 23:55:45.597656",
                    "missingImage": false,
                    "serverImage": 0,
                    "thumbPath": "https://s3-us-west-1.amazonaws.com/webeditor-prod-storagesta-bucketsworkimagebuckete1-wq34bl4418v0/2/e/6/3/2e639838-d4a9-4017-a8ae-9e5542ef49c7/4/f/f/t_4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg?AWSAccessKeyId=AKIA2OAJTSPU5RR3QX6Z&Expires=1768521600&Signature=ACFLbx2YcE3V%2F9dU6%2BseajPiVvM%3D",
                    "workPath": null,
                    "highResPath": "https://s3-us-west-1.amazonaws.com/webeditor-prod-storagesta-bucketsworkimagebuckete1-wq34bl4418v0/2/e/6/3/2e639838-d4a9-4017-a8ae-9e5542ef49c7/4/f/f/h_4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg?AWSAccessKeyId=AKIA2OAJTSPU5RR3QX6Z&Expires=1768521600&Signature=U%2BuK9rVTHDMV138sZPJbvKcqsLE%3D",
                    "orientation": "1",
                    "height": "4000",
                    "width": "3000",
                    "imageType": "n",
                    "notes": null,
                    "filename": "20230725_130124.jpg",
                    "fileHash": "E4F9DCA05B9DF7C8F4B482D8D3F5AD3D",
                    "linkURL": null,
                    "showInMediaTray": "true",
                    "originalURL": null,
                    "tags": [],
                    "sections": [
                        "a225c6a9712ebbccfce6f3297029728d"
                    ],
                    "nodes": [],
                    "approvalStatus": null,
                    "uploadedByEmailAddress": null,
                    "uploadedSectionID": null,
                    "integrationData": null,
                    "path": "https://s3-us-west-1.amazonaws.com/webeditor-prod-storagesta-bucketsuserimagebucketa9-bru5b587tm1q/2/e/6/3/2e639838-d4a9-4017-a8ae-9e5542ef49c7/4/f/f/4ff87ad0-cd39-47ab-9d14-84d9410cb16e.jpg?AWSAccessKeyId=AKIA2OAJTSPU5RR3QX6Z&Expires=1768521600&Signature=SiniP0wZ%2BwtLQaelDi0avWJaRuA%3D"
                }
            }
        ]
    }
}
```
## ProjectUpdate after inserting an image
```
:method: POST
:scheme: https
:authority: build.blurb.com
:path: /php-api/ZoomProjectChanges/update
Accept: application/json, text/plain, */*
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9
Cache-Control: no-cache
Connection: keep-alive
Content-Length: 751
Content-Type: application/json
```
### Response
```json
{
    "resultCode": 0,
    "result": {
        "changeRequestID": "70F03C54-7DF9-4DC9-9CBF-12B8B2CEF922",
        "changes": [
            {
                "type": "PAGE_ITEM_UPDATED",
                "changes": [
                    {
                        "styles": [],
                        "image_width": 0.97774780849629,
                        "image_rotation": 0,
                        "width": 0.97774780849629,
                        "height": 0.83020903573837,
                        "pageID": "e7bfbcf6fce9deee51d052478b35f62f",
                        "image_height": 1.30366374466172,
                        "image_positionX": 0,
                        "image_orientation": 0,
                        "image_positionY": -0.236727354461675,
                        "itemType": "graphicItem",
                        "text": "",
                        "positionX": 1.0222521915037,
                        "positionY": 0,
                        "cornerID": "",
                        "maskShape": "",
                        "imageID": "dd8a6220-5758-4c6b-a63f-3bb1d98cd80d",
                        "type": "N",
                        "id": "13836ea053c9372abd4734e875fd9730",
                        "filters": [
                            {}
                        ],
                        "rotation": 0,
                        "spineShift": 0
                    }
                ]
            },
            {
                "type": "PAGE_IMAGE_USAGE_CHANGED",
                "changes": {
                    "spreadID": "dca60bf7af9046279ba96bbbd010468f",
                    "pageID": "e7bfbcf6fce9deee51d052478b35f62f",
                    "deltas": {
                        "addedImages": [
                            "dd8a6220-5758-4c6b-a63f-3bb1d98cd80d"
                        ],
                        "removedImages": [],
                        "removedItems": []
                    }
                }
            },
            {
                "type": "PAGE_LAST_UPDATE_CHANGED",
                "changes": {
                    "pageID": "e7bfbcf6fce9deee51d052478b35f62f",
                    "sectionId": "a225c6a9712ebbccfce6f3297029728d",
                    "pageLastUpdated": "20250316000143.820312",
                    "thumbnailUpdated": false,
                    "numBlankPages": 0
                }
            }
        ]
    }
}
```
## GetProjectSJson - spread : pages pair
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/getProjectAsJson?projectPK=37216&spread=b09d8b6f47f01965ec7e61e69a1dfb8c
Accept: application/json, text/plain, */*
```
### Response
```json
{
    "currentSection": "98693f5467f4b25f0a002e3a5a901a7a",
    "pageItems": {
        "841c0f4139a4a82d1215e8209fb9a2ab": {
            "pageID": "7935eb488247c974a6a09fa5973bcc73",
            "styles": [],
            "image_rotation": 0,
            "width": 0.78643578643579,
            "height": 0.54978354978355,
            "image_width": 0.78643578643579,
            "image_height": 0.54978354978355,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "graphicItem",
            "text": "",
            "positionX": 0.083694083694084,
            "positionY": 0.13997113997114,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "841c0f4139a4a82d1215e8209fb9a2ab",
            "filters": [
                {}
            ],
            "rotation": 0,
            "spineShift": 0
        },
        "e2dd1c891c287c5fbdc774f100b24979": {
            "pageID": "7935eb488247c974a6a09fa5973bcc73",
            "styles": [],
            "image_rotation": 0,
            "width": 0.78643578643579,
            "height": 0.067821067821068,
            "image_width": 0.78643578643579,
            "image_height": 0.067821067821068,
            "image_positionX": 0,
            "image_orientation": 0,
            "image_positionY": 0,
            "itemType": "richText",
            "text": "",
            "positionX": 0.085137085137085,
            "positionY": 0.71717171717172,
            "cornerID": "",
            "maskShape": "",
            "type": "N",
            "id": "e2dd1c891c287c5fbdc774f100b24979",
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
        "6e4f69b40acb439d734529c0cbee61f5": {
            "id": "6e4f69b40acb439d734529c0cbee61f5",
            "pageType": "C",
            "canAddCaption": true,
            "canAddImage": true,
            "canChangeLayout": true,
            "canMoveCaption": true,
            "canMoveImage": true,
            "canSetBackground": true,
            "layoutLocked": false,
            "ratio": 0.857291305853,
            "ratioBase": 1,
            "background": {
                "graphicItem": null,
                "color": 16777215
            },
            "pageItems": [],
            "dateLastModified": "20250315235448.703125",
            "lastModifiedBy": "97f6c1dc-a86a-4aa5-b7c8-c07626787339",
            "thumbnailURL": "https://webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com/16/372/37216/6e4f69b40acb439d734529c0cbee61f5.jpg",
            "pageNumber": [
                1
            ]
        },
        "7935eb488247c974a6a09fa5973bcc73": {
            "id": "7935eb488247c974a6a09fa5973bcc73",
            "pageType": "P",
            "canAddCaption": true,
            "canAddImage": true,
            "canChangeLayout": true,
            "canMoveCaption": true,
            "canMoveImage": true,
            "canSetBackground": true,
            "layoutLocked": false,
            "ratio": 0.857291305853,
            "ratioBase": 1,
            "background": {
                "graphicItem": null,
                "color": 16777215
            },
            "pageItems": [
                "841c0f4139a4a82d1215e8209fb9a2ab",
                "e2dd1c891c287c5fbdc774f100b24979"
            ],
            "currentLayout": "082c694e291e43819dd9c85a4fa0d42b",
            "dateLastModified": "20250315235449.191406",
            "lastModifiedBy": "97f6c1dc-a86a-4aa5-b7c8-c07626787339",
            "thumbnailURL": "https://webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com/16/372/37216/7935eb488247c974a6a09fa5973bcc73.jpg",
            "pageNumber": [
                2
            ]
        }
    },
    "project": {
        "projectPK": 37216,
        "projectID": "37686d55-994f-4ae2-8c5b-d76b111a84aa",
        "name": "PhotoBook zzMzcyMTY",
        "numPages": 20,
        "numImages": 0,
        "projectXMLVersion": 101,
        "captionVersion": 1,
        "spineCaptionVersion": 1,
        "createdDate": "2025-03-15 23:54:43",
        "modifiedDate": "2025-03-16 00:02:00.847656",
        "type": 0,
        "subtype": 24,
        "cover": "0",
        "theme": "",
        "style": 0,
        "ratio": 0.857291,
        "layoutsFixed": false,
        "lastModified": "20250316000200.847656",
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
                "a225c6a9712ebbccfce6f3297029728d": {
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
                "98693f5467f4b25f0a002e3a5a901a7a": {
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
        "projectAuthor": "Johan Tique",
        "thumbnailUrl": "https://webeditor-prod-storagesta-bucketsthumbimagebucket1-wyiazntcj8gp.s3.amazonaws.com/16/372/37216/e7bfbcf6fce9deee51d052478b35f62f.jpg",
        "pages": [
            "6e4f69b40acb439d734529c0cbee61f5",
            "7935eb488247c974a6a09fa5973bcc73"
        ],
        "product": {
            "size": "10x8",
            "description": "Photo Book",
            "pk": "PhotoBook-10x8-ImageWrap-Standard",
            "id": 24
        },
        "shareID": "6E6626D8-D871-4CF9-99AD-94C1009F8830"
    },
    "executionTime": 0.03156113624572754,
    "outerExecutionTime": 0.03711390495300293
}
```
## Adding a text "this is just a text"
```
:method: POST
:scheme: https
:authority: build.blurb.com
:path: /php-api/ZoomProjectChanges/update
Accept: application/json, text/plain, */*
```
```json
{
    "resultCode": 0,
    "result": {
        "changeRequestID": "70F03C54-7DF9-4DC9-9CBF-12B8B2CEF922",
        "changes": [
            {
                "type": "PAGE_ITEM_UPDATED",
                "changes": [
                    {
                        "styles": {},
                        "image_width": 12.908874799264732,
                        "image_rotation": 0,
                        "fill": "rgb(0,0,0)",
                        "width": 0.7864357864357902,
                        "height": 0.031266205313558025,
                        "pageID": "7935eb488247c974a6a09fa5973bcc73",
                        "showBackground": false,
                        "image_height": 1.113242413881544,
                        "image_positionX": 0,
                        "image_orientation": 0,
                        "image_positionY": -3.858518226710904,
                        "itemType": "richText",
                        "text": "this is just a text",
                        "positionX": 0.085137085137085,
                        "verticalAlign": "top",
                        "positionY": 0.71717171717172,
                        "fontSize": 16,
                        "cornerID": "",
                        "fontFamily": "Archivo",
                        "fontAlignment": null,
                        "maskShape": "",
                        "backgroundColor": null,
                        "textAlign": "left",
                        "maxChars": 0,
                        "type": "N",
                        "id": "e2dd1c891c287c5fbdc774f100b24979",
                        "filters": [
                            {}
                        ],
                        "rotation": 0,
                        "spineShift": 0,
                        "spellCheck": []
                    }
                ]
            },
            {
                "type": "PAGE_ITEM_UPDATED",
                "changes": [
                    {
                        "styles": {},
                        "image_width": 32.8067666097089,
                        "image_rotation": 0,
                        "fill": "rgb(0,0,0)",
                        "width": 0.7864357864357902,
                        "height": 0.031266205313558025,
                        "pageID": "7935eb488247c974a6a09fa5973bcc73",
                        "showBackground": false,
                        "image_height": 2.829207395699663,
                        "image_positionX": 0,
                        "image_orientation": 0,
                        "image_positionY": -9.806083713060925,
                        "itemType": "richText",
                        "text": "this is just a text",
                        "positionX": 0.085137085137085,
                        "verticalAlign": "top",
                        "positionY": 0.71717171717172,
                        "fontSize": 16,
                        "cornerID": "",
                        "fontFamily": "Archivo",
                        "fontAlignment": null,
                        "maskShape": "",
                        "backgroundColor": null,
                        "textAlign": "left",
                        "maxChars": 0,
                        "type": "N",
                        "id": "e2dd1c891c287c5fbdc774f100b24979",
                        "filters": [
                            {}
                        ],
                        "rotation": 0,
                        "spineShift": 0,
                        "spellCheck": []
                    }
                ]
            },
            {
                "type": "PAGE_LAST_UPDATE_CHANGED",
                "changes": {
                    "pageID": "7935eb488247c974a6a09fa5973bcc73",
                    "sectionId": "98693f5467f4b25f0a002e3a5a901a7a",
                    "pageLastUpdated": "20250316001233.468750",
                    "thumbnailUpdated": false,
                    "numBlankPages": 0
                }
            }
        ]
    }
}
```
# editor page - Uploading
## After clicking "add to cart"
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/validateCanUpload
Accept: application/json, text/plain, */*
```
```json
{
    "valid": true
}
```
## queueRendererJob

The `actionQueueRendererJob` method is responsible for creating a rendering job for a user's project. This is an important part of the production workflow for creating print-ready files from a user's project (likely a photo book or similar product).

Here's what this action does:

1. **Authentication and validation**:
   - Gets the current user's account information
   - Verifies the required `projectPK` (project primary key) parameter is provided
   - Confirms the project exists and belongs to the current user

2. **Creates a render job record**:
   ```php
   $rendererJob = new \Legacy\RenderJob();
   $rendererJob->createdAt = $now;
   $rendererJob->updatedAt = $now;
   $rendererJob->userProjectPK = $projectPK;
   $rendererJob->retries = 0;
   $rendererJob->status = "Q";  // "Q" means "Queued"
   $rendererJob->jobType = "order";
   // ...other properties...
   $rendererJob->save(false);
   ```

3. **Publishes the project**:
   - Calls `PicabooUtils::publishProject` which likely creates a snapshot/archive of the project in its current state

4. **Creates an ordered project record**:
   - Records a link between the render job and the project
   - Stores project metadata (XML representation, hash, page count, etc.)
   ```php
   $upo = new \Legacy\OrderedProject();
   $upo->orderNumber = $rendererJob->pk;
   $upo->userProjectPK = $projectPK;
   // ...store project data...
   $upo->save(false);
   ```

5. **Triggers processing**:
   - Calls `LambdaHelper::startRenderJob` to initiate processing
   - This likely triggers an AWS Lambda function to handle the actual rendering work

6. **Returns response**:
   - Returns a JSON response with the render job ID

Thus, the PDF (guts and cover) files are produced as part of the render job workflow. In summary:

- A render job is queued (via methods such as actionQueueRendererJob) which kicks off the rendering process on a separate rendering server (often triggered via LambdaHelper::startRenderJob). This renders the “guts” (content) and “cover” PDFs for the project.

- Once the PDFs have been generated and stored (typically on S3), the upload process (in actionUpload) takes over. This process calls BlurbyAPI::createProject and then BlurbyAPI::startBookUpload, finally invoking FileUploader::uploadTheFiles to upload the two PDF files (for “guts” and “cover”) to Blurby.

In short, the PDF creation occurs during the render job processing (triggered externally via Lambda or a dedicated rendering server), and the upload process simply packages and sends those generated PDF files onward.

```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/queueRendererJob?projectPK=37216&logo=white
Accept: application/json, text/plain, */*
newrelic: eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6Ijc1MDEiLCJhcCI6Ijc3MjM0MDI5NCIsImlkIjoiZDU4YWQyODgwODU1MTdmZCIsInRyIjoiNTdkMGZmNWEyOWE1MzA1OTVmMjFjNzA0ZjBkZGI3NGIiLCJ0aSI6MTc0MjA4NDM5OTc5Nn19
tracestate: 7501@nr=0-1-7501-772340294-d58ad288085517fd----1742084399796

Response
:status: 200
Content-Length: 19
Content-Type: application/json; charset=UTF-8
Date: Sun, 16 Mar 2025 00:20:00 GMT
Server: Apache/2.4.62 (Debian)
Via: 1.1 6d77342eb60c8ea96903996368766612.cloudfront.net (CloudFront)
x-amz-cf-id: zEz4m5jlR5TeJmVIeUdIl7v0eusLkTXRBWdM0kkcG6t3IMO2KYCn8Q==
x-amz-cf-pop: SFO53-C1
x-cache: Miss from cloudfront
x-powered-by: PHP/8.2.27
```
```json
{
    "renderJob": 15691
}
```
## userProject/upload

The `actionUpload` method is responsible for uploading rendered book files to a printing service called Blurby. This is part of the book production workflow after a render job has been created and the PDFs for the book have been generated.

Here's what this method does:

1. **Authentication and Validation**
- Takes a `$jobPK` parameter which identifies a specific render job
- Retrieves the corresponding `RenderJob` object from the database
- Gets the current user account and checks if they have a valid Blurby session ID
- Throws a 401 error if authentication fails

2. **Project Configuration**
- Creates a callback function to update the render job status during the process
- Retrieves the associated `Project` and `Product` details
- Collects specifications needed for printing:
  - Size (dimensions) of the book
  - Cover type (hardcover, softcover, etc.)
  - Paper type with appropriate mappings for Blurby's system
  - Page count, title, and author information

3. **Blurby Integration**
- Calls `BlurbyAPI::createProject()` to create a project in Blurby's system
- Updates the render job with the Blurby book GUID/ID
- Prepares a SKU string combining size, cover type, and paper type
- Initiates the book upload via `BlurbyAPI::startBookUpload()`
- Uses `FileUploader::uploadTheFiles()` to upload the PDF files to Blurby

4. **Status Updates & Response**
- Updates the render job status at each stage using the callback function
- Marks the job as:
  - 'P' (Progress) during processing steps
  - 'U' (Uploaded) when completed
  - 'F' (Failed) if an error occurs
- Returns a JSON response with the created project details or throws an error

This method is part of a complete book production workflow that starts with users designing books in the application and ends with physical printing by Blurby.
---
The `BlurbyAPI::startBookUpload()` retreives a JSON with this information (example)

```json
{
  "api_account": "account123",
  "id": "coll-001",
  "version": 3,
  "base_input_directory": "storage:abc/input/path",
  "base_output_directory": "storage:abc/output/path",
  "date_created": "2023-09-01T12:00:00Z",
  "date_version": "2023-09-02T08:00:00Z",
  "date_updated": "2023-09-02T10:00:00Z",
  "date_deleted": null,
  "status": "enqueued",
  "settings": {
    "defaultQuality": "high",
    "maxRetries": 3
  },
  "files": {
    "cover": {
      "src": "storage:pdfs:uploads/coll-001/original-cover.pdf",
      "from": "",
      "src_url": "https://example.com/signed-url-cover",
      "status": "ready",
      "size": 225155,
      "media_type": "application/pdf",
      "hash_md5": "abcde12345abcde12345abcde12345ab",
      "upload_info": null,
      "metadata": {
        "uploadedBy": "user123"
      },
      "upload": null,
      "storage": {
        "type": "s3",
        "location": {
          "bucket": "my-bucket",
          "path": "uploads/coll-001/original-cover.pdf"
        }
      }
    },
    "guts": {
      "src": "storage:pdfs:uploads/coll-001/original-guts.pdf",
      "from": "",
      "src_url": "https://example.com/signed-url-guts",
      "status": "ready",
      "size": 5475529,
      "media_type": "application/pdf",
      "hash_md5": "12345abcde12345abcde12345abcde123",
      "upload_info": {
        "type": "upload-service-v2",
        "chunk_upload_url": null,
        "finish_file_url": "http://api.example.com/finish-file",
        "upload_url": null,
        "multipart_upload": {
          "upload_id": "upload123",
          "part_size": 5242880,
          "parts": [
            "https://example.com/chunk1",
            "https://example.com/chunk2"
          ]
        },
        "file_id": "file-001"
      },
      "metadata": {
        "uploadedBy": "user456",
        "description": "Guts file uploaded"
      },
      "upload": {
        "type": "upload-service",
        "target_filename": "original-guts.pdf",
        "size": 5475529,
        "media_type": "application/pdf"
      },
      "storage": {
        "type": "s3",
        "location": {
          "bucket": "my-bucket",
          "path": "uploads/coll-001/original-guts.pdf"
        }
      }
    }
  },
  "metadata": {
    "category": "reports",
    "region": "us-east-1"
  },
  "notify": {
    "email": {
      "recipient": "notify@example.com",
      "event": "upload_complete"
    }
  },
  "ops": {
    "op1": {
      "type": "rasterize",
      "input": {
        "cover": {
          "src": "storage:pdfs:uploads/coll-001/original-cover.pdf",
          "status": "ready",
          "media_type": "application/pdf"
        }
      },
      "notify": {
        "sms": {
          "recipient": "+1234567890",
          "event": "processing_done"
        }
      },
      "output_filenames": {
        "page1": "output_page1.pdf"
      },
      "settings": {
        "bitmap_height": 600
      },
      "status": "awaiting-input"
    }
  },
  "apply": "preflight-and-preview",
  "payload": {
    "extra": "data"
  },
  "reprocess": [
    "template-basic"
  ],
  "event": "collection_created",
  "url": "http://api.example.com/collections/coll-001",
  "audit_info": {
    "changedBy": "system",
    "changeDate": "2023-09-02T10:00:00Z"
  }
}
```

The inner `uploadTheFiles` method orchestrates the upload process for two PDF files (typically the "guts" and cover PDFs) as part of a multi-part upload to an S3 bucket. It does this by:

- It extracts the files object, which contains both a cover and guts file.
- It sends a progress callback indicating the start of the upload for the "guts" file, then calls uploadFile with the guts file data (which—in this JSON—has an upload_info object defined containing URLs like finish_file_url and multipart details).
- It then updates progress with a callback for the "cover" file and similarly calls uploadFile for the cover file.
- Within uploadFile, it opens a stream to the file stored in the S3 bucket (using the bucket name from the application settings), reads the file in 5MB chunks, and maps each chunk to a corresponding part defined in the file’s `upload_info->multipart_upload.`
- For each chunk, it uploads the part by calling uploadFilePart (which issues an HTTP PUT to the part’s upload URL and records the ETag).
- Once all parts are processed, it finalizes the upload by calling markAsFinished with a JSON payload that includes the file ID, upload ID, and the details of all parts. This tells the external upload service that the file is fully uploaded.

In summary, given the JSON provided, uploadTheFiles takes the uploaded files’ metadata and content, splits them into parts, uploads each part to S3, and then finalizes the upload process via an HTTP request.

The extra step `uploadTheFiles` is there to finalize a multi‐part upload. In our case (and many cloud storage APIs like S3), a large file is broken into chunks that are uploaded separately. After all parts are uploaded, the client must explicitly “mark the upload as finished” (by calling markAsFinished) so the system can commit or assemble the parts into a single file.

> **ASSUMPTION** Blurby doesn’t do that automatically because:
>
> • It leaves the control to our client code to handle retries and error checking for individual parts.
> • The multi‐part upload process is designed to allow granular control over large uploads (for example, re-uploading a failed chunk without resending the entire file).
> • Finalization is generally managed at the client side (or by the middleware) so that if any part fails, you have the opportunity to fix it before the file is committed.
>
> This design gives flexibility and robustness for handling large file uploads.

```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/upload?jobPK=15691
Accept: application/json, text/plain, */*
newrelic: eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6Ijc1MDEiLCJhcCI6Ijc3MjM0MDI5NCIsImlkIjoiOGQ0MmJjZDFiYTgxNmRmZCIsInRyIjoiMjE5ZGJlNTQyZWYwZGQxOTNmMjNiZTcwMzMxM2I5ZWIiLCJ0aSI6MTc0MjA4NDQxODE5OX19
tracestate: 7501@nr=0-1-7501-772340294-8d42bcd1ba816dfd----1742084418199

Response
:status: 200
Content-Length: 115
Content-Type: application/json; charset=UTF-8
Date: Sun, 16 Mar 2025 00:20:26 GMT
Server: Apache/2.4.62 (Debian)
Via: 1.1 6d77342eb60c8ea96903996368766612.cloudfront.net (CloudFront)
x-amz-cf-id: vQgLew4fouu88MHR_g_DmtG1eVoDb3bqOm5ScvI95t1LSj3kvlCxLg==
x-amz-cf-pop: SFO53-C1
x-cache: Miss from cloudfront
x-powered-by: PHP/8.2.27
```
```json
{
    "book_id": 12359819,
    "book_guid": "P17748856",
    "cover_design_guid": "CP14418391",
    "project_id": 12470454,
    "uploaded": true
}
```
## userProject/uploadStatus
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/uploadStatus?jobPK=15691
Accept: application/json, text/plain, */*

Response
:status: 200
Content-Type: application/json; charset=UTF-8
Date: Sun, 16 Mar 2025 00:20:26 GMT
Server: Apache/2.4.62 (Debian)
Via: 1.1 6d77342eb60c8ea96903996368766612.cloudfront.net (CloudFront)
x-amz-cf-id: tVjscgqwl5ILjBwtfUv8yGqUUy2RqduAyqFq-KozTHYJ22XltYMhjA==
x-amz-cf-pop: SFO53-C1
x-cache: Miss from cloudfront
x-powered-by: PHP/8.2.27
```
```json
{
    "api_account": "blurb",
    "id": "P17748856",
    "version": 1,
    "base_output_directory": "storage:pdfs:blurb/P17748856/",
    "date_created": "2025-03-16T00:20:20.482Z",
    "date_version": "2025-03-16T00:20:20.482Z",
    "date_updated": "2025-03-16T00:20:20.482Z",
    "status": "success", # awaiting-input, processing, success
    "lifecycle": {
        "state": "active",
        "state_status": "ok"
    },
    "settings": {
        "blurb_product_id": "standard_landscape-imagewrap-standard_paper"
    },
    "files": {
        "cover": {
            "src": "storage:pdfs:blurb/P17748856/15691_cover.pdf",
            "collection_version": 0,
            "status": "ready",
            "storage_class": "normal",
            "size": 2445374,
            "media_type": "application/pdf",
            "ready": true
        },
        "guts": {
            "src": "storage:pdfs:blurb/P17748856/15691_guts.pdf",
            "collection_version": 0,
            "status": "ready",
            "storage_class": "normal",
            "size": 583061,
            "media_type": "application/pdf",
            "ready": true
        }
    },
    "notify": {
        "blurby": {
            "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17748856?event=collection_success&api_key=OT12Xn3B1mkdfsb04F1C",
            "events": [
                "success"
            ],
            "include": [
                "src_url"
            ]
        }
    },
    "ops": {
        "cover_preview": {
            "priority": 100,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                },
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "preview/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 509246,
                    "media_type": "application/pdf",
                    "hash_md5": "651bfdf243125fd9de40f8c7d2fa130d",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 587,
                        "height": 524
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 390511,
                    "media_type": "application/pdf",
                    "hash_md5": "0d6ff9b238a3940584c1593bc292d9c4",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 587,
                        "height": 524
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1636,
                    "media_type": "application/pdf",
                    "hash_md5": "389809dc9cf28cb37877939d5114a57e",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 587,
                        "height": 524
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1636,
                    "media_type": "application/pdf",
                    "hash_md5": "389809dc9cf28cb37877939d5114a57e",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 587,
                        "height": 524
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 945488,
                    "media_type": "application/pdf",
                    "hash_md5": "66222dd3597543f83d6975076de294a4",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 1200,
                        "height": 524
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1106,
                    "media_type": "application/pdf",
                    "hash_md5": "ea5710ef46f4f0234fe68613a6405468",
                    "metadata": {
                        "segment": "spine",
                        "width": 27,
                        "height": 524
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.573Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 1200,
                "bitmap_height": 600,
                "force_inside_covers": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428195
                }
            },
            "execution_type": "aws_lambda"
        },
        "cover_preview_300dpi": {
            "priority": 200,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                },
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "preview_300dpi/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_300dpi/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9568115,
                    "media_type": "application/pdf",
                    "hash_md5": "0ed57a9a99b250e78f531d3c360e0df5",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 2930,
                        "height": 2515
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_300dpi/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7165910,
                    "media_type": "application/pdf",
                    "hash_md5": "9242416aca746caa1c1204e1b09c128a",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 2930,
                        "height": 2515
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_300dpi/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 26938,
                    "media_type": "application/pdf",
                    "hash_md5": "3f193dd4da3197998d4f1911abef2017",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 2930,
                        "height": 2515
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_300dpi/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 26938,
                    "media_type": "application/pdf",
                    "hash_md5": "3f193dd4da3197998d4f1911abef2017",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 2930,
                        "height": 2515
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_300dpi/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 18100344,
                    "media_type": "application/pdf",
                    "hash_md5": "95a8f40966adc74281ef5368cc24bbfe",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 5997,
                        "height": 2515
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_300dpi/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11859,
                    "media_type": "application/pdf",
                    "hash_md5": "3b955f42e6e560ac7f235c436a4e8cf2",
                    "metadata": {
                        "segment": "spine",
                        "width": 138,
                        "height": 2515
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.559Z",
            "version": 1,
            "settings": {
                "image_quality": 85,
                "area": "trim-no-fold",
                "bitmap_dpi": 300,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428178
                }
            },
            "execution_type": "aws_lambda"
        },
        "cover_preview_72dpi": {
            "priority": 130,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                },
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "preview_72dpi/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_72dpi/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 723070,
                    "media_type": "application/pdf",
                    "hash_md5": "e8ce407501608c765086c3f8279c7490",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 704,
                        "height": 604
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_72dpi/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 558630,
                    "media_type": "application/pdf",
                    "hash_md5": "44da903e6a232ecfc8a7a3276b56286c",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 704,
                        "height": 604
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_72dpi/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2153,
                    "media_type": "application/pdf",
                    "hash_md5": "d7a5d1961b1914a4957edd6e5167c06a",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 704,
                        "height": 604
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_72dpi/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2153,
                    "media_type": "application/pdf",
                    "hash_md5": "d7a5d1961b1914a4957edd6e5167c06a",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 704,
                        "height": 604
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_72dpi/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1381215,
                    "media_type": "application/pdf",
                    "hash_md5": "0ad2a430c2a236162c51eb241a48a26e",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 1440,
                        "height": 604
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17748856/cover_preview_72dpi/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1344,
                    "media_type": "application/pdf",
                    "hash_md5": "13c0f7de6a7624e782d88894e9ca7105",
                    "metadata": {
                        "segment": "spine",
                        "width": 33,
                        "height": 604
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.597Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 72,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428220
                }
            },
            "execution_type": "aws_lambda"
        },
        "cover_thumbnails": {
            "priority": 140,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                },
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "thumbnails/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_thumbnails/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 12054,
                    "media_type": "application/pdf",
                    "hash_md5": "3112f5b9f6a4500e53c88435b340be48",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 78,
                        "height": 70
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_thumbnails/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9499,
                    "media_type": "application/pdf",
                    "hash_md5": "7ee2fe60e59ed67344a99764336e4c7b",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 78,
                        "height": 70
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_thumbnails/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 145,
                    "media_type": "application/pdf",
                    "hash_md5": "78c5f956b78a82052ee640bd7058fcd7",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 78,
                        "height": 70
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_thumbnails/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 145,
                    "media_type": "application/pdf",
                    "hash_md5": "78c5f956b78a82052ee640bd7058fcd7",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 78,
                        "height": 70
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17748856/cover_thumbnails/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 21954,
                    "media_type": "application/pdf",
                    "hash_md5": "4915d7a8542fbd53a81ae5ea4a1b57b1",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 160,
                        "height": 70
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17748856/cover_thumbnails/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 77,
                    "media_type": "application/pdf",
                    "hash_md5": "2818f8c07d8e8075ce77a6191b450084",
                    "metadata": {
                        "segment": "spine",
                        "width": 4,
                        "height": 70
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.535Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 160,
                "bitmap_height": 75,
                "force_inside_covers": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428149
                }
            },
            "execution_type": "aws_lambda"
        },
        "cover_thumbnails_18dpi": {
            "priority": 110,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17748856/autofixed-cover.pdf",
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2446840,
                    "media_type": "application/pdf",
                    "hash_md5": "51bbfb8a5009afce9a1e72c844b511eb",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17748856/autofixed-guts.pdf",
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 588433,
                    "media_type": "application/pdf",
                    "hash_md5": "af04b189bd7dfd6c64d33aff18fa2b60",
                    "ready": true
                }
            },
            "output_filename_schema": "thumbnails_18dpi/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/cover-trim-no-fold-back_cover-a042050a-2561-4a5e-92e6-5486adae8d34.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7853,
                    "media_type": "image/jpeg",
                    "hash_md5": "84eab6bd1912e1fc9f446f1314663fef",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 176,
                        "height": 151
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/cover-trim-no-fold-front_cover-a1ae0f5b-93d4-4466-b7dd-aabe6e5650ee.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6148,
                    "media_type": "image/jpeg",
                    "hash_md5": "dba05d88f1815e833de8fcb0a49127f7",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 176,
                        "height": 151
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/cover-trim-no-fold-inside_back_cover-946ba4c0-2833-43e8-96a3-f4e58c2c08d8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 597,
                    "media_type": "image/jpeg",
                    "hash_md5": "8d7bfc31c96906b235d8d712bad58e28",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 176,
                        "height": 151
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/cover-trim-no-fold-inside_front_cover-1eb77828-bc9a-4e6f-a1ad-9125aeeebed6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 597,
                    "media_type": "image/jpeg",
                    "hash_md5": "8d7bfc31c96906b235d8d712bad58e28",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 176,
                        "height": 151
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/cover-trim-no-fold-outside_full_cover-162a9ae1-aed6-4f52-ba0d-d0d80b7c5fb5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 13869,
                    "media_type": "image/jpeg",
                    "hash_md5": "847a22830e8911fe5a943c0bee2c40be",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 360,
                        "height": 151
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/cover-trim-no-fold-spine-b7b0ed9b-b964-4dfd-a876-4f89e8ce48a5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 352,
                    "media_type": "image/jpeg",
                    "hash_md5": "94b16244bf176d58f21298b1df8e79b1",
                    "metadata": {
                        "segment": "spine",
                        "width": 8,
                        "height": 151
                    },
                    "ready": true
                }
            },
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17748856?event=upload&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:24.128Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 18,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "execution_type": "local"
        },
        "guts_preview": {
            "priority": 120,
            "type": "rasterize",
            "input": {
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "preview/${file_key}-${area}-${uuid}.${ext}",
            "output": {
                "guts_page_1": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4165,
                    "media_type": "application/pdf",
                    "hash_md5": "e47dbfea59c9d53b34d1318d4f05e5a4",
                    "metadata": {
                        "page": 1,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 10,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 11,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 12,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 13,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 14,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 15,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 16,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 17,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 18,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 19,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 2,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 20,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 3,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 4,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 5,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 6,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 7,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 8,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17748856/preview/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1624,
                    "media_type": "application/pdf",
                    "hash_md5": "79b7190b5b13ed18eb9adbd448261830",
                    "metadata": {
                        "page": 9,
                        "width": 600,
                        "height": 514
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.582Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 600,
                "bitmap_height": 600,
                "force_inside_covers": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428204
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_preview_300dpi": {
            "priority": 400,
            "type": "rasterize",
            "input": {
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "preview_300dpi/${file_key}-${area}-${uuid}.${ext}",
            "output": {
                "guts_page_1": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 44577,
                    "media_type": "application/pdf",
                    "hash_md5": "88c3a145fe053f7f1bf5f6c2a06b04fd",
                    "metadata": {
                        "page": 1,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 10,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 11,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 12,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 13,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 14,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 15,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 16,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 17,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 18,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 19,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 2,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 20,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 3,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 4,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 5,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 6,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 7,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 8,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17748856/preview_300dpi/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 25403,
                    "media_type": "application/pdf",
                    "hash_md5": "57b695ce70c7b8f99bef809cb3761726",
                    "metadata": {
                        "page": 9,
                        "width": 2850,
                        "height": 2400
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.566Z",
            "version": 1,
            "settings": {
                "image_quality": 85,
                "area": "trim-no-fold",
                "bitmap_dpi": 300,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428187
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_preview_72dpi": {
            "priority": 300,
            "type": "rasterize",
            "input": {
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "preview_72dpi/${file_key}-${area}-${uuid}.${ext}",
            "output": {
                "guts_page_1": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 5156,
                    "media_type": "application/pdf",
                    "hash_md5": "db52f3584aedc01d7fc9d17ecfcbfcd2",
                    "metadata": {
                        "page": 1,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 10,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 11,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 12,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 13,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 14,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 15,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 16,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 17,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 18,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 19,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 2,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 20,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 3,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 4,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 5,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 6,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 7,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 8,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17748856/preview_72dpi/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2023,
                    "media_type": "application/pdf",
                    "hash_md5": "0dfa9b6bd027f2affcf684e6d4eec058",
                    "metadata": {
                        "page": 9,
                        "width": 684,
                        "height": 576
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.544Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 72,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428160
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_thumbnails": {
            "priority": 150,
            "type": "rasterize",
            "input": {
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "thumbnails/${file_key}-${area}-${uuid}.${ext}",
            "output": {
                "guts_page_1": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 281,
                    "media_type": "application/pdf",
                    "hash_md5": "2516f9f264b9518313b77333df9b45fe",
                    "metadata": {
                        "page": 1,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 10,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 11,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 12,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 13,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 14,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 15,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 16,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 17,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 18,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 19,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 2,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 20,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 3,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 4,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 5,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 6,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 7,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 8,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "843b0be0902cb9c7df1adab246beb8f7",
                    "metadata": {
                        "page": 9,
                        "width": 80,
                        "height": 69
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.552Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 80,
                "bitmap_height": 75,
                "force_inside_covers": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428170
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_thumbnails_18dpi": {
            "priority": 160,
            "type": "rasterize",
            "input": {
                "guts": {
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "awaiting-input",
                    "storage_class": "normal",
                    "ready": false
                }
            },
            "output_filename_schema": "thumbnails_18dpi/${file_key}-${area}-${uuid}.${ext}",
            "output": {
                "guts_page_1": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 780,
                    "media_type": "application/pdf",
                    "hash_md5": "449db4bbb3fd3ec5fdb2ac22b2511508",
                    "metadata": {
                        "page": 1,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 10,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 11,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 12,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 13,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 14,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 15,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 16,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 17,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 18,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 19,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 2,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 20,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 3,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 4,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 5,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 6,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 7,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 8,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17748856/thumbnails_18dpi/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316,
                    "media_type": "application/pdf",
                    "hash_md5": "bac2576940dc64d60009bd9c531ec75e",
                    "metadata": {
                        "page": 9,
                        "width": 171,
                        "height": 144
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:42.589Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 18,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "report": {
                "remote_execution": {
                    "src_upload_duration": 0,
                    "temp_file_to_be_deleted": "",
                    "invoke_time": 1742084428212
                }
            },
            "execution_type": "aws_lambda"
        },
        "preflight": {
            "type": "blurb-preflight",
            "input": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17748856/15691_cover.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "size": 2445374,
                    "media_type": "application/pdf",
                    "hash_md5": "15eaf726afdcb0474a507f7213232738",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17748856/15691_guts.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "size": 583061,
                    "media_type": "application/pdf",
                    "hash_md5": "9e2c910b01d811bd1c676e8c35f2859e",
                    "ready": true
                }
            },
            "input_set": "collection.files",
            "output": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17748856/autofixed-cover.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2446840,
                    "media_type": "application/pdf",
                    "hash_md5": "51bbfb8a5009afce9a1e72c844b511eb",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17748856/autofixed-guts.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 588433,
                    "media_type": "application/pdf",
                    "hash_md5": "af04b189bd7dfd6c64d33aff18fa2b60",
                    "ready": true
                },
                "report": {
                    "src": "storage:pdfs:blurb/P17748856/preflight-report.json",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6279,
                    "media_type": "application/json",
                    "hash_md5": "0ba0c44b7a2e3d3e495265b088695e76",
                    "ready": true
                }
            },
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17748856?event=preflight&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                },
                "bookserve": {
                    "uri": "http://bookserve.blurb.com/axis/PdfProcessingCallbackServlet?guid=P17748856&op=preflight",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-16T00:20:24.128Z",
            "version": 1,
            "settings": {
                "autofix": true,
                "extract_pdf_metadata": true
            },
            "report": {
                "pdf_metadata": [
                    {
                        "file_type": "Cover",
                        "author": "",
                        "title": "",
                        "pdf_producer": "pdf-lib (https://github.com/Hopding/pdf-lib)",
                        "application": "pdf-lib (https://github.com/Hopding/pdf-lib)",
                        "keywords": "",
                        "date_created": "2025-03-16T00:20:17Z",
                        "date_modified": "2025-03-16T00:20:17Z",
                        "subject": "",
                        "pdf_version": "1.7",
                        "page_count": 1
                    },
                    {
                        "file_type": "Pages",
                        "author": "",
                        "title": "",
                        "pdf_producer": "pdf-lib (https://github.com/Hopding/pdf-lib)",
                        "application": "pdf-lib (https://github.com/Hopding/pdf-lib)",
                        "keywords": "",
                        "date_created": "2025-03-16T00:20:17Z",
                        "date_modified": "2025-03-16T00:20:17Z",
                        "subject": "",
                        "pdf_version": "1.7",
                        "page_count": 20
                    }
                ],
                "product_type": {
                    "id": "standard_landscape-imagewrap-standard_paper",
                    "book_id": "standard_landscape",
                    "name": "Standard Landscape 10x8 in 25x20 cm",
                    "page_width_post_trim": 684,
                    "page_height_post_trim": 576,
                    "page_bleeds": {
                        "inside": 0,
                        "outside": 9,
                        "top": 9,
                        "bottom": 9
                    },
                    "safe_zone": {
                        "inside": 45,
                        "outside": 18,
                        "top": 18,
                        "bottom": 18
                    },
                    "cover_pages": "outside-only",
                    "book_product": "photobook",
                    "cover_type": "imagewrap",
                    "paper_type_id": "standard_paper",
                    "min_page_count": 20,
                    "max_page_count": 440,
                    "page_count_mod": 2,
                    "page_width_pre_trim": 693,
                    "page_height_pre_trim": 594
                },
                "issues": [
                    {
                        "severity": "Error",
                        "message": "Page 1: Expected page size is 20.597 in by 8.993 in, but it is actually 21.373 in by 8.99 in.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "pages": {
                                    "strings": {
                                        "page_number": "1"
                                    },
                                    "messages": {},
                                    "key": "preflight.page",
                                    "count": null
                                },
                                "issue": {
                                    "strings": {
                                        "expected_height_inches": "8.993 in",
                                        "actual_height_inches": "8.99 in",
                                        "actual_width_inches": "21.373 in",
                                        "expected_width_inches": "20.597 in"
                                    },
                                    "messages": {},
                                    "key": "preflight.invalid_page_size",
                                    "count": null
                                }
                            },
                            "string": "{{pages}}: {{issue}}"
                        },
                        "file_type": "Cover"
                    },
                    {
                        "severity": "Error",
                        "message": "Page 1: Image with non perceptual rendering intent detected.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "pages": {
                                    "strings": {
                                        "page_number": "1"
                                    },
                                    "messages": {},
                                    "key": "preflight.page",
                                    "count": null
                                },
                                "issue": {
                                    "strings": {},
                                    "messages": {},
                                    "key": "preflight.image_non_perceptual_rendering_intent_detected",
                                    "count": null
                                }
                            },
                            "string": "{{pages}}: {{issue}}"
                        },
                        "file_type": "Cover"
                    },
                    {
                        "severity": "Error",
                        "message": "Pages 1-20: Image with non perceptual rendering intent detected.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "pages": {
                                    "strings": {
                                        "page_ranges": "1-20"
                                    },
                                    "messages": {},
                                    "key": "preflight.pages_range",
                                    "count": null
                                },
                                "issue": {
                                    "strings": {},
                                    "messages": {},
                                    "key": "preflight.image_non_perceptual_rendering_intent_detected",
                                    "count": null
                                }
                            },
                            "string": "{{pages}}: {{issue}}"
                        },
                        "file_type": "Pages"
                    }
                ],
                "valid": true,
                "preflight_version": 3,
                "autofixed": true,
                "cover_extracted": false,
                "autofixes_applied": [
                    {
                        "message": "Page 1: Fixing image.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "fix": {
                                    "strings": {},
                                    "messages": {},
                                    "key": "autofix.fix_images",
                                    "count": null
                                },
                                "page": {
                                    "strings": {
                                        "page_number": "1"
                                    },
                                    "messages": {},
                                    "key": "preflight.page",
                                    "count": null
                                }
                            },
                            "string": "{{page}}: {{fix}}"
                        },
                        "file_type": "Cover"
                    },
                    {
                        "message": "Page 1: Resize the page to 20.597 in by 8.993 in.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "fix": {
                                    "strings": {
                                        "new_width_inches": "20.597 in",
                                        "new_height_inches": "8.993 in"
                                    },
                                    "messages": {},
                                    "key": "autofix.page_resize",
                                    "count": null
                                },
                                "page": {
                                    "strings": {
                                        "page_number": "1"
                                    },
                                    "messages": {},
                                    "key": "preflight.page",
                                    "count": null
                                }
                            },
                            "string": "{{page}}: {{fix}}"
                        },
                        "file_type": "Cover"
                    },
                    {
                        "message": "Pages 1-20: Fixing image.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "fix": {
                                    "strings": {},
                                    "messages": {},
                                    "key": "autofix.fix_images",
                                    "count": null
                                },
                                "page": {
                                    "strings": {
                                        "page_ranges": "1-20"
                                    },
                                    "messages": {},
                                    "key": "preflight.pages_range",
                                    "count": null
                                }
                            },
                            "string": "{{page}}: {{fix}}"
                        },
                        "file_type": "Pages"
                    }
                ],
                "cover_dimensions": {
                    "page_count": 20,
                    "spec_bleeds": {
                        "left": 22,
                        "right": 22,
                        "top": 22,
                        "bottom": 22
                    },
                    "safe_zone": {
                        "left": 18,
                        "right": 18,
                        "top": 18,
                        "bottom": 18
                    },
                    "content_areas": {
                        "main_content": {
                            "left": 22,
                            "right": 1461,
                            "top": 625.5,
                            "bottom": 22,
                            "empty": false,
                            "dimensions": {
                                "width": 1439,
                                "height": 603.5
                            },
                            "width": 1439,
                            "height": 603.5
                        },
                        "left_main_content": {
                            "left": 22,
                            "right": 725,
                            "top": 625.5,
                            "bottom": 22,
                            "empty": false,
                            "dimensions": {
                                "width": 703,
                                "height": 603.5
                            },
                            "width": 703,
                            "height": 603.5
                        },
                        "right_main_content": {
                            "left": 758,
                            "right": 1461,
                            "top": 625.5,
                            "bottom": 22,
                            "empty": false,
                            "dimensions": {
                                "width": 703,
                                "height": 603.5
                            },
                            "width": 703,
                            "height": 603.5
                        },
                        "spine_content": {
                            "left": 725,
                            "right": 758,
                            "top": 625.5,
                            "bottom": 22,
                            "empty": false,
                            "dimensions": {
                                "width": 33,
                                "height": 603.5
                            },
                            "width": 33,
                            "height": 603.5
                        },
                        "main_content_pre_trim": {
                            "left": 0,
                            "right": 1483,
                            "top": 647.5,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 1483,
                                "height": 647.5
                            },
                            "width": 1483,
                            "height": 647.5
                        },
                        "left_main_pre_trim": {
                            "left": 0,
                            "right": 725,
                            "top": 647.5,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 725,
                                "height": 647.5
                            },
                            "width": 725,
                            "height": 647.5
                        },
                        "right_main_pre_trim": {
                            "left": 758,
                            "right": 1483,
                            "top": 647.5,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 725,
                                "height": 647.5
                            },
                            "width": 725,
                            "height": 647.5
                        },
                        "spine_pre_trim": {
                            "left": 725,
                            "right": 758,
                            "top": 647.5,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 33,
                                "height": 647.5
                            },
                            "width": 33,
                            "height": 647.5
                        },
                        "isbn_placeholder": {
                            "left": 310.5,
                            "right": 436.5,
                            "top": 139,
                            "bottom": 67,
                            "empty": false,
                            "dimensions": {
                                "width": 126,
                                "height": 72
                            },
                            "width": 126,
                            "height": 72
                        },
                        "left_flap_content": null,
                        "right_flap_content": null,
                        "left_flap_pre_trim": null,
                        "right_flap_pre_trim": null,
                        "left_flap_content_without_folding_edge": null,
                        "right_flap_content_without_folding_edge": null,
                        "left_flap_pre_trim_without_folding_edge": null,
                        "right_flap_pre_trim_without_folding_edge": null
                    },
                    "imagewrap_width": 1603,
                    "post_trim_width": 1439,
                    "post_trim_height": 603.5,
                    "pre_trim_width": 1483,
                    "pre_trim_height": 647.5
                },
                "guts_dimensions": {
                    "bleeds": {
                        "inside": 0,
                        "outside": 9,
                        "top": 9,
                        "bottom": 9
                    },
                    "safe_zone": {
                        "inside": 45,
                        "outside": 18,
                        "top": 18,
                        "bottom": 18
                    },
                    "content_areas": {
                        "odd_page_content": {
                            "left": 9,
                            "right": 693,
                            "top": 585,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 684,
                                "height": 576
                            },
                            "width": 684,
                            "height": 576
                        },
                        "even_page_content": {
                            "left": 0,
                            "right": 684,
                            "top": 585,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 684,
                                "height": 576
                            },
                            "width": 684,
                            "height": 576
                        }
                    },
                    "post_trim_width": 684,
                    "post_trim_height": 576,
                    "pre_trim_width": 693,
                    "pre_trim_height": 594
                }
            },
            "execution_type": "local"
        }
    },
    "book_url": "https://www.blurb.com/my/book/transactional_detail/12359819?ref=WZQXGCYNFHLYsyhHxq58&token=09c26a7c60ee756961fd21c624b9e35ea3ebe676",
    "book_has_isbn": false
}
```
