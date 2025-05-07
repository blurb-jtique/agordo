# UBUNTU 16.04 LTS

sudo apt update
sudo apt install build-essential curl wget openssl libssl-dev libreadline-dev zlib1g-dev dirmngr libmagickwand-dev imagemagick-6.q16 libffi-dev libpq-dev cmake libyaml-dev git libmagickcore-6.q16-dev exiftool
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"
rbenv install 1.9.3-p550
rbenv global 1.9.3-p550
ssh-keygen -t ed25519 -C "ubuntu16-amd64@blurb.com"

# echo to this /etc/fstab : share /mnt/utm 9p trans=virtio,version=9p2000.L,rw,_netdev,auto 0 0
sudo mkdir /mnt/utm
sudo mount -a
sudo systemctl start remote-fs.target
# sudo systemctl start remote-fs.target

# copy the code / git or similar, and in the code dir do:
gem install bundler -v 1.16.2
rbenv rehash

# imagemagick issue
sudo apt install apt-file
apt-file update
apt-file search Magick-config

graphicsmagick-libmagick-dev-compat: /usr/bin/Magick-config
graphicsmagick-libmagick-dev-compat: /usr/share/man/man1/Magick-config.1.gz
libgraphicsmagick1-dev: /usr/bin/GraphicsMagick-config
libgraphicsmagick1-dev: /usr/share/man/man1/GraphicsMagick-config.1.gz
libmagickcore-6.q16-dev: /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/Magick-config # <-----

# add this to bashrc
export PATH="/usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16:$PATH"

which Magick-config

# Install postgres 9
sudo apt-get install postgresql postgresql-contrib
sudo systemctl status postgresql
sudo systemctl start postgresql
sudo systemctl enable postgresql
# create an user
CREATE USER blurby WITH SUPERUSER PASSWORD 'blurby';
# create database
CREATE DATABASE blurb_development;
GRANT ALL PRIVILEGES ON DATABASE blurb_development TO blurby;
# create schema
CREATE SCHEMA blurby;
# import from existing DB
psql -U postgres -d blurb_development < /mnt/utm/blurby-auth-schema-blurb_staging-202501071058.sql

# Using evil_migration
# enabling trust on postgres, copy/change trust permission in below file
sudo nano /etc/postgresql/9.5/main/pg_hba.conf
# Database administrative login by Unix domain socket
local   all             postgres                                trust
1. Edit postgresql.conf to Listen on All Interfaces
By default, PostgreSQL on many distros listens only on the loopback interface (localhost). To allow external connections:

Locate postgresql.conf. Common paths on Ubuntu might be:

/etc/postgresql/9.x/main/postgresql.conf
(Adjust the version directory if needed.)

Find the line:

