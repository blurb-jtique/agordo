# Setup for Mac

all steps must be executed on Mac

## 1. clone the repos

- blurby : temp-sandbox
- hemingway
- https://github.com/blurb/docker_microservices : temp-sandbox

## 2. install podman

https://podman-desktop.io/docs/installation/macos-install

install ARM compatible version

verify the 5 most important extensions

enable third party docker components compatibility

add registry:

- go to settings/registries
- use the existing docker hub registry and edit it, setting the username as blurbendava and ask for the password to the team (see if it is possible to stoer it using keeper)

do not install podman-compose, instead instal docker compose using the repo and the bin, moving it to bin folder
pull the needed images as it follows:

blurbbooks/services-postgres2:latest
blurbbooks/service-tomcat8-jre8
blurbbooks/product-service

## 3. download the Hemingway artifact

```sh
sh ~/${PATH_TO}/docker_microservices/download-if-newer.sh http://slc-jenkins-integration.vip.blurb.com/view/all/job/hemingway/lastSuccessfulBuild/artifact/assets.tgz hemingway.tgz
```

## 4. begin with the Ruby installation - 2.7.8

```sh
brew install wget gcc make openssl libyaml readline zlib pkg-config sqlite autoconf automake libtool postgresql mysql node yarn libvips redis memcached git chromedriver curl watchman libpq graphviz readline libyaml gmp libffi imagemagick@6 libxml2 libxslt exiftool pgcli
```

install rbenv

```sh
brew install rbenv
```

```sh
rbenv install 2.7.8
rbenv global 2.7.8
gem install bundler -v 2.2.34
rbenv rehash
```

## 5. install ruby dependencies

```sh
cd blurby
bundle install
```


## 6. install docker ecosystem

```sh
brew install postgresql@11
```