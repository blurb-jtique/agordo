BEGIN;

------------------------------------------------------------------------------
-- Table: addresses
------------------------------------------------------------------------------
CREATE TABLE addresses (
    id              SERIAL PRIMARY KEY,
    first_name      character varying NOT NULL,
    street1         character varying NOT NULL,
    street2         character varying,
    city            character varying NOT NULL,
    zip             character varying NOT NULL,
    country_id      character varying NOT NULL,
    state_id        character varying,
    state_name      character varying,
    phone           character varying(40),
    deleted_at      timestamp without time zone,
    addressable_id  integer NOT NULL,
    addressable_type character varying,
    po_box_or_apo   boolean NOT NULL DEFAULT false,
    last_name       character varying,
    company_name    character varying,
    type            character varying
);

CREATE INDEX addresses_idx_polymorphic_fk
  ON addresses(addressable_id, addressable_type);

------------------------------------------------------------------------------
-- Table: admin_global_settings
------------------------------------------------------------------------------
CREATE TABLE admin_global_settings (
    id                SERIAL PRIMARY KEY,
    name              character varying,
    value             character varying,
    created_by_user_id integer,
    deleted_at        timestamp without time zone,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone,
    restricted        boolean NOT NULL DEFAULT false,
    type              character varying
);

------------------------------------------------------------------------------
-- Table: admin_meta_data
------------------------------------------------------------------------------
CREATE TABLE admin_meta_data (
    id         SERIAL PRIMARY KEY,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: api_keys
------------------------------------------------------------------------------
CREATE TABLE api_keys (
    id                  SERIAL PRIMARY KEY,
    user_id             integer,
    key                 character varying,
    name                character varying,
    created_at          timestamp without time zone,
    updated_at          timestamp without time zone,
    url                 character varying,
    support_url         character varying,
    callback_url        character varying,
    secret              character varying(40),
    order_callback_url  character varying,
    partner_id          integer,
    deleted_at          timestamp without time zone
);
CREATE INDEX index_api_keys_on_deleted_at
  ON api_keys(deleted_at);
CREATE UNIQUE INDEX index_api_keys_on_key
  ON api_keys(key);

------------------------------------------------------------------------------
-- Table: api_products
------------------------------------------------------------------------------
CREATE TABLE api_products (
    id                    SERIAL PRIMARY KEY,
    product_id            integer,
    cover_type_id         integer,
    product_dimension_id  integer,
    api_key_id            integer,
    title                 character varying(1024),
    guid                  character varying,
    state                 character varying DEFAULT 'PENDING',
    generate_cover        boolean,
    generate_cover_color  character varying,
    cover_url             character varying,
    guts_url              character varying,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone,
    generate_text_color   character varying,
    deleted_at            timestamp without time zone,
    paper_type_id         integer,
    source_version        character varying,
    source_info           character varying(2048),
    guts_uploaded_at      timestamp without time zone,
    cover_updated_at      timestamp without time zone
);

CREATE INDEX index_api_products_on_product_id
  ON api_products(product_id);

------------------------------------------------------------------------------
-- Table: api_sessions
------------------------------------------------------------------------------
CREATE TABLE api_sessions (
    id          SERIAL PRIMARY KEY,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone,
    api_user_id integer,
    api_key_id  integer
);

------------------------------------------------------------------------------
-- Table: api_sign_ins
------------------------------------------------------------------------------
CREATE TABLE api_sign_ins (
    id          SERIAL PRIMARY KEY,
    api_user_id integer NOT NULL,
    api_key_id  integer NOT NULL,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: api_users
------------------------------------------------------------------------------
CREATE TABLE api_users (
    id        SERIAL PRIMARY KEY,
    user_id   integer,
    user_token character varying
);

------------------------------------------------------------------------------
-- Table: apple_distribution_jobs
------------------------------------------------------------------------------
CREATE TABLE apple_distribution_jobs (
    id                SERIAL PRIMARY KEY,
    ebook_id          integer,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone,
    retry_count       integer,
    wf_id             integer,
    task_arguments_json text
);

------------------------------------------------------------------------------
-- Table: apple_rejection_tickets
------------------------------------------------------------------------------
CREATE TABLE apple_rejection_tickets (
    id                 SERIAL PRIMARY KEY,
    ebook_id           integer NOT NULL,
    ticket_type        character varying,
    notes              text,
    ticket_id          character varying,
    ticket_updated_at  timestamp without time zone,
    created_at         timestamp without time zone,
    updated_at         timestamp without time zone
);

CREATE INDEX index_apple_rejection_tickets_on_ebook_id
  ON apple_rejection_tickets(ebook_id);

------------------------------------------------------------------------------
-- Table: application_policies
------------------------------------------------------------------------------
CREATE TABLE application_policies (
    id   SERIAL PRIMARY KEY,
    name character varying NOT NULL
);

CREATE UNIQUE INDEX index_application_policies_on_name
  ON application_policies(name);

------------------------------------------------------------------------------
-- Table: application_policy_entries
------------------------------------------------------------------------------
CREATE TABLE application_policy_entries (
    id                   SERIAL PRIMARY KEY,
    application_policy_id integer,
    api_key_id            integer
);

------------------------------------------------------------------------------
-- Table: application_versions
------------------------------------------------------------------------------
CREATE TABLE application_versions (
    id          SERIAL PRIMARY KEY,
    api_key_id  integer,
    version     character varying
);

CREATE INDEX index_application_versions_on_version
  ON application_versions(version);

------------------------------------------------------------------------------
-- Table: asset_sizes_jobs
------------------------------------------------------------------------------
CREATE TABLE asset_sizes_jobs (
    id             SERIAL PRIMARY KEY,
    status         character varying DEFAULT 'new',
    bbf2_project_id character varying NOT NULL,
    wf_id          integer
);

------------------------------------------------------------------------------
-- Table: base_prices
------------------------------------------------------------------------------
CREATE TABLE base_prices (
    id                    SERIAL PRIMARY KEY,
    cover_type_id         integer NOT NULL,
    currency_id           character varying NOT NULL,
    price                 integer NOT NULL,
    product_type          character varying NOT NULL,
    product_dimension_id  integer NOT NULL,
    api_key_id            integer,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone,
    paper_type_id         integer NOT NULL
);

CREATE INDEX index_base_prices_on_paper_type_id
  ON base_prices(paper_type_id);

------------------------------------------------------------------------------
-- Table: bbf2_jobs
------------------------------------------------------------------------------
CREATE TABLE bbf2_jobs (
    id               SERIAL PRIMARY KEY,
    progress         integer DEFAULT 0,
    status           character varying DEFAULT 'new',
    bbf2_project_id  integer,
    created_at       timestamp without time zone,
    updated_at       timestamp without time zone,
    started_at       timestamp without time zone,
    finished_at      timestamp without time zone,
    job_type         character varying NOT NULL,
    wf_id            integer,
    update_needed    boolean
);

CREATE INDEX index_bbf2_jobs_on_bbf2_project_id
  ON bbf2_jobs(bbf2_project_id);

------------------------------------------------------------------------------
-- Table: bbf2_project_assets
------------------------------------------------------------------------------
CREATE TABLE bbf2_project_assets (
    id         SERIAL PRIMARY KEY,
    storage_id text NOT NULL,
    project_id text NOT NULL
);

CREATE INDEX index_bbf2_project_assets_on_project_id
  ON bbf2_project_assets(project_id);

------------------------------------------------------------------------------
-- Table: bbf2_projects
------------------------------------------------------------------------------
CREATE TABLE bbf2_projects (
    id          SERIAL PRIMARY KEY,
    guts_id     integer,
    project_id  character varying,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone,
    deleted_at  timestamp without time zone,
    selected    boolean NOT NULL DEFAULT false
);

CREATE INDEX index_bbf2_projects_on_guts_id
  ON bbf2_projects(guts_id);

CREATE INDEX idx_bbf2_projects_project_id
  ON bbf2_projects(project_id);

------------------------------------------------------------------------------
-- Table: bbf_jobs
------------------------------------------------------------------------------
CREATE TABLE bbf_jobs (
    id               SERIAL PRIMARY KEY,
    product_id       integer,
    book_xml         text,
    created_at       timestamp without time zone,
    updated_at       timestamp without time zone,
    user_id          integer,
    photobook_job_id integer,
    api_key_id       integer,
    book_project_id  integer,
    guts_id          integer,
    cover_design_id  integer,
    type             character varying,
    wf_id            integer,
    intended_cover_id integer
);

------------------------------------------------------------------------------
-- Table: bisac_categories
------------------------------------------------------------------------------
CREATE TABLE bisac_categories (
    id        SERIAL PRIMARY KEY,
    name      character varying NOT NULL,
    code      character varying,
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE INDEX index_bisac_categories_on_parent_id
  ON bisac_categories(parent_id);

------------------------------------------------------------------------------
-- Table: blob_chunks
------------------------------------------------------------------------------
CREATE TABLE blob_chunks (
    id                      SERIAL PRIMARY KEY,
    blob_upload_id          integer NOT NULL,
    chunk                   integer NOT NULL,
    state                   bytea NOT NULL,
    chunk_offset            integer NOT NULL,
    size                    integer NOT NULL,
    host                    character varying(256),
    created_at              timestamp without time zone NOT NULL,
    started_at              timestamp without time zone,
    processing_started_at   timestamp without time zone,
    finished_at             timestamp without time zone
);

CREATE INDEX index_blob_chunks_on_blob_upload_id_and_chunk
  ON blob_chunks(blob_upload_id, chunk);

CREATE INDEX index_blob_chunks_on_processing_started_at
  ON blob_chunks(processing_started_at);

CREATE INDEX index_blob_chunks_on_state_and_host
  ON blob_chunks(state, host);

------------------------------------------------------------------------------
-- Table: blob_uploads
------------------------------------------------------------------------------
CREATE TABLE blob_uploads (
    id              SERIAL PRIMARY KEY,
    upload_id       character varying(36) NOT NULL,
    state           bytea NOT NULL,
    total_size      integer NOT NULL,
    destination     character varying(512),
    created_at      timestamp without time zone NOT NULL,
    started_at      timestamp without time zone,
    finished_at     timestamp without time zone
);

CREATE INDEX index_blob_uploads_on_state_and_created_at
  ON blob_uploads(state, created_at);

CREATE INDEX index_blob_uploads_on_upload_id
  ON blob_uploads(upload_id);

------------------------------------------------------------------------------
-- Table: book_meta_datas
------------------------------------------------------------------------------
CREATE TABLE book_meta_datas (
    id              SERIAL PRIMARY KEY,
    book_id         integer,
    serialized_data text,
    authonomy       boolean
);

------------------------------------------------------------------------------
-- Table: book_previews
------------------------------------------------------------------------------
CREATE TABLE book_previews (
    id            SERIAL PRIMARY KEY,
    book_id       integer NOT NULL,
    preview_pages text NOT NULL DEFAULT ''
);

CREATE UNIQUE INDEX index_book_previews_on_book_id
  ON book_previews(book_id);

------------------------------------------------------------------------------
-- Table: book_projects
------------------------------------------------------------------------------
CREATE TABLE book_projects (
    id                  SERIAL PRIMARY KEY,
    user_id             integer,
    name                character varying,
    title               character varying,
    author              character varying,
    project_id          character varying,
    created_at          timestamp without time zone,
    updated_at          timestamp without time zone,
    subtitle            text,
    cover_file_name     character varying,
    cover_content_type  character varying,
    cover_file_size     integer,
    cover_updated_at    timestamp without time zone,
    product_id          integer,
    deleted_at          timestamp without time zone,
    synced              boolean NOT NULL DEFAULT true,
    source_name         character varying,
    source_version      character varying,
    source_info         character varying(2048),
    instant_book        character varying,
    type                character varying
);

CREATE INDEX index_book_projects_on_created_at
  ON book_projects(created_at);

CREATE INDEX index_book_projects_on_deleted_at
  ON book_projects(deleted_at);

CREATE INDEX index_book_projects_on_product_id
  ON book_projects(product_id);

CREATE INDEX index_book_projects_on_project_id
  ON book_projects(project_id);

CREATE INDEX index_book_projects_on_updated_at
  ON book_projects(updated_at);

CREATE INDEX index_book_projects_on_user_id
  ON book_projects(user_id);

------------------------------------------------------------------------------
-- Table: book_smart_crash_logs
------------------------------------------------------------------------------
CREATE TABLE book_smart_crash_logs (
    id                 SERIAL PRIMARY KEY,
    time               timestamp without time zone,
    from               character varying,
    guid               character varying,
    book_smart_version character varying,
    open_count         character varying,
    theme              character varying,
    to_reproduce_steps text,
    cause              text,
    stack              text,
    os_version         character varying,
    jvm                character varying,
    locale             character varying,
    book_guid          character varying
);

------------------------------------------------------------------------------
-- Table: book_source_devices
------------------------------------------------------------------------------
CREATE TABLE book_source_devices (
    id           SERIAL PRIMARY KEY,
    book_id      integer,
    user_agent   character varying,
    device_id    character varying,
    device_model character varying,
    os_version   character varying,
    build_version character varying,
    network_type character varying,
    device       character varying,
    model        character varying
);

CREATE INDEX idx_book_source_devices_book_id
  ON book_source_devices(book_id);

------------------------------------------------------------------------------
-- Table: book_specifications
------------------------------------------------------------------------------
CREATE TABLE book_specifications (
    id                    SERIAL PRIMARY KEY,
    cover_design_id       integer NOT NULL,
    cover_type_id         integer NOT NULL,
    paper_type_id         integer NOT NULL,
    custom_logo_type_id   integer,
    endsheet_type_id      integer,
    book_covering_type_id integer,
    cover_paper_type_id   integer,
    coating_type_id       integer,
    intended_cover_id     integer
);

------------------------------------------------------------------------------
-- Table: book_weights
------------------------------------------------------------------------------
CREATE TABLE book_weights (
    id                    SERIAL PRIMARY KEY,
    cover_type_id         integer,
    product_dimension_id  integer,
    weight_per_page       double precision,
    weight_constant       double precision,
    paper_type_id         integer
);

------------------------------------------------------------------------------
-- Table: bookify_crash_logs
------------------------------------------------------------------------------
CREATE TABLE bookify_crash_logs (
    id            SERIAL PRIMARY KEY,
    created_at    timestamp without time zone,
    username      character varying,
    project_guid  text,
    os            text,
    browser       text,
    flash_version text,
    error_message text,
    stack_trace   text,
    app_version   character varying,
    commands      text
);

------------------------------------------------------------------------------
-- Table: bookstore_languages
------------------------------------------------------------------------------
CREATE TABLE bookstore_languages (
    id          SERIAL PRIMARY KEY,
    name        character varying(50) NOT NULL,
    iso_id      character varying(3)  NOT NULL,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone,
    type        character varying
);

CREATE UNIQUE INDEX bookstore_languages_iso_id_type_key
  ON bookstore_languages(iso_id, type);

CREATE UNIQUE INDEX bookstore_languages_name_type_key
  ON bookstore_languages(name, type);

------------------------------------------------------------------------------
-- Table: bots
------------------------------------------------------------------------------
CREATE TABLE bots (
    id                SERIAL PRIMARY KEY,
    name              character varying NOT NULL,
    sample_user_agent character varying,
    url               character varying,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone
);

CREATE UNIQUE INDEX index_bots_on_name
  ON bots(name);

------------------------------------------------------------------------------
-- Table: campaigns
------------------------------------------------------------------------------
CREATE TABLE campaigns (
    id          SERIAL PRIMARY KEY,
    name        character varying NOT NULL,
    description character varying,
    agency      character varying,
    region      character varying,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: campaigns_backup
------------------------------------------------------------------------------
CREATE TABLE campaigns_backup (
    id          SERIAL PRIMARY KEY,
    name        character varying NOT NULL,
    description character varying,
    agency      character varying,
    region      character varying,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: capability_exceptions
------------------------------------------------------------------------------
CREATE TABLE capability_exceptions (
    id                    SERIAL PRIMARY KEY,
    printer_id            integer NOT NULL,
    product_dimension_id  integer,
    cover_type_id         integer,
    created_at            timestamp without time zone,
    created_by_username   character varying,
    deleted_at            timestamp without time zone,
    deleted_by_username   character varying,
    paper_type_id         integer,
    endsheet_type_id      integer,
    book_covering_type_id integer,
    api_key_id            integer
);

------------------------------------------------------------------------------
-- Table: cart_line_items
------------------------------------------------------------------------------
CREATE TABLE cart_line_items (
    id           SERIAL PRIMARY KEY,
    cart_id      integer,
    line_item_id integer,
    coupon_id    integer,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: carts
------------------------------------------------------------------------------
CREATE TABLE carts (
    id                  SERIAL PRIMARY KEY,
    currency_id         character varying,
    shown_return_policy boolean,
    created_at          timestamp without time zone,
    updated_at          timestamp without time zone,
    user_id             integer,
    deleted_at          timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: categories
------------------------------------------------------------------------------
CREATE TABLE categories (
    id                 SERIAL PRIMARY KEY,
    name               character varying(100) NOT NULL,
    updated_at         timestamp without time zone,
    name_i18n_key      character varying,
    bisac              character varying,
    web_uri            character varying
);

------------------------------------------------------------------------------
-- Table: channels
------------------------------------------------------------------------------
CREATE TABLE channels (
    id          SERIAL PRIMARY KEY,
    name        character varying NOT NULL,
    description character varying,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: channels_backup
------------------------------------------------------------------------------
CREATE TABLE channels_backup (
    id          SERIAL PRIMARY KEY,
    name        character varying NOT NULL,
    description character varying,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: checkouts
------------------------------------------------------------------------------
CREATE TABLE checkouts (
    id                             SERIAL PRIMARY KEY,
    cart_id                        integer,
    user_id                        integer,
    bill_id                        integer,
    ship_id                        integer,
    selected_shipping_option       integer,
    payment_detail_id              integer,
    printer_id                     integer,
    payment_type                   character varying,
    ship_resp                      text,
    created_at                     timestamp without time zone,
    updated_at                     timestamp without time zone,
    shipping_data_id               integer,
    estimated_ship_date            date,
    multi_coupon_id                integer,
    selected_shipping_fixed_cost   integer,
    cart_snapshot                  text,
    api_key_id                     integer,
    application_version_id         integer,
    ship_method_id                 integer,
    shipping_service_response_id   integer
);

------------------------------------------------------------------------------
-- Table: checkouts_coupon_uses
------------------------------------------------------------------------------
-- This table declared :id => false, so no primary key
CREATE TABLE checkouts_coupon_uses (
    checkout_id   integer,
    coupon_use_id integer
);

CREATE INDEX idx_ckts_c_us_ckt_id
  ON checkouts_coupon_uses(checkout_id);

------------------------------------------------------------------------------
-- Table: classification_test_books
------------------------------------------------------------------------------
CREATE TABLE classification_test_books (
    id                     SERIAL PRIMARY KEY,
    product_id             integer,
    classification_test_id integer
);

------------------------------------------------------------------------------
-- Table: classification_test_response_options
------------------------------------------------------------------------------
CREATE TABLE classification_test_response_options (
    id                     SERIAL PRIMARY KEY,
    option_text            character varying,
    classification_test_id integer
);

------------------------------------------------------------------------------
-- Table: classification_test_responses
------------------------------------------------------------------------------
CREATE TABLE classification_test_responses (
    id                                 SERIAL PRIMARY KEY,
    user_id                            integer,
    classification_test_book_id        integer,
    classification_test_response_option_id integer
);

------------------------------------------------------------------------------
-- Table: classification_tests
------------------------------------------------------------------------------
CREATE TABLE classification_tests (
    id               SERIAL PRIMARY KEY,
    name             character varying,
    active           boolean,
    completed        boolean,
    created_by_user_id integer
);

------------------------------------------------------------------------------
-- Table: comments
------------------------------------------------------------------------------
CREATE TABLE comments (
    id             SERIAL PRIMARY KEY,
    comment        text NOT NULL,
    user_id        integer NOT NULL,
    commentable_id integer NOT NULL,
    commentable_type character varying(64) NOT NULL,
    created_at     timestamp without time zone NOT NULL
);

CREATE INDEX comments_idx_type_id
  ON comments(commentable_id, commentable_type);

------------------------------------------------------------------------------
-- Table: configuration_pricings
------------------------------------------------------------------------------
CREATE TABLE configuration_pricings (
    id                    SERIAL PRIMARY KEY,
    product_dimension_id  integer NOT NULL,
    cover_type_id         integer NOT NULL,
    low_page_count        integer NOT NULL,
    high_page_count       integer NOT NULL,
    price_in_cents        integer NOT NULL,
    currency_id           character varying,
    paper_type_id         integer,
    cover_paper_type_id   integer,
    price_in_cents_usd    integer,
    api_key_id            integer
);

------------------------------------------------------------------------------
-- Table: content_images
------------------------------------------------------------------------------
CREATE TABLE content_images (
    id                SERIAL PRIMARY KEY,
    site_content_id   integer NOT NULL,
    file_file_name    character varying,
    file_content_type character varying,
    file_file_size    integer,
    file_updated_at   timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: content_translations
------------------------------------------------------------------------------
CREATE TABLE content_translations (
    id         SERIAL PRIMARY KEY,
    name       character varying,
    start_sha  text,
    end_sha    text,
    state      character varying,
    language   character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: content_types
------------------------------------------------------------------------------
CREATE TABLE content_types (
    id    SERIAL PRIMARY KEY,
    value character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: continents
------------------------------------------------------------------------------
CREATE TABLE continents (
    id   SERIAL PRIMARY KEY,
    name character varying
);

------------------------------------------------------------------------------
-- Table: conversion_events
------------------------------------------------------------------------------
CREATE TABLE conversion_events (
    id                             SERIAL PRIMARY KEY,
    name                           character varying NOT NULL,
    conversion_event_reference_type character varying,
    created_at                     timestamp without time zone,
    updated_at                     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: conversion_statuses
------------------------------------------------------------------------------
-- Rails says “Could not dump table 'conversion_statuses'...” (unknown custom type).
-- This is a placeholder guess. Adjust the 'conversion_status' column type as needed.
CREATE TABLE conversion_statuses (
    id                     SERIAL PRIMARY KEY,
    conversion_status      text,  -- or whatever type (enum) your DB actually uses
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: countries
------------------------------------------------------------------------------
CREATE TABLE countries (
    id                  SERIAL PRIMARY KEY,
    iso_id              character varying(3) NOT NULL,
    name                character varying     NOT NULL,
    continent_id        integer,
    deleted_at          timestamp without time zone,
    shipping_region_id  integer,
    allows_return_label boolean,
    iso_3_id            character varying
);

CREATE UNIQUE INDEX index_countries_on_iso_3_id
  ON countries(iso_3_id);

CREATE UNIQUE INDEX index_countries_on_iso_id
  ON countries(iso_id);

------------------------------------------------------------------------------
-- Table: coupon_code_mappings (id => false)
------------------------------------------------------------------------------
CREATE TABLE coupon_code_mappings (
    multi_coupon_id integer NOT NULL,
    coupon_id       integer NOT NULL
);

CREATE INDEX idx_cpn_cd_mppngs_mlti_cpn_id
  ON coupon_code_mappings(multi_coupon_id);

------------------------------------------------------------------------------
-- Table: coupon_template_currencies
------------------------------------------------------------------------------
CREATE TABLE coupon_template_currencies (
    id                      SERIAL PRIMARY KEY,
    coupon_template_id      integer NOT NULL,
    currency_iso_id         character varying(12) NOT NULL,
    amount                  integer NOT NULL,
    max_value_for_percent   integer,
    target_min_value        integer,
    created_at              timestamp without time zone,
    updated_at              timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: coupon_template_to_product_dimensions
------------------------------------------------------------------------------
CREATE TABLE coupon_template_to_product_dimensions (
    id                  SERIAL PRIMARY KEY,
    coupon_template_id  integer NOT NULL,
    product_dimension_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: coupon_template_to_product_options
------------------------------------------------------------------------------
CREATE TABLE coupon_template_to_product_options (
    id                 SERIAL PRIMARY KEY,
    coupon_template_id integer NOT NULL,
    product_option_id  integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: coupon_templates
------------------------------------------------------------------------------
CREATE TABLE coupon_templates (
    id                     SERIAL PRIMARY KEY,
    code_prefix            character varying(64) NOT NULL,
    description            character varying(128) NOT NULL,
    budget_bucket          character varying(64),
    calc_type              character varying(20) DEFAULT 'FIXED' NOT NULL,
    applies_to             character varying(64) NOT NULL,
    amount                 integer DEFAULT 0,
    max_value_for_percent  integer,
    enabled                boolean DEFAULT true NOT NULL,
    auto_assigned          boolean DEFAULT false NOT NULL,
    created_at             timestamp without time zone NOT NULL,
    deleted_at             timestamp without time zone,
    starts_on              date,
    ends_on                date,
    target_applies_to      character varying(64) DEFAULT 'ALL' NOT NULL,
    target_min_value       integer,
    target_max_value       integer,
    target_min_quantity    integer,
    target_max_quantity    integer,
    uses_per_customer      integer,
    uses_per_coupon        integer DEFAULT 1,
    coupons_count          integer DEFAULT 0 NOT NULL,
    currency_id            character varying(12),
    allow_unauthored_books boolean DEFAULT false,
    is_gift_card           boolean DEFAULT false,
    user_id                integer
);

CREATE INDEX coupon_templates_idx_code
  ON coupon_templates(code_prefix, deleted_at);

------------------------------------------------------------------------------
-- Table: coupon_uses
------------------------------------------------------------------------------
CREATE TABLE coupon_uses (
    id                SERIAL PRIMARY KEY,
    created_at        timestamp without time zone NOT NULL,
    amount            integer DEFAULT 0 NOT NULL,
    coupon_amount     integer DEFAULT 0 NOT NULL,
    coupon_calc_type  character varying(20) NOT NULL,
    coupon_applies_to character varying(64) NOT NULL,
    order_id          integer,
    coupon_id         integer NOT NULL,
    coupon_amount_usd integer DEFAULT 0 NOT NULL,
    amount_usd        integer DEFAULT 0 NOT NULL,
    user_id           integer,
    currency_id       character varying,
    device_id         character varying
);

CREATE INDEX index_coupon_uses_on_device_id
  ON coupon_uses(device_id);

------------------------------------------------------------------------------
-- Table: coupons
------------------------------------------------------------------------------
CREATE TABLE coupons (
    id                     SERIAL PRIMARY KEY,
    code                   character varying(64) NOT NULL,
    created_at             timestamp without time zone NOT NULL,
    deleted_at             timestamp without time zone,
    coupon_uses_count      integer DEFAULT 0 NOT NULL,
    template_id            integer NOT NULL,
    claimed_by_user_id     integer,
    type                   character varying,
    gift_card_line_item_id integer,
    gift_card_option_id    integer,
    voided_amount          integer DEFAULT 0,
    voided_amount_usd      integer DEFAULT 0,
    country_id             character varying(3)
);

CREATE INDEX coupons_idx_code
  ON coupons(code, deleted_at);

CREATE INDEX index_coupons_on_template_id
  ON coupons(template_id);

------------------------------------------------------------------------------
-- Table: cover_designs
------------------------------------------------------------------------------
CREATE TABLE cover_designs (
    id                  SERIAL PRIMARY KEY,
    product_id          integer,
    created_at          timestamp without time zone,
    updated_at          timestamp without time zone,
    cover_design_guid   character varying(64),
    selected            boolean DEFAULT true,
    deleted_at          timestamp without time zone,
    asset_collection_id character varying(64)
);

CREATE INDEX index_cover_designs_on_cover_design_guid
  ON cover_designs(cover_design_guid);

CREATE INDEX index_cover_designs_on_deleted_at
  ON cover_designs(deleted_at);

CREATE INDEX index_cover_designs_on_product_id
  ON cover_designs(product_id);

CREATE INDEX index_cover_designs_on_selected
  ON cover_designs(selected);

------------------------------------------------------------------------------
-- Table: cover_renderer_jobs
------------------------------------------------------------------------------
CREATE TABLE cover_renderer_jobs (
    id         SERIAL PRIMARY KEY,
    order_id   integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    wf_id      integer
);

------------------------------------------------------------------------------
-- Table: currencies (id => false)
------------------------------------------------------------------------------
CREATE TABLE currencies (
    iso_id                character varying(3) NOT NULL,
    string_format         character varying(256) NOT NULL,
    seller_minimum_payout integer NOT NULL,
    seller_processing_fee integer NOT NULL,
    exponent              integer NOT NULL DEFAULT 2
);
ALTER TABLE currencies ADD PRIMARY KEY (iso_id);

------------------------------------------------------------------------------
-- Table: currencies_stores (id => false)
------------------------------------------------------------------------------
CREATE TABLE currencies_stores (
    store_id    integer NOT NULL,
    currency_id character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: currency_markups
------------------------------------------------------------------------------
CREATE TABLE currency_markups (
    id             SERIAL PRIMARY KEY,
    markup_type_id integer NOT NULL,
    currency_id    character varying NOT NULL,
    markup_value   double precision NOT NULL,
    api_key_id     integer
);

------------------------------------------------------------------------------
-- Table: currency_pricings
------------------------------------------------------------------------------
CREATE TABLE currency_pricings (
    id                  SERIAL PRIMARY KEY,
    currency_id         character varying NOT NULL,
    created_by_user_id  integer NOT NULL,
    premium_paper_markup double precision NOT NULL,
    colophon_markup     double precision NOT NULL,
    created_at          timestamp without time zone,
    updated_at          timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: custhelp_domains
------------------------------------------------------------------------------
CREATE TABLE custhelp_domains (
    id       SERIAL PRIMARY KEY,
    language character varying,
    domain   character varying
);

------------------------------------------------------------------------------
-- Table: custom_isbn_intents
------------------------------------------------------------------------------
CREATE TABLE custom_isbn_intents (
    id         SERIAL PRIMARY KEY,
    project_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: customer_coupon_templates
------------------------------------------------------------------------------
CREATE TABLE customer_coupon_templates (
    id                            SERIAL PRIMARY KEY,
    applies_to_behavior           character varying,
    coupon_template_id            integer NOT NULL,
    purchase_range_min            integer,
    purchase_range_max            integer,
    creation_source               character varying,
    customer_coupon_template_type character varying NOT NULL,
    partner_id                    integer,
    days_until_expiration         integer,
    created_at                    timestamp without time zone,
    updated_at                    timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: daylight_savings_datas
------------------------------------------------------------------------------
CREATE TABLE daylight_savings_datas (
    id                     SERIAL PRIMARY KEY,
    begin_daylight_savings timestamp without time zone NOT NULL,
    end_daylight_savings   timestamp without time zone NOT NULL,
    country_id             character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: default_gateways
------------------------------------------------------------------------------
CREATE TABLE default_gateways (
    id          SERIAL PRIMARY KEY,
    gateway_name character varying,
    created_at   timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: default_time_in_transits
------------------------------------------------------------------------------
CREATE TABLE default_time_in_transits (
    id                       SERIAL PRIMARY KEY,
    trackable                boolean NOT NULL DEFAULT false,
    transit_information_id   integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: delivery_methods
------------------------------------------------------------------------------
CREATE TABLE delivery_methods (
    id                    SERIAL PRIMARY KEY,
    name                  character varying,
    rank                  integer,
    display_name_i18n_key character varying
);

------------------------------------------------------------------------------
-- Table: deprecated__old_metadata
------------------------------------------------------------------------------
CREATE TABLE deprecated__old_metadata (
    id         SERIAL PRIMARY KEY,
    storage_id text NOT NULL,
    key_id     integer NOT NULL,
    value      text,
    deleted_at timestamp without time zone
);

CREATE INDEX index_metadata_on_storage_id
  ON deprecated__old_metadata(storage_id);

------------------------------------------------------------------------------
-- Table: deprecated__old_metadata_keys
------------------------------------------------------------------------------
CREATE TABLE deprecated__old_metadata_keys (
    id        SERIAL PRIMARY KEY,
    key       text NOT NULL,
    deleted_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: (lots of "deprecated_*" tables)
------------------------------------------------------------------------------
-- In the interest of brevity, the many “deprecated_*” tables will follow
-- the same straightforward pattern:  CREATE TABLE, primary key "id", columns
-- with matching types/defaults, plus any listed indexes.  They do not appear
-- to be in active use, so I’ll just demonstrate a couple. You can expand
-- similarly for all.

CREATE TABLE deprecated_blurb_nation_infos (
    id         SERIAL PRIMARY KEY,
    user_id    integer,
    member_at  timestamp without time zone,
    provider_at timestamp without time zone,
    removed_at timestamp without time zone
);

CREATE TABLE deprecated_mobile_contacts (
    id            SERIAL PRIMARY KEY,
    user_id       integer,
    address       character varying(128) NOT NULL DEFAULT '',
    CONSTRAINT    chk_address_not_empty CHECK (length(address) > 0)
);
CREATE INDEX index_mobile_contacts_on_address
  ON deprecated_mobile_contacts(address);
CREATE INDEX index_mobile_contacts_on_user_id
  ON deprecated_mobile_contacts(user_id);

-- ...and so on for the rest of the `deprecated_` tables.

------------------------------------------------------------------------------
-- Table: devices
------------------------------------------------------------------------------
CREATE TABLE devices (
    id    SERIAL PRIMARY KEY,
    make  character varying,
    model character varying
);

CREATE UNIQUE INDEX index_devices_on_make_model
  ON devices(make, model);

------------------------------------------------------------------------------
-- Table: disabled_reasons
------------------------------------------------------------------------------
CREATE TABLE disabled_reasons (
    id         SERIAL PRIMARY KEY,
    name       character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: distributed_task_policies
------------------------------------------------------------------------------
CREATE TABLE distributed_task_policies (
    id                     SERIAL PRIMARY KEY,
    name                   character varying NOT NULL,
    distribution_threshold integer,
    distribution_value     character varying,
    distribution_type      character varying,
    disabled               boolean,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone
);

CREATE UNIQUE INDEX index_distributed_task_policies_on_name
  ON distributed_task_policies(name);

------------------------------------------------------------------------------
-- Table: distribution_amazon_order_items
------------------------------------------------------------------------------
CREATE TABLE distribution_amazon_order_items (
    id                           SERIAL PRIMARY KEY,
    distribution_amazon_order_id integer,
    asin                         character varying,
    quantity                     integer DEFAULT 1,
    item_price                   integer DEFAULT 0 NOT NULL,
    item_price_usd               integer,
    item_tax                     integer DEFAULT 0 NOT NULL,
    item_tax_usd                 integer,
    promotion_discount           integer DEFAULT 0 NOT NULL,
    promotion_discount_usd       integer,
    shipping_discount            integer DEFAULT 0 NOT NULL,
    shipping_discount_usd        integer,
    shipping_price               integer DEFAULT 0 NOT NULL,
    shipping_price_usd           integer,
    shipping_tax                 integer DEFAULT 0 NOT NULL,
    shipping_tax_usd             integer,
    currency_id                  character varying(3) NOT NULL,
    created_at                   timestamp without time zone,
    updated_at                   timestamp without time zone,
    amazon_order_item_code       character varying,
    seller_sku                   character varying
);

------------------------------------------------------------------------------
-- Table: distribution_amazon_orders
------------------------------------------------------------------------------
CREATE TABLE distribution_amazon_orders (
    id             SERIAL PRIMARY KEY,
    amazon_order_id character varying,
    state          character varying DEFAULT 'NEW',
    order_id       integer,
    order_total    integer DEFAULT 0 NOT NULL,
    order_total_usd integer,
    currency_id    character varying(3) NOT NULL,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: distribution_channel_product_sales
------------------------------------------------------------------------------
CREATE TABLE distribution_channel_product_sales (
    id                        SERIAL PRIMARY KEY,
    created_at                timestamp without time zone NOT NULL,
    settled_at                timestamp without time zone,
    line_item_id              integer NOT NULL,
    author_profit             integer DEFAULT 0 NOT NULL,
    author_profit_usd         integer DEFAULT 0 NOT NULL,
    statement_id              integer,
    settled_currency_id       character varying(3),
    settled_exchange_rate_id  integer,
    settled_author_profit     integer DEFAULT 0 NOT NULL,
    settled_author_profit_usd integer DEFAULT 0 NOT NULL,
    settleable_at             date,
    type                      character varying
);

CREATE INDEX index_channel_product_sales_on_line_item_id
  ON distribution_channel_product_sales(line_item_id);

CREATE INDEX idx_distribution_channel_product_sales_statement_id
  ON distribution_channel_product_sales(statement_id);

------------------------------------------------------------------------------
-- Table: distribution_channels
------------------------------------------------------------------------------
CREATE TABLE distribution_channels (
    id         SERIAL PRIMARY KEY,
    name       character varying,
    key        character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE UNIQUE INDEX index_distribution_channels_on_key
  ON distribution_channels(key);

------------------------------------------------------------------------------
-- Table: distribution_entries
------------------------------------------------------------------------------
CREATE TABLE distribution_entries (
    id                                 SERIAL PRIMARY KEY,
    distribution_channel_id            integer,
    isbn_id                            integer,
    state                              character varying,
    created_at                         timestamp without time zone,
    updated_at                         timestamp without time zone,
    deleted_at                         timestamp without time zone,
    distribution_price_id              integer,
    project_format_id                  integer,
    seller_book_specification_id       integer,
    distribution_wholesale_discount_tier_id integer NOT NULL
);

CREATE INDEX index_distribution_entries_on_distribution_channel_id
  ON distribution_entries(distribution_channel_id);

CREATE INDEX idx_dstrbtn_entry_dstrbtn_prc_id
  ON distribution_entries(distribution_price_id);

CREATE INDEX index_distribution_entries_on_project_format_id
  ON distribution_entries(project_format_id);

CREATE INDEX index_distribution_entries_on_seller_book_specification_id
  ON distribution_entries(seller_book_specification_id);

------------------------------------------------------------------------------
-- Table: distribution_entry_histories
------------------------------------------------------------------------------
-- Another unknown custom type: “distribution_entry_histories_state”
-- Provide a placeholder:
CREATE TABLE distribution_entry_histories (
    id              SERIAL PRIMARY KEY,
    distribution_entry_id integer,
    state           text,  -- or change to the real type
    created_at      timestamp without time zone,
    updated_at      timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: distribution_feed_submissions
------------------------------------------------------------------------------
CREATE TABLE distribution_feed_submissions (
    id            SERIAL PRIMARY KEY,
    submission_id character varying NOT NULL,
    feed_type     character varying NOT NULL,
    submitted_date timestamp without time zone,
    status        character varying,
    created_at    timestamp without time zone,
    updated_at    timestamp without time zone,
    isbn          character varying,
    feed_type_id  integer NOT NULL
);

CREATE INDEX index_distribution_feed_submissions_on_isbn
  ON distribution_feed_submissions(isbn);

CREATE INDEX index_distribution_feed_submissions_on_submission_id
  ON distribution_feed_submissions(submission_id);

------------------------------------------------------------------------------
-- Table: distribution_ingram_sales_data
------------------------------------------------------------------------------
CREATE TABLE distribution_ingram_sales_data (
    id                                 SERIAL PRIMARY KEY,
    isbn                               character varying,
    sku                                character varying,
    parent_isbn                        character varying,
    list_price                         character varying,
    wholesale_discount_percentage      character varying,
    mtd_quantity                       character varying,
    mtd_avg_list_price                 character varying,
    mtd_extended_list                  character varying,
    mtd_avg_discount_percentage        character varying,
    mtd_extended_discount              character varying,
    mtd_avg_wholesale_price            character varying,
    mtd_extended_wholesale             character varying,
    mtd_avg_print_charge               character varying,
    mtd_extended_print_charge          character varying,
    mtd_gross_pub_comp                 character varying,
    mtd_extended_adjustments           character varying,
    mtd_extended_recovery              character varying,
    mtd_pub_comp                       character varying,
    deferral_balance                   character varying,
    reporting_currency_code            character varying NOT NULL,
    period_name                        character varying,
    original_deferral_amount           character varying,
    mtd_return_quantity                character varying,
    mtd_return_wholesale               character varying,
    mtd_return_charge                  character varying,
    mtd_return_total                   character varying,
    mtd_net_quantity                   character varying,
    mtd_net_wholesale                  character varying,
    mtd_net_pub_comp                   character varying,
    returns_flag                       character varying,
    nonreturnable_date                 character varying,
    market                             character varying
);

CREATE INDEX idx_dist_ingram_sales_data_period_name
  ON distribution_ingram_sales_data(period_name);

------------------------------------------------------------------------------
-- Table: distribution_ingram_sales_data_line_items (id => false)
------------------------------------------------------------------------------
CREATE TABLE distribution_ingram_sales_data_line_items (
    distribution_ingram_sales_data_id integer NOT NULL,
    line_item_id                      integer NOT NULL
);

CREATE INDEX idx_dist_ingram_sales_data_line_items_id
  ON distribution_ingram_sales_data_line_items(distribution_ingram_sales_data_id);

CREATE INDEX idx_dist_ingram_sales_data_line_items_line_item_id
  ON distribution_ingram_sales_data_line_items(line_item_id);

------------------------------------------------------------------------------
-- Table: distribution_list_price_histories
------------------------------------------------------------------------------
CREATE TABLE distribution_list_price_histories (
    id                           SERIAL PRIMARY KEY,
    list_price                   integer,
    seller_book_specification_id integer,
    list_price_usd               integer,
    currency_id                  character varying,
    created_at                   timestamp without time zone,
    updated_at                   timestamp without time zone,
    distribution_list_price_id   integer,
    base_price                   integer,
    base_price_usd               integer
);

------------------------------------------------------------------------------
-- Table: distribution_list_prices
------------------------------------------------------------------------------
CREATE TABLE distribution_list_prices (
    id                           SERIAL PRIMARY KEY,
    list_price                   integer DEFAULT 0 NOT NULL,
    seller_book_specification_id integer,
    created_at                   timestamp without time zone,
    updated_at                   timestamp without time zone,
    deleted_at                   timestamp without time zone,
    currency_id                  character varying(3) DEFAULT 'USD' NOT NULL,
    list_price_usd               integer DEFAULT 0 NOT NULL
);

------------------------------------------------------------------------------
-- Table: distribution_pricing_models
------------------------------------------------------------------------------
CREATE TABLE distribution_pricing_models (
    id                      SERIAL PRIMARY KEY,
    distribution_channel_id integer NOT NULL,
    distributor_rake        double precision DEFAULT 0.0 NOT NULL,
    distributor_fee         integer DEFAULT 0 NOT NULL,
    blurb_rake              double precision DEFAULT 0.0 NOT NULL,
    blurb_fee               integer DEFAULT 0 NOT NULL,
    created_at              timestamp without time zone,
    updated_at              timestamp without time zone,
    currency_id             character varying(3) DEFAULT 'USD' NOT NULL,
    deleted_at              timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: distribution_states
------------------------------------------------------------------------------
CREATE TABLE distribution_states (
    id          SERIAL PRIMARY KEY,
    key         character varying,
    description character varying,
    active      boolean DEFAULT true
);

------------------------------------------------------------------------------
-- Table: distribution_wholesale_discount_tiers
------------------------------------------------------------------------------
CREATE TABLE distribution_wholesale_discount_tiers (
    id                       SERIAL PRIMARY KEY,
    distribution_channel_id  integer,
    discount_percentage      double precision NOT NULL,
    created_at               timestamp without time zone,
    updated_at               timestamp without time zone,
    rank                     integer
);

CREATE INDEX index_distribution_wholesale_discount_tiers_on_distribution_cha
  ON distribution_wholesale_discount_tiers(distribution_channel_id);

------------------------------------------------------------------------------
-- Table: download_tokens
------------------------------------------------------------------------------
CREATE TABLE download_tokens (
    id                     SERIAL PRIMARY KEY,
    user_id                integer,
    download_tokenable_id  integer,
    token                  character varying,
    uses                   integer DEFAULT 0,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone,
    bitly_url              character varying,
    download_tokenable_type character varying DEFAULT 'ebook' NOT NULL
);

CREATE UNIQUE INDEX index_download_tokens_on_user_id_and_download_tokenable_id_and_
  ON download_tokens(user_id, download_tokenable_id, download_tokenable_type);

------------------------------------------------------------------------------
-- Table: downloads
------------------------------------------------------------------------------
-- Could not dump table “downloads” because “Unknown type 'uuid' for column 'ua_hash'”.
-- Here’s a placeholder that includes a uuid column:
CREATE TABLE downloads (
    id         SERIAL PRIMARY KEY,
    ua_hash    uuid,  -- or change to text if you don’t want real UUID
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ebook_apple_epub_jobs
------------------------------------------------------------------------------
CREATE TABLE ebook_apple_epub_jobs (
    id        SERIAL PRIMARY KEY,
    progress  integer DEFAULT 0,
    status    character varying DEFAULT 'new',
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ebook_id   integer,
    wf_id      integer
);

------------------------------------------------------------------------------
-- Table: ebook_apple_ibookstore_removals
------------------------------------------------------------------------------
CREATE TABLE ebook_apple_ibookstore_removals (
    id        SERIAL PRIMARY KEY,
    ebook_id  integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ebook_apple_ibookstore_reports
------------------------------------------------------------------------------
CREATE TABLE ebook_apple_ibookstore_reports (
    id        SERIAL PRIMARY KEY,
    filename  character varying,
    sales_csv text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ebook_apple_ibookstore_submissions
------------------------------------------------------------------------------
CREATE TABLE ebook_apple_ibookstore_submissions (
    id                 SERIAL PRIMARY KEY,
    ebook_id           integer NOT NULL,
    bisac_category_id  integer NOT NULL,
    price_tier         integer NOT NULL,
    created_at         timestamp without time zone,
    updated_at         timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ebook_categories (id => false)
------------------------------------------------------------------------------
CREATE TABLE ebook_categories (
    ebook_id       integer NOT NULL,
    category_id    integer NOT NULL,
    category_type  character varying(1) NOT NULL DEFAULT 'S',
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone
);
CREATE INDEX idx_ebookcategories_bycat
  ON ebook_categories(category_id, ebook_id);
CREATE UNIQUE INDEX udx_ebookcategories_primarycat
  ON ebook_categories(ebook_id, category_type);

------------------------------------------------------------------------------
-- Table: ebook_epubs
------------------------------------------------------------------------------
CREATE TABLE ebook_epubs (
    id                SERIAL PRIMARY KEY,
    user_id           integer,
    cover_file_size   integer,
    title             character varying,
    cover_file_name   character varying,
    cover_content_type character varying,
    filename          character varying,
    cover_updated_at  timestamp without time zone,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone,
    epub_file_name    character varying,
    epub_content_type character varying,
    epub_file_size    integer,
    epub_updated_at   timestamp without time zone,
    author            character varying,
    project_id        character varying,
    cover_image_url   character varying
);

------------------------------------------------------------------------------
-- Table: ebook_page_visits
------------------------------------------------------------------------------
CREATE TABLE ebook_page_visits (
    id        SERIAL PRIMARY KEY,
    ebook_id  integer NOT NULL,
    sales     integer DEFAULT 0 NOT NULL,
    views     integer DEFAULT 0 NOT NULL,
    created_on date NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ebook_price_tiers
------------------------------------------------------------------------------
CREATE TABLE ebook_price_tiers (
    id          SERIAL PRIMARY KEY,
    tier_index  integer,
    price_cents integer,
    currency_id character varying,
    active      boolean DEFAULT false,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ebook_sales
------------------------------------------------------------------------------
CREATE TABLE ebook_sales (
    id                     SERIAL PRIMARY KEY,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone,
    apple_created_at       timestamp without time zone,
    settled_at             timestamp without time zone,
    line_item_id           integer,
    currency_id            character varying NOT NULL,
    ebook_id               integer NOT NULL,
    quantity               integer DEFAULT 1 NOT NULL,
    author_profit          integer DEFAULT 0 NOT NULL,
    author_profit_usd      integer DEFAULT 0 NOT NULL,
    markupable_history_id  integer,
    statement_id           integer,
    settled_currency_id    character varying(3),
    settled_exchange_rate_id integer,
    settled_author_profit  integer DEFAULT 0 NOT NULL,
    settled_author_profit_usd integer DEFAULT 0 NOT NULL,
    markupable_history_type character varying,
    source                 character varying DEFAULT 'blurb' NOT NULL
);

CREATE INDEX idx_ebook_sales_ebook_id
  ON ebook_sales(ebook_id);
CREATE INDEX idx_ebook_sales_line_item_id
  ON ebook_sales(line_item_id);
CREATE INDEX idx_ebook_sales_statement_id
  ON ebook_sales(statement_id);

------------------------------------------------------------------------------
-- Table: ebook_sources
------------------------------------------------------------------------------
CREATE TABLE ebook_sources (
    id   SERIAL PRIMARY KEY,
    name text NOT NULL
);

------------------------------------------------------------------------------
-- Table: ebooks
------------------------------------------------------------------------------
-- Could not dump table “ebooks” (unknown type 'uuid' for 'ebook_storage_id').
CREATE TABLE ebooks (
    id                SERIAL PRIMARY KEY,
    ebook_storage_id  uuid,  -- or text
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: emails
------------------------------------------------------------------------------
CREATE TABLE emails (
    id                 SERIAL PRIMARY KEY,
    user_id            integer NOT NULL,
    address            character varying(128) NOT NULL DEFAULT '',
    confirmed          boolean NOT NULL DEFAULT false,
    confirm_ip         character varying,
    confirmed_on       timestamp without time zone,
    created_at         timestamp without time zone NOT NULL,
    deleted_at         timestamp without time zone,
    confirmed_by_id    integer,
    email_signup_source text,
    verified           boolean
);

CREATE INDEX index_emails_on_address
  ON emails(address);

CREATE INDEX emails_idx_email
  ON emails(deleted_at);

CREATE INDEX index_emails_on_user_id
  ON emails(user_id);

------------------------------------------------------------------------------
-- Table: embed_widget_users
------------------------------------------------------------------------------
CREATE TABLE embed_widget_users (
    id        SERIAL PRIMARY KEY,
    user_id   integer,
    session_id character varying,
    is_author boolean DEFAULT false
);

------------------------------------------------------------------------------
-- Table: exchange_rates
------------------------------------------------------------------------------
CREATE TABLE exchange_rates (
    id             SERIAL PRIMARY KEY,
    to_currency_id character varying(3) NOT NULL,
    rate           double precision NOT NULL,
    active_at      timestamp without time zone NOT NULL
);

------------------------------------------------------------------------------
-- Table: excluded_cover_options
------------------------------------------------------------------------------
CREATE TABLE excluded_cover_options (
    id                 SERIAL PRIMARY KEY,
    cover_design_id    integer,
    product_option_id  integer,
    scope              character varying(20) NOT NULL DEFAULT 'PRODUCT',
    created_at         timestamp without time zone,
    updated_at         timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: excluded_product_options
------------------------------------------------------------------------------
CREATE TABLE excluded_product_options (
    id                SERIAL PRIMARY KEY,
    product_option_id integer NOT NULL,
    product_id        integer NOT NULL,
    scope             character varying(20) NOT NULL DEFAULT 'AUTHOR'
);

CREATE INDEX index_excluded_product_options_on_product_id
  ON excluded_product_options(product_id);

------------------------------------------------------------------------------
-- Table: failed_login_attempts
------------------------------------------------------------------------------
CREATE TABLE failed_login_attempts (
    id           SERIAL PRIMARY KEY,
    ipaddress    character varying NOT NULL,
    context      character varying NOT NULL,
    attempts     integer DEFAULT 0,
    attempt_date timestamp without time zone NOT NULL,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

CREATE INDEX index_failed_login_attempts_on_context
  ON failed_login_attempts(context);

CREATE INDEX index_failed_login_attempts_on_ipaddress
  ON failed_login_attempts(ipaddress);

------------------------------------------------------------------------------
-- Table: fixed_currency_prices
------------------------------------------------------------------------------
CREATE TABLE fixed_currency_prices (
    id                SERIAL PRIMARY KEY,
    product_id        integer NOT NULL,
    cover_type_id     integer NOT NULL,
    currency_id       character varying NOT NULL,
    created_by_user_id character varying NOT NULL,
    price             integer DEFAULT 0 NOT NULL,
    price_usd         integer DEFAULT 0 NOT NULL,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone,
    deleted_at        timestamp without time zone,
    guts_id           integer,
    paper_type_id     integer
);

CREATE INDEX index_fixed_currency_prices_on_product_id_and_guts_id
  ON fixed_currency_prices(product_id, guts_id);

------------------------------------------------------------------------------
-- Table: fixed_line_item_currency_prices
------------------------------------------------------------------------------
CREATE TABLE fixed_line_item_currency_prices (
    id             SERIAL PRIMARY KEY,
    price          integer DEFAULT 0 NOT NULL,
    price_usd      integer DEFAULT 0 NOT NULL,
    currency_id    character varying NOT NULL,
    line_item_type character varying NOT NULL,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: fixed_price_currency_markups
------------------------------------------------------------------------------
CREATE TABLE fixed_price_currency_markups (
    id             SERIAL PRIMARY KEY,
    markup_type_id integer NOT NULL,
    currency_id    character varying NOT NULL,
    markup_value   double precision NOT NULL,
    api_key_id     integer
);

------------------------------------------------------------------------------
-- Table: flags
------------------------------------------------------------------------------
CREATE TABLE flags (
    id             SERIAL PRIMARY KEY,
    message        text,
    user_id        integer,
    flaggable_id   integer,
    flaggable_type character varying,
    created_on     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: geo_ips
------------------------------------------------------------------------------
CREATE TABLE geo_ips (
    id             SERIAL PRIMARY KEY,
    begin_ip       character varying,
    end_ip         character varying,
    country_iso_id character varying,
    country_name   character varying,
    begin_num      bigint,
    end_num        bigint
);

CREATE INDEX geo_ips_begin_num_end_num_ipx
  ON geo_ips(begin_num, end_num);

------------------------------------------------------------------------------
-- Table: gift_card_combo_orders
------------------------------------------------------------------------------
CREATE TABLE gift_card_combo_orders (
    id                 SERIAL PRIMARY KEY,
    order_id           integer NOT NULL,
    gift_card_order_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: gift_card_line_items
------------------------------------------------------------------------------
CREATE TABLE gift_card_line_items (
    id                SERIAL PRIMARY KEY,
    gift_card_order_id integer NOT NULL,
    template_id       integer NOT NULL,
    quantity          integer NOT NULL,
    price             integer NOT NULL,
    price_usd         integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: gift_card_options
------------------------------------------------------------------------------
CREATE TABLE gift_card_options (
    id                 SERIAL PRIMARY KEY,
    message            character varying,
    theme              character varying(64),
    gift_card_order_id integer,
    language_id        integer
);

------------------------------------------------------------------------------
-- Table: gift_card_orders
------------------------------------------------------------------------------
CREATE TABLE gift_card_orders (
    id                       SERIAL PRIMARY KEY,
    currency_id              character varying(3),
    total_usd                integer DEFAULT 0,
    total                    integer DEFAULT 0,
    user_id                  integer NOT NULL,
    created_at               timestamp without time zone NOT NULL,
    state                    character varying DEFAULT 'NEW_GIFT_ORDER' NOT NULL,
    payment_type             character varying(20),
    payment_cc_first_name    character varying(60),
    payment_cc_last_name     character varying(60),
    payment_cc_last4digits   character varying(4),
    payment_cc_expiry        character varying(4),
    internal_type            character varying(20) DEFAULT 'STANDARD' NOT NULL,
    exchange_rate_id         integer
);

------------------------------------------------------------------------------
-- Table: groups
------------------------------------------------------------------------------
CREATE TABLE groups (
    id         SERIAL PRIMARY KEY,
    name       character varying,
    admin      boolean,
    deleted_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: groups_roles
------------------------------------------------------------------------------
CREATE TABLE groups_roles (
    id         SERIAL PRIMARY KEY,
    group_id   integer,
    role_id    integer,
    deleted_at timestamp without time zone
);

CREATE INDEX idx_groups_roles_group_id
  ON groups_roles(group_id);

------------------------------------------------------------------------------
-- Table: guts
------------------------------------------------------------------------------
CREATE TABLE guts (
    id                      SERIAL PRIMARY KEY,
    bookserve_id            character varying(64),
    booksmart_guid          character varying(64),
    booksmart_version       character varying(128),
    booksmart_ancestor_guid character varying(64),
    booksmart_pcl_guid      character varying(64),
    booksmart_install_guid  character varying(64),
    booksmart_save_as_count integer DEFAULT 0 NOT NULL,
    booksmart_import_count  integer DEFAULT 0 NOT NULL,
    custom_end_sheet        text,
    creation_source         character varying DEFAULT 'booksmart' NOT NULL,
    pages                   integer DEFAULT 0 NOT NULL,
    product_id              integer,
    status                  character varying(30) DEFAULT 'PENDING',
    deleted_at              timestamp without time zone,
    selected                boolean DEFAULT false NOT NULL,
    created_at              timestamp without time zone,
    updated_at              timestamp without time zone,
    asset_manager           character varying(32) DEFAULT 'bookserve'
);

CREATE INDEX index_guts_on_product_id
  ON guts(product_id);

------------------------------------------------------------------------------
-- Table: holding_bin_rules
------------------------------------------------------------------------------
CREATE TABLE holding_bin_rules (
    id        SERIAL PRIMARY KEY,
    type      character varying,
    condition character varying,
    enabled   boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: holding_bin_rules_multi_rules (id => false)
------------------------------------------------------------------------------
CREATE TABLE holding_bin_rules_multi_rules (
    multi_rule_id       integer NOT NULL,
    holding_bin_rule_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: holidays
------------------------------------------------------------------------------
CREATE TABLE holidays (
    id     SERIAL PRIMARY KEY,
    date   date NOT NULL,
    country_id character varying DEFAULT 'us'
);

------------------------------------------------------------------------------
-- Table: i18n_faqs
------------------------------------------------------------------------------
CREATE TABLE i18n_faqs (
    id        SERIAL PRIMARY KEY,
    en_id     character varying NOT NULL,
    fr_id     character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ibookstore_events
------------------------------------------------------------------------------
CREATE TABLE ibookstore_events (
    id             SERIAL PRIMARY KEY,
    event_type     integer,
    event_subtype  integer,
    ebook_id       integer,
    price_tier     integer,
    bisac_category_id integer,
    user_id        integer,
    currency_code  character varying(3),
    duration       integer,
    created_at     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: ibookstore_territory_sets
------------------------------------------------------------------------------
CREATE TABLE ibookstore_territory_sets (
    id           SERIAL PRIMARY KEY,
    codes        text,
    name         character varying,
    current_from timestamp without time zone,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

CREATE UNIQUE INDEX index_ibookstore_territory_sets_on_name
  ON ibookstore_territory_sets(name);

------------------------------------------------------------------------------
-- Table: id2user
------------------------------------------------------------------------------
-- “Unknown type 'uuid' for column 'storage_id'”:
CREATE TABLE id2user (
    id         SERIAL PRIMARY KEY,
    storage_id uuid,  -- or text
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: invites
------------------------------------------------------------------------------
CREATE TABLE invites (
    id             SERIAL PRIMARY KEY,
    email          character varying(128),
    inviteable_id  integer NOT NULL,
    inviteable_type character varying(30) NOT NULL,
    created_on     timestamp without time zone NOT NULL,
    deleted_at     timestamp without time zone,
    sn_uid         character varying(30),
    sn_type        character varying(100)
);

CREATE INDEX invites_idx_type_id
  ON invites(inviteable_id, inviteable_type);
CREATE INDEX invites_idx_sn_type_uid
  ON invites(sn_type, sn_uid);

------------------------------------------------------------------------------
-- Table: isbns
------------------------------------------------------------------------------
CREATE TABLE isbns (
    id                 SERIAL PRIMARY KEY,
    number_text        character varying,
    guts_id            integer,
    cover_type_id      integer,
    provider_has_latest boolean DEFAULT true,
    created_at         timestamp without time zone,
    updated_at         timestamp without time zone,
    ebook_id           integer,
    assigned_at        timestamp without time zone,
    cover_design_id    integer,
    paper_type_id      integer,
    user_id            integer,
    custom_isbn        boolean DEFAULT false
);

CREATE UNIQUE INDEX index_isbns_on_guts_id_and_cover_design_id_and_cover_type_id_an
  ON isbns(guts_id, cover_design_id, cover_type_id, paper_type_id);

CREATE UNIQUE INDEX index_isbns_on_number_text
  ON isbns(number_text);

CREATE INDEX index_isbns_on_provider_has_latest
  ON isbns(provider_has_latest);

------------------------------------------------------------------------------
-- Table: job_retry_policies
------------------------------------------------------------------------------
CREATE TABLE job_retry_policies (
    id           SERIAL PRIMARY KEY,
    policy_name  character varying,
    retry_count  integer,
    delay_duration integer,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

CREATE UNIQUE INDEX index_job_retry_policies_on_policy_name
  ON job_retry_policies(policy_name);

------------------------------------------------------------------------------
-- Table: job_statuses
------------------------------------------------------------------------------
CREATE TABLE job_statuses (
    id         SERIAL PRIMARY KEY,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    started_at timestamp without time zone,
    finished_at timestamp without time zone,
    status     character varying,
    error      text,
    job_id     integer,
    job_type   character varying
);

------------------------------------------------------------------------------
-- Table: labelings
------------------------------------------------------------------------------
CREATE TABLE labelings (
    id            SERIAL PRIMARY KEY,
    label_id      integer,
    labelable_id  integer,
    labelable_type character varying,
    context       character varying,
    created_at    timestamp without time zone
);

CREATE INDEX index_labelings_on_labelable_id
  ON labelings(labelable_id);

CREATE INDEX index_labelings_on_labelable_id_and_labelable_type_and_context
  ON labelings(labelable_id, labelable_type, context);

------------------------------------------------------------------------------
-- Table: labels
------------------------------------------------------------------------------
CREATE TABLE labels (
    id   SERIAL PRIMARY KEY,
    name character varying
);

------------------------------------------------------------------------------
-- Table: languages
------------------------------------------------------------------------------
CREATE TABLE languages (
    id             SERIAL PRIMARY KEY,
    name           character varying,
    language_code  character varying,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone,
    domain_prefix  character varying
);

------------------------------------------------------------------------------
-- Table: large_order_attributes
------------------------------------------------------------------------------
CREATE TABLE large_order_attributes (
    id                      SERIAL PRIMARY KEY,
    order_id                integer,
    large_order_type        character varying,
    release_date            timestamp without time zone,
    payment_type            character varying,
    payment_received_at     timestamp without time zone,
    created_at              timestamp without time zone,
    updated_at              timestamp without time zone,
    po_number               text,
    released_for_pnp        timestamp without time zone,
    received_inventory      timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: line_items
------------------------------------------------------------------------------
CREATE TABLE line_items (
    id                            SERIAL PRIMARY KEY,
    sub_order_id                  integer,
    product_id                    integer,
    price                         integer NOT NULL,
    quantity                      integer NOT NULL,
    ship_tracking_number          text,
    state                         character varying(20) NOT NULL DEFAULT 'NEW',
    price_usd                     integer DEFAULT 0 NOT NULL,
    initial_price                 integer DEFAULT 0 NOT NULL,
    initial_price_usd             integer DEFAULT 0 NOT NULL,
    custom_cover_id               integer,
    currency_id                   character varying,
    cover_design_id               integer,
    guts_id                       integer,
    production_method             character varying DEFAULT 'PRINTER_TO_CUSTOMER' NOT NULL,
    line_item_type                character varying,
    ebook_id                      integer,
    pdf_book_id                   integer,
    isbn_id                       integer,
    shipment_notification_queued_on timestamp without time zone,
    created_at                    timestamp without time zone,
    updated_at                    timestamp without time zone,
    tax_rate_id                   integer,
    printable_product_id          integer
);

CREATE INDEX idx_line_items_created_at
  ON line_items(created_at);
CREATE INDEX idx_line_items_ebook_id
  ON line_items(ebook_id);
CREATE INDEX index_line_items_on_guts_id
  ON line_items(guts_id);
CREATE INDEX idx_line_items_isbn_id
  ON line_items(isbn_id);
CREATE INDEX idx_line_items_pdf_book_id
  ON line_items(pdf_book_id);
CREATE INDEX index_line_items_on_product_id
  ON line_items(product_id);
CREATE INDEX index_line_items_on_ship_tracking_number
  ON line_items(ship_tracking_number);
CREATE INDEX index_line_items_on_shipment_notification_queued_on
  ON line_items(shipment_notification_queued_on);
CREATE INDEX index_line_items_on_sub_order_id
  ON line_items(sub_order_id);
CREATE INDEX idx_line_items_updated_at
  ON line_items(updated_at);

------------------------------------------------------------------------------
-- Table: markup_histories
------------------------------------------------------------------------------
CREATE TABLE markup_histories (
    id                    SERIAL PRIMARY KEY,
    markup_before         integer DEFAULT 0 NOT NULL,
    markup_after          integer DEFAULT 0 NOT NULL,
    markup_before_usd     integer DEFAULT 0 NOT NULL,
    markup_after_usd      integer DEFAULT 0 NOT NULL,
    markup_before_currency_id character varying(3) NOT NULL,
    markup_after_currency_id  character varying(3) NOT NULL,
    markup_id             integer NOT NULL,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone
);

CREATE INDEX index_markup_histories_on_markup_id
  ON markup_histories(markup_id);

------------------------------------------------------------------------------
-- Table: markup_types
------------------------------------------------------------------------------
CREATE TABLE markup_types (
    id           SERIAL PRIMARY KEY,
    name         character varying NOT NULL,
    parent_markup integer,
    method       integer DEFAULT 1 NOT NULL
);

------------------------------------------------------------------------------
-- Table: markups
------------------------------------------------------------------------------
CREATE TABLE markups (
    id           SERIAL PRIMARY KEY,
    author_markup integer DEFAULT 0 NOT NULL,
    author_markup_usd integer DEFAULT 0 NOT NULL,
    fixed_price  integer,
    currency_id  character varying(3) NOT NULL,
    markupable_type character varying NOT NULL,
    markupable_id   integer NOT NULL,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: matched_holding_bin_rules
------------------------------------------------------------------------------
CREATE TABLE matched_holding_bin_rules (
    id                SERIAL PRIMARY KEY,
    sub_order_id      integer NOT NULL,
    holding_bin_rule_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: memberships
------------------------------------------------------------------------------
CREATE TABLE memberships (
    id               SERIAL PRIMARY KEY,
    group_id         integer,
    user_id          integer,
    grant_privileges boolean DEFAULT false,
    deleted_at       timestamp without time zone,
    created_at       timestamp without time zone
);

CREATE INDEX idx_memberships_user_id_group_id
  ON memberships(user_id, group_id);

------------------------------------------------------------------------------
-- Table: multi_coupons
------------------------------------------------------------------------------
CREATE TABLE multi_coupons (
    id          SERIAL PRIMARY KEY,
    code        character varying,
    description text,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: notes
------------------------------------------------------------------------------
CREATE TABLE notes (
    id            SERIAL PRIMARY KEY,
    body          text,
    notable_id    integer,
    notable_type  character varying,
    created_at    timestamp without time zone,
    updated_at    timestamp without time zone
);

-- The schema has 2 identical indexes declared; we’ll keep just one:
CREATE UNIQUE INDEX index_notable_id_and_notable_type_uniqueness
  ON notes(notable_id, notable_type);

CREATE INDEX notes_idx_polymorphic_fk
  ON notes(notable_id, notable_type);

------------------------------------------------------------------------------
-- Table: order_internal_types
------------------------------------------------------------------------------
CREATE TABLE order_internal_types (
    id           SERIAL PRIMARY KEY,
    name         character varying,
    abbreviation character varying
);

------------------------------------------------------------------------------
-- Table: order_methods
------------------------------------------------------------------------------
CREATE TABLE order_methods (
    id   SERIAL PRIMARY KEY,
    name character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: order_return_reasons
------------------------------------------------------------------------------
CREATE TABLE order_return_reasons (
    id        SERIAL PRIMARY KEY,
    parent_id integer,
    value     character varying(100) NOT NULL,
    enabled   boolean DEFAULT true,
    position  integer DEFAULT 1,
    deleted_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: order_returns
------------------------------------------------------------------------------
CREATE TABLE order_returns (
    id                     SERIAL PRIMARY KEY,
    order_id               integer NOT NULL,
    root_order_id          integer NOT NULL,
    reason_id              integer NOT NULL,
    sub_reason_id          integer,
    sub_sub_reason_id      integer,
    created_by_user_id     integer,
    resolution_id          integer,
    resolution_type        character varying(50) NOT NULL,
    right_now_incident_id  character varying(100),
    photo_required         boolean DEFAULT false NOT NULL,
    book_required          boolean DEFAULT false NOT NULL,
    created_at             timestamp without time zone NOT NULL,
    resolved_at            timestamp without time zone,
    sub_sub_sub_reason_id  integer
);

------------------------------------------------------------------------------
-- Table: orders
------------------------------------------------------------------------------
CREATE TABLE orders (
    id                            SERIAL PRIMARY KEY,
    user_id                       integer NOT NULL,
    created_at                    timestamp without time zone NOT NULL,
    state                         character varying(20) DEFAULT 'NEW' NOT NULL,
    status                        character varying(10) DEFAULT 'OK' NOT NULL,
    total                         integer DEFAULT 0 NOT NULL,
    tax                           integer DEFAULT 0 NOT NULL,
    shipping                      integer DEFAULT 0 NOT NULL,
    discount                      integer DEFAULT 0 NOT NULL,
    payment_type                  character varying(20) NOT NULL,
    payment_cc_first_name         character varying(60),
    payment_cc_last_name          character varying(60),
    payment_cc_last4digits        character varying(4),
    payment_cc_expiry             character varying(4),
    date_shipped                  date,
    currency_id                   character varying(3) NOT NULL,
    exchange_rate_id              integer,
    total_usd                     integer DEFAULT 0 NOT NULL,
    discount_usd                  integer DEFAULT 0 NOT NULL,
    tax_usd                       integer DEFAULT 0 NOT NULL,
    shipping_usd                  integer DEFAULT 0 NOT NULL,
    shipment_notification_queued_on date,
    shown_return_policy           boolean DEFAULT false,
    digital_tax                   integer,
    digital_tax_usd               integer,
    reduced_tax                   integer DEFAULT 0 NOT NULL,
    reduced_tax_usd               integer DEFAULT 0 NOT NULL,
    checkout_nonce                integer,
    api_key_id                    integer,
    application_version_id        integer,
    tax_exempt                    boolean DEFAULT false,
    updated_at                    timestamp without time zone,
    internal_type_id              integer DEFAULT 1 NOT NULL
);

CREATE INDEX index_orders_on_api_key_id
  ON orders(api_key_id);

CREATE UNIQUE INDEX fk_checkout_nonce
  ON orders(checkout_nonce);

CREATE INDEX idx_orders_checkout_nonce
  ON orders(checkout_nonce);

CREATE INDEX idx_orders_created_at
  ON orders(created_at);

CREATE INDEX index_orders_on_created_at
  ON orders(created_at);

CREATE INDEX idx_order_internal_type_id
  ON orders(internal_type_id);

CREATE INDEX index_order_on_shipment_notification_queued_on
  ON orders(shipment_notification_queued_on);

CREATE INDEX orders_index
  ON orders(state, user_id);

CREATE INDEX index_orders_on_state
  ON orders(state);

CREATE INDEX idx_orders_updated_at
  ON orders(updated_at);

------------------------------------------------------------------------------
-- Table: page_prices
------------------------------------------------------------------------------
CREATE TABLE page_prices (
    id                    SERIAL PRIMARY KEY,
    paper_type_id         integer NOT NULL,
    product_type          character varying NOT NULL,
    currency_id           character varying NOT NULL,
    low_page_count        integer NOT NULL,
    high_page_count       integer NOT NULL,
    product_dimension_id  integer NOT NULL,
    api_key_id            integer,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone,
    fractional_cents      numeric(12,5) DEFAULT 0.0 NOT NULL
);

------------------------------------------------------------------------------
-- Table: partner_codes
------------------------------------------------------------------------------
CREATE TABLE partner_codes (
    id              SERIAL PRIMARY KEY,
    partner_code    character varying(25) NOT NULL,
    description     character varying,
    created_by_email character varying,
    partner_id      integer NOT NULL,
    channel_id      integer,
    campaign_id     integer,
    active          boolean,
    created_at      timestamp without time zone,
    updated_at      timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: partner_codes_backup
------------------------------------------------------------------------------
CREATE TABLE partner_codes_backup (
    id              SERIAL PRIMARY KEY,
    partner_code    character varying(25) NOT NULL,
    description     character varying,
    created_by_email character varying,
    partner_id      integer NOT NULL,
    channel_id      integer,
    campaign_id     integer,
    active          boolean,
    created_at      timestamp without time zone,
    updated_at      timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: partner_promotions
------------------------------------------------------------------------------
CREATE TABLE partner_promotions (
    id         SERIAL PRIMARY KEY,
    partner_id integer NOT NULL,
    name       character varying NOT NULL,
    enabled    boolean DEFAULT false NOT NULL,
    starts_on  date NOT NULL,
    created_at timestamp without time zone NOT NULL
);

------------------------------------------------------------------------------
-- Table: partner_trackings
------------------------------------------------------------------------------
-- “Unknown type 'uuid' for column 'ua_hash'”:
CREATE TABLE partner_trackings (
    id         SERIAL PRIMARY KEY,
    ua_hash    uuid,  -- or text
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: partners
------------------------------------------------------------------------------
CREATE TABLE partners (
    id                SERIAL PRIMARY KEY,
    name              character varying(100) NOT NULL,
    code              character varying,
    revenue_share_pct integer NOT NULL,
    created_at        timestamp without time zone NOT NULL,
    deleted_at        timestamp without time zone,
    contact_email     character varying(50),
    url               character varying(100),
    has_page          boolean,
    bookstore_feed    boolean DEFAULT false,
    description       character varying,
    cookie_lifetime   integer,
    partner_type      character varying
);

------------------------------------------------------------------------------
-- Table: partners_backup
------------------------------------------------------------------------------
CREATE TABLE partners_backup (
    id                SERIAL PRIMARY KEY,
    name              character varying(100) NOT NULL,
    code              character varying,
    revenue_share_pct integer NOT NULL,
    active            boolean DEFAULT true NOT NULL,
    created_at        timestamp without time zone NOT NULL,
    deleted_at        timestamp without time zone,
    contact_email     character varying(50),
    url               character varying(100),
    has_page          boolean,
    bookstore_feed    boolean DEFAULT false,
    description       character varying,
    cookie_lifetime   integer,
    partner_type      character varying
);

CREATE UNIQUE INDEX index_partners_on_code
  ON partners_backup(code);

------------------------------------------------------------------------------
-- Table: payee_names
------------------------------------------------------------------------------
CREATE TABLE payee_names (
    id         SERIAL PRIMARY KEY,
    seller_id  integer NOT NULL,
    name       character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);

CREATE INDEX idx_payee_names_seller_id
  ON payee_names(seller_id);

------------------------------------------------------------------------------
-- Table: payment_details
------------------------------------------------------------------------------
CREATE TABLE payment_details (
    id                     SERIAL PRIMARY KEY,
    order_id               integer,
    express_token          character varying,
    express_payer_id       character varying,
    first_name             character varying,
    last_name              character varying,
    express_payer_email    character varying,
    express_transaction_id character varying,
    express_params         text
);

------------------------------------------------------------------------------
-- Table: payment_gateway_errors
------------------------------------------------------------------------------
CREATE TABLE payment_gateway_errors (
    id             SERIAL PRIMARY KEY,
    exception      character varying NOT NULL,
    transaction_type character varying(20) NOT NULL,
    description    character varying(80),
    amount         integer,
    adapter        character varying(32),
    transaction_id character varying(128),
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: payment_records
------------------------------------------------------------------------------
CREATE TABLE payment_records (
    id           SERIAL PRIMARY KEY,
    statement_id integer NOT NULL,
    payment_type integer DEFAULT 0 NOT NULL,
    pay_problem_id integer DEFAULT 0 NOT NULL,
    processed_at timestamp without time zone,
    processed_by integer,
    result_code  integer
);

------------------------------------------------------------------------------
-- Table: payment_type_names
------------------------------------------------------------------------------
CREATE TABLE payment_type_names (
    id   SERIAL PRIMARY KEY,
    code integer NOT NULL,
    name character varying(8) NOT NULL
);

------------------------------------------------------------------------------
-- Table: paymentech_merchant_ids
------------------------------------------------------------------------------
CREATE TABLE paymentech_merchant_ids (
    id           SERIAL PRIMARY KEY,
    currency_id  character varying NOT NULL,
    test_mode    boolean NOT NULL,
    mid          character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: payout_parameters
------------------------------------------------------------------------------
CREATE TABLE payout_parameters (
    id               SERIAL PRIMARY KEY,
    currency_id      character varying(3) NOT NULL,
    payment_type     integer NOT NULL,
    processing_fee   integer NOT NULL,
    processing_fee_usd integer NOT NULL,
    usual_minimum    character varying(5) NOT NULL
);

------------------------------------------------------------------------------
-- Table: paypal_emails
------------------------------------------------------------------------------
CREATE TABLE paypal_emails (
    id         SERIAL PRIMARY KEY,
    seller_id  integer NOT NULL,
    address    character varying DEFAULT '' NOT NULL,
    created_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);

CREATE INDEX idx_paypal_emails_seller_id
  ON paypal_emails(seller_id);

------------------------------------------------------------------------------
-- Table: pdf_book_jobs
------------------------------------------------------------------------------
CREATE TABLE pdf_book_jobs (
    id           SERIAL PRIMARY KEY,
    status       character varying DEFAULT 'new',
    started_at   timestamp without time zone,
    finished_at  timestamp without time zone,
    wf_id        integer,
    pdf_book_id  integer
);

CREATE INDEX idx_pdf_book_jobs_pdf_book_id
  ON pdf_book_jobs(pdf_book_id);

------------------------------------------------------------------------------
-- Table: pdf_book_sales
------------------------------------------------------------------------------
CREATE TABLE pdf_book_sales (
    id                     SERIAL PRIMARY KEY,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone,
    settled_at             timestamp without time zone,
    line_item_id           integer,
    author_profit          integer DEFAULT 0 NOT NULL,
    author_profit_usd      integer DEFAULT 0 NOT NULL,
    statement_id           integer,
    settled_currency_id    character varying(3),
    settled_exchange_rate_id integer,
    settled_author_profit  integer DEFAULT 0 NOT NULL,
    settled_author_profit_usd integer DEFAULT 0 NOT NULL,
    markupable_history_id  integer,
    markupable_history_type character varying,
    pdf_book_id            integer
);

CREATE INDEX idx_pdf_book_sales_statement_id
  ON pdf_book_sales(statement_id);

------------------------------------------------------------------------------
-- Table: pdf_books
------------------------------------------------------------------------------
CREATE TABLE pdf_books (
    id         SERIAL PRIMARY KEY,
    product_id integer,
    for_sale   boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    api_id     character varying,
    deleted_at timestamp without time zone
);

CREATE INDEX index_pdf_books_on_product_id
  ON pdf_books(product_id);

------------------------------------------------------------------------------
-- Table: pdf_infos
------------------------------------------------------------------------------
CREATE TABLE pdf_infos (
    id              SERIAL PRIMARY KEY,
    book_id         integer NOT NULL,
    os              character varying,
    browser         character varying,
    version         character varying,
    created_at      timestamp without time zone,
    updated_at      timestamp without time zone,
    upload_completed boolean NOT NULL DEFAULT false
);

------------------------------------------------------------------------------
-- Table: pending_notifications
------------------------------------------------------------------------------
CREATE TABLE pending_notifications (
    id                SERIAL PRIMARY KEY,
    notifier_type     character varying,
    notifier_id       integer,
    notification_type character varying,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone
);

CREATE INDEX pending_notifications_notifier
  ON pending_notifications(notifier_id, notifier_type);

------------------------------------------------------------------------------
-- Table: pending_workflows
------------------------------------------------------------------------------
CREATE TABLE pending_workflows (
    id         SERIAL PRIMARY KEY,
    name       character varying,
    wf_id      integer,
    job_id     integer,
    parent_id  integer,
    sched_start character varying,
    args       text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    notify_url text,
    job_type   text
);

CREATE INDEX index_pending_workflows_on_wf_id
  ON pending_workflows(wf_id);

------------------------------------------------------------------------------
-- Table: periods
------------------------------------------------------------------------------
CREATE TABLE periods (
    id         SERIAL PRIMARY KEY,
    date_start date NOT NULL,
    date_end   date NOT NULL
);

CREATE UNIQUE INDEX index_periods_on_date_end
  ON periods(date_end);

CREATE UNIQUE INDEX index_periods_on_date_start
  ON periods(date_start);

------------------------------------------------------------------------------
-- Table: permission_audits
------------------------------------------------------------------------------
CREATE TABLE permission_audits (
    id             SERIAL PRIMARY KEY,
    author_id      integer,
    auditable_id   integer,
    auditable_type character varying,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone,
    action         character varying
);

------------------------------------------------------------------------------
-- Table: photo_import_urls
------------------------------------------------------------------------------
CREATE TABLE photo_import_urls (
    id             SERIAL PRIMARY KEY,
    url            character varying(1024),
    status         character varying,
    image_id       character varying,
    photo_import_id integer,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone,
    metadata       text
);

------------------------------------------------------------------------------
-- Table: photo_imports
------------------------------------------------------------------------------
CREATE TABLE photo_imports (
    id             SERIAL PRIMARY KEY,
    api_user_id    integer,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone,
    metadata       character varying(2048),
    source         character varying,
    book_project_id integer
);

------------------------------------------------------------------------------
-- Table: photobook_jobs
------------------------------------------------------------------------------
CREATE TABLE photobook_jobs (
    id         SERIAL PRIMARY KEY,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    book_xml   text,
    user_id    integer
);

------------------------------------------------------------------------------
-- Table: postal_code_formats
------------------------------------------------------------------------------
CREATE TABLE postal_code_formats (
    id             SERIAL PRIMARY KEY,
    format_string  character varying,
    country_id     character varying(4)
);

CREATE INDEX index_postal_code_formats_on_country_id
  ON postal_code_formats(country_id);

------------------------------------------------------------------------------
-- Table: preflight_datas
------------------------------------------------------------------------------
CREATE TABLE preflight_datas (
    id          SERIAL PRIMARY KEY,
    product_id  integer,
    is_error    boolean,
    page        integer,
    message     integer
);

CREATE INDEX index_preflight_datas_on_product_id
  ON preflight_datas(product_id);

------------------------------------------------------------------------------
-- Table: preflight_errors
------------------------------------------------------------------------------
CREATE TABLE preflight_errors (
    id              SERIAL PRIMARY KEY,
    preflight_task_id integer,
    page            integer,
    task            character varying,
    message         text,
    created_at      timestamp without time zone,
    updated_at      timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: preflight_jobs
------------------------------------------------------------------------------
CREATE TABLE preflight_jobs (
    id                    SERIAL PRIMARY KEY,
    cover_type_id         integer,
    product_dimension_id  integer,
    cover_url             character varying,
    guts_url              character varying,
    pages                 integer,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone,
    api_key_id            integer,
    api_product_id        integer
);

------------------------------------------------------------------------------
-- Table: preflight_tasks
------------------------------------------------------------------------------
CREATE TABLE preflight_tasks (
    id               SERIAL PRIMARY KEY,
    preflight_job_id integer,
    url              character varying,
    type             character varying,
    state            character varying,
    created_at       timestamp without time zone,
    updated_at       timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: preflight_warnings
------------------------------------------------------------------------------
CREATE TABLE preflight_warnings (
    id           SERIAL PRIMARY KEY,
    warning_id   integer,
    warning_type character varying,
    is_error     boolean DEFAULT false,
    page         integer,
    message      integer
);

CREATE INDEX index_preflight_warnings_on_warning_type_and_warning_id
  ON preflight_warnings(warning_type, warning_id);

------------------------------------------------------------------------------
-- Table: preview_states
------------------------------------------------------------------------------
CREATE TABLE preview_states (
    id         SERIAL PRIMARY KEY,
    state      character varying,
    sort_order integer
);

------------------------------------------------------------------------------
-- Table: pricing_datas
------------------------------------------------------------------------------
CREATE TABLE pricing_datas (
    id                           SERIAL PRIMARY KEY,
    dimension_id                 integer NOT NULL,
    cover_type_id                integer NOT NULL,
    x1                           double precision NOT NULL,
    x2                           double precision NOT NULL,
    x3                           double precision NOT NULL,
    constant                     double precision NOT NULL,
    clu_multiplier               double precision NOT NULL,
    premium_workflow_multiplier  double precision NOT NULL,
    premium_paper_multiplier     double precision NOT NULL,
    custom_cover_price           double precision
);

------------------------------------------------------------------------------
-- Table: pricing_snapshots
------------------------------------------------------------------------------
CREATE TABLE pricing_snapshots (
    id                           SERIAL PRIMARY KEY,
    base_prices_csv_file_name    character varying,
    base_prices_csv_content_type character varying,
    base_prices_csv_file_size    integer,
    base_prices_csv_updated_at   timestamp without time zone,
    page_prices_csv_file_name    character varying,
    page_prices_csv_content_type character varying,
    page_prices_csv_file_size    integer,
    page_prices_csv_updated_at   timestamp without time zone,
    currency_markups_csv_file_name    character varying,
    currency_markups_csv_content_type character varying,
    currency_markups_csv_file_size    integer,
    currency_markups_csv_updated_at   timestamp without time zone,
    created_at                   timestamp without time zone,
    updated_at                   timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: printable_product_base_prices
------------------------------------------------------------------------------
CREATE TABLE printable_product_base_prices (
    id                 SERIAL PRIMARY KEY,
    currency_id        character varying(3) NOT NULL,
    price             integer,
    printable_product_type character varying(32) NOT NULL,
    finish_type_id     integer,
    paper_base_type_id integer,
    printable_product_dimension_id integer NOT NULL,
    version            integer NOT NULL,
    created_at         timestamp without time zone
);

CREATE UNIQUE INDEX idx_printable_product_base_prices_lookup_fields
  ON printable_product_base_prices(
       currency_id,
       printable_product_type,
       finish_type_id,
       paper_base_type_id,
       printable_product_dimension_id,
       version
     );

------------------------------------------------------------------------------
-- Table: printable_product_weights
------------------------------------------------------------------------------
CREATE TABLE printable_product_weights (
    id            SERIAL PRIMARY KEY,
    printable_product_type character varying(32) NOT NULL,
    printable_product_dimension_id integer NOT NULL,
    weight_constant         double precision NOT NULL
);

CREATE UNIQUE INDEX indexname
  ON printable_product_weights(printable_product_type, printable_product_dimension_id);

------------------------------------------------------------------------------
-- Table: printable_products
------------------------------------------------------------------------------
CREATE TABLE printable_products (
    id                        SERIAL PRIMARY KEY,
    bookserve_id              character varying(64),
    printable_product_type    character varying(32) NOT NULL,
    user_id                   integer NOT NULL,
    title                     character varying,
    status                    character varying(30),
    creation_tool             character varying(64) NOT NULL,
    creation_tool_version     character varying(64) NOT NULL,
    color_space               character varying(16),
    color_profile             character varying(32),
    api_key_id                integer,
    pricing_version           integer NOT NULL,
    last_ordered_at           timestamp without time zone,
    created_at                timestamp without time zone,
    updated_at                timestamp without time zone,
    deleted_at                timestamp without time zone
);

CREATE INDEX idx_printable_products_bookserve_id
  ON printable_products(bookserve_id);

CREATE INDEX idx_printable_products_creation_tool
  ON printable_products(creation_tool);

CREATE INDEX idx_printable_products_user_fk
  ON printable_products(user_id);

------------------------------------------------------------------------------
-- Table: printable_products_product_options
------------------------------------------------------------------------------
CREATE TABLE printable_products_product_options (
    id                   SERIAL PRIMARY KEY,
    printable_product_id integer NOT NULL,
    product_option_id    integer NOT NULL
);

CREATE INDEX idx_printable_products_product_options_ppid
  ON printable_products_product_options(printable_product_id);

------------------------------------------------------------------------------
-- Table: printer_capacities
------------------------------------------------------------------------------
CREATE TABLE printer_capacities (
    id           SERIAL PRIMARY KEY,
    printer_id   integer NOT NULL,
    minimum      integer NOT NULL,
    maximum      integer NOT NULL,
    created_on   timestamp without time zone NOT NULL,
    printer_type character varying NOT NULL
);

CREATE INDEX printer_capacities_idx_created_on
  ON printer_capacities(created_on);

CREATE INDEX index_printer_capacities_on_printer_type
  ON printer_capacities(printer_type);

------------------------------------------------------------------------------
-- Table: printer_outputs
------------------------------------------------------------------------------
CREATE TABLE printer_outputs (
    id           SERIAL PRIMARY KEY,
    printer_id   integer,
    printer_type character varying,
    quantity     integer,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: printer_slas
------------------------------------------------------------------------------
CREATE TABLE printer_slas (
    id                 SERIAL PRIMARY KEY,
    printer_id         integer,
    delivery_method_id integer,
    days_for_sla       integer,
    created_at         timestamp without time zone,
    updated_at         timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: printer_to_delivery_methods
------------------------------------------------------------------------------
CREATE TABLE printer_to_delivery_methods (
    id                 SERIAL PRIMARY KEY,
    printer_id         integer NOT NULL,
    delivery_method_id integer NOT NULL,
    enabled            boolean NOT NULL DEFAULT false,
    created_at         timestamp without time zone,
    updated_at         timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: printer_to_shipper_account_informations
------------------------------------------------------------------------------
CREATE TABLE printer_to_shipper_account_informations (
    id                                SERIAL PRIMARY KEY,
    printer_id                        integer,
    shipper_account_information_id    integer
);

------------------------------------------------------------------------------
-- Table: printer_to_shipper_delivery_methods
------------------------------------------------------------------------------
CREATE TABLE printer_to_shipper_delivery_methods (
    id                        SERIAL PRIMARY KEY,
    printer_id                integer,
    shipper_delivery_method_id integer
);

------------------------------------------------------------------------------
-- Table: printers
------------------------------------------------------------------------------
CREATE TABLE printers (
    id                      SERIAL PRIMARY KEY,
    name                    character varying,
    address_id              integer,
    default                 boolean DEFAULT false NOT NULL,
    supports_custom_workflow boolean DEFAULT false,
    utc_offset              integer,
    pickup_time             integer DEFAULT 61200,
    currency_id             character varying,
    order_method_id         integer DEFAULT 1 NOT NULL
);

------------------------------------------------------------------------------
-- Table: product_categories (id => false)
------------------------------------------------------------------------------
CREATE TABLE product_categories (
    product_id     integer NOT NULL,
    category_id    integer NOT NULL,
    category_type  character varying(1) DEFAULT 'S' NOT NULL,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone
);

CREATE INDEX idx_productcategories_bycat
  ON product_categories(category_id, product_id);

CREATE UNIQUE INDEX udx_productcategories_primarycat
  ON product_categories(product_id, category_type);

------------------------------------------------------------------------------
-- Table: product_customizations
------------------------------------------------------------------------------
CREATE TABLE product_customizations (
    id                   SERIAL PRIMARY KEY,
    product_id           integer,
    has_custom_cover_text boolean DEFAULT false
);

CREATE INDEX index_product_customizations_on_product_id
  ON product_customizations(product_id);

------------------------------------------------------------------------------
-- Table: product_dimensions
------------------------------------------------------------------------------
CREATE TABLE product_dimensions (
    id                        SERIAL PRIMARY KEY,
    booksmart_dimensions      character varying(128) NOT NULL,
    orientation               character varying(32) NOT NULL,
    preview_page_dimensions   character varying,
    preview_cover_dimensions  character varying,
    cover_dimension_inches    character varying,
    description_i18n_key      character varying,
    key                       character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: product_offerings
------------------------------------------------------------------------------
CREATE TABLE product_offerings (
    id                   SERIAL PRIMARY KEY,
    name                 character varying,
    product_dimension_id integer,
    created_at           timestamp without time zone,
    updated_at           timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: product_options
------------------------------------------------------------------------------
CREATE TABLE product_options (
    id                  SERIAL PRIMARY KEY,
    type                character varying(30) NOT NULL,
    name                character varying(100) NOT NULL,
    bookserve_value     character varying(50) NOT NULL,
    price               integer NOT NULL,
    display_name_i18n_key character varying,
    group_id            integer,
    markup_type_id      integer DEFAULT 1 NOT NULL,
    pro_option          boolean DEFAULT false NOT NULL,
    param_name          character varying
);

CREATE UNIQUE INDEX product_options_idx_inherited
  ON product_options(id, type);

------------------------------------------------------------------------------
-- Table: product_page_visits
------------------------------------------------------------------------------
CREATE TABLE product_page_visits (
    id         SERIAL PRIMARY KEY,
    product_id integer NOT NULL,
    created_on date NOT NULL,
    views      integer DEFAULT 0 NOT NULL,
    sales      integer DEFAULT 0 NOT NULL
);

CREATE INDEX product_page_visits_on_daily_products
  ON product_page_visits(created_on, product_id);

------------------------------------------------------------------------------
-- Table: product_sales
------------------------------------------------------------------------------
CREATE TABLE product_sales (
    id                     SERIAL PRIMARY KEY,
    created_at             timestamp without time zone NOT NULL,
    settled_at             timestamp without time zone,
    line_item_id           integer NOT NULL,
    author_profit          integer DEFAULT 0 NOT NULL,
    author_profit_usd      integer DEFAULT 0 NOT NULL,
    markupable_history_id  integer,
    statement_id           integer,
    settled_currency_id    character varying(3),
    settled_exchange_rate_id integer,
    settled_author_profit  integer DEFAULT 0 NOT NULL,
    settled_author_profit_usd integer DEFAULT 0 NOT NULL,
    markupable_history_type character varying
);

CREATE INDEX index_product_sales_on_line_item_id
  ON product_sales(line_item_id);

CREATE INDEX idx_product_sales_statement_id
  ON product_sales(statement_id);

------------------------------------------------------------------------------
-- Table: products
------------------------------------------------------------------------------
CREATE TABLE products (
    id                         SERIAL PRIMARY KEY,
    type                       character varying(30) NOT NULL,
    author_id                  integer NOT NULL,
    title                      character varying(1024),
    sub_title                  character varying(1024),
    description                text,
    private                    boolean DEFAULT true NOT NULL,
    created_at                 timestamp without time zone NOT NULL,
    deleted_at                 timestamp without time zone,
    status                     character varying(30) DEFAULT 'PENDING',
    featured                   boolean DEFAULT false NOT NULL,
    pages                      integer DEFAULT 0 NOT NULL,
    authors                    character varying(256),
    bookserve_id               character varying(64),
    booksmart_guid             character varying(64),
    booksmart_version          character varying(128),
    preview_url                character varying(1024),
    product_dimension_id       integer NOT NULL,
    featured_at                timestamp without time zone,
    permission_received_at     timestamp without time zone,
    admin_meta_data_id         integer,
    booksmart_ancestor_guid    character varying(64),
    booksmart_pcl_guid         character varying(64),
    booksmart_install_guid     character varying(64),
    booksmart_save_as_count    integer DEFAULT 0 NOT NULL,
    booksmart_import_count     integer DEFAULT 0 NOT NULL,
    updated_at                 timestamp without time zone,
    creation_source            character varying DEFAULT 'booksmart' NOT NULL,
    redirect_to                integer,
    custom_end_sheet           text,
    preview_state_id           integer DEFAULT 1 NOT NULL,
    first_purchased_at         timestamp without time zone,
    isbn_intent                boolean DEFAULT false,
    distribution_state_id      integer DEFAULT 2 NOT NULL,
    language_id                integer,
    bookstore_language_id      integer,
    author_purchased           boolean DEFAULT false NOT NULL
);

CREATE INDEX index_products_on_author_id
  ON products(author_id);

CREATE INDEX index_products_on_first_purchased_at
  ON products(first_purchased_at);

CREATE INDEX idx_products_featured
  ON products(id);

------------------------------------------------------------------------------
-- Table: profile_answers
------------------------------------------------------------------------------
CREATE TABLE profile_answers (
    id                 SERIAL PRIMARY KEY,
    profile_id         integer NOT NULL,
    profile_question_id integer NOT NULL,
    value              character varying(500) NOT NULL,
    updated_at         timestamp without time zone
);

CREATE UNIQUE INDEX profile_answers_idx_profile_and_question
  ON profile_answers(profile_id, profile_question_id);

------------------------------------------------------------------------------
-- Table: profile_questions
------------------------------------------------------------------------------
CREATE TABLE profile_questions (
    id              SERIAL PRIMARY KEY,
    label           character varying(500) NOT NULL,
    position        integer,
    label_i18n_key  character varying
);

------------------------------------------------------------------------------
-- Table: profiles
------------------------------------------------------------------------------
CREATE TABLE profiles (
    id               SERIAL PRIMARY KEY,
    user_id          integer NOT NULL,
    business         boolean DEFAULT false NOT NULL,
    firstname        character varying(40),
    lastname         character varying(40),
    url              character varying(1024),
    location         character varying(100),
    gender           character varying(1),
    occupation       character varying(100),
    about            character varying(1000),
    phone            character varying(20),
    competencies     character varying(500),
    affiliations     character varying(500),
    business_name    character varying(40),
    business_url     character varying(1024),
    business_location character varying(100),
    business_about   character varying(1000),
    updated_at       timestamp without time zone,
    business_email   character varying(120),
    country_id       character varying,
    state_id         character varying,
    city             character varying,
    zip              character varying
);

CREATE INDEX profiles_idx_user_id
  ON profiles(user_id);

------------------------------------------------------------------------------
-- Table: project_format_types
------------------------------------------------------------------------------
CREATE TABLE project_format_types (
    id          SERIAL PRIMARY KEY,
    name        character varying,
    display_rank integer
);

------------------------------------------------------------------------------
-- Table: project_formats
------------------------------------------------------------------------------
CREATE TABLE project_formats (
    id                    SERIAL PRIMARY KEY,
    project_id            integer,
    project_format_type_id integer,
    isbn_id               integer,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone,
    deleted_at            timestamp without time zone
);

CREATE INDEX index_project_formats_on_isbn_id
  ON project_formats(isbn_id);

CREATE INDEX index_project_formats_on_project_format_type_id
  ON project_formats(project_format_type_id);

CREATE INDEX index_project_formats_on_project_id
  ON project_formats(project_id);

------------------------------------------------------------------------------
-- Table: project_members
------------------------------------------------------------------------------
CREATE TABLE project_members (
    id              SERIAL PRIMARY KEY,
    project_id      integer NOT NULL,
    purchasable_id  integer,
    purchasable_type character varying,
    created_at      timestamp without time zone,
    updated_at      timestamp without time zone
);

CREATE INDEX index_project_members_on_project_id
  ON project_members(project_id);

CREATE INDEX index_project_members_on_purchasable_id
  ON project_members(purchasable_id);

------------------------------------------------------------------------------
-- Table: projects
------------------------------------------------------------------------------
CREATE TABLE projects (
    id                   SERIAL PRIMARY KEY,
    title                character varying(1024),
    sub_title            character varying(1024),
    description          text,
    deleted_at           timestamp without time zone,
    created_at           timestamp without time zone,
    updated_at           timestamp without time zone,
    purchasable_updated_at timestamp without time zone,
    url                  character varying,
    author_id            integer
);

CREATE INDEX index_projects_on_author_id
  ON projects(author_id);

------------------------------------------------------------------------------
-- Table: purchased_product_options
------------------------------------------------------------------------------
CREATE TABLE purchased_product_options (
    id                SERIAL PRIMARY KEY,
    line_item_id      integer NOT NULL,
    product_option_id integer NOT NULL,
    price             integer DEFAULT 0 NOT NULL,
    price_usd         integer DEFAULT 0 NOT NULL
);

CREATE INDEX index_purchased_product_options_on_line_item_id
  ON purchased_product_options(line_item_id);

CREATE INDEX idx_purchased_product_options_product_option_id
  ON purchased_product_options(product_option_id);

------------------------------------------------------------------------------
-- Table: ranged_static_shipping_costs
------------------------------------------------------------------------------
CREATE TABLE ranged_static_shipping_costs (
    id                        SERIAL PRIMARY KEY,
    shipper_delivery_method_id integer NOT NULL,
    zone                      character varying NOT NULL,
    low_weight                double precision NOT NULL,
    high_weight               double precision NOT NULL,
    cost_in_cents             integer NOT NULL,
    currency_id               character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: reference_postal_codes
------------------------------------------------------------------------------
CREATE TABLE reference_postal_codes (
    id          SERIAL PRIMARY KEY,
    postal_code character varying,
    state_id    character varying NOT NULL
);

CREATE INDEX index_reference_postal_codes_on_postal_code
  ON reference_postal_codes(postal_code);

------------------------------------------------------------------------------
-- Table: regional_attributes
------------------------------------------------------------------------------
CREATE TABLE regional_attributes (
    id   SERIAL PRIMARY KEY,
    name character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: regional_sites
------------------------------------------------------------------------------
CREATE TABLE regional_sites (
    id                   SERIAL PRIMARY KEY,
    name                 character varying NOT NULL,
    i18n_key             character varying NOT NULL,
    domain               character varying NOT NULL,
    country_code         character varying NOT NULL,
    default_currency_id  character varying NOT NULL,
    default_language_id  integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: regional_sites_attributes (id => false)
------------------------------------------------------------------------------
CREATE TABLE regional_sites_attributes (
    regional_site_id      integer NOT NULL,
    regional_attribute_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: regional_sites_currencies (id => false)
------------------------------------------------------------------------------
CREATE TABLE regional_sites_currencies (
    regional_site_id integer NOT NULL,
    currency_id      character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: regional_sites_languages
------------------------------------------------------------------------------
CREATE TABLE regional_sites_languages (
    id               SERIAL PRIMARY KEY,
    regional_site_id integer NOT NULL,
    language_id      integer NOT NULL,
    www_url          character varying NOT NULL,
    subdomain        character varying
);

------------------------------------------------------------------------------
-- Table: responsys_opt_ins
------------------------------------------------------------------------------
CREATE TABLE responsys_opt_ins (
    id        SERIAL PRIMARY KEY,
    created_at timestamp without time zone,
    email     text
);

------------------------------------------------------------------------------
-- Table: responsys_opt_outs
------------------------------------------------------------------------------
CREATE TABLE responsys_opt_outs (
    id        SERIAL PRIMARY KEY,
    created_at timestamp without time zone,
    email     text
);

------------------------------------------------------------------------------
-- Table: responsys_recipients
------------------------------------------------------------------------------
CREATE TABLE responsys_recipients (
    id          SERIAL PRIMARY KEY,
    user_id     integer NOT NULL,
    recipient_id integer NOT NULL,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

CREATE INDEX index_responsys_recipients_on_recipient_id
  ON responsys_recipients(recipient_id);

------------------------------------------------------------------------------
-- Table: rights
------------------------------------------------------------------------------
CREATE TABLE rights (
    id         SERIAL PRIMARY KEY,
    name       character varying,
    controller character varying,
    action     character varying
);

------------------------------------------------------------------------------
-- Table: rights_roles (id => false)
------------------------------------------------------------------------------
CREATE TABLE rights_roles (
    right_id integer,
    role_id  integer
);
CREATE INDEX idx_rights_roles_role_id
  ON rights_roles(role_id);

------------------------------------------------------------------------------
-- Table: roles
------------------------------------------------------------------------------
CREATE TABLE roles (
    id   SERIAL PRIMARY KEY,
    name character varying
);

------------------------------------------------------------------------------
-- Table: routing_printer_to_region_versions
------------------------------------------------------------------------------
CREATE TABLE routing_printer_to_region_versions (
    id        SERIAL PRIMARY KEY,
    created_on timestamp without time zone NOT NULL,
    username  character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: routing_printer_to_regions
------------------------------------------------------------------------------
CREATE TABLE routing_printer_to_regions (
    id              SERIAL PRIMARY KEY,
    printer_id      integer NOT NULL,
    region_id       integer NOT NULL,
    priority        integer NOT NULL,
    printer_to_region_version_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: routing_region_groups
------------------------------------------------------------------------------
CREATE TABLE routing_region_groups (
    id         SERIAL PRIMARY KEY,
    name       character varying NOT NULL,
    sort_order integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: routing_regions
------------------------------------------------------------------------------
CREATE TABLE routing_regions (
    id             SERIAL PRIMARY KEY,
    region_id      character varying NOT NULL,
    region_type    character varying NOT NULL,
    region_group_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: search_pages
------------------------------------------------------------------------------
CREATE TABLE search_pages (
    id        SERIAL PRIMARY KEY,
    title     character varying,
    body      text,
    custhelp_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    keywords  character varying,
    url       character varying,
    type      character varying,
    language  character varying,
    path      character varying
);

------------------------------------------------------------------------------
-- Table: seller_book_specifications
------------------------------------------------------------------------------
CREATE TABLE seller_book_specifications (
    id                    SERIAL PRIMARY KEY,
    cover_design_id       integer NOT NULL,
    cover_type_id         integer NOT NULL,
    paper_type_id         integer NOT NULL,
    custom_logo_type_id   integer,
    endsheet_type_id      integer,
    book_covering_type_id integer,
    enabled               boolean DEFAULT true NOT NULL,
    cover_paper_type_id   integer,
    coating_type_id       integer
);

------------------------------------------------------------------------------
-- Table: seller_product_option_histories
------------------------------------------------------------------------------
CREATE TABLE seller_product_option_histories (
    id                        SERIAL PRIMARY KEY,
    seller_product_option_id  integer NOT NULL,
    created_at                timestamp without time zone NOT NULL,
    markup_before             integer DEFAULT 0 NOT NULL,
    markup_after              integer DEFAULT 0 NOT NULL,
    markup_before_currency_id character varying(3) NOT NULL,
    markup_after_currency_id  character varying(3) NOT NULL,
    markup_before_usd         integer DEFAULT 0 NOT NULL,
    markup_after_usd          integer DEFAULT 0 NOT NULL
);

CREATE INDEX seller_product_option_histories_idx_seller_product_option_id
  ON seller_product_option_histories(seller_product_option_id);

------------------------------------------------------------------------------
-- Table: seller_product_options
------------------------------------------------------------------------------
CREATE TABLE seller_product_options (
    id                          SERIAL PRIMARY KEY,
    product_id                  integer NOT NULL,
    product_option_id           integer NOT NULL,
    author_markup               integer DEFAULT 0 NOT NULL,
    fixed_price                 integer,
    currency_id                 character varying(3),
    author_markup_usd           integer DEFAULT 0 NOT NULL,
    seller_book_specification_id integer
);

CREATE INDEX index_seller_product_options_on_product_id
  ON seller_product_options(product_id);

------------------------------------------------------------------------------
-- Table: sellers
------------------------------------------------------------------------------
CREATE TABLE sellers (
    id                             SERIAL PRIMARY KEY,
    user_id                        integer NOT NULL,
    created_at                     timestamp without time zone NOT NULL,
    tax_identifier_type            character varying(30),
    tax_identifier                 character varying(256),
    payment_address_id             integer,
    updated_at                     timestamp without time zone,
    currency_id                    character varying(3) NOT NULL,
    queued_currency_id             character varying(3),
    united_states_citizen          boolean NOT NULL,
    united_states_business_owner   boolean,
    united_states_resident         boolean,
    temp_address_id                integer,
    failed_validity                boolean,
    payee_name_id                  integer,
    payment_type                   integer DEFAULT 0 NOT NULL,
    paypal_email_id                integer,
    agreed_to_ebook_syp_terms      boolean DEFAULT false,
    deleted_at                     timestamp without time zone,
    trusted                        boolean DEFAULT false NOT NULL,
    nonreturnable                  boolean DEFAULT false NOT NULL
);

CREATE INDEX index_sellers_on_payment_type
  ON sellers(payment_type);

CREATE UNIQUE INDEX sellers_user_id_idx
  ON sellers(user_id);

------------------------------------------------------------------------------
-- Table: sessions
------------------------------------------------------------------------------
CREATE TABLE sessions (
    id         SERIAL PRIMARY KEY,
    session_id character varying,
    data       text,
    updated_at timestamp without time zone,
    user_id    integer,
    created_at timestamp without time zone
);

CREATE INDEX sessions_session_id_index
  ON sessions(session_id);

CREATE UNIQUE INDEX unique_session_id
  ON sessions(session_id);

------------------------------------------------------------------------------
-- Table: ship_methods
------------------------------------------------------------------------------
CREATE TABLE ship_methods (
    id                          SERIAL PRIMARY KEY,
    name                        character varying NOT NULL,
    display_name                character varying NOT NULL,
    trackable                   boolean NOT NULL,
    delivery_date               timestamp without time zone NOT NULL,
    shipping_service_response_id integer,
    price                       integer NOT NULL,
    price_usd                   integer,
    carrier                     character varying NOT NULL,
    currency_id                 character varying(3),
    estimated_ship_date         timestamp without time zone NOT NULL,
    international               boolean
);

CREATE INDEX index_ship_methods_on_shipping_service_response_id
  ON ship_methods(shipping_service_response_id);

------------------------------------------------------------------------------
-- Table: shipper_account_informations
------------------------------------------------------------------------------
CREATE TABLE shipper_account_informations (
    id                          SERIAL PRIMARY KEY,
    shipper_id                  integer,
    shipper_number              character varying,
    access_license_for_rate_shop character varying,
    access_license              character varying,
    for_returns                 boolean,
    account_number              character varying(200),
    meter_number                character varying(200),
    blurb_account               boolean NOT NULL DEFAULT false
);

------------------------------------------------------------------------------
-- Table: shipper_capabilites_to_countries
------------------------------------------------------------------------------
CREATE TABLE shipper_capabilites_to_countries (
    id                   SERIAL PRIMARY KEY,
    shipper_capability_id integer,
    country_id           integer
);

------------------------------------------------------------------------------
-- Table: shipper_capabilities
------------------------------------------------------------------------------
CREATE TABLE shipper_capabilities (
    id               SERIAL PRIMARY KEY,
    shipper_id       integer,
    supports_po_boxes boolean,
    enabled          boolean
);

------------------------------------------------------------------------------
-- Table: shipper_capabilities_to_states
------------------------------------------------------------------------------
CREATE TABLE shipper_capabilities_to_states (
    id                   SERIAL PRIMARY KEY,
    shipper_capability_id integer,
    state_id            integer
);

------------------------------------------------------------------------------
-- Table: shipper_delivery_methods
------------------------------------------------------------------------------
CREATE TABLE shipper_delivery_methods (
    id            SERIAL PRIMARY KEY,
    shipper_id    integer,
    option_name   character varying,
    option_id     integer,
    scope         character varying,
    surcharge     double precision,
    enabled       boolean,
    display_name  character varying,
    delivery_method_id integer,
    continental_us boolean,
    priority      integer,
    fuel_surcharge double precision,
    commercial_residential_or_both character varying(20) DEFAULT 'BOTH' NOT NULL,
    details_text  character varying,
    maximum_weight_usage double precision DEFAULT 999999 NOT NULL,
    bookserve_key integer DEFAULT 0 NOT NULL,
    minimum_package_weight numeric(10,2) DEFAULT 0.0 NOT NULL,
    maximum_package_weight numeric(10,2) DEFAULT 10.0 NOT NULL,
    display_name_i18n_key character varying,
    details_text_i18n_key character varying
);

------------------------------------------------------------------------------
-- Table: shippers
------------------------------------------------------------------------------
CREATE TABLE shippers (
    id                  SERIAL PRIMARY KEY,
    type                character varying,
    name                character varying,
    priority            integer,
    cost_lookup_class   character varying
);

------------------------------------------------------------------------------
-- Table: shipping_datas
------------------------------------------------------------------------------
CREATE TABLE shipping_datas (
    id                            SERIAL PRIMARY KEY,
    source                        character varying,
    cheap_cost                    integer,
    cheap_name                    character varying,
    mid_cost                      integer,
    mid_name                      character varying,
    expensive_cost                integer,
    expensive_name                character varying,
    printer                       character varying,
    country_code                  character varying,
    zip                           character varying,
    state_name                    character varying,
    state_id                      character varying,
    num_books                     integer,
    created_on                    date,
    order_id                      integer,
    actual_rate_usd               integer,
    mark_up_usd                   integer,
    handling_usd                  integer,
    shipping_discount_usd         integer,
    actual_rate_cost_in_cents     integer,
    actual_rate_currency          character varying(3),
    mark_up_cost_in_cents         integer,
    mark_up_currency              character varying(3),
    handling_cost_in_cents        integer,
    handling_currency             character varying(3),
    shipping_discount_cost_in_cents integer,
    shipping_discount_currency    character varying(3),
    number_of_boxes               integer,
    weight                        double precision,
    residential                   boolean,
    po_box                        boolean
);

------------------------------------------------------------------------------
-- Table: shipping_fixed_base_costs
------------------------------------------------------------------------------
CREATE TABLE shipping_fixed_base_costs (
    id                     SERIAL PRIMARY KEY,
    product_dimension_id   integer NOT NULL,
    cover_type_id          integer NOT NULL,
    shipper_delivery_method_id integer NOT NULL,
    price                  integer DEFAULT 0 NOT NULL,
    product_type           character varying,
    currency_id            character varying,
    deleted_at             timestamp without time zone,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: shipping_fixed_costs
------------------------------------------------------------------------------
CREATE TABLE shipping_fixed_costs (
    id                     SERIAL PRIMARY KEY,
    delivery_method_id     integer,
    created_by_user_id     character varying NOT NULL,
    shipping_region_id     integer NOT NULL,
    start_unit_range       integer NOT NULL,
    end_unit_range         integer,
    base_unit_price_id     integer,
    currency_id            character varying,
    price                  integer DEFAULT 0 NOT NULL,
    price_usd              integer DEFAULT 0 NOT NULL,
    deleted_at             timestamp without time zone,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: shipping_fixed_page_costs
------------------------------------------------------------------------------
CREATE TABLE shipping_fixed_page_costs (
    id                     SERIAL PRIMARY KEY,
    product_dimension_id   integer NOT NULL,
    cover_type_id          integer NOT NULL,
    paper_type_id          integer NOT NULL,
    shipper_delivery_method_id integer NOT NULL,
    price                  integer DEFAULT 0 NOT NULL,
    product_type           character varying,
    currency_id            character varying,
    deleted_at             timestamp without time zone,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: shipping_options
------------------------------------------------------------------------------
CREATE TABLE shipping_options (
    id                      SERIAL PRIMARY KEY,
    checkout_id             integer,
    shipper_delivery_method_id integer,
    price_in_cents          integer,
    currency_id             character varying(3),
    display_name            text DEFAULT '',
    details_text            text DEFAULT '',
    markup_cost_in_cents    integer,
    markup_currency         character varying(3),
    handling_cost_in_cents  integer,
    handling_currency       character varying(3),
    base_cost_in_cents      integer,
    base_currency           character varying(3),
    number_of_boxes         integer
);

------------------------------------------------------------------------------
-- Table: shipping_regions
------------------------------------------------------------------------------
CREATE TABLE shipping_regions (
    id                          SERIAL PRIMARY KEY,
    name                        character varying NOT NULL,
    default_ship_method_no_po_box_id integer,
    sort_order                  integer NOT NULL,
    default_ship_method_po_box_id integer,
    preselected_delivery_method_id integer
);

------------------------------------------------------------------------------
-- Table: shipping_service_responses
------------------------------------------------------------------------------
CREATE TABLE shipping_service_responses (
    id         SERIAL PRIMARY KEY,
    created_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: shipping_system_tests
------------------------------------------------------------------------------
CREATE TABLE shipping_system_tests (
    id              SERIAL PRIMARY KEY,
    order_id        integer,
    ground_cost     integer,
    second_day_cost integer,
    next_day_cost   integer
);

------------------------------------------------------------------------------
-- Table: shipping_time_in_transits
------------------------------------------------------------------------------
CREATE TABLE shipping_time_in_transits (
    id                   SERIAL PRIMARY KEY,
    shipper_id           integer NOT NULL,
    printer_id           integer NOT NULL,
    transit_information_id integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: shipping_upgrade_actions
------------------------------------------------------------------------------
CREATE TABLE shipping_upgrade_actions (
    id                     SERIAL PRIMARY KEY,
    order_id               integer NOT NULL,
    action                 character varying NOT NULL,
    refund_amount          integer,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone,
    shipping_difference    integer,
    shipping_difference_usd integer,
    refund_amount_usd      integer,
    old_shipper_delivery_method_id integer,
    new_shipper_delivery_method_id integer,
    refund_currency_id     character varying(3),
    shipping_difference_currency_id character varying(3),
    old_ship_method_id     integer,
    new_ship_method_id     integer
);

CREATE INDEX index_shipping_upgrade_actions_on_order_id
  ON shipping_upgrade_actions(order_id);

------------------------------------------------------------------------------
-- Table: site_contents
------------------------------------------------------------------------------
CREATE TABLE site_contents (
    id                SERIAL PRIMARY KEY,
    contentable_id    integer,
    contentable_type  character varying NOT NULL,
    body_source       text,
    body_html         text,
    body_processor    character varying
);

------------------------------------------------------------------------------
-- Table: social_connections
------------------------------------------------------------------------------
CREATE TABLE social_connections (
    id               SERIAL PRIMARY KEY,
    user_id          integer NOT NULL,
    network_name     character varying(50) NOT NULL,
    connection_id    character varying,
    connection_username character varying,
    access_token     text,
    access_secret    text,
    created_at       timestamp without time zone,
    updated_at       timestamp without time zone,
    expiration       timestamp without time zone
);

CREATE INDEX index_social_connections_on_connection_id
  ON social_connections(connection_id);

CREATE UNIQUE INDEX social_cons_user_id_network_name_idx
  ON social_connections(user_id, network_name);

------------------------------------------------------------------------------
-- Table: social_details
------------------------------------------------------------------------------
CREATE TABLE social_details (
    id             SERIAL PRIMARY KEY,
    sn_uid         character varying(30) NOT NULL,
    auth_token     character varying,
    type           character varying,
    user_id        integer NOT NULL,
    created_at     timestamp without time zone NOT NULL,
    uninstalled_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: social_posts
------------------------------------------------------------------------------
CREATE TABLE social_posts (
    id           SERIAL PRIMARY KEY,
    postable_id  integer,
    user_id      integer,
    postable_type character varying(50),
    network_name character varying(50),
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

CREATE INDEX social_posts_postable_id
  ON social_posts(postable_id, postable_type);

CREATE INDEX social_posts_user_network
  ON social_posts(user_id, network_name);

------------------------------------------------------------------------------
-- Table: social_preferences
------------------------------------------------------------------------------
CREATE TABLE social_preferences (
    id           SERIAL PRIMARY KEY,
    user_id      integer NOT NULL,
    network_name character varying(50) NOT NULL,
    enabled      boolean DEFAULT true,
    created_at   timestamp without time zone,
    updated_at   timestamp without time zone
);

CREATE UNIQUE INDEX social_prefs_user_id_network_name_idx
  ON social_preferences(user_id, network_name);

------------------------------------------------------------------------------
-- Table: spam_tin_filters
------------------------------------------------------------------------------
CREATE TABLE spam_tin_filters (
    id          SERIAL PRIMARY KEY,
    filter_text text NOT NULL,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

CREATE UNIQUE INDEX index_spam_tin_filters_on_filter
  ON spam_tin_filters(filter_text);

------------------------------------------------------------------------------
-- Table: spam_tin_members
------------------------------------------------------------------------------
CREATE TABLE spam_tin_members (
    id               SERIAL PRIMARY KEY,
    spammable_id     integer NOT NULL,
    spammable_type   character varying NOT NULL,
    released_at      timestamp without time zone,
    created_at       timestamp without time zone,
    updated_at       timestamp without time zone,
    spam_tin_filter_text text NOT NULL
);

CREATE UNIQUE INDEX index_spam_tin_members_on_spammable_id_and_spammable_type
  ON spam_tin_members(spammable_id, spammable_type);

------------------------------------------------------------------------------
-- Table: sso_credential_groups
------------------------------------------------------------------------------
CREATE TABLE sso_credential_groups (
    id         SERIAL PRIMARY KEY,
    name       character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: sso_credentials
------------------------------------------------------------------------------
CREATE TABLE sso_credentials (
    id                     SERIAL PRIMARY KEY,
    api_key_id             integer NOT NULL,
    sso_credential_group_id integer NOT NULL,
    key                    character varying NOT NULL,
    value                  character varying NOT NULL,
    created_at             timestamp without time zone,
    updated_at             timestamp without time zone
);

CREATE UNIQUE INDEX index_sso_credentials_on_api_key_id_and_sso_credential_group_id
  ON sso_credentials(api_key_id, sso_credential_group_id, key);

------------------------------------------------------------------------------
-- Table: statements
------------------------------------------------------------------------------
CREATE TABLE statements (
    id                     SERIAL PRIMARY KEY,
    created_at             timestamp without time zone NOT NULL,
    period_id              integer NOT NULL,
    seller_id              integer NOT NULL,
    author_profit          integer DEFAULT 0 NOT NULL,
    processing_fee         integer DEFAULT 0 NOT NULL,
    payout_amount          integer DEFAULT 0 NOT NULL,
    carry_over_amount      integer DEFAULT 0 NOT NULL,
    currency_id            character varying(3) NOT NULL,
    author_profit_usd      integer DEFAULT 0 NOT NULL,
    processing_fee_usd     integer DEFAULT 0 NOT NULL,
    payout_amount_usd      integer DEFAULT 0 NOT NULL,
    carry_over_amount_usd  integer DEFAULT 0 NOT NULL,
    status                 character varying(10) DEFAULT 'review' NOT NULL,
    downloads              integer DEFAULT 0 NOT NULL,
    was_inquire            boolean DEFAULT false NOT NULL,
    prior_carry_amount     integer DEFAULT 0 NOT NULL,
    prior_carry_amount_usd integer DEFAULT 0 NOT NULL,
    payee_address_id       integer,
    payee_name_id          integer,
    reviewed_by            integer,
    reviewed_at            timestamp without time zone,
    confirmed_by           integer,
    confirmed_at           timestamp without time zone,
    processed_by           integer,
    processed_at           timestamp without time zone,
    payment_type           integer DEFAULT 0 NOT NULL,
    paypal_email_id        integer,
    pay_problem_id         integer DEFAULT 0 NOT NULL,
    result_code            integer
);

CREATE INDEX index_statements_on_seller_id_and_period_id
  ON statements(period_id, seller_id);

------------------------------------------------------------------------------
-- Table: states
------------------------------------------------------------------------------
CREATE TABLE states (
    id                    SERIAL PRIMARY KEY,
    iso_id                character varying NOT NULL,
    name                  character varying NOT NULL,
    country_id            character varying(3) NOT NULL,
    association_with_country character varying DEFAULT 'state',
    postal_abbrev         character varying NOT NULL,
    is_military           boolean DEFAULT false NOT NULL
);

CREATE UNIQUE INDEX index_states_on_iso_id
  ON states(iso_id);

------------------------------------------------------------------------------
-- Table: static_shipping_costs
------------------------------------------------------------------------------
CREATE TABLE static_shipping_costs (
    id                     SERIAL PRIMARY KEY,
    shipper_delivery_method_id integer NOT NULL,
    zone                   character varying,
    weight                 integer NOT NULL,
    cost_in_cents          integer NOT NULL,
    currency_id            character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: static_shipping_rates
------------------------------------------------------------------------------
CREATE TABLE static_shipping_rates (
    id                     SERIAL PRIMARY KEY,
    shipper_id             integer,
    shipper_delivery_method_id integer,
    country_id             integer,
    base_rate              integer,
    per_pound_rate         integer,
    currency_id            character varying
);

------------------------------------------------------------------------------
-- Table: storage_token_maps
------------------------------------------------------------------------------
CREATE TABLE storage_token_maps (
    id           SERIAL PRIMARY KEY,
    primary_token character varying NOT NULL,
    linked_token  character varying NOT NULL
);

CREATE UNIQUE INDEX index_storage_token_maps_on_linked_token_and_primary_token
  ON storage_token_maps(linked_token, primary_token);

CREATE INDEX index_storage_token_maps_on_primary_token
  ON storage_token_maps(primary_token);

------------------------------------------------------------------------------
-- Table: stores
------------------------------------------------------------------------------
CREATE TABLE stores (
    id                   SERIAL PRIMARY KEY,
    i18n_key             character varying NOT NULL,
    default_currency_id  character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: stories
------------------------------------------------------------------------------
CREATE TABLE stories (
    id                SERIAL PRIMARY KEY,
    user_id           integer,
    title             character varying,
    storage_id        character varying,
    description       text,
    deleted_at        timestamp without time zone,
    cover_file_name   character varying,
    cover_content_type character varying,
    cover_file_size   integer,
    cover_updated_at  timestamp without time zone,
    created_at        timestamp without time zone,
    updated_at        timestamp without time zone,
    featured          boolean,
    featured_at       timestamp without time zone,
    private           boolean DEFAULT true,
    comments_count    integer DEFAULT 0
);

CREATE INDEX stories_featured_idx
  ON stories(featured, deleted_at);

CREATE UNIQUE INDEX index_stories_on_storage_id
  ON stories(storage_id);

------------------------------------------------------------------------------
-- Table: story_streams
------------------------------------------------------------------------------
CREATE TABLE story_streams (
    id          SERIAL PRIMARY KEY,
    user_id     integer NOT NULL,
    story_id    integer NOT NULL,
    last_update timestamp without time zone NOT NULL,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: sub_order_service_entries
------------------------------------------------------------------------------
CREATE TABLE sub_order_service_entries (
    id                   SERIAL PRIMARY KEY,
    sub_order_id         integer NOT NULL,
    sub_order_service_id integer NOT NULL,
    created_by_user_id   integer,
    created_at           timestamp without time zone,
    updated_at           timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: sub_order_services
------------------------------------------------------------------------------
CREATE TABLE sub_order_services (
    id   SERIAL PRIMARY KEY,
    name character varying NOT NULL
);

------------------------------------------------------------------------------
-- Table: sub_order_sims
------------------------------------------------------------------------------
CREATE TABLE sub_order_sims (
    id                        SERIAL PRIMARY KEY,
    sub_order_id              integer NOT NULL,
    print_vendor              character varying(80),
    line_item_quantity        integer DEFAULT 0 NOT NULL,
    transferred_to_printer_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: sub_orders
------------------------------------------------------------------------------
CREATE TABLE sub_orders (
    id                         SERIAL PRIMARY KEY,
    order_id                   integer NOT NULL,
    state                      character varying(20) DEFAULT 'NEW' NOT NULL,
    product_total              integer DEFAULT 0 NOT NULL,
    percent_tax                double precision DEFAULT 0.0 NOT NULL,
    global_order_id            character varying(80),
    print_vendor               character varying(80),
    ship_id                    character varying(10),
    ship_vendor                character varying(64),
    ship_description           character varying(128),
    ship_cost                  integer DEFAULT 0 NOT NULL,
    ship_internal_cost         integer DEFAULT 0 NOT NULL,
    estimated_ship_date        date,
    product_total_usd          integer DEFAULT 0 NOT NULL,
    ship_cost_usd              integer DEFAULT 0 NOT NULL,
    ship_internal_cost_usd     integer DEFAULT 0 NOT NULL,
    transferred_to_printer_at  timestamp without time zone,
    return_label_tracking_number character varying,
    delivery_date              date,
    customer_delivery_date      date,
    customer_selected_method_id integer,
    printer_ship_date           date,
    contractual_printer_ship_date date,
    created_at                 timestamp without time zone,
    updated_at                 timestamp without time zone,
    ship_method_id             integer
);

CREATE INDEX idx_sub_orders_created_at
  ON sub_orders(created_at);

CREATE UNIQUE INDEX sub_orders_idx_global_order_id
  ON sub_orders(global_order_id);

CREATE INDEX index_sub_orders_on_order_id
  ON sub_orders(order_id);

CREATE INDEX index_sub_orders_on_return_label_tracking_number
  ON sub_orders(return_label_tracking_number);

CREATE INDEX idx_sub_orders_updated_at
  ON sub_orders(updated_at);

------------------------------------------------------------------------------
-- Table: synchronized_workers
------------------------------------------------------------------------------
CREATE TABLE synchronized_workers (
    id             SERIAL PRIMARY KEY,
    group_key      character varying NOT NULL,
    data           text,
    result         text,
    result_order   integer,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone,
    progress       text,
    task_count     integer DEFAULT 0,
    completed_count integer DEFAULT 0,
    job_id         integer,
    job_type       character varying
);

CREATE INDEX index_synchronized_workers_on_group_key
  ON synchronized_workers(group_key);

CREATE INDEX idx_job_id_type
  ON synchronized_workers(job_id, job_type);

------------------------------------------------------------------------------
-- Table: syp_percentage_histories
------------------------------------------------------------------------------
CREATE TABLE syp_percentage_histories (
    id               SERIAL PRIMARY KEY,
    syp_percentage_id integer NOT NULL,
    percent_before   integer,
    percent_after    integer NOT NULL,
    currency_id      character varying NOT NULL,
    line_item_type   character varying NOT NULL,
    created_at       timestamp without time zone,
    updated_at       timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: syp_percentages
------------------------------------------------------------------------------
CREATE TABLE syp_percentages (
    id             SERIAL PRIMARY KEY,
    percent        integer NOT NULL,
    currency_id    character varying NOT NULL,
    line_item_type character varying NOT NULL,
    created_at     timestamp without time zone,
    updated_at     timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: taggings
------------------------------------------------------------------------------
CREATE TABLE taggings (
    id            SERIAL PRIMARY KEY,
    taggable_id   integer,
    tag_id        integer,
    taggable_type character varying,
    updated_at    timestamp without time zone
);

CREATE INDEX taggings_idx_polymorphic_fk
  ON taggings(taggable_id, taggable_type);

------------------------------------------------------------------------------
-- Table: tags
------------------------------------------------------------------------------
CREATE TABLE tags (
    id   SERIAL PRIMARY KEY,
    name character varying
);

------------------------------------------------------------------------------
-- Table: tax_exemptions
------------------------------------------------------------------------------
CREATE TABLE tax_exemptions (
    id                    SERIAL PRIMARY KEY,
    user_id               integer NOT NULL,
    expires_at            timestamp without time zone,
    approved_by_user_id   integer NOT NULL,
    created_at            timestamp without time zone,
    updated_at            timestamp without time zone
);

CREATE INDEX index_tax_exemptions_on_user_id
  ON tax_exemptions(user_id);

------------------------------------------------------------------------------
-- Table: tax_identifiers
------------------------------------------------------------------------------
CREATE TABLE tax_identifiers (
    id                 SERIAL PRIMARY KEY,
    tax_identifier_type character varying(30) NOT NULL,
    tax_identifier     character varying(256) NOT NULL,
    user_id            integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: tax_rates
------------------------------------------------------------------------------
CREATE TABLE tax_rates (
    id         SERIAL PRIMARY KEY,
    zip_code   character varying,
    created_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    type       character varying,
    state_abbrev character varying,
    county_name text,
    city_name   text,
    state_sales_tax double precision,
    state_use_tax double precision,
    county_sales_tax double precision,
    county_use_tax double precision,
    city_sales_tax double precision,
    city_use_tax double precision,
    "MTA_sales_tax" double precision,
    "MTA_use_tax" double precision,
    "SPD_sales_tax" double precision,
    "SPD_use_tax" double precision,
    total_sales_tax double precision,
    total_use_tax double precision,
    county_number character varying,
    city_number   character varying,
    "MTA_name"    text,
    "MTA_number"  text,
    "SPD_name"    text,
    "SPD_number"  text,
    tax_shipping_alone boolean,
    tax_shipping_and_handling_together boolean,
    country_name  text,
    country_code  character varying,
    display_name  text
);

CREATE INDEX taxrate_idx_zip_code
  ON tax_rates(deleted_at, zip_code);

CREATE INDEX index_tax_rates_on_deleted_at
  ON tax_rates(deleted_at);

------------------------------------------------------------------------------
-- Table: tokens
------------------------------------------------------------------------------
CREATE TABLE tokens (
    id              SERIAL PRIMARY KEY,
    token           character varying(128) NOT NULL,
    expires_at      timestamp without time zone,
    num_used        integer DEFAULT 0 NOT NULL,
    tokenable_id    integer NOT NULL,
    tokenable_type  character varying(64) NOT NULL,
    created_on      timestamp without time zone NOT NULL,
    deleted_at      timestamp without time zone
);

CREATE INDEX tokens_idx_token
  ON tokens(deleted_at, token);

CREATE INDEX tokens_idx_type_id
  ON tokens(tokenable_id, tokenable_type);

------------------------------------------------------------------------------
-- Table: transaction_entries
------------------------------------------------------------------------------
CREATE TABLE transaction_entries (
    id                  SERIAL PRIMARY KEY,
    transactionable_id  integer NOT NULL,
    created_at          timestamp without time zone NOT NULL,
    source              character varying(20) NOT NULL,
    description         character varying(80) NOT NULL,
    source_ip_address   character varying(64),
    transaction_type    character varying(20) NOT NULL,
    transaction_id      character varying(128),
    status              character varying(20) NOT NULL,
    amount              integer NOT NULL,
    settled_at          timestamp without time zone,
    payment_type        character varying(20),
    payment_cc_first_name character varying(60),
    payment_cc_last_name  character varying(60),
    payment_cc_last4digits character varying(4),
    payment_cc_expiry   character varying(4),
    response_code       character varying(30),
    response_subcode    character varying(30),
    response_text       character varying,
    response_auth_code  character varying(64),
    response_avs_code   character varying(10),
    response_ccv_code   character varying(64),
    adjustment_type     character varying(20),
    transaction_token   character varying(256),
    gateway_adapter     character varying(32),
    reconciliation_id   character varying(64),
    currency_id         character varying(3) NOT NULL,
    exchange_rate_id    integer,
    amount_usd          integer DEFAULT 0 NOT NULL,
    transactionable_type character varying(64),
    used_test_server    boolean DEFAULT false NOT NULL,
    payment_bank_code   character varying(10),
    payment_country_code character varying(2),
    payment_account_holder character varying(30)
);

CREATE INDEX te_idx_order_id
  ON transaction_entries(created_at, transactionable_id);

------------------------------------------------------------------------------
-- Table: transit_informations
------------------------------------------------------------------------------
CREATE TABLE transit_informations (
    id                  SERIAL PRIMARY KEY,
    delivery_method_id  integer NOT NULL,
    shipping_region_id  integer NOT NULL,
    country_id          character varying,
    state_id            character varying,
    zip                 character varying,
    po_box_or_apo       boolean DEFAULT false NOT NULL,
    days_in_transit     integer NOT NULL
);

------------------------------------------------------------------------------
-- Table: trashbins
------------------------------------------------------------------------------
CREATE TABLE trashbins (
    id             SERIAL PRIMARY KEY,
    trashed_at     timestamp without time zone NOT NULL,
    trash_item_id  integer NOT NULL,
    trash_item_type character varying NOT NULL
);

CREATE INDEX index_trashbins_on_trash_item_type_and_trash_item_id
  ON trashbins(trash_item_type, trash_item_id);

CREATE INDEX index_trashbins_on_trashed_at_and_trash_item_type
  ON trashbins(trashed_at, trash_item_type);

------------------------------------------------------------------------------
-- Table: user_conversion_events
------------------------------------------------------------------------------
CREATE TABLE user_conversion_events (
    id                           SERIAL PRIMARY KEY,
    user_id                      integer NOT NULL,
    conversion_event_id          integer NOT NULL,
    conversion_event_reference_id integer,
    regional_site_id             integer,
    created_at                   timestamp without time zone,
    updated_at                   timestamp without time zone,
    ua_hash                      character varying  -- or if you want real UUID, adapt here
);

CREATE INDEX index_user_conversion_events_on_ua_hash
  ON user_conversion_events(ua_hash);

------------------------------------------------------------------------------
-- Table: user_fb_statuses
------------------------------------------------------------------------------
CREATE TABLE user_fb_statuses (
    id        SERIAL PRIMARY KEY,
    user_id   integer NOT NULL,
    has_fb    boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: user_notice_locations
------------------------------------------------------------------------------
CREATE TABLE user_notice_locations (
    id   SERIAL PRIMARY KEY,
    name text
);

------------------------------------------------------------------------------
-- Table: user_notices
------------------------------------------------------------------------------
CREATE TABLE user_notices (
    id                   SERIAL PRIMARY KEY,
    content             text,
    partial             text,
    action              text,
    controller          text,
    position            integer,
    user_notice_location_id integer,
    start_date          timestamp without time zone,
    end_date            timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: user_notices_users (id => false)
------------------------------------------------------------------------------
CREATE TABLE user_notices_users (
    user_id       integer,
    user_notice_id integer
);

CREATE INDEX idx_user_notices_users_user_id
  ON user_notices_users(user_id);

------------------------------------------------------------------------------
-- Table: user_printer_overrides
------------------------------------------------------------------------------
CREATE TABLE user_printer_overrides (
    id         SERIAL PRIMARY KEY,
    user_id    integer,
    printer_id integer,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone
);

------------------------------------------------------------------------------
-- Table: user_regional_audit
------------------------------------------------------------------------------
CREATE TABLE user_regional_audit (
    id                     SERIAL PRIMARY KEY,
    language_id            integer,
    preferred_currency_id  character varying(3),
    regional_site_id       integer,
    created_at             timestamp without time zone,
    user_id                integer
);

------------------------------------------------------------------------------
-- Table: users
------------------------------------------------------------------------------
CREATE TABLE users (
    id                      SERIAL PRIMARY KEY,
    username                character varying(64),
    first                   character varying NOT NULL DEFAULT '',
    last                    character varying NOT NULL DEFAULT '',
    is_active               boolean NOT NULL DEFAULT true,
    want_newsletter         boolean NOT NULL DEFAULT false,
    text_only               boolean NOT NULL DEFAULT false,
    last_login_at           timestamp without time zone,
    num_logins              integer NOT NULL DEFAULT 0,
    created_at              timestamp without time zone NOT NULL,
    deleted_at              timestamp without time zone,
    registered_from         character varying(30),
    primary_billing_id      integer,
    primary_shipping_id     integer,
    partner_code_id         integer,
    partner_fix_affected    boolean NOT NULL DEFAULT false,
    partner_fix_run_at      date,
    beast_admin             boolean,
    posts_count             integer DEFAULT 0,
    updated_at              timestamp without time zone,
    website                 character varying,
    login_key               character varying,
    login_key_expires_at    timestamp without time zone,
    bio                     character varying,
    bio_html                text,
    identity_url            character varying,
    avatar_file_name        character varying,
    preferred_currency_id   character varying(3),
    beast_staff             boolean DEFAULT false NOT NULL,
    want_b3_newsletter      boolean DEFAULT false NOT NULL,
    allow_custom_covers     boolean,
    book_comments           boolean DEFAULT true,
    book_comment_notify     boolean DEFAULT true,
    guest                   boolean,
    avatar_content_type     character varying,
    avatar_file_size        integer,
    avatar_updated_at       timestamp without time zone,
    language_id             integer NOT NULL DEFAULT 1,
    pp_gate_open_at         timestamp without time zone,
    pp_edits_remaining      integer,
    ip_address              character varying,
    preferred_store_id      integer,
    regional_site_id        integer,
    disabled_reason_id      integer,
    api_key_id              integer,
    application_version_id  integer,
    hashed_password_new     character varying,
    password_salt           character varying,
    remember_digest         character varying,
    public_id               character varying(36),
    bookstore_allowed       boolean DEFAULT false
);

CREATE INDEX users_idx_username
  ON users(deleted_at, username);

CREATE UNIQUE INDEX public_id_index
  ON users(public_id);

CREATE UNIQUE INDEX username_uniqueness
  ON users(username);

------------------------------------------------------------------------------
-- Table: users_followings
------------------------------------------------------------------------------
CREATE TABLE users_followings (
    id          SERIAL PRIMARY KEY,
    user_id     integer NOT NULL,
    following_id integer NOT NULL,
    created_at  timestamp without time zone,
    updated_at  timestamp without time zone,
    blacklisted boolean DEFAULT false
);

------------------------------------------------------------------------------
-- Table: usps_zone_mappings
------------------------------------------------------------------------------
CREATE TABLE usps_zone_mappings (
    id                    SERIAL PRIMARY KEY,
    origin_zip            integer,
    destination_zip_start integer,
    destination_zip_end   integer,
    zone                  character varying
);

COMMIT;