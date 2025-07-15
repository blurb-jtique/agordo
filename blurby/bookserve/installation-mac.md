# Bookserve Installation Guide for Mac M3

This guide provides step-by-step instructions for setting up the Bookserve Java application on macOS with Apple Silicon (M3 chip).

## Prerequisites

- macOS with Apple Silicon (M3)
- [SDKMAN!](https://sdkman.io/) installed for Java environment management
- Git for version control
- Podman for containerized database

## 1. Java Development Environment Setup

### 1.1 Install Java 8

Install Amazon Corretto 8, which is fully compatible with the Bookserve application:

```sh
sdk install java 8.0.452-amzn
```

### 1.2 Install Maven

Maven 3.8.x provides full compatibility with Java 8 and includes improved TLS support:

```sh
sdk install maven 3.8.9
```

### 1.3 Install Apache Tomcat

```sh
sdk install tomcat 9.0.104
```

### 1.4 Configure SDKMAN Auto-Environment

Create an `.sdkmanrc` file in your project directory to automatically switch to the correct Java and Maven versions:

```bash
nano .sdkmanrc
```

Add the following content:

```text
# Enable auto-env through the sdkman_auto_env config
# Add key=value pairs of SDKs to use below
java=8.0.452-amzn
maven=3.8.9
```

### 1.5 Verify Installation

Check that Maven is using the correct Java version:

```sh
mvn -v
```

Expected output should show Java 8:
```
Apache Maven 3.8.9 (e26b057cc3a17459358ef53e4d0e2e381bf08a1c)
Maven home: /Users/c-johan.tique/.sdkman/candidates/maven/current
Java version: 1.8.0_452, vendor: Amazon.com Inc.
...
```

### 1.6 Configure Maven Settings

Create or update your Maven settings file to include Blurb's internal repositories:

```sh
mkdir -p ~/.m2
nano ~/.m2/settings.xml
```

Add the following content:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
          http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <mirrors>
    <mirror>
      <id>blurb-internal</id>
      <url>http://archiva.blurb.com:8080/repository/internal/</url>
      <mirrorOf>blurb.internal</mirrorOf>
      <blocked>false</blocked>
    </mirror>
    <mirror>
      <id>blurb-snapshots</id>
      <url>http://archiva.blurb.com:8080/repository/snapshots/</url>
      <mirrorOf>blurb.snapshots</mirrorOf>
      <blocked>false</blocked>
    </mirror>
  </mirrors>
</settings>
```

## 2. Database Setup

### 2.1 Download Database Files

Download the books database from the [Blurb Google Drive shared folder](https://drive.google.com/drive/folders/1nMt96XhcTQgzcbbODe2kehuYe-8s_lG9).

### 2.2 Setup Database Container

1. Update the `docker-microservices` repository to the latest version on the `temp-sandbox` branch
1. Stop any running containers and restart with Podman:

```sh
podman compose down
podman compose up -d
```

1. Verify the `bookserve-db` service is running:

```sh
podman ps | grep bookserve-db
```

### 2.3 Import Database

Import the downloaded database file into the PostgreSQL container:

```sh
podman exec -i bookserve-db psql -U postgres -d books < /path/to/your/books.sql
```

> **Note:** Replace `/path/to/your/books.sql` with the actual path to your downloaded database file.

## 3. Bookserve Application Setup

### 3.1 Clone Repository

Clone the Bookserve repository and switch to the Mac-specific branch:

```sh
git clone git@github.com:blurb/bookserve.git
cd bookserve
git checkout local/mac/pdx
```

### 3.2 Build Application

Build the application with Java 8 compatibility, excluding migrations and skipping tests:

```sh
mvn clean install \
  -Dmaven.compiler.source=1.8 \
  -Dmaven.compiler.target=1.8 \
  -pl '!migrations' \
  -Dmaven.test.skip=true
```

## 4. Tomcat Configuration and Deployment

### 4.1 Configure Tomcat Permissions

Make the Tomcat scripts executable:

```sh
chmod +x ~/.sdkman/candidates/tomcat/9.0.104/bin/*.sh
```

### 4.2 Start Tomcat Server

Start the Tomcat server:

```sh
~/.sdkman/candidates/tomcat/9.0.104/bin/startup.sh
```

Expected output:

```text
Using CATALINA_BASE:   /Users/c-johan.tique/.sdkman/candidates/tomcat/9.0.104
Using CATALINA_HOME:   /Users/c-johan.tique/.sdkman/candidates/tomcat/9.0.104
Using CATALINA_TMPDIR: /Users/c-johan.tique/.sdkman/candidates/tomcat/9.0.104/temp
Using JRE_HOME:        /Users/c-johan.tique/.sdkman/candidates/java/current
Using CLASSPATH:       /Users/c-johan.tique/.sdkman/candidates/tomcat/9.0.104/bin/bootstrap.jar:/Users/c-johan.tique/.sdkman/candidates/tomcat/9.0.104/bin/tomcat-juli.jar
Using CATALINA_OPTS:
Tomcat started.
```

### 4.3 Deploy Applications

Deploy the built WAR files to Tomcat:

```sh
cp uploader/target/uploader.war ~/.sdkman/candidates/tomcat/9.0.104/webapps/
cp webservice/target/axis.war ~/.sdkman/candidates/tomcat/9.0.104/webapps/
```

### 4.4 Server Management

#### Stop Tomcat Server

```sh
~/.sdkman/candidates/tomcat/9.0.104/bin/shutdown.sh
```

#### Monitor Logs

View real-time Tomcat logs:

```sh
# View latest logs (live)
tail -f ~/.sdkman/candidates/tomcat/9.0.104/logs/catalina.out

# View last 1000 lines with live updates
tail -1000f ~/.sdkman/candidates/tomcat/9.0.104/logs/catalina.out
```

#### Application-Specific Logs

Application logs are stored in `/var/log/tomcat/`:

```sh
cd /var/log/tomcat
ls -la
# Expected files: bookserve.log uploader.log
```

## 5. Verification and Testing

After completing the installation:

1. **Verify Tomcat is running:** Navigate to `http://localhost:8080` in your browser
1. **Check application deployment:** Verify that `uploader.war` and `axis.war` are deployed
1. **Test database connection:** Ensure the application can connect to the PostgreSQL database
1. **Review logs:** Check application logs for any errors or warnings

## 6. Troubleshooting

### Common Issues

- **Java Version Mismatch:** Ensure `mvn -v` shows Java 8, not Java 21
- **Port Conflicts:** Check if port 8080 is already in use
- **Database Connection:** Verify the `bookserve-db` container is running
- **WAR File Deployment:** Ensure WAR files are copied to the correct webapps directory

### Useful Commands

```sh
# Check Java version
java -version

# Check running containers
podman ps

# Check Tomcat process
ps aux | grep tomcat

# Check port usage
lsof -i :8080
```

---

## Additional Notes

- This guide is specifically designed for macOS with Apple Silicon (M3 chip)
- The `local/mac/pdx` branch contains Mac-specific configurations
- Database files should be kept secure and not committed to version control
- Always test changes in a development environment before production deployment
