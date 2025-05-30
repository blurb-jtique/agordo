# Setup for Mac

all steps must be executed on Mac

## 1. clone the repos

### 1.1 Gtihub Config
- Create github account with blurb email

- create and add ssh keys to gihub
```sh
    ssh-keygen -t ed25519 -C "[YOUR USER HERE]@blurb.com"
```

- config GitHub username and email
```sh
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"
```
- Auto-Start SSH Agent on Login

```sh
# Start the SSH agent in the background. This is useful for managing your SSH keys during your session,
# especially when installing dependencies from private repositories that require SSH authentication.
eval "$(ssh-agent -s)"

# Add your private SSH key to the agent so you don't have to enter your passphrase every time.
ssh-add ~/.ssh/id_rsa


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

- Enable plugnis

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

**Get up docker_microservices**

```sh
podman compose up 
```

## 4. download the Hemingway artifact

```sh
sh ~/${PATH_TO}/docker_microservices/download-if-newer.sh http://slc-jenkins-integration.vip.blurb.com/view/all/job/hemingway/lastSuccessfulBuild/artifact/assets.tgz hemingway.tgz
```

## 5. begin with the Ruby installation - 2.7.8

Install Homebrew

```sh
sh /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install dependencies

```sh
brew install wget gcc make openssl libyaml readline zlib pkg-config sqlite autoconf automake libtool postgresql mysql node yarn libvips redis memcached git chromedriver curl watchman libpq graphviz readline libyaml gmp libffi imagemagick@6 libxml2 libxslt exiftool pgcli
```

install rbenv

```sh
brew install rbenv
```

- **Add the next line in the .bashrc/.zshrc config**

```sh
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
```

```sh
rbenv install 2.7.8
rbenv global 2.7.8
gem install bundler -v 2.2.34
rbenv rehash
```


## 6 add dev.blurb.com, dev.blurb.es in hosts

```sh
echo "127.0.0.1 dev.blurb.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 dev.blurb.es" | sudo tee -a /etc/hosts
```

## 7 - Review node version if it is not installed, install it

```sh
node -v
```

```sh
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash

Edit your ~/.zshrc:
nano ~/.zshrc
Add the following at the bottom:

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

source ~/.zshrc
```

```sh
brew install node
```

## 8. install ruby dependencies

```sh
cd blurby
bundle install
```


## 9. install docker compose

```sh
brew install docker-compose
```

## 10. Request docker hub credentials in order to get access to blurbbooks

## 11. install DBeaver

- **download it from** https://dbeaver.io/

- **Setting up**
	- set port 25432
	- enable check show all databases	

