# Ubuntu 20.04 Server
This readme involves both **Blurby** and **Hemingway** projects in a virtualized environment running in Ubuntu Server 20.04 LTS, the purpose of having this VM is having more control in your Blurby local environment while it is connected to the containerized ecosystem of the Java services.

This guide provides a temporary solution before transitioning to a fully containerized setup. Below, you'll find the steps to perform a fresh installation of Blurby, utilizing an up-to-date Blurby database.

## Last Test Setup
**OS** Mac M3 Pro Sonoma 14.4

**date** 20250120

**VM machine** UTM Version 4.6.4 (107)

**contact** johan.tique@blurb.com

## Assumptions
- you have a fresh Ubuntu Server 20.04 LTS installation using virtualization and UTM/QEMU and you have a shared folder well-configured
- you have access to Blurb GitHub
- your new Ubuntu Server has OpenSSH already installed, if not, install it:
  
  ```bash
  sudo apt install openssh-server
  sudo systemctl status ssh
  sudo systemctl enable ssh
  sudo systemctl restart ssh
  ```

- UTM stills support different architectures emulation
- your Ubuntu Server has a sudo user/account called `rpi`
- for both blurby and hemingway repos you need to use the **utm-focal** branch which should be for now a mirror of **master** with small compatibility changes
- you have already running or fully prepared the containerized environment [docker_microservices](https://github.com/blurb/docker_microservices)

## Connection setup

### Installing net tools

```bash
sudo apt install net-tools
```

check the assigned IP by DHCP, for now it is virtualized
```bash
ifconfig
# inet 192.168.64.4
```
**192.168.64.4** is the IP in my case attached to enp0s1 interface

### shared directory
echo to this `/etc/fstab` - at the end of file
```text
share /mnt/utm 9p trans=virtio,version=9p2000.L,rw,_netdev,auto 0 0
```

mount the shared fodler
```bash
sudo mkdir /mnt/utm
sudo mount -a
sudo systemctl start remote-fs.target
```

test the shared folder access
```bash
ls /mnt/utm
```

### SSH setup : client and server
#### SSH keys
SSH key to add to blurb GtiHub Repo
```bash
ssh-keygen -t ed25519 -C "ubuntu20-amd64@blurb.com"
cp ~/.ssh/id_ed25519.pub /mnt/utm 
```
after that copy the pub key available in your shared folder in the host and configure it into you GitHub account

add your ssh key as default (again)
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
#### SSH server

**In your physical/real computer (the MAC in this case)**, create an RSA key to setup the connection to your Ubuntu Server VM using SSH, DO NOT use a passphrase, you could but there is no need to do that
```bash
ssh-keygen -t rsa -C "[YOUR USER HERE]@blurb.com"
```

copy public key to shared folder in my case it is `~/Dev/shared-utm`
```bash
cp ~/.ssh/id_rsa.pub ~/Dev/shared-utm
```

Now **in the VM terminal** add the physical public key to the vm authorized keys, make sure your utm folder is still mounted
```bash
cat /mnt/utm/id_rsa.pub >> ~/.ssh/authorized_keys
```

Again **in the physical/real computer**, let's optimize the configuraion to the SSH tunnels in order to access with ease to the Ubuntu Server VM by using SSH

1.  edit the `/etc/hosts` and add the VM's IP to your host (you found it by using `ifconfig`), verify the content was added
```bash
echo "192.168.64.4 utm-focal-blurby" | sudo tee -a /etc/hosts
```

2. Add the configuration to the your host SSH config 
```bash
cat <<EOF >> ~/.ssh/config
Host utm-focal-blurby
  HostName utm-focal-blurby
  User rpi
  IdentityFile ~/.ssh/id_rsa
EOF
```

test your configuration, you should accept the fingerprint to be permanently added 'utm-focal-blurby' (ED25519) to the list of known hosts
```
ssh utm-focal-blurby
```

using the connection you openned above (be aware you are in the VM you can execute `whoami` to see your user) let's tweak the SSH server rules to guarantee VS-code can connect to the server without mush interrumptions

edit the following file `/etc/ssh/sshd_config` commenting out the following line and set it to `YES` -  this is just a fallback (just in case...)
```
PasswordAuthentication yes
```

addding the following configurations at the end to extend the time of a connection
```
ClientAliveInterval 30
ClientAliveCountMax 86400
```

## Libraries and dependencies

installing needed OS libraries
```bash
sudo apt update
sudo apt install build-essential curl wget openssl libssl-dev libreadline-dev zlib1g-dev dirmngr libmagickwand-dev imagemagick-6.q16 libffi-dev libpq-dev cmake libyaml-dev git libmagickcore-6.q16-dev exiftool
```

installing OpenSSL 1.0.2, in the VM root directory of the `rpi` account execute the following commands 
```bash
mkdir tweaks
cd tweaks
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz
tar xzf openssl-1.0.2u.tar.gz
cd openssl-1.0.2u
./config --prefix=/opt/openssl-1.0.2u --openssldir=/opt/openssl-1.0.2u shared zlib
make
sudo make install
```

you could verify the installation by inspecting the content in this directory
```bash
ls /opt/openssl-1.0.2u/
# bin  certs  include  lib  man  misc  openssl.cnf  private
```

finally, add the following ENV variables into your `~/.bashrc` file (at the end of the file)
```
## OpenSSL issue
export CFLAGS="-I/opt/openssl-1.0.2u/include"
export LDFLAGS="-L/opt/openssl-1.0.2u/lib"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/openssl-1.0.2u"
```

installing Ruby (this operation may take a long time), we are going to use a ruby version manager called rbenv
```
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
eval "$(~/.rbenv/bin/rbenv init - --no-rehash bash)"
rbenv install 1.9.3-p550
rbenv global 1.9.3-p550
rbenv install 2.1.0
```

during the ruby installation, rbenv should use the the `--with-openssl-dir` flag
```bash
# -> ./configure "--prefix=$HOME/.rbenv/versions/1.9.3-p550" --with-openssl-dir=/opt/openssl-1.0.2u
```

```bash
gem install bundler -v 1.16.2
rbenv rehash
```

After installing Ruby, let's begin with node installation, we are gogin to use a nodejs version manager called nodenv
```bash
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(nodenv init -)"' >> ~/.bashrc
source ~/.bashrc
nodenv install 8.11.1
nodenv global 8.11.1
```

### Troubleshooting imagemagick issue
Follow these instructions if this command is not giving you anything
```bash
which Magick-config
```

```bash
sudo apt install apt-file
sudo apt-file update
apt-file search Magick-config
# OUTPUT:
# graphicsmagick-libmagick-dev-compat: /usr/bin/Magick-config
# graphicsmagick-libmagick-dev-compat: /usr/share/man/man1/Magick-config.1.gz
# libgraphicsmagick1-dev: /usr/bin/GraphicsMagick-config
# libgraphicsmagick1-dev: /usr/share/man/man1/GraphicsMagick-config.1.gz
# libmagickcore-6.q16-dev: /usr/lib/x86_64-linux-gnu/ImageMagick-6.9.10/bin-q16/Magick-config <------
# libmagickcore-6.q16hdri-dev: /usr/lib/x86_64-linux-gnu/ImageMagick-6.9.10/bin-q16hdri/Magick-config
```

add this to **.bashrc** file
```bash
export PATH="/usr/lib/x86_64-linux-gnu/ImageMagick-6.9.10/bin-q16:$PATH"
```

Now `which Magick-config` should give you the expected path
```bash
which Magick-config
```

### Troubleshooting OpenSSL issue
Problem arises when Ruby wants to use `__bc_crypt` within `bcrypt` gem, it is creating an invalid hash and you could get this error `BCrypt::Errors::InvalidHash: invalid hash`

first diagnosis could be obtained by comparing this two outputs
```bash
openssl version
ruby -ropenssl -e 'puts OpenSSL::OPENSSL_VERSION'
```

it should be the same, and for this OS, Ruby version, and legacy project it is expected to be  
**OpenSSL 1.0.2u  20 Dec 2019**


## Blurby Project
clone the project - master is the default branch (this operation may take a long time)
```bash
mkdir code
cd code
git clone git@github.com:blurb/blurby.git
cd blurbly
```

add your ssh key as default (again)
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

install the ruby dependencies inside `~/code/blurby` directory
```bash
bundle install
```

bower installation, here `blurbmenu` was changed to `zz_blurbmenu` maybe a deprecation, check that into `bower.json` dependencies
```bash
npx bower install
npm install
```
### Tweaks before running Blurby
NOTICE that these tweaks **have already been introduced** in the **utm-focal** branch

As you will be running this VM with the local containerized environment, it is necessary that you edit the auth service base class `lib/services/auth_service/clients/base.rb:15` to force using http instead of https
```ruby
# force http always
ServicesHelper.url_for_service('auth').gsub("http://", "http://")
```

For some special cases the captcha verifier could give you problems, if so, you could add your username (when created one) into this sort of whitelist within the `app/controllers/application_controller.rb`
```ruby
def captcha_verified?
  return true if ["dpanic", "SmokeyThProd", "your_username"].include?(params[:user].try(:[], :username))
```

Bcrypt was updated, in this linux version, bcrypt v 3.1.10 is not creating valid hashes, to solve the issue it is necessary to update the library to the version 3.1.20, `Gemfile.lock` was updated.
```
bcrypt (3.1.20)
```

Regarding database migrations, for some reason the `ActiveRecord::Base.connection.reset_pk_sequence!` is not compatible with Postgresql anymore, if you face some issues realted to `increment_by` column during a migration you could replace `ActiveRecord::Base.connection.reset_pk_sequence!` to use `reset_pk_sequence!` extending the `extend MigrationHelper` module in the migration which is giving you the issue. For example:
```
class AddShootmytravelPartnerAndCode < ActiveRecord::Migration
  extend MigrationHelper

  def self.up
    # ActiveRecord::Base.connection.reset_pk_sequence!('partners')
    reset_pk_sequence!('partners')
```

### Configuration files / Settings

Assuming that you have the **docker_microservices** running and within the VM's hosts file, it is necessary to add the reference to your host computer that are running and port forwarding the Java services and databases using docker/podman, if the IP of the VM is `192.168.64.4` commonly the host will take the `192.168.64.1` address, but you need to verify it. assuming that within your VM you will have to execute the following:
```bash
echo "192.168.64.1 containerized-host" | sudo tee -a /etc/hosts
```

**Database configuration**
```yml
#
# shared database defaults
#
defaults: &defaults
  adapter: postgresql
  encoding: unicode
  username: blurby
  password:
  min_messages: notice

development: &development
  database: blurb_dev
  host: containerized-host
  port: 25432
  adapter: postgresql
  encoding: unicode
  username: blurby
  schema_search_path: blurby,public
  password:

test: &test
  database: blurb_test
  host: containerized-host
  port: 25432
  adapter: postgresql
  encoding: unicode
  username: postgres
  schema_search_path: blurby,public
  password:
```

**Redis configuration**
```yml
default: &default
  host: containerized-host
  port: 6379

development:
  <<: *default

test:
  <<: *default

cucumber:
  <<: *default

utopia:
  <<: *default

epub:
  <<: *default

staging:
  <<: *default

production:
  <<: *default
```

**Endpoints**
```yml
me_prefix: "dev"
subdomain_postfix: #{fetch(:blurby_subdomain_postfix, nil)} # Subdomain postfix for blurby ('eng' in foo.eng.blurb.com). Default is nil.
domain: localhost
number_asset_hosts: #{fetch(:number_asset_hosts, 0)}
ssl_asset_host: #{fetch(:ssl_asset_host, nil)}

hostnames:
  river_url: http://river:8080/river
  www_url: http://dev.blurb.com:3000
  forums_url:
  photos_url:
  secure_url: https://dev.blurb.com:3000
  uploads_url: http://bookserve:8080
  bookshow_url: http://bookserve:8080
  bookserve_url: http://bookserve:8080
  bookify_api_url: 
  bookify_images_url:  http://portkey:8080/portkey
  bookify_uploads_url: 

  isbn_service_url: http://isbn-service:9024/isbn-service/
  order_service_url: http://order-service:9022/product-service/
  product_service_url: http://product-service:9022/product-service/
  shipping_service_url: http://shipping-service:9008/shipping-service/
  feature_service_url: http://feature-service:9004/feature-service
  auth_service_url: http://containerized-host:9012/auth-service/
  upload_service_url: http://upload-service:9100/
  pdf-processing_service_url: http://pdf-processing-service:9110/pdf-processing-service/
  bookwizard_url: http://bookwizard:9090
```

**Blurb on host machine**
in the host machine which is also running the containers, you need to point `dev.blurb.com` to the VM machine IP address
```bash
echo "192.168.64.4 dev.blurb.com" | sudo tee -a /etc/hosts
```

### Blurby running
Remember that it is required to have the containerized environment running first.

Let's go to the `~/code/blurby` directory, and before you can run the Blurby server, you should run the db migrations, to do that you could use
```bash
bundle exec rake db:migrate
```

Ruby server
```bash
bundle exec thin start
```

To open a Rails 2 development console:
```bash
bundle exec script/console
```

## Hemingway Project

clone and access the project
```bash
cd ~/code
git clone git@github.com:blurb/hemingway.git
cd hemingway
```

install bundler 1.16.6 for Ruby version 2.1
```bash
gem install bundler -v 1.16.6
```

If you encountered a SSL issue like
```
ERROR:  Could not find a valid gem 'bundler' (= 1.16.6), here is why:
          Unable to download data from https://rubygems.org/ - SSL_connect returned=1 errno=0 state=error: certificate verify failed (https://api.rubygems.org/specs.4.8.gz)
```

you could force the use of http instead of https (bad idea) or reinstall a modern ruby gems version that is still compatible with Ruby 2.1. To reinstall ruby gems, download the gem in a modern OS with valid certificates
```bash
wget https://rubygems.org/downloads/rubygems-update-2.7.11.gem
```

make sure your CA certificates are updated
```
sudo apt-get update
sudo apt-get install --reinstall ca-certificates
```

install the rubygems updater and update rubygems 
```bash
gem install --local rubygems-update-2.7.11.gem
update_rubygems
gem --version
# 2.7.11
```

commonly it should install the expected bundler, if not you could it again
```bash
gem install bundler -v 1.16.6
```

also the Gemfile was modified, supressing the https protocol from rubygems and removing the `source 'http://repo.blurb.com/gem_repo'`
```ruby
source 'http://rubygems.org'
#source 'http://repo.blurb.com/gem_repo'
```

do the installation
```bash
bundle install
npx bower install
npm install
```

moving the compiled assets
```bash
mkdir -p public/assets/distribution
bundle exec rake translations
bundle exec rake assets:precompile
bundle exec rake build:dev RAILS_ENV=development
cp public/distribution/assets/application.js public/assets/distribution
cp public/distribution/assets/application.css public/assets/distribution
cp public/distribution/assets/manifest.yml public/assets/distribution
ln -s /home/rpi/code/hemingway/public/assets/distribution /home/rpi/code/blurby/public/assets/distribution
```
