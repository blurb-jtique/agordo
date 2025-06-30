# Blurb Development Environment Setup Guide for Mac (M-chip)

This guide provides step-by-step instructions to set up a complete development environment for the Blurb project on macOS systems with Apple Silicon (M1/M2/M3) chips.

## Prerequisites

- macOS with Apple Silicon (M1/M2/M3 chip)
- Administrative access to install software
- Stable internet connection

## Table of Contents

1. [Initial Setup](#1-initial-setup)
   - [GitHub Configuration](#11-github-configuration)
   - [SSH Keys Setup](#12-ssh-keys-setup)
2. [Shell Environment Setup](#2-shell-environment-setup)
3. [System Dependencies](#3-system-dependencies)
   - [Homebrew Installation](#31-homebrew-installation)
   - [Ruby Installation](#32-ruby-installation-278)
4. [Containerization Tools](#4-containerization-tools)
   - [Podman Installation](#41-podman-installation)
   - [Docker Compose Installation](#42-docker-compose-installation)
5. [Node.js Environment](#5-nodejs-environment)
6. [Database Setup](#6-database-setup)
   - [PostgreSQL Installation](#61-postgresql-installation)
   - [DBeaver Installation](#62-dbeaver-installation)
   - [Database Configuration](#63-database-configuration)
7. [Network Configuration](#7-network-configuration)
8. [Project Setup](#8-project-setup)
   - [Repository Cloning](#81-repository-cloning)
   - [Hemingway Artifact Setup](#82-hemingway-artifact-setup)
   - [Blurb Project Configuration](#83-blurb-project-configuration)
9. [Troubleshooting](#9-troubleshooting)
   - [Intel/Rosetta Setup for EventMachine Issues](#91-intelrosetta-setup-for-eventmachine-issues)
   - [Podman Issues](#92-podman-issues)

---

## 1. Initial Setup

### 1.1 GitHub Configuration

Before starting, ensure you have access to the Blurb repositories and proper authentication set up.

1. **Create GitHub account**: Use your Blurb email address to create a GitHub account if you don't have one.

2. **Generate SSH keys**: Create a new SSH key pair for secure authentication with GitHub.

```sh
ssh-keygen -t ed25519 -C "[YOUR_USERNAME]@blurb.com"
```

3. **Add SSH key to GitHub**: Copy the public key and add it to your GitHub account.

```sh
cat ~/.ssh/id_ed25519.pub
```

### 1.2 SSH Keys Setup

Configure Git with your credentials and set up SSH agent for seamless authentication.

1. **Configure Git credentials**:

```sh
git config --global user.name "Your Name"
git config --global user.email "your.email@blurb.com"
```

2. **Configure SSH agent**: Set up automatic SSH key loading.

```sh
# Start the SSH agent in the background
eval "$(ssh-agent -s)"

# Add your private SSH key to the agent
ssh-add ~/.ssh/id_ed25519
```

3. **Configure SSH agent to start automatically** by adding to your shell profile:

```sh
echo 'eval "$(ssh-agent -s)"' >> ~/.zshrc
echo 'ssh-add ~/.ssh/id_ed25519' >> ~/.zshrc
```

## 2. Shell Environment Setup

Configure zsh and Oh My Zsh for an enhanced development experience.

### 2.1 Install Oh My Zsh

Since macOS comes with zsh by default, we just need to install Oh My Zsh for enhanced functionality.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 2.2 Install Syntax Highlighting Plugin

```sh
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

### 2.3 Configure Plugins

Edit your `~/.zshrc` file and update the plugins line:

```sh
plugins=(git bundler colorize brew zeus gem rails ruby npm node nanoc history-substring-search zsh-syntax-highlighting)
```

### 2.4 Set Environment Variables

Add the following environment variables to your `~/.zshrc`:

```sh
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
```

### 2.5 Apply Changes

Reload your shell configuration:

```sh
source ~/.zshrc
```

## 3. System Dependencies

### 3.1 Homebrew Installation

Install Homebrew, the package manager for macOS:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install essential development dependencies:

```sh
brew install wget gcc make openssl libyaml readline zlib pkg-config sqlite autoconf automake libtool postgresql mysql node yarn libvips redis memcached git chromedriver curl watchman libpq graphviz gmp libffi imagemagick@6 libxml2 libxslt exiftool pgcli
```

### 3.2 Ruby Installation (2.7.8)

Install rbenv for Ruby version management:

```sh
brew install rbenv
```

Add rbenv to your shell configuration:

```sh
echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

Install Ruby 2.7.8 and set it as the global version:

```sh
rbenv install 2.7.8
rbenv global 2.7.8
gem install bundler -v 2.2.34
rbenv rehash
```

## 4. Containerization Tools

### 4.1 Podman Installation

Install Podman for container management. Follow the official guide at: <https://podman-desktop.io/docs/installation/macos-install>

1. **Install Podman and Podman Desktop**:

```sh
brew install podman podman-desktop
```

2. **Configure Podman Desktop**:
   - Install ARM-compatible version
   - Verify these essential extensions are enabled:
     - composer
     - docker
     - lima
     - podman
     - registries
   - Enable Docker compatibility in Podman Desktop settings

3. **Configure Registry Access**:
   - Go to Settings > Registries
   - Edit the existing Docker Hub registry
   - Set username as `blurbendava`
   - Request the password from your team (consider storing it in Keeper)

4. **Download Docker Assets**:

```sh
cp ~/Downloads/docker-assets.zip ~/code/docker_microservices/
cd ~/code/docker_microservices
unzip docker-assets.zip
```

5. **Pull Required Images**:
   - `blurbbooks/services-postgres2:latest`
   - `blurbbooks/service-tomcat8-jre8`
   - `blurbbooks/product-service`

6. **Start Services**:

```sh
podman compose up
```

### 4.2 Docker Compose Installation

```sh
brew install docker-compose
```

## 5. Node.js Environment

### 5.1 Check Current Node Version

```sh
node -v
```

### 5.2 Install nodenv (if Node.js is not installed)

```sh
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash
```

Add nodenv to your shell configuration:

```sh
echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(nodenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

### 5.3 Install Node.js 16.20.2

This version is compatible with the Ruby 2.7 Blurby branch:

```sh
nodenv install 16.20.2
nodenv global 16.20.2
```

## 6. Database Setup

### 6.1 PostgreSQL Installation

Install PostgreSQL 11 (or a compatible version):

```sh
brew install petere/postgresql/postgresql@11
```

Add PostgreSQL to your PATH:

```sh
echo 'export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"' >> ~/.zshrc
```

Set PostgreSQL environment variables:

```sh
echo 'export LDFLAGS="-L/opt/homebrew/opt/postgresql@11/lib"' >> ~/.zshrc
echo 'export CPPFLAGS="-I/opt/homebrew/opt/postgresql@11/include"' >> ~/.zshrc
echo 'export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@11/lib/pkgconfig"' >> ~/.zshrc
source ~/.zshrc
```

Verify the installation:

```sh
psql --version
```

### 6.2 DBeaver Installation

1. Download DBeaver from: <https://dbeaver.io/>

2. **Configuration**:
   - Set port to 25432
   - Enable "Show all databases" option

### 6.3 Database Configuration

#### 6.3.1 Download Database Files

Download the test and development database files from the [Google Drive resources folder](https://drive.google.com/drive/folders/1nMt96XhcTQgzcbbODe2kehuYe-8s_lG9).

#### 6.3.2 Setup Test Database

```sh
# Connect to PostgreSQL
psql -p 25432 -d postgres -U postgres -h 127.0.0.1

# Drop existing database if it exists
DROP DATABASE IF EXISTS blurb_test_b;

# Exit PostgreSQL and import the database
\q
psql -U postgres -f ~/11_202505041046-blurb_test_b.sql | grep ERROR
```

#### 6.3.3 Setup Development Database

```sh
# Connect to PostgreSQL
psql -p 35432 -d postgres -U postgres -h 127.0.0.1

# Drop existing database if it exists
DROP DATABASE IF EXISTS blurb_dev;

# Exit PostgreSQL and import the database
\q
psql -U postgres -f ~/15_202505130933-blurb_dev.sql | grep ERROR
```

**Note**: Comment out the timeout-related lines (lines 13 and 36) if they cause issues:

```sql
-- SET transaction_timeout = 0;
```

## 7. Network Configuration

Add development domains to your hosts file:

```sh
echo "127.0.0.1 dev.blurb.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 dev.blurb.es" | sudo tee -a /etc/hosts
```

## 8. Project Setup

### 8.1 Repository Cloning

Clone the Blurby repository and checkout the ruby-2-7 branch:

```sh
git clone https://github.com/blurb/blurby.git
cd blurby
git checkout ruby-2-7
```

### 8.2 Hemingway Artifact Setup

Download the Hemingway artifact:

```sh
cd ~/code/docker_microservices
./download-if-newer.sh http://slc-jenkins-integration.vip.blurb.com/view/all/job/hemingway/lastSuccessfulBuild/artifact/assets.tgz hemingway.tgz
```

Create the necessary symlinks following the instructions from the [Hemingway repository](https://github.com/blurb/hemingway?tab=readme-ov-file#set-up-your-hemingwayblurby-vagrant-box):

```sh
cd hemingway
cp public/distribution/assets/application.js public/assets/distribution/
cp public/distribution/assets/application.css public/assets/distribution/
cp public/distribution/assets/manifest.yml public/assets/distribution/

# Create symlink using absolute paths for Hemingway and Blurby
ln -s /absolute/path/to/hemingway/public/assets/distribution /absolute/path/to/blurby/public/assets/distribution
```

### 8.3 Blurb Project Configuration

1. **Configure endpoints**: Create `endpoints.yml` based on `endpoints.yml.example` and update it with the [endpoints configuration](https://gist.github.com/blurb-jpedroza/f5478b1bded750af138c9e063a606888).

2. **Install dependencies**:

```sh
cd blurby
bundle install
npx bower install
npm install
```

3. **Start the Ruby server**:

```sh
bundle exec thin start
```

You should see output similar to:

```
2025-06-27 16:59:40 -0500 Thin web server (v1.8.2 codename Ruby Razor)
2025-06-27 16:59:40 -0500 Maximum connections set to 1024
2025-06-27 16:59:40 -0500 Listening on 0.0.0.0:3000, CTRL+C to stop
```

## 9. Troubleshooting

### 9.1 Intel/Rosetta Setup for EventMachine Issues

If you encounter compilation issues with gems like `eventmachine` or native extensions on Apple Silicon, follow this guide to set up a parallel x86 (Intel) environment using Rosetta 2.

#### 9.1.1 Install Rosetta 2

```sh
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

#### 9.1.2 Open Terminal in x86 Mode

```sh
arch -x86_64 /bin/zsh
```

#### 9.1.3 Install Intel Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Intel Homebrew to your `~/.zshrc`:

```sh
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Verify the installation:

```sh
arch -x86_64 brew --version
```

#### 9.1.4 Install OpenSSL 1.1 Manually

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

#### 9.1.5 Install x86 Dependencies

```sh
arch -x86_64 brew update
arch -x86_64 /usr/local/bin/brew install zlib libyaml readline gdbm pkgconf libpq imagemagick
```

#### 9.1.6 Configure Environment for x86 Builds

Add this configuration to your `~/.zshrc`:

```sh
if [ "$(uname -m)" = "x86_64" ]; then
  export PATH="$HOME/.local/openssl-1.1/bin:$PATH"
  export LDFLAGS="\
    -L$HOME/.local/openssl-1.1/lib \
    -L/usr/local/opt/zlib/lib \
    -L/usr/local/opt/libyaml/lib \
    -L/usr/local/opt/readline/lib \
    -L/usr/local/opt/gdbm/lib \
    -L/usr/local/opt/libpq/lib \
    -L/usr/local/opt/imagemagick/lib"
  export CPPFLAGS="\
    -I$HOME/.local/openssl-1.1/include \
    -I/usr/local/opt/zlib/include \
    -I/usr/local/opt/libyaml/include \
    -I/usr/local/opt/readline/include \
    -I/usr/local/opt/gdbm/include \
    -I/usr/local/opt/libpq/include \
    -I/usr/local/opt/imagemagick/include/ImageMagick-7"
  export PKG_CONFIG_PATH="\
    $HOME/.local/openssl-1.1/lib/pkgconfig:\
    /usr/local/opt/zlib/lib/pkgconfig:\
    /usr/local/opt/libyaml/lib/pkgconfig:\
    /usr/local/opt/readline/lib/pkgconfig:\
    /usr/local/opt/gdbm/lib/pkgconfig:\
    /usr/local/opt/libpq/lib/pkgconfig:\
    /usr/local/opt/imagemagick/lib/pkgconfig"
  export RUBY_CONFIGURE_OPTS="\
    --with-openssl-dir=$HOME/.local/openssl-1.1 \
    --with-zlib-dir=/usr/local/opt/zlib \
    --with-libyaml-dir=/usr/local/opt/libyaml \
    --with-readline-dir=/usr/local/opt/readline \
    --with-gdbm-dir=/usr/local/opt/gdbm"
fi
```

#### 9.1.7 Configure Bundler for x86

```sh
arch -x86_64 bundle config build.eventmachine --with-openssl-dir=$HOME/.local/openssl-1.1
arch -x86_64 bundle config build.pg --with-pg-config=/usr/local/opt/libpq/bin/pg_config
arch -x86_64 bundle config build.rmagick --with-opt-dir=/usr/local/opt/imagemagick
```

#### 9.1.8 Update EventMachine Version

Update your `Gemfile` to use a newer version of EventMachine:

```ruby
gem 'eventmachine', '~> 1.2.7'
```

Then run:

```sh
arch -x86_64 bundle update eventmachine
arch -x86_64 bundle install
```

#### 9.1.9 Alternative: Patch EventMachine 1.0.7

If you need to stick with EventMachine 1.0.7, you can patch it manually:

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

### 9.2 Podman Issues

If you encounter issues with `podman compose up`, try removing the default network:

```sh
podman network rm docker_microservices_default
```

---

## Additional Notes

- **Docker Hub Access**: Request Docker Hub credentials from your team to access `blurbbooks` repositories.
- **Database Versions**: PostgreSQL 11 is recommended for compatibility, but newer versions should work as well.
- **Node.js Version**: Version 16.20.2 is specifically tested with the Ruby 2.7 Blurby branch.
- **Performance**: Apple Silicon Macs may require the Intel/Rosetta setup for certain Ruby gems.

## Support

If you encounter issues not covered in this guide, please:

1. Check the troubleshooting section
2. Consult with your team members
3. Review the official documentation for each tool
4. Consider creating an issue in the project repository

---

*Last updated: June 2025*