## 12. Install prostgress and setup databases

  ***12.1. install postgresql***

  ```sh
  brew install **petere**/postgresql/postgresql@11
  ```
  ***12.2. add export to zshrc***

  Add postgresql@11 first in your PATH, run:

  ```sh
  echo 'export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"' >> ~/.zshrc
  ```

  Set the following Postgres flags

	```sh
	export LDFLAGS="-L/opt/homebrew/opt/postgresql@11/lib"
	
	export CPPFLAGS="-I/opt/homebrew/opt/postgresql@11/include"

  export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@11/lib/pkgconfig"
	```
	
  **12.3. review psql version**

	```sh
	psql --version
	```

  **12.4. Download database test and dev**
   [drive](https://drive.google.com/drive/folders/1nMt96XhcTQgzcbbODe2kehuYe-8s_lG9), folder resources

  **12.5. Test connection psql for test and dev databases**

  update test database

  ```sh
  psql -p 25432 -d postgres -U postgres -h 127.0.0.1
  DROP DATABASE blurb_test_b; if already exist
	psql -U postgres -f ~/11_202505041046-blurb_test_b.sql | grep error  
  ```

  **12.6. repeat the same above process with the dev database sql**

  update dev database

	```sh
	psql -p 35432 -d postgres -U postgres -h 127.0.0.1
	DROP DATABASE blurb_test_b; if already exist
	psql -U postgres -f ~/15_202505130933-blurb_dev.sql | grep error
	```

  Comment the lines 13 and 36 related to timeout

	```sh
	-- SET transaction_timeout = 0;
	```

## 13. Start Blurb project

**Config endpoints** 
Create `endpoints.yml` base on the `endpoints.yml.example` and update it with the [endpoints](https://gist.github.com/blurb-jpedroza/f5478b1bded750af138c9e063a606888)

**run blurb project** 
```sh
bundle exec thin start
```

## 14. Troubleshooting: Intel/Rosetta Setup for EventMachine & Node Issues

If you run into compilation issues with gems like `eventmachine` or native extensions depending on OpenSSL or PG, especially on M chips, follow this guide to set up a parallel x86 (Intel) environment using Rosetta 2.

### 14.1. Install Rosetta 2

```sh
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

### 14.2. Open a terminal in x86 mode

```sh
arch -x86_64 /bin/zsh
```

### 14.3. Install Intel Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add this to your `~/.zshrc`:

```sh
# Homebrew Intel (Rosetta)
/usr/local/bin:$PATH
```

Reload your shell:

```sh
source ~/.zshrc
```

Verify:

```sh
arch -x86_64 brew --version
```

### 14.4. Install OpenSSL 1.1 manually

```sh
mkdir -p ~/src/openssl-1.1 && cd ~/src/openssl-1.1
curl -LO https://www.openssl.org/source/old/1.1.1/openssl-1.1.1u.tar.gz
tar xf openssl-1.1.1u.tar.gz
cd openssl-1.1.1u
arch -x86_64 ./Configure darwin64-x86_64-cc \
  --prefix=$HOME/.local/openssl-1.1 \
  --openssldir=$HOME/.local/openssl-1.1/ssl \
  shared zlib
arch -x86_64 make -j$(sysctl -n hw.ncpu)
arch -x86_64 make install_sw
```

### 14.5. Install x86 dependencies via Intel Homebrew

```sh
arch -x86_64 brew update
arch -x86_64 /usr/local/bin/brew install zlib libyaml readline gdbm pkgconf
```

### 14.6. Update `~/.zshrc` for x86 builds

```sh
if [ "$(uname -m)" = "x86_64" ]; then
  export PATH="$HOME/.local/openssl-1.1/bin:$PATH"
  export LDFLAGS="\
    -L$HOME/.local/openssl-1.1/lib \
    -L/usr/local/opt/zlib/lib \
    -L/usr/local/opt/libyaml/lib \
    -L/usr/local/opt/readline/lib \
    -L/usr/local/opt/gdbm/lib"
  export CPPFLAGS="\
    -I$HOME/.local/openssl-1.1/include \
    -I/usr/local/opt/zlib/include \
    -I/usr/local/opt/libyaml/include \
    -I/usr/local/opt/readline/include \
    -I/usr/local/opt/gdbm/include"
  export PKG_CONFIG_PATH="\
    $HOME/.local/openssl-1.1/lib/pkgconfig:\
    /usr/local/opt/zlib/lib/pkgconfig:\
    /usr/local/opt/libyaml/lib/pkgconfig:\
    /usr/local/opt/readline/lib/pkgconfig:\
    /usr/local/opt/gdbm/lib/pkgconfig"
  export RUBY_CONFIGURE_OPTS="\
    --with-openssl-dir=$HOME/.local/openssl-1.1 \
    --with-zlib-dir=/usr/local/opt/zlib \
    --with-libyaml-dir=/usr/local/opt/libyaml \
    --with-readline-dir=/usr/local/opt/readline \
    --with-gdbm-dir=/usr/local/opt/gdbm"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/libpq/lib -L/usr/local/opt/imagemagick/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/libpq/include -I/usr/local/opt/imagemagick/include/ImageMagick-7"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libpq/lib/pkgconfig:/usr/local/opt/imagemagick/lib/pkgconfig"
fi
```

Reload:

```sh
source ~/.zshrc
```

### 14.7. Install remaining dependencies

```sh
arch -x86_64 /usr/local/bin/brew install libpq imagemagick
```

### 14.8. Bundler Configuration

```sh
arch -x86_64 bundle config build.eventmachine --with-openssl-dir=$HOME/.local/openssl-1.1
arch -x86_64 bundle config build.pg --with-pg-config=/usr/local/opt/libpq/bin/pg_config
arch -x86_64 bundle config build.rmagick --with-opt-dir=/usr/local/opt/imagemagick
```

Update `Gemfile` to:

```ruby
gem 'eventmachine', '~> 1.2.7'
```

Then run:

```sh
arch -x86_64 bundle update eventmachine
arch -x86_64 bundle install
```

### 14.9. Alternative: Patch EventMachine 1.0.7

```sh
cd ~/.rbenv/versions/2.7.8/lib/ruby/gems/2.7.0/gems/eventmachine-1.0.7/ext
# Replace all `bind(...)` with `::bind(...)`
# Example:
# - if (bind(sd, bind_to, bind_to_size) < 0) {
# + if (::bind(sd, bind_to, bind_to_size) < 0) {

make clean
make
arch -x86_64 bundle install
```

## 15. Troubleshooting podman

- **Run the next command to fix issues running podman compose up**

```sh
podman network rm docker_microservices_default
```
