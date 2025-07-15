# **Blurby Deployment Processes & Best Practices**
This document outlines key processes related to **Blurby’s deployment**, covering **branching strategies, coding conventions, debugging practices, and addressing code changes**.

---

## **Current Branches**
Blurby follows a **two-branch model** to manage its deployments.

| Service   | Staging/Master | Integration/Production |
|-----------|---------------|------------------------|
| Blurby    | `master`       | `production`           |
| Hemingway | `master`       | `production`           |
| API-Test  | `master`       | `master`               |
| Web-Test  | `master`       | `production`           |

### **Branching Rules**
- **Master:**
  - Acts as a **staging/sandbox** environment for feature development.
  - Used for **testing** before merging changes into production.
  - Can be used locally for debugging and validation.
- **Production:**
  - Contains **stable, deployable** code.
  - Only approved and tested features should be merged here.

### **PR Workflow**
1. Developer **creates a feature branch** from `master`.
2. Developer pushes the changes and **opens a PR to `master`**.
3. If the feature is **ready for release**, a **PR is opened from `master` to `production`**.
4. QA runs **final validation**, and if all tests pass, the release is **approved for deployment**.
5. The **Release Manager** triggers the **blurby-prod-PL pipeline** to push changes to production.

---

## **Conventions and Practices**
### **Commit Message Standards**
We follow **[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)** for structuring commit messages.

**Format:**
```sh
<type>: <short description>

[optional longer description]
```

**Examples:**
```sh
feat: add support for bulk checkout
fix: resolve timeout issue in payment service
refactor: improve error handling for API responses
chore: update dependencies
```

### **Code Review Guidelines**
Code review is a collaborative process where developers examine each other's code to ensure quality, find potential bugs, maintain coding standards, and address security vulnerabilities.  This practice helps identify issues early, promotes knowledge sharing, and improves code maintainability.  Always leverage automated checks like linters and static analysis improving or adding some rules if they are missing.  The integration of AI-powered code review assistants is also growing, automating routine checks, detecting code smells, and suggesting improvements for a more efficient and less labor-intensive process.

Before merging PRs, the following should be checked, plese see deatiled information here https://blurb-books.atlassian.net/wiki/spaces/SE/pages/3700490277/Code+Review+Process:
- **Does the code align with business requirements?**
- **Are there any breaking changes?**
- **Is the code well-structured, readable, and maintainable?**
- **Have all tests passed?**
- **Is documentation updated (if applicable)?**

Use **peer reviews** and **automated linting tools** to enforce standards.

### **Best Practices for Legacy Rails 2 & Java Services**
- Use **Ruby 1.9.3 & Rails 2** for Blurby, ensuring compatibility.
- **Avoid modifying existing monolithic structures** unless necessary.
- Prefer **service-oriented approaches** when integrating new functionality.
- **Minimize database schema changes** unless explicitly required.

---

## **Addressing Code**
### **Modifying & Debugging Code in Local Environment**
#### **Using Master as a Sandbox**
- **Master can be used for isolated testing.**
- If a specific change needs to be tested, **deploy to master and validate**.
- Use `cap utm deploy` (Capistrano) to **automate deployments** if needed.

#### **Cherry-picking Commits**
- Sometimes, a fix in your local feature branch needs to be applied to master.
- Instead of merging the entire branch, use **git cherry-pick**:
  ```sh
  git checkout master
  git cherry-pick <commit-hash>
  ```

