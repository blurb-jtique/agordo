Below are some clarifying questions that would help in crafting a modernization plan (moving from Ruby 1.9.3/Rails 2 to Ruby 2.7.8/Rails 5) while simultaneously ensuring your Java microservices are fully tested in a local environment and improving your slow pipelines. If you can provide answers (or partial guidance) on these points, we'll be able to outline a much more targeted roadmap.

1. Current Codebase and Test Coverage
	1.	Current Tests & Coverage
	•	Do you have a reliable test suite (RSpec, Test::Unit, Cucumber, etc.) that covers the majority of functionality, or is coverage incomplete?
  ANSWER: yes, it is reliable, but very slow... it covers both unit, functional and system tests
	•	Are there any known fragile or “untestable” areas of the app that might complicate the upgrade?
  ANSWER: not sure, I would say no, but it is possible to find some in the future
	2.	Feature Toggle or Branching Strategy
	•	Are you open to using feature flags or branching to progressively introduce the Rails 5 code, or do you prefer an all-in-one code upgrade in a single branch?
  ANSWER: yes, that should be part of the proposal I need help with to build
	•	How do you typically manage partial upgrades or “hybrid” states of the code?
  ANSWER: that part is not managed right now since the codebase is too old it is been a while (more than) six years that upgrades do not happen
	3.	Database Schema & Migrations
	•	Are your migrations up-to-date, or is there legacy code with migrations that may not run cleanly on newer Rails versions?
  ANSWER: migrations are ok, but I need to review the consistency, I have found some issues when I tried to replicate the system from scratch
	•	Any known database quirks (e.g., old plugins for schema management, custom stored procedures) that might break on Rails 5?
  ANSWER: not really, but we will need to confirm

2. Local Environment Replication (with Java Microservices)
	4.	Local Dev Environment Setup
	•	Do the Java microservices also run in a local environment, or are they normally deployed on external VMs/containers?
  ANSWER: both in local and external environments
	•	Do you have Docker Compose or another tool to spin up a local copy of the Java microservices + the Ruby app + any supporting services (Redis, DB, etc.)?
  ANSWER: we are finishing that including all service dependencies and databases
	5.	Inter-Service Communication
	•	Do the Java services communicate with the Ruby monolith via REST/HTTP? Messaging queues? Something else?
  ANSWER: mainly HTTP/REST
	•	Are you able to mock or stub out the Java services if needed, or do you strictly need everything running end to end?
  ANSWER: yes I am able to do that
	6.	Performance Requirements
	•	Is the local environment purely for functional development/testing, or do you also plan to do performance tests locally?
  ANSWER: purely development, but in the mid-term future it could be used to run performance tests since we want to containerize the system on production
	•	How resource-intensive are these microservices in a local environment (CPU, memory usage, etc.)?
  ANSWER: not too much 20% usage of CPU, memory

3. Pipeline and Build Infrastructure
	7.	Current Pipeline Tools & Slowness
	•	What's your existing CI/CD setup (Jenkins, TeamCity, GitLab CI, etc.)?
  ANSWER: Jenkins - year 2018 version
	•	Where do you see the most slowdown (build steps, test execution, environment spin-up, artifact publishing)?
  ANSWER: dependencies caching, database setup and creation (it is repeated several times), assets compilation, parallel execution issues, test execution
	8.	Desired Pipeline Improvements
	•	Are you aiming for faster tests (e.g., parallelization, test splitting) or more stable builds (caching dependencies, container-based builds)?
  ANSWER: yes
	•	Do you have any constraints on the build environment (on-prem only, cloud-based CI, licensing, etc.)?
  ANSWER: not really
	9.	Artifact and Dependency Management
	•	How do you currently handle gem/bundle caching or JAR dependencies for the Java microservices?
  ANSWER: not sure
	•	Would adopting something like Docker builds help or does that conflict with your modernization-first approach?
  ANSWER: maybe but at beginning just for local enviroment

4. Upgrade Path: Ruby 1.9.3 & Rails 2 → Ruby 2.7.8 & Rails 5
	10.	Incremental vs. Jump Upgrade

	•	Do you want to do a multi-step upgrade (e.g., Rails 2 → 3 → 4 → 5) or skip directly to Rails 5 with some bridging gems (e.g., rails_upgrade, etc.)?
  ANSWER: incrementally upgrade
	•	Are you prepared to remove or replace legacy plugins that might not be compatible with Rails 5?
  ANSWER: yes

	11.	Gems & Plugin Audit

	•	Have you audited your Gemfile or plugin usage to see if all or most gems have Rails 5–compatible versions?
  ANSWER: I need to do that deeper
	•	Any known showstoppers (e.g., a critical plugin that's unmaintained and only supports Rails 2/3)?
  ANSWER: may be yes, and we will need to support those dependencies to getting them work with new Ruby/Rails conditions

	12.	App Architecture

	•	How monolithic is the Ruby codebase? Are there gemified internal engines or separate libraries that might simplify a staged approach?
  ANSWER: there is only a monolith
	•	Are there major monkey-patches or heavy metaprogramming that could break under modern Ruby (2.7) or Rails 5?
  ANSWER: not sure, maybe not, but I would have to review them

5. Organizational Constraints & Timeline
	13.	Business Deadlines or Seasonal Peaks

	•	Are there similar seasonal spikes or hard deadlines that force you to keep the existing app stable?
  ANSWER: they want to have that as soon as posible, but it should take what it needs to
	•	Do you need to maintain the old 1.9.3/Rails 2 environment in parallel for a certain period?
  ANSWER: yes until the new upgraded platform is working well

	14.	Team Experience

	•	Does your team have experience upgrading Rails across multiple major versions?
  ANSWER: the team is only one Ruby expert with full availability
	•	How comfortable are they with gem replacements, tackling deprecation warnings, etc.?
  ANSWER: he is very comfortable with those processes

	15.	Risk Tolerance

	•	Are you okay with partial downtime or rolling deploys during the upgrade, or must this be zero-downtime?
  ANSWER: it can be a canary release plus blue/green deployment
	•	If the upgrade runs longer than planned, do you have fallback plans?
  ANSWER: keep using the older platform

6. Additional Considerations
	16.	Deployment Targets

	•	Will the modernized Rails 5 app eventually be containerized, or do you plan to keep it on VMs until further notice?
  ANSWER: yes, it will be eventually containerized
	•	Are you planning to eventually move to cloud hosting or remain on-prem?
  ANSWER: remain on-prem

	17.	Security & Compliance

	•	Are there strict compliance requirements (PCI, HIPAA, etc.) that might require certain Ruby versions or patch levels?
  ANSWER: not really
	•	Do you have scanning tools (Snyk, Trivy, etc.) for vulnerabilities on the new stack?
  ANSWER: not really

	18.	Rollback Strategy for the Upgrade

	•	If you migrate certain modules or gem versions and something fails in production, do you have a plan to revert?
  ANSWER: we need to have a plan
	•	Will you do a parallel environment (blue-green) for the newly upgraded app?
  ANSWER: yes