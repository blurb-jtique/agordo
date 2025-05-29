# Setup for Mac

all steps must be executed on Mac

## 1. clone the repos

### 1.1 Gtihub Config
- Create github account with blurb email

- create and add ssh keys to gihub
```sh
    ssh-keygen -t rsa -C "[YOUR USER HERE]@blurb.com"
```

- config GitHub username and email
```sh
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"
```

- Auto-Start SSH Agent on Login

```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

source ~/.zshrc
```

- blurby : temp-sandbox
- hemingway
- https://github.com/blurb/docker_microservices : temp-sandbox

- Download from Drive the docker assets and put all of them in the root of docker_microservices project

## 2. Setup zsh

- Install and setup zsh and oh-my-zsh plugin
```sh
  sudo apt install zsh
```

- install oh-my-zsh

```sh
  bash sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- set zsh as defaut

```sh
chsh -s /usr/bin/zsh
```
- Download the zsh-syntax-highlighting plugin, cloning it into the plugins directory of ohmyzsh.

```sh
cd ~/.oh-my-zsh/custom/plugins
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
```

- Open your /.zshrc file and Look for the line that is like:
```sh
plugins=(git)
```

- Enalbe plugnis

```sh
plugins=(git bundler colorize brew zeus gem rails ruby npm node nanoc history-substring-search zsh-syntax-highlighting)
```

- Copy and paste at the end of the same file the following environment variables

```sh
export LANGUAGE=en_US.UTF-8  
  
export LC_ALL=en_US.UTF-8  
  
export LANGUAGE=es_CO.UTF-8  
  
export LC_ALL=es_CO.UTF-8  
```

- Save and close the ~/.zshrc file.

- Restart (close and open another) terminal for the changes to apply or use this command in the same terminal to "reload":

```sh
	source ~/.zshrc
```


## 3. install podman

https://podman-desktop.io/docs/installation/macos-install

install ARM compatible version
verify the 5 most important extensions
enable third party docker components compatibility


**add registry**:

- go to settings/registries
- use the existing docker hub registry and edit it, setting the username as blurbendava and ask for the password to the team (see if it is possible to stoer it using keeper)

do not install podman-compose, instead instal docker compose using the repo and the bin, moving it to bin folder

- **install podman desktop**
	- **review mportant extensions**
		- composer
		- docker
		- lima
		- podman
		- registries
		
	- **settings**
		- docker compatibility enabled


**pull the needed images as it follows:**

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