#### **Overriding Job Results for Deployment**
- Sometimes, tests block deployment due to **flaky tests**.
- Use the **blurby-PL-job-result-override** to manually trigger deployment:
  🔗 [Job Result Override](http://jenkins-pdx.blurb.com/view/all/job/blurby-PL-job-result-override/)

---

## **Debugging**
### **Debugging Locally with Pry**
- Use **pry** to debug Ruby code:
  ```ruby
  require 'pry'
  binding.pry
  ```

### **Connecting to SSH**
- Debugging Blurby services via SSH:
  ```sh
  ssh utm-focal-blurby
  ```
- For **integration hosts**, a **jump host** may be required.

### **Investigating Local Deployment Issues**
- If a deployment fails:
  1. **Manually inspect the environment**:
     ```sh
     ssh utm-focal-blurby
     cd /code/blurby
     tail -f logs/production.log
     ```
  2. **Check River (Workflow Broker) Logs**:
     ```sh
     podman logs -f river
     ```
  3. **Restart Services If Needed**:
     ```sh
     systemctl restart blurby
     ```

### **Debugging Local Java Microservices**
- Blurby relies on Java microservices running in **Podman**.
- To inspect a running service:
  ```sh
  podman ps
  podman logs -f <container-id>
  ```
- Restart a specific service:
  ```sh
  podman restart <service-name>
  ```

## **Testing**

you can run the tests using the predefined blurb_test in the UTM machine, and you can run the test using a remote console and Rspec `RAILS_ENV=test bundle exec spec spec/path/to/spec/file_spec.rb`

to run integration tests, you need to install the Ruby version 2.4.5 in your local machine, to do that you need to do some tricks

Ruby 2.4.5 (and similar older releases) is not fully compatible with the newer libffi on Apple Silicon. A common workaround is to tell the compiler to ignore the implicit function declaration error. You can do this by passing an extra C flag during installation.

```bash
RUBY_CFLAGS="-Wno-error=implicit-function-declaration" rbenv install 2.4.5
```

### Steps to Follow

1. **Ensure Dependencies Are Installed**

   Make sure you have Homebrew’s dependencies installed:

   ```bash
   brew install openssl readline libyaml gmp libffi
   ```

   If necessary, export the proper flags so that the Ruby build can find these libraries:

   ```bash
   export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
   export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
   ```

2. **Install Ruby with the Custom Flag**

   Now run the install command with the extra flag:

   ```bash
   RUBY_CFLAGS="-Wno-error=implicit-function-declaration" rbenv install 2.4.5
   ```

3. **Verify Installation**

   Once installed, you can set Ruby 2.4.5 as your local version with:

   ```bash
   rbenv local 2.4.5
   ```

   And check with:

   ```bash
   ruby -v
   ```

This approach tells the compiler not to treat the missing `ffi_prep_closure` declaration as an error, allowing Ruby 2.4.5 to build on your M1/M2/M3 Mac.

On the other hand, for this version of Ruby and this M3 chips it is neccesary to tweak Nokogiri, Nokogiri 1.8.5 was released before Apple Silicon became common, and its packaged libxml2/libxslt can run into build issues with newer compilers and on ARM. A common workaround is to force Nokogiri to use the system libraries instead of its packaged copies.

Here’s what you can try:

1. **Install libxml2 and libxslt via Homebrew:**

   ```bash
   brew install libxml2 libxslt
   ```

2. **Set environment variables (if needed) so the compiler finds them:**

   ```bash
   export NOKOGIRI_USE_SYSTEM_LIBRARIES=true
   export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib -L/opt/homebrew/opt/libxslt/lib"
   export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include -I/opt/homebrew/opt/libxslt/include"
   ```

3. **Configure Bundler (or install the gem) to use system libraries:**

   ```bash
   bundle config build.nokogiri --use-system-libraries
   bundle install
   ```

   Or, if you prefer to install the gem directly:

   ```bash
   gem install nokogiri -v '1.8.5' -- --use-system-libraries
   ```

These steps should help Nokogiri build using your system’s libxml2 and libxslt, avoiding the compatibility issues with the packaged versions. If you still encounter errors, please check the generated `mkmf.log` for more details and ensure your Homebrew libraries are up-to-date.

## Installing api-test and web-test
After merging your changes to master or even production branches you can use locally the api-test and web-test repositories to execute integration tests manually from yout local machine, to do that clone the integration test repositories and `bundle install` each of them
```
git@github.com:blurb/api-test.git
github.com:blurb/web-test.git
```

After that you must download and replace in the web-test repo the chromedriver to support chrome headless browser and be able to run the tests in both staging and master, you could that from here https://googlechromelabs.github.io/chrome-for-testing/ make sure your computer is using the same version of chrome you downloaded driver is compatible with.

After having all installed and configured, you can run the tests locally

### API-TESTS
Here's an example of running a single test for shipping-service, written out in full:
> bundle exec rake test DOMAIN=pdx-master TEST_FILE=test/api/service/shipping_services/printer_admin_services_test.rb TEST_METHOD=test_get_all_possible_ship_methods_for_each_printer_inactive_printer_true GROUP=shipping_service
>> ... End of test run response:
>> 1 tests, 2 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
>> 100% passed

### WEB-TESTS
*Running a single test scenario, directly via rspec against a file:*
```
$ [env vars] bundle exec rspec [path/to/spec/file.rb]:[line-number]
$ [env vars] bundle exec rspec [path/to/spec/file.rb] -e '[scenario-name]'

$ DOMAIN=pdx-master BROWSER=firefox bundle exec rspec spec/features/status/foo_spec.rb:16
$ DOMAIN=pdx-master BROWSER=chrome bundle exec rspec spec/features/status/foo_spec.rb -e 'I will pass'
$ DOMAIN=pdx-master SELENIUM_GRID=true bundle exec rspec spec/features/status/foo_spec.rb -e 'As foo, I might fail'
```