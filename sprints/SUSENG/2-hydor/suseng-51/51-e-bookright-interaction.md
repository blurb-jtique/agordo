# First interaction

https://www.blurb.com/projects/12466954/provide_isbns?first_visit=true

https://www.blurb.com/projects/12466954/upload_complete?first_visit=true?first_visit=undefined

https://www.blurb.com/projects/12466954/add_to_cart

https://www.blurb.com/b/12356327-alpha-notebook

https://www.blurb.com/admin/product/swearch/show/12356327

https://build.blurb.com/editor/MzY1NTc= / project id 36557

MTg3NTE=

---

# Photobook zz2MzY5MDc

https://build.blurb.com/editor/2MzY5MDc=

```json
{
    "book_id": 12358280,
    "book_guid": "P17747308",
    "cover_design_guid": "CP14416845",
    "project_id": 12468913,
    "uploaded": true
}
```

---

# Gamma Photobook zzMTk5MTU
MTk5MTU=
Gamma Photobook zzMTk5MTU - project id: 19915

**After uploading**
@bookserve_id="P17746137", @booksmart_version="Web Editor", @cover_design_guid="CP14415677

## queueRenderJob
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/queueRendererJob?projectPK=19915&logo=custom
Accept: application/json, text/plain, */*
optimizelySession=0; ua=cmvscsfgfssbm
Host: build.blurb.com
newrelic: eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6Ijc1MDEiLCJhcCI6Ijc3MjM0MDI5NCIsImlkIjoiMzMyMzM4N2UwMzgwZjY0ZiIsInRyIjoiZmJmZDU2ZThhZWQxMGIxNTQzMDEzNWM1YzE5NDA1YWMiLCJ0aSI6MTc0MTg2NDkxNDc2Mn19
Referer: https://build.blurb.com/editor/MTk5MTU=
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: cors
Sec-Fetch-Site: same-origin
traceparent: 00-fbfd56e8aed10b15430135c5c19405ac-3323387e0380f64f-01
tracestate: 7501@nr=0-1-7501-772340294-3323387e0380f64f----1741864914762
```
{
    "renderJob": 15445
}

## Upload
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/upload?jobPK=15445
Accept: application/json, text/plain, */*
Host: build.blurb.com
newrelic: eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6Ijc1MDEiLCJhcCI6Ijc3MjM0MDI5NCIsImlkIjoiMDg1MGU3NzNjODI0MTg3NiIsInRyIjoiMGM4NDVlOTU1NTUyOWRlZDE1NGFjZDJjYWE3NmQwYzkiLCJ0aSI6MTc0MTg2NDkzMjA5NX19
Referer: https://build.blurb.com/editor/MTk5MTU=
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: cors
Sec-Fetch-Site: same-origin
traceparent: 00-0c845e9555529ded154acd2caa76d0c9-0850e773c8241876-01
tracestate: 7501@nr=0-1-7501-772340294-0850e773c8241876----1741864932095
```

```json
{
    "book_id": 12357124,
    "book_guid": "P17746137",
    "cover_design_guid": "CP14415677",
    "project_id": 12467752,
    "uploaded": true
}
```

## First Upload Status
```
:method: GET
:scheme: https
:authority: build.blurb.com
:path: /php-api/userProject/uploadStatus?jobPK=15445
Accept: application/json, text/plain, */*
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9
```

```json
{
    "api_account": "blurb",
    "id": "P17746137",
    "version": 1,
    "base_output_directory": "storage:pdfs:blurb/P17746137/",
    "date_created": "2025-03-13T11:22:13.113Z",
    "date_version": "2025-03-13T11:22:13.113Z",
    "date_updated": "2025-03-13T11:22:13.113Z",
    "status": "awaiting-input",
    "lifecycle": {
        "state": "active",
        "state_status": "ok"
    },
    "settings": {
        "blurb_product_id": "small_square-softcover-premium_lustre_paper"
    },
    "files": {
        "cover": {
            "src": "storage:pdfs:blurb/P17746137/15445_cover.pdf",
            "collection_version": 0,
            "status": "awaiting-transfer",
            "storage_class": "normal",
            "size": 1232150,
            "media_type": "application/pdf",
            "upload_info": {
                "type": "upload-service-v2",
                "finish_file_url": "https://upload-service.builder.blurb.com/collection/collection_b4e38f98-51a2-4330-9a9a-2e18516ab64f/complete-file",
                "multipart_upload": {
                    "key": "default/blurb/P17746137/15445_cover.pdf",
                    "parts": [
                        {
                            "part_number": 1,
                            "upload_url": "https://blurb-pdf-processing-service-prod-preflight.s3.us-west-2.amazonaws.com/default/blurb/P17746137/15445_cover.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA2PCQKJ6L4FTTJQGQ%2F20250313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250313T112215Z&X-Amz-Expires=259200&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDZ6zFqnp%2FcSpajJKinYuRqvWod%2B2ZOdWd1emOaA%2FTD1AiBxv6bzfZaoc7iNWvhyDt7mCwDVuUx9rncYma7853%2BlYyquAwjV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAQaDDcxOTU3NTQ2OTk3NSIMajAAFswkmIloRGLrKoIDCWeAVBqk%2BlrgREvG2ipziFLZEXA2kXKlWSrpUY0LZzHxQgLNyfCmfenYiKdA2TFBjlTTA1hI%2BYqGV%2Bqzj%2FY26ria61N3Oka7RGETnajOvPC0JL5bPzCGXXjK4faLmtvqupV6A91NzKDgO61kOeOPUNCDeJ9pLnUgysNQVf%2F9MRjzp5lFmgkAt0CyMOF4gO1aMINFunjCWO2XeODzPHvfcbY%2F7J8sqtu2khXcPSFaiF9BUIn7aOxBb0aQIJhIghSqyc9HHWcS%2F25cZk20NKVTPgtLnSJbWPofF3EogwV%2FidNMrDDJ6rY0gVCDanivCo278g11rYMVmCPaTAGMaUdne6zOUljMGmpzEeJKSNu7ne92z2bqWxPqbOJ%2BPsF5tROSju5hVIYrQm%2BQa8nIWr3Vm35Rxb5VIy%2F9bS3xSiu1i7ZeaR0YIgEsFQn2m80ZId9iG8aMtX%2Byt5H42bKFpYGTJEx1qyxq4X73hm5rPwrYgrlwnGdqqTCqOhPWRtf4gNObT5Iw5f%2FKvgY6ngGbLG9KdFnqOzjz2WHuQVhWjIbjMKhXuuNzdngQNNgOABnYpv3gy4ZfyrrvQFnEhLLzj5T32CvRamsPN5y7JNVodpeVqPj14fXXsOxgjbxeOIJvRqLZCJXosUPBloELRulcQTmeW8LC3rChTttOctZtv7oExWgL7MRdytnjEwece8Ch5FWFYjD0noELvB1MK74oi8fxn8bBLwVV5FyKyA%3D%3D&X-Amz-Signature=21442d7f08bae3c21deedcc14223b64342166d75375ef34ba8c3dc1537394e07&X-Amz-SignedHeaders=host&partNumber=1&uploadId=NuLg3e26fOyJJFoSPzMjSmpfs79CY3RkB1BXiD7gdZtjxjFSrlqwKmHiuldZpVI3WBG6SvOUOnDH.S8r4RFiQ0wpoaAZpBddzxvrp8B46wD5FzkSEylCPWgeZs0.fAljj_uF66L6b_opsINEeSy6krpT5yhiqzvAAAkwt29x5e9v057l5k8WiOUYbxI_9dZQ"
                        }
                    ],
                    "upload_id": "NuLg3e26fOyJJFoSPzMjSmpfs79CY3RkB1BXiD7gdZtjxjFSrlqwKmHiuldZpVI3WBG6SvOUOnDH.S8r4RFiQ0wpoaAZpBddzxvrp8B46wD5FzkSEylCPWgeZs0.fAljj_uF66L6b_opsINEeSy6krpT5yhiqzvAAAkwt29x5e9v057l5k8WiOUYbxI_9dZQ"
                },
                "file_id": "file_f9349700-a799-493c-bf43-a56347e2eec9"
            },
            "ready": false
        },
        "guts": {
            "src": "storage:pdfs:blurb/P17746137/15445_guts.pdf",
            "collection_version": 0,
            "status": "awaiting-transfer",
            "storage_class": "normal",
            "size": 9983345,
            "media_type": "application/pdf",
            "upload_info": {
                "type": "upload-service-v2",
                "finish_file_url": "https://upload-service.builder.blurb.com/collection/collection_e029f489-8181-4deb-b91d-5b90ace3d288/complete-file",
                "multipart_upload": {
                    "key": "default/blurb/P17746137/15445_guts.pdf",
                    "parts": [
                        {
                            "part_number": 1,
                            "upload_url": "https://blurb-pdf-processing-service-prod-preflight.s3.us-west-2.amazonaws.com/default/blurb/P17746137/15445_guts.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA2PCQKJ6L4FTTJQGQ%2F20250313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250313T112216Z&X-Amz-Expires=259200&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDZ6zFqnp%2FcSpajJKinYuRqvWod%2B2ZOdWd1emOaA%2FTD1AiBxv6bzfZaoc7iNWvhyDt7mCwDVuUx9rncYma7853%2BlYyquAwjV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAQaDDcxOTU3NTQ2OTk3NSIMajAAFswkmIloRGLrKoIDCWeAVBqk%2BlrgREvG2ipziFLZEXA2kXKlWSrpUY0LZzHxQgLNyfCmfenYiKdA2TFBjlTTA1hI%2BYqGV%2Bqzj%2FY26ria61N3Oka7RGETnajOvPC0JL5bPzCGXXjK4faLmtvqupV6A91NzKDgO61kOeOPUNCDeJ9pLnUgysNQVf%2F9MRjzp5lFmgkAt0CyMOF4gO1aMINFunjCWO2XeODzPHvfcbY%2F7J8sqtu2khXcPSFaiF9BUIn7aOxBb0aQIJhIghSqyc9HHWcS%2F25cZk20NKVTPgtLnSJbWPofF3EogwV%2FidNMrDDJ6rY0gVCDanivCo278g11rYMVmCPaTAGMaUdne6zOUljMGmpzEeJKSNu7ne92z2bqWxPqbOJ%2BPsF5tROSju5hVIYrQm%2BQa8nIWr3Vm35Rxb5VIy%2F9bS3xSiu1i7ZeaR0YIgEsFQn2m80ZId9iG8aMtX%2Byt5H42bKFpYGTJEx1qyxq4X73hm5rPwrYgrlwnGdqqTCqOhPWRtf4gNObT5Iw5f%2FKvgY6ngGbLG9KdFnqOzjz2WHuQVhWjIbjMKhXuuNzdngQNNgOABnYpv3gy4ZfyrrvQFnEhLLzj5T32CvRamsPN5y7JNVodpeVqPj14fXXsOxgjbxeOIJvRqLZCJXosUPBloELRulcQTmeW8LC3rChTttOctZtv7oExWgL7MRdytnjEwece8Ch5FWFYjD0noELvB1MK74oi8fxn8bBLwVV5FyKyA%3D%3D&X-Amz-Signature=37c933e5526166b27bef0018cbcf70138f934353a08766fb2e21e877ccbf9aaf&X-Amz-SignedHeaders=host&partNumber=1&uploadId=k.GR16oUua2kIREyIfDdKj5TuxuaLlwq9v575iC_VIxORibz3IgI.e8bgKStP12xV.TovhR.zA4J.aVBdH3zo1r2LUTh75zZoQW5Y6v4BIo.Y2bictyd393nQaVSU6MAdOJm1wBk8GdUDvAHBxSkNkEARbYjFijfV_PxxA67jSASkbazMxfoh2iFs2ecCV9h"
                        },
                        {
                            "part_number": 2,
                            "upload_url": "https://blurb-pdf-processing-service-prod-preflight.s3.us-west-2.amazonaws.com/default/blurb/P17746137/15445_guts.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA2PCQKJ6L4FTTJQGQ%2F20250313%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20250313T112216Z&X-Amz-Expires=259200&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDZ6zFqnp%2FcSpajJKinYuRqvWod%2B2ZOdWd1emOaA%2FTD1AiBxv6bzfZaoc7iNWvhyDt7mCwDVuUx9rncYma7853%2BlYyquAwjV%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAQaDDcxOTU3NTQ2OTk3NSIMajAAFswkmIloRGLrKoIDCWeAVBqk%2BlrgREvG2ipziFLZEXA2kXKlWSrpUY0LZzHxQgLNyfCmfenYiKdA2TFBjlTTA1hI%2BYqGV%2Bqzj%2FY26ria61N3Oka7RGETnajOvPC0JL5bPzCGXXjK4faLmtvqupV6A91NzKDgO61kOeOPUNCDeJ9pLnUgysNQVf%2F9MRjzp5lFmgkAt0CyMOF4gO1aMINFunjCWO2XeODzPHvfcbY%2F7J8sqtu2khXcPSFaiF9BUIn7aOxBb0aQIJhIghSqyc9HHWcS%2F25cZk20NKVTPgtLnSJbWPofF3EogwV%2FidNMrDDJ6rY0gVCDanivCo278g11rYMVmCPaTAGMaUdne6zOUljMGmpzEeJKSNu7ne92z2bqWxPqbOJ%2BPsF5tROSju5hVIYrQm%2BQa8nIWr3Vm35Rxb5VIy%2F9bS3xSiu1i7ZeaR0YIgEsFQn2m80ZId9iG8aMtX%2Byt5H42bKFpYGTJEx1qyxq4X73hm5rPwrYgrlwnGdqqTCqOhPWRtf4gNObT5Iw5f%2FKvgY6ngGbLG9KdFnqOzjz2WHuQVhWjIbjMKhXuuNzdngQNNgOABnYpv3gy4ZfyrrvQFnEhLLzj5T32CvRamsPN5y7JNVodpeVqPj14fXXsOxgjbxeOIJvRqLZCJXosUPBloELRulcQTmeW8LC3rChTttOctZtv7oExWgL7MRdytnjEwece8Ch5FWFYjD0noELvB1MK74oi8fxn8bBLwVV5FyKyA%3D%3D&X-Amz-Signature=f152b3cd132c25f815f97088902dc6a62edcf063d3431a9264d648463a5d8499&X-Amz-SignedHeaders=host&partNumber=2&uploadId=k.GR16oUua2kIREyIfDdKj5TuxuaLlwq9v575iC_VIxORibz3IgI.e8bgKStP12xV.TovhR.zA4J.aVBdH3zo1r2LUTh75zZoQW5Y6v4BIo.Y2bictyd393nQaVSU6MAdOJm1wBk8GdUDvAHBxSkNkEARbYjFijfV_PxxA67jSASkbazMxfoh2iFs2ecCV9h"
                        }
                    ],
                    "upload_id": "k.GR16oUua2kIREyIfDdKj5TuxuaLlwq9v575iC_VIxORibz3IgI.e8bgKStP12xV.TovhR.zA4J.aVBdH3zo1r2LUTh75zZoQW5Y6v4BIo.Y2bictyd393nQaVSU6MAdOJm1wBk8GdUDvAHBxSkNkEARbYjFijfV_PxxA67jSASkbazMxfoh2iFs2ecCV9h"
                },
                "file_id": "file_7896b161-772b-43b3-8102-10f37f44a47c"
            },
            "ready": false
        }
    },
    "notify": {
        "blurby": {
            "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=collection_success&api_key=OT12Xn3B1mkdfsb04F1C",
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 1200,
                "bitmap_height": 600,
                "force_inside_covers": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 85,
                "area": "trim-no-fold",
                "bitmap_dpi": 300,
                "force_inside_covers": true,
                "full_page_flaps": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 72,
                "force_inside_covers": true,
                "full_page_flaps": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 160,
                "bitmap_height": 75,
                "force_inside_covers": false
            },
            "execution_type": "aws_lambda"
        },
        "cover_thumbnails_18dpi": {
            "priority": 110,
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
            "output_filename_schema": "thumbnails_18dpi/cover-${area}-${segment}-${uuid}.${ext}",
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=upload&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 600,
                "bitmap_height": 600,
                "force_inside_covers": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 85,
                "area": "trim-no-fold",
                "bitmap_dpi": 300,
                "force_inside_covers": true,
                "full_page_flaps": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 72,
                "force_inside_covers": true,
                "full_page_flaps": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "media",
                "bitmap_width": 80,
                "bitmap_height": 75,
                "force_inside_covers": false
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
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "image_quality": 90,
                "area": "trim-no-fold",
                "bitmap_dpi": 18,
                "force_inside_covers": true,
                "full_page_flaps": false
            },
            "execution_type": "aws_lambda"
        },
        "preflight": {
            "type": "blurb-preflight",
            "input_set": "collection.files",
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=preflight&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                },
                "bookserve": {
                    "uri": "http://bookserve.blurb.com/axis/PdfProcessingCallbackServlet?guid=P17746137&op=preflight",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "enqueued",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
            "version": 1,
            "settings": {
                "autofix": true,
                "extract_pdf_metadata": true
            },
            "execution_type": "local"
        }
    },
    "book_url": "https://www.blurb.com/my/book/transactional_detail/12357124?ref=WZQXGCYNFHLYsyhHxq58&token=afe7c574d500416c89f3f9760c07c180c693f3bb",
    "book_has_isbn": false
}
```
## middle upload status
```json
{
    "api_account": "blurb",
    "id": "P17746137",
    "version": 1,
    "base_output_directory": "storage:pdfs:blurb/P17746137/",
    "date_created": "2025-03-13T11:22:13.113Z",
    "date_version": "2025-03-13T11:22:13.113Z",
    "date_updated": "2025-03-13T11:22:13.113Z",
    "status": "processing",
    "lifecycle": {
        "state": "active",
        "state_status": "ok"
    },
    "settings": {
        "blurb_product_id": "small_square-softcover-premium_lustre_paper"
    },
    "files": {
        "cover": {
            "src": "storage:pdfs:blurb/P17746137/15445_cover.pdf",
            "collection_version": 0,
            "status": "ready",
            "storage_class": "normal",
            "size": 1232150,
            "media_type": "application/pdf",
            "ready": true
        },
        "guts": {
            "src": "storage:pdfs:blurb/P17746137/15445_guts.pdf",
            "collection_version": 0,
            "status": "ready",
            "storage_class": "normal",
            "size": 9983345,
            "media_type": "application/pdf",
            "ready": true
        }
    },
    "notify": {
        "blurby": {
            "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=collection_success&api_key=OT12Xn3B1mkdfsb04F1C",
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
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 668415,
                    "media_type": "application/pdf",
                    "hash_md5": "b2bc6ab1f616f89c3753ba4b5a42c5fd",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 369143,
                    "media_type": "application/pdf",
                    "hash_md5": "8e4149b5e442fd6c50b78761209a005d",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1857,
                    "media_type": "application/pdf",
                    "hash_md5": "edf4f10fd9a7a38dea584092a9738f0f",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1857,
                    "media_type": "application/pdf",
                    "hash_md5": "edf4f10fd9a7a38dea584092a9738f0f",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1043993,
                    "media_type": "application/pdf",
                    "hash_md5": "1095e2200ed0c50d7f83cd276ed5ae46",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 1178,
                        "height": 600
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 112,
                    "media_type": "application/pdf",
                    "hash_md5": "37af73723fc206706db5e6c242ef2f20",
                    "metadata": {
                        "segment": "spine",
                        "width": 6,
                        "height": 600
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.504Z",
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
                    "invoke_time": 1741864942697
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
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4387455,
                    "media_type": "application/pdf",
                    "hash_md5": "318fd4432fd4ca3e99ef3b53a63efd36",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2287086,
                    "media_type": "application/pdf",
                    "hash_md5": "a25a4fd6ea3d1bf778cd3d62d02f1844",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9960,
                    "media_type": "application/pdf",
                    "hash_md5": "506599fe43150f14a7068c349cd6511e",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9960,
                    "media_type": "application/pdf",
                    "hash_md5": "506599fe43150f14a7068c349cd6511e",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6768649,
                    "media_type": "application/pdf",
                    "hash_md5": "dc6a358099e19aacbf43f5fec2b4464b",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 3017,
                        "height": 1500
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 310,
                    "media_type": "application/pdf",
                    "hash_md5": "59da90fb837cec734931794fb5f4b859",
                    "metadata": {
                        "segment": "spine",
                        "width": 17,
                        "height": 1500
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.508Z",
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
                    "invoke_time": 1741864942678
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
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 269894,
                    "media_type": "application/pdf",
                    "hash_md5": "48e126fb74b2030d6f75c9c0753efd1c",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 154214,
                    "media_type": "application/pdf",
                    "hash_md5": "3f15713b294073e017a5c7dd448fca65",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 910,
                    "media_type": "application/pdf",
                    "hash_md5": "a81845db41fe81a614939ba8422e428d",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 910,
                    "media_type": "application/pdf",
                    "hash_md5": "a81845db41fe81a614939ba8422e428d",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 428595,
                    "media_type": "application/pdf",
                    "hash_md5": "6abc3ac284161db5db2c5f62ffc08955",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 724,
                        "height": 360
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 93,
                    "media_type": "application/pdf",
                    "hash_md5": "798c7e84fe86254eec7fa414366f3a45",
                    "metadata": {
                        "segment": "spine",
                        "width": 4,
                        "height": 360
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.499Z",
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
                    "invoke_time": 1741864942724
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
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11480,
                    "media_type": "application/pdf",
                    "hash_md5": "d9d17376e9526553a5725d5e8b58d6da",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7789,
                    "media_type": "application/pdf",
                    "hash_md5": "4b5d3af536ba8713c95069db3aa0cd90",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "bf3c39bdb38c8aa5af7db784d393cccd",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "bf3c39bdb38c8aa5af7db784d393cccd",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 19501,
                    "media_type": "application/pdf",
                    "hash_md5": "efe566257e9bc39ea573eb0cf564ff7b",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 147,
                        "height": 75
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 74,
                    "media_type": "application/pdf",
                    "hash_md5": "492ecc5b1aa2394f39f7dd508794ceed",
                    "metadata": {
                        "segment": "spine",
                        "width": 1,
                        "height": 75
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.513Z",
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
                    "invoke_time": 1741864942648
                }
            },
            "execution_type": "aws_lambda"
        },
        "cover_thumbnails_18dpi": {
            "priority": 110,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-cover.pdf",
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1233585,
                    "media_type": "application/pdf",
                    "hash_md5": "6b267230981dd582c697a7f2bbb0738d",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-guts.pdf",
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9988751,
                    "media_type": "application/pdf",
                    "hash_md5": "0afc006e8fd3ca0d98d3a6b88bb31459",
                    "ready": true
                }
            },
            "output_filename_schema": "thumbnails_18dpi/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-back_cover-71d3afa6-dbed-4dda-ba05-6e8ce558f16b.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6042,
                    "media_type": "image/jpeg",
                    "hash_md5": "0b29092168f782b1abb51cc44177aae0",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-front_cover-4fdc0287-8290-4495-8d49-8f4a029665eb.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4109,
                    "media_type": "image/jpeg",
                    "hash_md5": "195a211d341a7cec3878b8b61d8367c7",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-inside_back_cover-f3905d3c-79db-4522-a5e5-a5b2400fc13b.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 392,
                    "media_type": "image/jpeg",
                    "hash_md5": "c825915fd452a343864bbcfa23c2d845",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-inside_front_cover-5288531c-ba8b-406e-9b9c-e076f27e6906.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 392,
                    "media_type": "image/jpeg",
                    "hash_md5": "c825915fd452a343864bbcfa23c2d845",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-outside_full_cover-6116b50f-e0e7-4377-94e3-0c9e4476a007.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9642,
                    "media_type": "image/jpeg",
                    "hash_md5": "108a27fae9cd2898ac42d4b5c209284f",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 181,
                        "height": 90
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-spine-03acabfd-14ee-4fd6-816a-94085b55ae8f.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 293,
                    "media_type": "image/jpeg",
                    "hash_md5": "aa27c9a0c00134038da8ad58f5e36e79",
                    "metadata": {
                        "segment": "spine",
                        "width": 1,
                        "height": 90
                    },
                    "ready": true
                }
            },
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=upload&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
            "progress": {
                "expected": 20,
                "created": 0,
                "uploaded": 0
            },
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
            "status": "processing",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                    "invoke_time": 1741864942706
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_preview_300dpi": {
            "progress": {
                "expected": 20,
                "created": 0,
                "uploaded": 0
            },
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
            "status": "processing",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                    "invoke_time": 1741864942688
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_preview_72dpi": {
            "progress": {
                "expected": 20,
                "created": 0,
                "uploaded": 0
            },
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
            "status": "processing",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                    "invoke_time": 1741864942658
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_thumbnails": {
            "progress": {
                "expected": 20,
                "created": 0,
                "uploaded": 0
            },
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
            "status": "processing",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                    "invoke_time": 1741864942668
                }
            },
            "execution_type": "aws_lambda"
        },
        "guts_thumbnails_18dpi": {
            "progress": {
                "expected": 20,
                "created": 0,
                "uploaded": 0
            },
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
            "status": "processing",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                    "invoke_time": 1741864942716
                }
            },
            "execution_type": "aws_lambda"
        },
        "preflight": {
            "type": "blurb-preflight",
            "input": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17746137/15445_cover.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "size": 1232150,
                    "media_type": "application/pdf",
                    "hash_md5": "5f0546df2ef956926fb7212c79d4517d",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17746137/15445_guts.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "size": 9983345,
                    "media_type": "application/pdf",
                    "hash_md5": "f9c196abf644a950780d9a11e3ce1afe",
                    "ready": true
                }
            },
            "input_set": "collection.files",
            "output": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-cover.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1233585,
                    "media_type": "application/pdf",
                    "hash_md5": "6b267230981dd582c697a7f2bbb0738d",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-guts.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9988751,
                    "media_type": "application/pdf",
                    "hash_md5": "0afc006e8fd3ca0d98d3a6b88bb31459",
                    "ready": true
                },
                "report": {
                    "src": "storage:pdfs:blurb/P17746137/preflight-report.json",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6215,
                    "media_type": "application/json",
                    "hash_md5": "bfa908e368d9eb7c00342938be61f790",
                    "ready": true
                }
            },
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=preflight&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                },
                "bookserve": {
                    "uri": "http://bookserve.blurb.com/axis/PdfProcessingCallbackServlet?guid=P17746137&op=preflight",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                        "date_created": "2025-03-13T11:22:10Z",
                        "date_modified": "2025-03-13T11:22:10Z",
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
                        "date_created": "2025-03-13T11:22:10Z",
                        "date_modified": "2025-03-13T11:22:10Z",
                        "subject": "",
                        "pdf_version": "1.7",
                        "page_count": 20
                    }
                ],
                "product_type": {
                    "id": "small_square-softcover-premium_lustre_paper",
                    "book_id": "small_square",
                    "name": "Mini Square 5x5 in 13x13 cm",
                    "page_width_post_trim": 360,
                    "page_height_post_trim": 360,
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
                    "cover_type": "softcover",
                    "paper_type_id": "premium_lustre_paper",
                    "min_page_count": 20,
                    "max_page_count": 80,
                    "page_count_mod": 2,
                    "page_width_pre_trim": 369,
                    "page_height_pre_trim": 378
                },
                "issues": [
                    {
                        "severity": "Error",
                        "message": "Page 1: Expected page size is 10.306 in by 5.25 in, but it is actually 10.25 in by 5.25 in.",
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
                                        "expected_height_inches": "5.25 in",
                                        "actual_height_inches": "5.25 in",
                                        "actual_width_inches": "10.25 in",
                                        "expected_width_inches": "10.306 in"
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
                        "message": "Page 1: Resize the page to 10.306 in by 5.25 in.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "fix": {
                                    "strings": {
                                        "new_width_inches": "10.306 in",
                                        "new_height_inches": "5.25 in"
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
                        "left": 9,
                        "right": 9,
                        "top": 9,
                        "bottom": 9
                    },
                    "safe_zone": {
                        "left": 18,
                        "right": 18,
                        "top": 18,
                        "bottom": 18
                    },
                    "content_areas": {
                        "main_content": {
                            "left": 9,
                            "right": 733,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 724,
                                "height": 360
                            },
                            "width": 724,
                            "height": 360
                        },
                        "left_main_content": {
                            "left": 9,
                            "right": 369,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        },
                        "right_main_content": {
                            "left": 373,
                            "right": 733,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        },
                        "spine_content": {
                            "left": 369,
                            "right": 373,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 4,
                                "height": 360
                            },
                            "width": 4,
                            "height": 360
                        },
                        "main_content_pre_trim": {
                            "left": 0,
                            "right": 742,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 742,
                                "height": 378
                            },
                            "width": 742,
                            "height": 378
                        },
                        "left_main_pre_trim": {
                            "left": 0,
                            "right": 369,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 369,
                                "height": 378
                            },
                            "width": 369,
                            "height": 378
                        },
                        "right_main_pre_trim": {
                            "left": 373,
                            "right": 742,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 369,
                                "height": 378
                            },
                            "width": 369,
                            "height": 378
                        },
                        "spine_pre_trim": {
                            "left": 369,
                            "right": 373,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 4,
                                "height": 378
                            },
                            "width": 4,
                            "height": 378
                        },
                        "isbn_placeholder": {
                            "left": 126,
                            "right": 252,
                            "top": 117,
                            "bottom": 45,
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
                    "post_trim_width": 724,
                    "post_trim_height": 360,
                    "pre_trim_width": 742,
                    "pre_trim_height": 378
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
                            "right": 369,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        },
                        "even_page_content": {
                            "left": 0,
                            "right": 360,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        }
                    },
                    "post_trim_width": 360,
                    "post_trim_height": 360,
                    "pre_trim_width": 369,
                    "pre_trim_height": 378
                }
            },
            "execution_type": "local"
        }
    },
    "book_url": "https://www.blurb.com/my/book/transactional_detail/12357124?ref=WZQXGCYNFHLYsyhHxq58&token=afe7c574d500416c89f3f9760c07c180c693f3bb",
    "book_has_isbn": false
}
```

## Final upload status
```json
{
    "api_account": "blurb",
    "id": "P17746137",
    "version": 1,
    "base_output_directory": "storage:pdfs:blurb/P17746137/",
    "date_created": "2025-03-13T11:22:13.113Z",
    "date_version": "2025-03-13T11:22:13.113Z",
    "date_updated": "2025-03-13T11:22:13.113Z",
    "status": "success",
    "lifecycle": {
        "state": "active",
        "state_status": "ok"
    },
    "settings": {
        "blurb_product_id": "small_square-softcover-premium_lustre_paper"
    },
    "files": {
        "cover": {
            "src": "storage:pdfs:blurb/P17746137/15445_cover.pdf",
            "collection_version": 0,
            "status": "ready",
            "storage_class": "normal",
            "size": 1232150,
            "media_type": "application/pdf",
            "ready": true
        },
        "guts": {
            "src": "storage:pdfs:blurb/P17746137/15445_guts.pdf",
            "collection_version": 0,
            "status": "ready",
            "storage_class": "normal",
            "size": 9983345,
            "media_type": "application/pdf",
            "ready": true
        }
    },
    "notify": {
        "blurby": {
            "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=collection_success&api_key=OT12Xn3B1mkdfsb04F1C",
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
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 668415,
                    "media_type": "application/pdf",
                    "hash_md5": "b2bc6ab1f616f89c3753ba4b5a42c5fd",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 369143,
                    "media_type": "application/pdf",
                    "hash_md5": "8e4149b5e442fd6c50b78761209a005d",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1857,
                    "media_type": "application/pdf",
                    "hash_md5": "edf4f10fd9a7a38dea584092a9738f0f",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1857,
                    "media_type": "application/pdf",
                    "hash_md5": "edf4f10fd9a7a38dea584092a9738f0f",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1043993,
                    "media_type": "application/pdf",
                    "hash_md5": "1095e2200ed0c50d7f83cd276ed5ae46",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 1178,
                        "height": 600
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 112,
                    "media_type": "application/pdf",
                    "hash_md5": "37af73723fc206706db5e6c242ef2f20",
                    "metadata": {
                        "segment": "spine",
                        "width": 6,
                        "height": 600
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.504Z",
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
                    "invoke_time": 1741864942697
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
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4387455,
                    "media_type": "application/pdf",
                    "hash_md5": "318fd4432fd4ca3e99ef3b53a63efd36",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2287086,
                    "media_type": "application/pdf",
                    "hash_md5": "a25a4fd6ea3d1bf778cd3d62d02f1844",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9960,
                    "media_type": "application/pdf",
                    "hash_md5": "506599fe43150f14a7068c349cd6511e",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9960,
                    "media_type": "application/pdf",
                    "hash_md5": "506599fe43150f14a7068c349cd6511e",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6768649,
                    "media_type": "application/pdf",
                    "hash_md5": "dc6a358099e19aacbf43f5fec2b4464b",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 3017,
                        "height": 1500
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_300dpi/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 310,
                    "media_type": "application/pdf",
                    "hash_md5": "59da90fb837cec734931794fb5f4b859",
                    "metadata": {
                        "segment": "spine",
                        "width": 17,
                        "height": 1500
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.508Z",
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
                    "invoke_time": 1741864942678
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
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 269894,
                    "media_type": "application/pdf",
                    "hash_md5": "48e126fb74b2030d6f75c9c0753efd1c",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 154214,
                    "media_type": "application/pdf",
                    "hash_md5": "3f15713b294073e017a5c7dd448fca65",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 910,
                    "media_type": "application/pdf",
                    "hash_md5": "a81845db41fe81a614939ba8422e428d",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 910,
                    "media_type": "application/pdf",
                    "hash_md5": "a81845db41fe81a614939ba8422e428d",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 428595,
                    "media_type": "application/pdf",
                    "hash_md5": "6abc3ac284161db5db2c5f62ffc08955",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 724,
                        "height": 360
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_preview_72dpi/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 93,
                    "media_type": "application/pdf",
                    "hash_md5": "798c7e84fe86254eec7fa414366f3a45",
                    "metadata": {
                        "segment": "spine",
                        "width": 4,
                        "height": 360
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.499Z",
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
                    "invoke_time": 1741864942724
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
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11480,
                    "media_type": "application/pdf",
                    "hash_md5": "d9d17376e9526553a5725d5e8b58d6da",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7789,
                    "media_type": "application/pdf",
                    "hash_md5": "4b5d3af536ba8713c95069db3aa0cd90",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/inside_back_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "bf3c39bdb38c8aa5af7db784d393cccd",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/inside_front_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 147,
                    "media_type": "application/pdf",
                    "hash_md5": "bf3c39bdb38c8aa5af7db784d393cccd",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/outside_full_cover.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 19501,
                    "media_type": "application/pdf",
                    "hash_md5": "efe566257e9bc39ea573eb0cf564ff7b",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 147,
                        "height": 75
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/cover_thumbnails/spine.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 74,
                    "media_type": "application/pdf",
                    "hash_md5": "492ecc5b1aa2394f39f7dd508794ceed",
                    "metadata": {
                        "segment": "spine",
                        "width": 1,
                        "height": 75
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:29.513Z",
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
                    "invoke_time": 1741864942648
                }
            },
            "execution_type": "aws_lambda"
        },
        "cover_thumbnails_18dpi": {
            "priority": 110,
            "type": "blurb-cover-rasterize",
            "input": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-cover.pdf",
                    "from": "preflight.output.cover",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1233585,
                    "media_type": "application/pdf",
                    "hash_md5": "6b267230981dd582c697a7f2bbb0738d",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-guts.pdf",
                    "from": "preflight.output.guts",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9988751,
                    "media_type": "application/pdf",
                    "hash_md5": "0afc006e8fd3ca0d98d3a6b88bb31459",
                    "ready": true
                }
            },
            "output_filename_schema": "thumbnails_18dpi/cover-${area}-${segment}-${uuid}.${ext}",
            "output": {
                "back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-back_cover-71d3afa6-dbed-4dda-ba05-6e8ce558f16b.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6042,
                    "media_type": "image/jpeg",
                    "hash_md5": "0b29092168f782b1abb51cc44177aae0",
                    "metadata": {
                        "segment": "back_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-front_cover-4fdc0287-8290-4495-8d49-8f4a029665eb.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4109,
                    "media_type": "image/jpeg",
                    "hash_md5": "195a211d341a7cec3878b8b61d8367c7",
                    "metadata": {
                        "segment": "front_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "inside_back_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-inside_back_cover-f3905d3c-79db-4522-a5e5-a5b2400fc13b.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 392,
                    "media_type": "image/jpeg",
                    "hash_md5": "c825915fd452a343864bbcfa23c2d845",
                    "metadata": {
                        "segment": "inside_back_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "inside_front_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-inside_front_cover-5288531c-ba8b-406e-9b9c-e076f27e6906.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 392,
                    "media_type": "image/jpeg",
                    "hash_md5": "c825915fd452a343864bbcfa23c2d845",
                    "metadata": {
                        "segment": "inside_front_cover",
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "outside_full_cover": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-outside_full_cover-6116b50f-e0e7-4377-94e3-0c9e4476a007.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9642,
                    "media_type": "image/jpeg",
                    "hash_md5": "108a27fae9cd2898ac42d4b5c209284f",
                    "metadata": {
                        "segment": "outside_full_cover",
                        "width": 181,
                        "height": 90
                    },
                    "ready": true
                },
                "spine": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/cover-trim-no-fold-spine-03acabfd-14ee-4fd6-816a-94085b55ae8f.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 293,
                    "media_type": "image/jpeg",
                    "hash_md5": "aa27c9a0c00134038da8ad58f5e36e79",
                    "metadata": {
                        "segment": "spine",
                        "width": 1,
                        "height": 90
                    },
                    "ready": true
                }
            },
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=upload&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 817010,
                    "media_type": "application/pdf",
                    "hash_md5": "26ef448fb01dde9fb6780ab23d80b5ab",
                    "metadata": {
                        "page": 1,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 375400,
                    "media_type": "application/pdf",
                    "hash_md5": "20f086d6f8b4dc3a736bd2f46f098a4a",
                    "metadata": {
                        "page": 10,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 390649,
                    "media_type": "application/pdf",
                    "hash_md5": "7f2285b2bdf36f51f336e216286dc6a7",
                    "metadata": {
                        "page": 11,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 534820,
                    "media_type": "application/pdf",
                    "hash_md5": "66ffe4042512d517ce5e03698611dbf3",
                    "metadata": {
                        "page": 12,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 409832,
                    "media_type": "application/pdf",
                    "hash_md5": "886002d183d871c55587fdce8b5f7a19",
                    "metadata": {
                        "page": 13,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 585621,
                    "media_type": "application/pdf",
                    "hash_md5": "1cc1074a10b94c600bdd4c4ef1450017",
                    "metadata": {
                        "page": 14,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 293336,
                    "media_type": "application/pdf",
                    "hash_md5": "147a9d1b00609c68c374e5cdd917efa4",
                    "metadata": {
                        "page": 15,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 929869,
                    "media_type": "application/pdf",
                    "hash_md5": "20fa954c83c7f21d803f6536ea49fd62",
                    "metadata": {
                        "page": 16,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 928150,
                    "media_type": "application/pdf",
                    "hash_md5": "6467446e25309d79c18e7fdae975a251",
                    "metadata": {
                        "page": 17,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 405600,
                    "media_type": "application/pdf",
                    "hash_md5": "beac82a835bfda8b68d5b5b66109b433",
                    "metadata": {
                        "page": 18,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 550016,
                    "media_type": "application/pdf",
                    "hash_md5": "5014fcd3003bf50a13791d04b2b882c0",
                    "metadata": {
                        "page": 19,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 408248,
                    "media_type": "application/pdf",
                    "hash_md5": "1a9fcde59955ecacfc056707f189ecc6",
                    "metadata": {
                        "page": 2,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 528694,
                    "media_type": "application/pdf",
                    "hash_md5": "cccec087f1843cc99324404e8923b302",
                    "metadata": {
                        "page": 20,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 449424,
                    "media_type": "application/pdf",
                    "hash_md5": "424883df649faa5f0796eeac85eb72eb",
                    "metadata": {
                        "page": 3,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 527611,
                    "media_type": "application/pdf",
                    "hash_md5": "cd56a748e145c877a7a4e0b7b5af8a83",
                    "metadata": {
                        "page": 4,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 357481,
                    "media_type": "application/pdf",
                    "hash_md5": "558b53a160c6f3c94eb5564ca7f3da51",
                    "metadata": {
                        "page": 5,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 231186,
                    "media_type": "application/pdf",
                    "hash_md5": "e9f8834b9140dcb547cfc4d3ea7de74f",
                    "metadata": {
                        "page": 6,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 781483,
                    "media_type": "application/pdf",
                    "hash_md5": "a686e0c857c9a753a3dab7a70bf4f61e",
                    "metadata": {
                        "page": 7,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 308567,
                    "media_type": "application/pdf",
                    "hash_md5": "138b5635959117236615f95a0e95a3a9",
                    "metadata": {
                        "page": 8,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17746137/preview/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 406639,
                    "media_type": "application/pdf",
                    "hash_md5": "6cee9c255518ccdca80240c25d365bf5",
                    "metadata": {
                        "page": 9,
                        "width": 586,
                        "height": 600
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:39.506Z",
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
                    "invoke_time": 1741864942706
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
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4435939,
                    "media_type": "application/pdf",
                    "hash_md5": "673d4ebf06471c4c45295a1452a7864b",
                    "metadata": {
                        "page": 1,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2269341,
                    "media_type": "application/pdf",
                    "hash_md5": "cdcd8040d626cd85163df0fe020914f9",
                    "metadata": {
                        "page": 10,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2283529,
                    "media_type": "application/pdf",
                    "hash_md5": "94f7685d280736c4c4e15e677ca2ad5a",
                    "metadata": {
                        "page": 11,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 3524305,
                    "media_type": "application/pdf",
                    "hash_md5": "6b365393962c97e91699387a2a9b62e6",
                    "metadata": {
                        "page": 12,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2742853,
                    "media_type": "application/pdf",
                    "hash_md5": "2a9840fec7007d90a9bce666b28b0516",
                    "metadata": {
                        "page": 13,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 3805522,
                    "media_type": "application/pdf",
                    "hash_md5": "565e35c3f626baa44ead2228a6fd25da",
                    "metadata": {
                        "page": 14,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1843960,
                    "media_type": "application/pdf",
                    "hash_md5": "cedb5fa16ddbb62f5263b03adb8661a4",
                    "metadata": {
                        "page": 15,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 5510562,
                    "media_type": "application/pdf",
                    "hash_md5": "d9b2193e5e4ea27f58a625ebe60855f2",
                    "metadata": {
                        "page": 16,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 5717928,
                    "media_type": "application/pdf",
                    "hash_md5": "f6b8ccc606bb1057c782d378dabd6895",
                    "metadata": {
                        "page": 17,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2444225,
                    "media_type": "application/pdf",
                    "hash_md5": "4cfc010eab4852ff5b3286ae704639cc",
                    "metadata": {
                        "page": 18,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 3714948,
                    "media_type": "application/pdf",
                    "hash_md5": "acb05fe270d6ad34ad454b623286a440",
                    "metadata": {
                        "page": 19,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2561760,
                    "media_type": "application/pdf",
                    "hash_md5": "e434b05c54d23c5eac7575dac001e299",
                    "metadata": {
                        "page": 2,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 3435174,
                    "media_type": "application/pdf",
                    "hash_md5": "52be9e689aa5b5f9400224970e1e91e3",
                    "metadata": {
                        "page": 20,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 3033218,
                    "media_type": "application/pdf",
                    "hash_md5": "2dd832e11116e743aeab1c70f17a0dac",
                    "metadata": {
                        "page": 3,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 3431137,
                    "media_type": "application/pdf",
                    "hash_md5": "ee446eb3f11007bf1de96270bde63a97",
                    "metadata": {
                        "page": 4,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2154956,
                    "media_type": "application/pdf",
                    "hash_md5": "29034d38fc57a47bb8ef36adc9130890",
                    "metadata": {
                        "page": 5,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1550376,
                    "media_type": "application/pdf",
                    "hash_md5": "8548f680a6dd7b5b47b0dce8a23e8818",
                    "metadata": {
                        "page": 6,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 5050744,
                    "media_type": "application/pdf",
                    "hash_md5": "0fba7140c32f3e693ad7a0350f719a78",
                    "metadata": {
                        "page": 7,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1970389,
                    "media_type": "application/pdf",
                    "hash_md5": "848dbf4804d415eded032fb4ff33e4cf",
                    "metadata": {
                        "page": 8,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17746137/preview_300dpi/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 2577041,
                    "media_type": "application/pdf",
                    "hash_md5": "b13929c0334e36dd93dbc4603f45f6bb",
                    "metadata": {
                        "page": 9,
                        "width": 1500,
                        "height": 1500
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:39.508Z",
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
                    "invoke_time": 1741864942688
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
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 326241,
                    "media_type": "application/pdf",
                    "hash_md5": "516ac17806b44b71c4ef96da86a91e9a",
                    "metadata": {
                        "page": 1,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 155933,
                    "media_type": "application/pdf",
                    "hash_md5": "97cfa3a724ce0acfab8e9a9cb10d3842",
                    "metadata": {
                        "page": 10,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 162386,
                    "media_type": "application/pdf",
                    "hash_md5": "7503d9f97e4347ea5250ab897b9fa588",
                    "metadata": {
                        "page": 11,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 215746,
                    "media_type": "application/pdf",
                    "hash_md5": "f63b7b2a774c9ed624fd985352f638ba",
                    "metadata": {
                        "page": 12,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 165819,
                    "media_type": "application/pdf",
                    "hash_md5": "654abe57d00bb687ebf612ba5615810f",
                    "metadata": {
                        "page": 13,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 237119,
                    "media_type": "application/pdf",
                    "hash_md5": "843b90785ea2d155f38217b5cba15a7a",
                    "metadata": {
                        "page": 14,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 122202,
                    "media_type": "application/pdf",
                    "hash_md5": "c750c8c6170c97ececc472cef56642ae",
                    "metadata": {
                        "page": 15,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 359791,
                    "media_type": "application/pdf",
                    "hash_md5": "c9a41c9ba65a0b510608f6ee3db2760d",
                    "metadata": {
                        "page": 16,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 360003,
                    "media_type": "application/pdf",
                    "hash_md5": "e482fe40b2150627b543f08b5247ad4d",
                    "metadata": {
                        "page": 17,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 167227,
                    "media_type": "application/pdf",
                    "hash_md5": "2a7ce036f61f8dba49a4af5fbdec42b3",
                    "metadata": {
                        "page": 18,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 217691,
                    "media_type": "application/pdf",
                    "hash_md5": "82c457692dfd59677bc6ea75525ce3a8",
                    "metadata": {
                        "page": 19,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 167393,
                    "media_type": "application/pdf",
                    "hash_md5": "6df0b8651259d29dc356ea2d232bebce",
                    "metadata": {
                        "page": 2,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 213882,
                    "media_type": "application/pdf",
                    "hash_md5": "416e22514b6aabaf70b73eca6536978c",
                    "metadata": {
                        "page": 20,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 179775,
                    "media_type": "application/pdf",
                    "hash_md5": "21f2c484be5fcfc1e93aed6cf57679f3",
                    "metadata": {
                        "page": 3,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 213828,
                    "media_type": "application/pdf",
                    "hash_md5": "e8d04106327e48508aee7efc5dfd3ea8",
                    "metadata": {
                        "page": 4,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 148268,
                    "media_type": "application/pdf",
                    "hash_md5": "a1bd55f7851ef5c438ad9109f658f796",
                    "metadata": {
                        "page": 5,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 93315,
                    "media_type": "application/pdf",
                    "hash_md5": "5ff83389cfaa9339460b2f4835ec32a6",
                    "metadata": {
                        "page": 6,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 316956,
                    "media_type": "application/pdf",
                    "hash_md5": "9b08c85fa2da587c3762682b410a1833",
                    "metadata": {
                        "page": 7,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 128204,
                    "media_type": "application/pdf",
                    "hash_md5": "6625197a4c0405d3cc43c75ea7a43b3b",
                    "metadata": {
                        "page": 8,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17746137/preview_72dpi/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 167130,
                    "media_type": "application/pdf",
                    "hash_md5": "277815ff814014c63814965a4cd03f3c",
                    "metadata": {
                        "page": 9,
                        "width": 360,
                        "height": 360
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:39.514Z",
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
                    "invoke_time": 1741864942658
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
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 15235,
                    "media_type": "application/pdf",
                    "hash_md5": "e30620a143f9c75d2747796b657edef9",
                    "metadata": {
                        "page": 1,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7065,
                    "media_type": "application/pdf",
                    "hash_md5": "fc5bc3a84e221f46fb7ca81e6ed98790",
                    "metadata": {
                        "page": 10,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7236,
                    "media_type": "application/pdf",
                    "hash_md5": "7b1fb5039adcb1da7a98410f0b98819d",
                    "metadata": {
                        "page": 11,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9423,
                    "media_type": "application/pdf",
                    "hash_md5": "2237bcb593a7b6afa458468b0248f9bb",
                    "metadata": {
                        "page": 12,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7157,
                    "media_type": "application/pdf",
                    "hash_md5": "7a6544742ffe58d4158f31e7dbef084f",
                    "metadata": {
                        "page": 13,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 10447,
                    "media_type": "application/pdf",
                    "hash_md5": "310ffce6e5c46f37ba7146b0c01e9101",
                    "metadata": {
                        "page": 14,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 5884,
                    "media_type": "application/pdf",
                    "hash_md5": "bf74034750f579efeb3ad8590c07166c",
                    "metadata": {
                        "page": 15,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 15730,
                    "media_type": "application/pdf",
                    "hash_md5": "30719655398c8205f46f2a7216ac1bc8",
                    "metadata": {
                        "page": 16,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 15944,
                    "media_type": "application/pdf",
                    "hash_md5": "bbd83ff13876175d0bfaf61876f429c6",
                    "metadata": {
                        "page": 17,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7173,
                    "media_type": "application/pdf",
                    "hash_md5": "2ac2f82e8315c4c4487fe99b5cecaa22",
                    "metadata": {
                        "page": 18,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9275,
                    "media_type": "application/pdf",
                    "hash_md5": "7d3266860a2651fc6d7a4c4c2a9e25ab",
                    "metadata": {
                        "page": 19,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7905,
                    "media_type": "application/pdf",
                    "hash_md5": "16cf8ca28dabd8be0b33e6641de66929",
                    "metadata": {
                        "page": 2,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9361,
                    "media_type": "application/pdf",
                    "hash_md5": "f4ffc0519740fa191baaff51770ba7e8",
                    "metadata": {
                        "page": 20,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7595,
                    "media_type": "application/pdf",
                    "hash_md5": "763c504f7c97a0842e0779989c6aec33",
                    "metadata": {
                        "page": 3,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9490,
                    "media_type": "application/pdf",
                    "hash_md5": "260b41bac87c7cf62c68a42d98b81663",
                    "metadata": {
                        "page": 4,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6618,
                    "media_type": "application/pdf",
                    "hash_md5": "53cbacc5c6f8c12a700a2de96d261655",
                    "metadata": {
                        "page": 5,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 4051,
                    "media_type": "application/pdf",
                    "hash_md5": "f1620e50b286f92c462ad14a0acfeadf",
                    "metadata": {
                        "page": 6,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 13693,
                    "media_type": "application/pdf",
                    "hash_md5": "ee4aa21e858c9ab69b2ce3ee1a320ece",
                    "metadata": {
                        "page": 7,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6582,
                    "media_type": "application/pdf",
                    "hash_md5": "3ab32279acae5309b2b0af2235f5b0e9",
                    "metadata": {
                        "page": 8,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 7516,
                    "media_type": "application/pdf",
                    "hash_md5": "53adf766ae5df085e1e66dbfba42adf7",
                    "metadata": {
                        "page": 9,
                        "width": 73,
                        "height": 75
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:39.511Z",
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
                    "invoke_time": 1741864942668
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
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_1.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 22510,
                    "media_type": "application/pdf",
                    "hash_md5": "6d964812937a4e52bd2127d207378222",
                    "metadata": {
                        "page": 1,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_10": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_10.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11058,
                    "media_type": "application/pdf",
                    "hash_md5": "601e3111d70ed2eb95904c6ec4bd7750",
                    "metadata": {
                        "page": 10,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_11": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_11.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11279,
                    "media_type": "application/pdf",
                    "hash_md5": "435bf5732ca1ecd5105841a593d17989",
                    "metadata": {
                        "page": 11,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_12": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_12.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 14582,
                    "media_type": "application/pdf",
                    "hash_md5": "ed2cb4e79f60368be724d0427cf7186d",
                    "metadata": {
                        "page": 12,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_13": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_13.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11215,
                    "media_type": "application/pdf",
                    "hash_md5": "58768a4688fdcb33fd612f9540a11eb4",
                    "metadata": {
                        "page": 13,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_14": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_14.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 16223,
                    "media_type": "application/pdf",
                    "hash_md5": "13fa5df06c07a5f39d87920fbd219fe2",
                    "metadata": {
                        "page": 14,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_15": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_15.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9081,
                    "media_type": "application/pdf",
                    "hash_md5": "3029e55c723a434c8c282768d6d0f082",
                    "metadata": {
                        "page": 15,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_16": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_16.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 23403,
                    "media_type": "application/pdf",
                    "hash_md5": "856447de086c94b4a1cbd72d669f2ee5",
                    "metadata": {
                        "page": 16,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_17": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_17.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 23622,
                    "media_type": "application/pdf",
                    "hash_md5": "d45b5d495a0f825bf0551255d385608c",
                    "metadata": {
                        "page": 17,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_18": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_18.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11490,
                    "media_type": "application/pdf",
                    "hash_md5": "42b6cc838ce95c64413256d38ca531e6",
                    "metadata": {
                        "page": 18,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_19": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_19.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 14650,
                    "media_type": "application/pdf",
                    "hash_md5": "5a05682e9269e0ed4d287ad0ef034dc3",
                    "metadata": {
                        "page": 19,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_2": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_2.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 12323,
                    "media_type": "application/pdf",
                    "hash_md5": "6220e870970e80cd92c91170420d6d87",
                    "metadata": {
                        "page": 2,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_20": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_20.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 14509,
                    "media_type": "application/pdf",
                    "hash_md5": "61c0098ce5911fda084892bc7ccb0037",
                    "metadata": {
                        "page": 20,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_3": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_3.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11830,
                    "media_type": "application/pdf",
                    "hash_md5": "def02709e760696f1f96d94d049bb653",
                    "metadata": {
                        "page": 3,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_4": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_4.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 14854,
                    "media_type": "application/pdf",
                    "hash_md5": "3da8c3b2212a2a617deb483e37b62d1a",
                    "metadata": {
                        "page": 4,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_5": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_5.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 10348,
                    "media_type": "application/pdf",
                    "hash_md5": "66162d58e666ad2145b50d360dce1ec6",
                    "metadata": {
                        "page": 5,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_6": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_6.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6322,
                    "media_type": "application/pdf",
                    "hash_md5": "ed3973ce5180983192ec6a7e7ed53c60",
                    "metadata": {
                        "page": 6,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_7": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_7.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 21507,
                    "media_type": "application/pdf",
                    "hash_md5": "515135c7121d6ccde155d001e42b1252",
                    "metadata": {
                        "page": 7,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_8": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_8.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9917,
                    "media_type": "application/pdf",
                    "hash_md5": "ec77c8c0c3d49487967ad5f03797ab42",
                    "metadata": {
                        "page": 8,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                },
                "guts_page_9": {
                    "src": "storage:pdfs:blurb/P17746137/thumbnails_18dpi/guts_page_9.jpg",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 11724,
                    "media_type": "application/pdf",
                    "hash_md5": "bc499059bd29b0a3fea4b919bdf07490",
                    "metadata": {
                        "page": 9,
                        "width": 90,
                        "height": 90
                    },
                    "ready": true
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:39.502Z",
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
                    "invoke_time": 1741864942716
                }
            },
            "execution_type": "aws_lambda"
        },
        "preflight": {
            "type": "blurb-preflight",
            "input": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17746137/15445_cover.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "size": 1232150,
                    "media_type": "application/pdf",
                    "hash_md5": "5f0546df2ef956926fb7212c79d4517d",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17746137/15445_guts.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "size": 9983345,
                    "media_type": "application/pdf",
                    "hash_md5": "f9c196abf644a950780d9a11e3ce1afe",
                    "ready": true
                }
            },
            "input_set": "collection.files",
            "output": {
                "cover": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-cover.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 1233585,
                    "media_type": "application/pdf",
                    "hash_md5": "6b267230981dd582c697a7f2bbb0738d",
                    "ready": true
                },
                "guts": {
                    "src": "storage:pdfs:blurb/P17746137/autofixed-guts.pdf",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 9988751,
                    "media_type": "application/pdf",
                    "hash_md5": "0afc006e8fd3ca0d98d3a6b88bb31459",
                    "ready": true
                },
                "report": {
                    "src": "storage:pdfs:blurb/P17746137/preflight-report.json",
                    "collection_version": 0,
                    "status": "ready",
                    "storage_class": "normal",
                    "size": 6215,
                    "media_type": "application/json",
                    "hash_md5": "bfa908e368d9eb7c00342938be61f790",
                    "ready": true
                }
            },
            "notify": {
                "blurby": {
                    "uri": "https://www.blurb.com/api/v2/pdf_books/notify/P17746137?event=preflight&api_key=OT12Xn3B1mkdfsb04F1C",
                    "events": [
                        "finish"
                    ]
                },
                "bookserve": {
                    "uri": "http://bookserve.blurb.com/axis/PdfProcessingCallbackServlet?guid=P17746137&op=preflight",
                    "events": [
                        "finish"
                    ]
                }
            },
            "status": "success",
            "status_timestamp": "2025-03-13T11:22:17.359Z",
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
                        "date_created": "2025-03-13T11:22:10Z",
                        "date_modified": "2025-03-13T11:22:10Z",
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
                        "date_created": "2025-03-13T11:22:10Z",
                        "date_modified": "2025-03-13T11:22:10Z",
                        "subject": "",
                        "pdf_version": "1.7",
                        "page_count": 20
                    }
                ],
                "product_type": {
                    "id": "small_square-softcover-premium_lustre_paper",
                    "book_id": "small_square",
                    "name": "Mini Square 5x5 in 13x13 cm",
                    "page_width_post_trim": 360,
                    "page_height_post_trim": 360,
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
                    "cover_type": "softcover",
                    "paper_type_id": "premium_lustre_paper",
                    "min_page_count": 20,
                    "max_page_count": 80,
                    "page_count_mod": 2,
                    "page_width_pre_trim": 369,
                    "page_height_pre_trim": 378
                },
                "issues": [
                    {
                        "severity": "Error",
                        "message": "Page 1: Expected page size is 10.306 in by 5.25 in, but it is actually 10.25 in by 5.25 in.",
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
                                        "expected_height_inches": "5.25 in",
                                        "actual_height_inches": "5.25 in",
                                        "actual_width_inches": "10.25 in",
                                        "expected_width_inches": "10.306 in"
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
                        "message": "Page 1: Resize the page to 10.306 in by 5.25 in.",
                        "translatable_message": {
                            "strings": {},
                            "messages": {
                                "fix": {
                                    "strings": {
                                        "new_width_inches": "10.306 in",
                                        "new_height_inches": "5.25 in"
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
                        "left": 9,
                        "right": 9,
                        "top": 9,
                        "bottom": 9
                    },
                    "safe_zone": {
                        "left": 18,
                        "right": 18,
                        "top": 18,
                        "bottom": 18
                    },
                    "content_areas": {
                        "main_content": {
                            "left": 9,
                            "right": 733,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 724,
                                "height": 360
                            },
                            "width": 724,
                            "height": 360
                        },
                        "left_main_content": {
                            "left": 9,
                            "right": 369,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        },
                        "right_main_content": {
                            "left": 373,
                            "right": 733,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        },
                        "spine_content": {
                            "left": 369,
                            "right": 373,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 4,
                                "height": 360
                            },
                            "width": 4,
                            "height": 360
                        },
                        "main_content_pre_trim": {
                            "left": 0,
                            "right": 742,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 742,
                                "height": 378
                            },
                            "width": 742,
                            "height": 378
                        },
                        "left_main_pre_trim": {
                            "left": 0,
                            "right": 369,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 369,
                                "height": 378
                            },
                            "width": 369,
                            "height": 378
                        },
                        "right_main_pre_trim": {
                            "left": 373,
                            "right": 742,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 369,
                                "height": 378
                            },
                            "width": 369,
                            "height": 378
                        },
                        "spine_pre_trim": {
                            "left": 369,
                            "right": 373,
                            "top": 378,
                            "bottom": 0,
                            "empty": false,
                            "dimensions": {
                                "width": 4,
                                "height": 378
                            },
                            "width": 4,
                            "height": 378
                        },
                        "isbn_placeholder": {
                            "left": 126,
                            "right": 252,
                            "top": 117,
                            "bottom": 45,
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
                    "post_trim_width": 724,
                    "post_trim_height": 360,
                    "pre_trim_width": 742,
                    "pre_trim_height": 378
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
                            "right": 369,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        },
                        "even_page_content": {
                            "left": 0,
                            "right": 360,
                            "top": 369,
                            "bottom": 9,
                            "empty": false,
                            "dimensions": {
                                "width": 360,
                                "height": 360
                            },
                            "width": 360,
                            "height": 360
                        }
                    },
                    "post_trim_width": 360,
                    "post_trim_height": 360,
                    "pre_trim_width": 369,
                    "pre_trim_height": 378
                }
            },
            "execution_type": "local"
        }
    },
    "book_url": "https://www.blurb.com/my/book/transactional_detail/12357124?ref=WZQXGCYNFHLYsyhHxq58&token=afe7c574d500416c89f3f9760c07c180c693f3bb",
    "book_has_isbn": false
}
```