#listen_addresses = 'localhost'
Uncomment it (remove #) and change it to:

listen_addresses = '*'
This tells PostgreSQL to accept connections from any network interface. Alternatively, you can specify just certain IPs (e.g., listen_addresses = '192.168.1.10').

Save your changes.

2. Configure pg_hba.conf to Allow Remote Connections
The pg_hba.conf file determines who can connect, from where, and how they authenticate.

Open pg_hba.conf. On Ubuntu, typically at:

/etc/postgresql/9.x/main/pg_hba.conf
Add or modify a line for external connections. For example, to allow all users, including postgres, to connect from any IP address with password authentication (md5):

host    all    postgres    0.0.0.0/0    trust

# modifying existing postgres role
ALTER ROLE postgres WITH PASSWORD NULL;
and test it
psql -U postgres
# CREATE USER postgres WITH SUPERUSER;
CREATE DATABASE blurb_development;
GRANT ALL PRIVILEGES ON DATABASE blurb_development TO postgres;

DROP DATABASE blurb_development;

# SSH Server
sudo apt install openssh-server
sudo systemctl status ssh
sudo systemctl enable ssh
sudo systemctl restart ssh

# the /etc/ssh/sshd_config
PasswordAuthentication yes
ClientAliveInterval 30
ClientAliveCountMax 86400


## generic setup
SSH add key as default
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## Frontend
Node installation
```
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc
source ~/.bashrc
nodenv install 8.11.1
nodenv global 8.11.1
```

bower installation, here blurbmenu was changed to zz_blurbmenu maybe a deprecation
```
npx bower install
npm install
```

# Tricks and Tweak

## Postgresql setup
### PG_HBA
```
# /etc/postgresql/9.5/main/pg_hba.conf
# Database administrative login by Unix domain socket
local   all             postgres                                trust
local   all             blurby                                  trust
```
### Postgres conf
```
# - Connection Settings -

listen_addresses = '*'                  # what IP address(es) to listen on;
```

## Code tweaks
app/models/api/sso/samsung.rb : 198
```ruby
# Api::SSO::SSOProvider.register('samsung', SSOProvider.new)
```

lib/money/lib/money/money.rb : 358
```ruby
# rescue FloatDomainError
rescue
```

lib/services/auth_service/clients/base.rb : 15
```ruby
# force http always
ServicesHelper.url_for_service('auth').gsub("http://", "http://")
```

## DB exporting - Master
schema only exportation with data types and foreign keys for schemas:
- auth_service
- blurby
- public
- project_service

```
psql -U postgres -d blurb_development < /mnt/utm/202501071333-blurb_staging.sql
```

## DB manual import
Inserting mandatory records to boot and get the first page working, this was only a test, since with the current seed data it should be enough
### blurby.preview_states
```sql
INSERT INTO blurby.preview_states (state,sort_order) VALUES
	 ('OFF',1),
	 ('FIRST15',2),
	 ('FULL',3),
	 ('CUSTOM',4);
```

### blurby.currencies
```sql
INSERT INTO blurby.currencies (iso_id,string_format,seller_minimum_payout,seller_processing_fee,exponent) VALUES
	 ('USD','---
:delimiter: ","
:symbol: US $
:separator: .
:html_symbol: US $
',2500,500,2),
	 ('AUD','---
:delimiter: ","
:symbol: AUD $
:separator: .
:html_symbol: AUD $
',3000,500,2),
	 ('CAD','---
:symbol: CAD $
:separator: .
:delimiter: ","
:html_symbol: CAD $
',2500,500,2),
	 ('EUR','---
:delimiter: .
:symbol: !binary |
  4oKs

:separator: ","
:html_symbol: "&euro;"
',1750,400,2),
	 ('GBP','---
:delimiter: ","
:symbol: !binary |
  wqM=

:separator: .
:html_symbol: "&pound;"
',1250,300,2),
	 ('JPY','---
:html_symbol: !binary |
  wqUg

:no_cents: true
:delimiter: ","
:separator: .
:symbol: !binary |
  wqUg

',30000,5000,0),
	 ('KRW','---
:html_symbol: !binary |
  4oKpIA==

:no_cents: true
:delimiter: ","
:separator: .
:symbol: !binary |
  4oKpIA==

',3200000,540000,0);
```

### blurby.languages
```
INSERT INTO blurby.languages (name,language_code,created_at,updated_at,domain_prefix) VALUES
	 ('No Language Set','NLS',NULL,'2011-09-30 14:17:30.370316','NLS'),
	 ('French','fr',NULL,'2011-09-30 14:17:30.371536','fr'),
	 ('English','en',NULL,'2011-09-30 14:17:30.372267','en'),
	 ('German','de',NULL,'2011-09-30 14:17:30.372923','de'),
	 ('Dutch','nl','2011-09-21 14:50:13.773329','2011-09-30 14:17:30.373587','nl'),
	 ('Portuguese','pt','2011-09-21 14:50:13.800103','2011-09-30 14:17:30.374357','br'),
	 ('Italian','it','2011-09-21 14:50:13.801481','2011-09-30 14:17:30.375009','it'),
	 ('Spanish','es','2011-09-21 14:50:13.802842','2011-09-30 14:17:30.37579','es'),
	 ('UK English','en-gb','2012-05-17 19:15:51.358089','2012-05-17 19:15:51.358089','en-gb'),
	 ('Japanese','ja','2013-01-22 13:55:11.264341','2013-01-22 13:55:11.264341','jp'),
	 ('Korean','ko','2013-01-22 13:55:11.268668','2013-01-22 13:55:11.268668','kr'),
	 ('Chinese','zh','2013-01-22 13:55:11.270192','2013-01-22 13:55:11.270192','cn');
```

### blurby.regional_sites
```
INSERT INTO blurby.regional_sites (name,i18n_key,"domain",country_code,default_currency_id,default_language_id) VALUES
	 ('United States','united_states','com','US','USD',3),
	 ('Australia','australia','com','AU','AUD',3),
	 ('Brazil','brazil','com','BR','USD',7),
	 ('Italy','italy','com','IT','EUR',8),
	 ('Netherlands','netherlands','com','NL','EUR',6),
	 ('United Kingdom','united_kingdom','co.uk','GB','GBP',3),
	 ('France','france','fr','FR','EUR',2),
	 ('Germany','germany','de','DE','EUR',5),
	 ('Spain','spain','es','ES','EUR',9),
	 ('Canada','canada','ca','CA','CAD',3),
	 ('China','china','com','CN','USD',13),
	 ('Japan','japan','jp','JP','JPY',11),
	 ('Korea','korea','kr','KR','KRW',12);
```

### blurby.curremcies
```
INSERT INTO blurby.exchange_rates (to_currency_id,rate,active_at) VALUES
	 ('EUR',0.8,'2007-07-25 12:13:38.261265'),
	 ('GBP',0.54,'2007-07-25 12:13:38.253351'),
	 ('AUD',1.27,'2006-01-01 00:00:00'),
	 ('GBP',0.54,'2009-08-24 11:41:23.945781'),
	 ('EUR',0.8,'2009-08-24 11:41:23.950432'),
	 ('CAD',1.05,'2006-01-01 00:00:00'),
	 ('GBP',0.61,'2010-09-27 18:27:59.652979'),
	 ('AUD',1.14,'2010-09-27 18:27:59.652979'),
	 ('JPY',84.43,'2006-01-01 00:00:00'),
	 ('KRW',1074.6,'2006-01-01 00:00:00'),
	 ('GBP',0.609,'2014-03-17 15:58:43.041725'),
	 ('AUD',1.1173,'2014-03-17 15:58:43.085186'),
	 ('EUR',0.7331,'2014-03-17 15:58:43.087521'),
	 ('AUD',1.0744,'2014-06-24 00:44:01.590669'),
	 ('EUR',0.7345,'2014-06-24 00:44:01.614165'),
	 ('GBP',0.5973,'2014-06-24 00:44:01.616551'),
	 ('CAD',1.0841,'2014-06-24 00:44:01.618794'),
	 ('AUD',1.2261,'2015-04-03 15:19:57.476431'),
	 ('EUR',0.8227,'2015-04-03 15:19:57.506855'),
	 ('GBP',0.6438,'2015-04-03 15:19:57.511637');
```

### blurby.product_dimmensions
```
INSERT INTO blurby.product_dimensions (booksmart_dimensions,orientation,preview_page_dimensions,preview_cover_dimensions,cover_dimension_inches,description_i18n_key,"key") VALUES
	 ('621x810','PORTRAIT','621x810','621x810','8.50x11.00','letter','letter'),
	 ('441x666','PORTRAIT','441x666','464x684','6.44x9.5','large_text','large_text'),
	 ('909x783','LANDSCAPE','420x361','450x380','13.18x11.14','large_format_landscape','large_landscape'),
	 ('369x378','SQUARE','264x264','303x303','5.44x5.44','small_square','small_square'),
	 ('495x495','SQUARE','418x418','450x433','7.42x7.14','square','square'),
	 ('855x864','SQUARE','418x418','450x433',NULL,'large_square','large_square'),
	 ('369x594','PORTRAIT','264x425','303x440','5.44x8.50','pocket_text','bwtext'),
	 ('585x738','PORTRAIT','336x424','352x440','8.13x10.25','standard_portrait_true8x10','standard_portrait_true8x10'),
	 ('567x720','PORTRAIT','335x425','361x440','8.42x10.26','standard_portrait','standard_portrait'),
	 ('693x594','LANDSCAPE','422x362','450x376','10.19x8.51','standard_landscape','standard_landscape');
```

```
INSERT INTO blurby.distribution_states ("key",description,active) VALUES
	 ('only_for_me','Only visible to the author',true),
	 ('invitation_only','Visible to non-author users that have the url',true),
	 ('public','Visible to all users',true),
	 ('amazon','Temporary Amazon Distribution',true);
```

```
INSERT INTO blurby.markup_types (name,parent_markup,"method") VALUES
	 ('No Markup',NULL,1),
	 ('Premium Paper',NULL,1),
	 ('ProBookMediumGlossPaper',NULL,1),
	 ('ProBookUncoatedPaper',NULL,1),
	 ('ProBookEndsheet',NULL,2),
	 ('ProBookBookCovering',NULL,2),
	 ('UVSatin',NULL,2),
	 ('UVGloss',NULL,2),
	 ('Custom Logo',NULL,1);
```

```
INSERT INTO blurby.product_options ("type",name,bookserve_value,price,display_name_i18n_key,group_id,markup_type_id,pro_option,param_name) VALUES
	 ('PremiumWorkflow','Custom','custom',0,'premium_workflow',NULL,1,false,NULL),
	 ('CustomCoverOption','Custom Cover','custom',0,'personalized_front_cover',NULL,1,false,NULL),
	 ('GiftCardCombo','Gift Card Combo','gift_card_combo',0,'gift_card_combo',NULL,1,false,NULL),
	 ('Colophon','Custom','custom',0,'custom_logo_upgrade',NULL,3,false,NULL),
	 ('GroupAllProductOption','AllCoversGroup','all-covers-group',0,'all_covers_group',NULL,1,false,NULL),
	 ('LargeBookCoverGroup','LargeBookCoverGroup','large-book-cover-group',0,'large_book_cover_group',16,1,false,NULL),
	 ('ProEndsheetGroup','ProEndsheetGroup','pro-endsheet-group',0,'pro_endsheet_group',18,1,false,NULL),
	 ('PlusCoating','PlusCoatingGroup','plus-coating-group',0,'plus_coating_group',38,1,false,NULL),
	 ('CoatingType','Uncoated','uncoated',0,'uncoated',38,1,false,NULL),
	 ('GroupAllProductOption','AllCoverPapersGroup','all-cover-papers-group',0,'all_cover_papers_group',NULL,1,false,NULL),
	 ('BookCoveringType','ProCharcoalLinenCovering','pro-charcoal-linen-covering',0,'pro_charcoal_linen_covering',33,7,true,NULL),
	 ('BookCoveringType','ProOatmealLinenCovering','pro-oatmeal-linen-covering',0,'pro_oatmeal_linen_covering',33,7,true,NULL),
	 ('CoatingType','SatinUVCoating','satin-uv-coating',0,'satin_uv_coating',39,8,false,NULL),
	 ('CoatingType','GlossUVCoating','gloss-uv-coating',0,'gloss_uv_coating',39,9,false,NULL),
	 ('PaperType','PremiumPaper','premium-matte',0,'premium_paper',14,2,false,'premium_matte_paper'),
	 ('PaperType','PremiumGlossPaper','premium-glossy',0,'premium_paper_lustre',14,2,false,'premium_lustre_paper'),
	 ('PaperType','NovelBwPaper','novel',0,'novel_bw_paper',34,1,false,'bw_text_paper'),
	 ('PaperType','NovelColorPaper','novel-bright-white',0,'novel_color_paper',34,1,false,'color_text_paper'),
	 ('CoverType','Softcover','softcover',0,'softcover',16,1,false,'softcover'),
	 ('CoverType','Hardcover','hardcover',0,'dust_jacket',15,1,false,'dustjacket'),
	 ('CoverType','ImageWrap','lithowrap',0,'imagewrap',15,1,false,'imagewrap'),
	 ('CoverType','SoftcoverSaddleStitched','softcover-saddle-stitched',0,'softcover_saddle_stitched',NULL,1,false,'saddle'),
	 ('GroupAllProductOption','AllCoatingsGroup','all-coatings-group',0,'all_coatings_group',NULL,1,false,NULL),
	 ('StandardCoating','StandardCoatingsGroup','standard-coatings-group',0,'standard_coatings_group',49,1,false,NULL),
	 ('PremiumPlusCoating','PremiumPlusCoatingGroup','premium-plus-coating-group',0,'premium_plus_coating_group',49,1,false,NULL),
	 ('CoatingType','GlossLaminateCoating','gloss-laminate-coating',0,'gloss_laminate_coating',50,1,false,NULL),
	 ('PhotoBookEndsheetGroup','PhotoBookEndsheetGroup','photo-book-endsheet-group',0,'photo_book_endsheet_group',61,1,false,NULL),
	 ('BookCoveringType','StandardGreyLinenCovering','standard-grey-linen-covering',0,'standard_grey_linen_covering',58,1,false,NULL),
	 ('GroupAllProductOption','AllBookCoveringsGroup','all-book-coverings-group',0,'all_book_coverings_group',NULL,1,false,NULL),
	 ('BlurbBookCoveringGroup','BlurbBookCoveringGroup','blurb-book-covering-group',0,'blurb_book_covering_group',57,1,false,NULL),
	 ('ProBookCoveringGroup','ProBookCoveringGroup','pro-book-covering-group',0,'pro_book_covering_group',19,1,false,NULL),
	 ('BookCoveringType','StandardBlackLinenCovering','standard-black-linen-covering',0,'standard_black_linen_covering',19,1,false,NULL),
	 ('TradeBookCoveringGroup','TradeBookCoveringGroup','trade-book-covering-group',0,'trade_book_covering_group',57,1,false,NULL),
	 ('GroupAllProductOption','AllEndsheetsGroup','all-endsheets-group',0,'all_endsheets_group',NULL,1,false,NULL),
	 ('EndsheetType','StandardWhiteEndsheet','standard-white-endsheet',0,'standard_white_endsheet',61,1,false,'standard_white_endsheet'),
	 ('CoverPaperType','PlusCover','pluscover',0,'plus_cover',43,1,false,'plus_cover_paper'),
	 ('CoverPaperType','PremiumPlusCover','premium-pluscover',0,'premium_plus_cover',43,1,false,'premium_plus_cover_paper'),
	 ('CoverPaperType','SelfCover','standard',0,'self_cover',43,1,false,'self_cover_paper'),
	 ('EndsheetType','ProBlackEndsheet','pro-black-endsheet',0,'pro_black_endsheet',32,6,true,'pro_black_endsheet'),
	 ('EndsheetType','ProCharcoalEndsheet','pro-charcoal-endsheet',0,'pro_charcoal_endsheet',32,6,true,'pro_charcoal_endsheet'),
	 ('EndsheetType','ProLightGreyEndsheet','pro-light-grey-endsheet',0,'pro_light_grey_endsheet',32,6,true,'pro_light_grey_endsheet'),
	 ('EndsheetType','ProWhiteEndsheet','pro-white-endsheet',0,'pro_white_endsheet',32,6,true,'pro_white_endsheet'),
	 ('EndsheetType','StandardMidGreyEndsheet','standard-mid-grey-endsheet',0,'standard_mid_grey_endsheet',18,1,false,'standard_mid_grey_endsheet'),
	 ('PaperBaseType','StandardPaperBase','StandardPaperBase',0,'standard_paper_base',NULL,1,false,'standard'),
	 ('FinishType','AcrylicGloss','AcrylicGloss',0,'acrylic_gloss',NULL,1,false,'acrylic_gloss'),
	 ('FinishType','MetalGloss','MetalGloss',0,'metal_gloss',NULL,1,false,'metal_gloss'),
	 ('FinishType','CanvasMatte','CanvasMatte',0,'canvas_matte',NULL,1,false,'canvas_matte'),
	 ('HangingHardwareType','Cable','Cable',0,'cable',NULL,1,false,'cable'),
	 ('HangingHardwareType','FlushMount','FlushMount',0,'flush_mount',NULL,1,false,'flush_mount'),
	 ('CornerType','Square','Square',0,'square',NULL,1,false,'square'),
	 ('PrintableProductDimension','Portrait 8x10','Portrait 8x10',0,'portrait_8x10',NULL,1,false,'portrait_8x10'),
	 ('PrintableProductDimension','Landscape 10x8','Landscape 10x8',0,'landscape_10x8',NULL,1,false,'landscape_10x8'),
	 ('PrintableProductDimension','Square 12x12','Square 12x12',0,'square_12x12',NULL,1,false,'square_12x12'),
	 ('PrintableProductDimension','Portrait 11x14','Portrait 11x14',0,'portrait_11x14',NULL,1,false,'portrait_11x14'),
	 ('PrintableProductDimension','Landscape 14x11','Landscape 14x11',0,'landscape_14x11',NULL,1,false,'landscape_14x11'),
	 ('PrintableProductDimension','Portrait 16x20','Portrait 16x20',0,'portrait_16x20',NULL,1,false,'portrait_16x20'),
	 ('PrintableProductDimension','Landscape 20x16','Landscape 20x16',0,'landscape_20x16',NULL,1,false,'landscape_20x16'),
	 ('PrintableProductDimension','Square 20x20','Square 20x20',0,'square_20x20',NULL,1,false,'square_20x20'),
	 ('PrintableProductDimension','Portrait 20x24','Portrait 20x24',0,'portrait_20x24',NULL,1,false,'portrait_20x24'),
	 ('PrintableProductDimension','Landscape 24x20','Landscape 24x20',0,'landscape_24x20',NULL,1,false,'landscape_24x20'),
	 ('PrintableProductDimension','Portrait 20x30','Portrait 20x30',0,'portrait_20x30',NULL,1,false,'portrait_20x30'),
	 ('PrintableProductDimension','Landscape 30x20','Landscape 30x20',0,'landscape_30x20',NULL,1,false,'landscape_30x20'),
	 ('PaperBaseType','CrystalPhotoMattePaperBase','crystal-photo-matte',0,'crystal_photo_matte_paper_base',NULL,1,false,'crystal_photo_matte'),
	 ('FinishType','BlockMatte','block-matte',0,'block_matte',NULL,1,false,'block_matte'),
	 ('FinishType','PosterMatte','poster-matte',0,'poster_matte',NULL,1,false,'poster_matte'),
	 ('PhotoBookPaperGroup','PhotoBookPaperGroup','photo-book-paper-group',0,'photo_book_paper_group',NULL,1,false,NULL),
	 ('GroupAllProductOption','AllPapersGroup','all-papers-group',0,'all_papers_group',NULL,1,false,NULL),
	 ('NovelPaperGroup','NovelPaperGroup','novel-paper-group',0,'novel_paper_group',91,1,false,NULL),
	 ('PaperType','SterlingPremium80','premium-magazine',0,'premium_magazine_paper',91,1,false,'premium_magazine_paper'),
	 ('PaperType','StandardTradeBWMattePaper','standard_trade_bw_matte_paper',0,'standard_trade_bw_matte_paper',91,1,false,'standard_trade_bw_matte_paper'),
	 ('PaperType','EconomyTradeMattePaper','economy_trade_matte_paper',0,'economy_trade_matte_paper',91,1,false,'economy_trade_matte_paper'),
	 ('PaperType','EconomyTradeBWCreamMattePaper','economy_trade_bw_cream_matte_paper',0,'economy_trade_bw_cream_matte_paper',91,1,false,'economy_trade_bw_cream_matte_paper'),
	 ('PaperType','StandardTradeMattePaper','standard_trade_matte_paper',0,'standard_trade_matte_paper',91,1,false,'standard_trade_matte_paper'),
	 ('PaperType','EconomyTradeBWMattePaper','economy_trade_bw_matte_paper',0,'economy_trade_bw_matte_paper',91,1,false,'economy_trade_bw_matte_paper'),
	 ('PaperType','Velvet','velvet_paper',0,'velvet_paper',91,1,false,'velvet_paper'),
	 ('PaperType','EconMagazine','magazine',0,'magazine_paper',91,1,false,'magazine_paper'),
	 ('PaperType','StandardLayflat','standard_layflat',0,'standard_layflat_paper',91,1,false,'standard_layflat_paper'),
	 ('PaperType','PremiumMatteLayflat','premium_matte_layflat',0,'premium_matte_layflat_paper',91,1,false,'premium_matte_layflat_paper'),
	 ('PaperType','ProUncoatedLayflat','pro_uncoated_layflat',0,'pro_uncoated_layflat_paper',91,1,false,'pro_uncoated_layflat_paper'),
	 ('PaperType','ProPhotoLayflat','pro_photo_layflat',0,'pro_photo_layflat_paper',91,1,false,'pro_photo_layflat_paper'),
	 ('PremiumPaper','PremiumPaperGroup','premium-paper-group',0,'premium_paper_group',17,1,false,NULL),
	 ('PaperType','StandardPaper','standard',0,'standard_paper',17,1,false,'standard_paper'),
	 ('PaperType','ProMediumGlossPaper','pro-medium-gloss-paper',0,'pro_medium_gloss_paper',17,4,true,'pro_medium_gloss_paper'),
	 ('PaperType','ProUncoatedPaper','pro-uncoated-paper',0,'pro_uncoated_paper',17,5,true,'pro_uncoated_paper');

```
```
```
```
```
```
```
```
```

## Port forwarding

to see all ports open, VS code has the ability to forward ports also
```
lsof -i -P -n | grep LISTEN
```