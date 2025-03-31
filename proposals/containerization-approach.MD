# Containerization Approach

| Status        | In progress                                          |
:-------------- |:---------------------------------------------------- |
| **Author(s)** | johan.tique@blurb.com                                |
| **Updated**   | 2025-01-13                                           |
| **Version**   | 1.1.0                                                |

Suggested approach to planning the migration to containerized environments on Rocky 9 while keeping our Ruby 1.9.3/Rails 2 monolith, Java microservices, and database largely as they are today (i.e., a "lift-and-shift" strategy initially).

0. Questions and Assumptions
1. High-Level Strategy and Phases
2. Alternatives and Trade-Offs
3. Key Risks and Mitigations
4. Illustrative Roadmap (3–4 month window)

# 0. Questions and Assumptions

## Questions about current way-of-work and future
1. How are resources within the VMs allocated or managed, and are there any concerns regarding over-provisioning or under-provisioning?
2. Have performance SLAs or SLOs (Service-Level Objectives) been established?
3. What is the average time being spent when calls are made to the Java microservices (latency, throughput, etc.)?
4. How are environment variables, secrets, and config files currently being handled in the monolith?
5. Are any organizational preferences or existing expertise recognized for a specific container orchestrator (Kubernetes, Docker Swarm, ECS, Nomad)?
6. Is SSL/TLS termination required inside containers, or will an ingress/load balancer be utilized?
7. Will changes in log aggregation or metrics scraping be required upon migrating to containers?
8. How much downtime or disruption can be tolerated by the organization during migration?
9. Has a cost model comparison been conducted between the current VM-based setup and the proposed container environment (in terms of hardware usage, hosting, storage, etc.)?
10. Have resources (budget, personnel) been allocated for the migration and subsequent maintenance?
11. Has a robust rollback strategy been prepared in case the containerized environment encounters issues?
12. How will backups and DR be handled in containerized environments?

## Assumptions
- Policies and strategies are defined for managing environment variables, secrets, and configuration files in containerized deployments.
- Databases are excluded from the initial migration scope.
- The plan uses Docker on bare-metal Rocky 9 x86_64 hosts.
- Existing firewall, networking, and identity policies are straightforward to manage, posing no critical migration blockers.
- A network architecture is already defined for existing platforms, covering services that handle routing and security layers.
- Monitoring, logging, tracing, and alerting methods can be reused with only minimal adjustments.
- The DevOps team is experienced with container technologies and can support at least partially both implementation and ongoing maintenance.
- Ample budget and hardware exist to replicate staging and production for a blue-green deployment approach.
- External systems (internal enterprise systems, external services, APIs) are container-friendly
- Ruby and Java services will be containerizaed in parallel
- External APIs or services (Braintree, Shippers, Amazon, etc) will not require major network/firewall adjustments
- A formal change management process will be defined requiring CAB (Change Advisory Board) approvals for production

## Concerns or possible risks
- Libraries and shared logic among multiple services may complicate the containerization process.
- External or internal systems may not adapt well to container packaging, especially older APIs or enterprise tools.
- Certain runtime dependencies could conflict within container boundaries.
- Managing large files and local writes could require specific storage solutions.
- Network security and ingress configurations must be carefully updated.
- Build and release workflows may demand additional container-specific steps.
- Ensuring zero downtime requires a robust rollback and failover plan.
- Missing container scanning tools can leave vulnerabilities undetected.
- Limited load or stress testing risks hiding performance bottlenecks.
- Without real traffic simulations, production-like issues might go unnoticed.
- Container overhead can cause unforeseen performance impacts.
- Short-term container efforts could overshadow critical refactoring and maintenance needs.
- Moderate uncertainty exists as migrations often reveal hidden complexity.

# 1. High-Level Strategy and Phases
We want minimal disruption ("barely no downtime") and currently have older technology (Ruby 1.9.3, Rails 2, specialized libraries), so the best near-term path is a phased lift-and-shift into containers, with blue-green or canary deployments to mitigate risk. Over time, we can refactor or upgrade components once containerized.

## PHASE 0: PREPARATION AND DISCOVERY
### 0.1. Team Onboarding & Ramp-Up
1. Introduce New Engineers to the Codebase
  - Conduct walk-through sessions of the old Ruby monolith and Java microservices.
  - Provide architecture diagrams, runbooks, and any existing container blueprints (even if outdated).
2. Review Legacy Container Blueprints
  - Gather the 4-year-old Dockerfiles or container scripts for both Ruby and Java.
  - Note known issues (networking problems, outdated base images) that were never resolved.
  - Decide which parts of these blueprints can be reused vs. rewritten.
3. Clarify Roles & Responsibilities
- Determine a primary point of contact for Ruby issues/decisions and for Java microservices.
- Assign tasks within the DevOps team (focuses on CI/CD, networking, etc.).
- Confirm how much availability each person really has for this project.

**Output/Deliverables:**
  - Updated onboarding documentation and codebase.
  - A short list of "lessons learned" from the old container attempt (4 years ago).
  - Defined points of contact for each service and for overarching DevOps tasks.

### 0.2. Container Base Image & Dependency Analysis
1. Inventory Dependencies
  - List all key Ruby gems, versions, and native libraries (ImageMagick, encryption libs, etc.).
  - For Java microservices, gather JDK version, frameworks (Spring Boot?), and third-party libraries.
2. Evaluate Suitable Base Images
  - Consider official Ruby or distro-based images that can handle Ruby 1.9.3, Rails 2.
  - For Java, pick a current but stable JDK base image that's known to work with the code.
  - Confirm library compatibility or note potential "gotchas." Confirm native libraries (image manipulation, encryption) can compile in the container environment.
3. Draft Preliminary Dockerfiles
  - Define Dockerfile for dev vs. production, outline those differences.
  - Ensure the Dockerfiles reference the correct base images and install all required system libs.
  - Flag any areas that may need refactoring (outdated gem or plugin with no updated repository).
  - Build a Docker image that runs on a base OS image compatible with Ruby 1.9.3 and Rails 2.
  - Ensure that the container has any necessary packages (ImageMagick, specialized libs).

**Output/Deliverables:**
- Dependency matrix (Ruby, Java, OS-level packages).
- Initial or revised Dockerfiles for Ruby and Java, even if not fully tested yet.

### 0.3. CI/CD Pipeline Approach
1. Decide on Jenkins vs. TeamCity (or Hybrid)
  - Conduct a short feasibility check: how much effort is required to modernize Jenkins with Docker build stages?
  - Evaluate licensing or resource implications for TeamCity if we choose to pilot it.
2. Define Container Build & Versioning Strategy
  - Decide how we'll tag Docker images (serviceName:1.0.0, :commitHash, :branchName).
  - Agree on how images will be versioned for dev, staging, and production.
  - If scanning is desired, identify the scanning tool (Trivy, Anchore, or Docker Hub's built-in scanning).
3. Draft CI/CD Pipeline Changes
  - Outline steps: mimic and improve steps defined on existing Jenkins stages incluing additional security gates.

**Output/Deliverables:**
- "CI/CD Pipeline" requirements doc or flowchart.
- Decision on whether to start with Jenkins or attempt an early switch to TeamCity.
- Container image versioning guidelines.

### 0.4. Networking & Security Discovery
1. Identify On-Prem Network Architecture
  - Document VLANs, DMZs, or subnets relevant to the old platform.
  - Clarify firewall change processes and required approvals (security team, network admins).
  - Evaluate existing load balancer solutions (F5, Nginx, etc.).
2. Plan for Blue-Green / Canary Setup
  - Decide if we'll use a reverse proxy, a hardware load balancer, or an in-container solution (NGINX, Envoy) for routing.
  - Draft a minimal design for how traffic will shift to the "blue" (new) environment, while "green" (old VMs) remains active.
3. Check External Integrations
  - List external APIs (Braintree, Amazon, shipping providers, Ingram) that might need IP whitelists or firewall updates.
  - Confirm if SSL certificates or internal CAs need reconfiguration for container traffic.

**Output/Deliverables:**
- Updated network diagram showing how the container environment will integrate.
- List of firewall rules or LB changes needed.
- Timeline/approval process for making network changes.

### 0.5. Scheduling & Resource Alignment
1. Define High-Level Migration Milestones
  - Outline the four phases (Phase 1: Dev/Test, Phase 2: Staging, Phase 3: Prod Pilot, Phase 4: Full Rollout) with approximate dates.
  - Incorporate known seasonal peaks (first one is 3 months away, plus the others more after).
  - Set realistic expectations for when we might have a stable container environment ready.
2. Align with Business & Other Teams
  - Present the plan to leadership, explaining the constraints (DevOps availability, network complexity, need for DR testing).
  - Get agreement on a "go/no-go" checkpoint if 3 months becomes infeasible for full containerization (fallback to partial rollout or remain on VMs for that next peak).
3. Draft Contingency Plans
  - If the containerization isn't ready by the first agreed seasonal peak, define how the old environment will handle the load (scale up additional VMs).

**Output/Deliverables:**
- High-level timeline/milestones document shared with stakeholders.
- Preliminary "Plan B" if containerization can't meet the agreed seasonal peak deadline.
- Sign-off from leadership on the approach and fallback strategies.

### 0.6. Preliminary Risk Assessment & DR Planning
1. Finalize Risk List & Matrix
  - Confirm the main risks: timeline constraints, network unknowns, legacy Ruby issues, limited DevOps capacity, etc.
  - Assign preliminary owners or mitigations ('Network Engineer X to handle firewall changes by date Y").
2. High-Level Disaster Recovery Strategy
  - Outline how we'll do a rollback from containers to VMs if the container environment fails in production.
  - Decide if we need a formal 'fire drill" in staging or a limited production DR test.
  - Note any DR-related tooling we might need (backup solutions, scripts, environment replication).

Output/Deliverables:
- Updated risk assessment matrix with assigned owners for mitigation.
- A short DR strategy doc specifying rollback steps (at least conceptually).

### Acceptance Criteria
1.	An Aligned Team: New Ruby/Java experts onboarded, DevOps responsibilities defined.
2.	Draft Container Blueprints: Basic Dockerfiles (or improvements to old ones) for Ruby & Java services.
3.	CI/CD Decision: Choice (Jenkins vs. TeamCity) and initial pipeline workflow design for container builds.
4.	Network/Firewall Clarifications: A plan to handle load balancers, firewall changes, external API routing.
5.	Preliminary Timeline: High-level milestone plan, acknowledging potential seasonal constraints and fallback options.
6.	Risk & DR Overview: A living risk register and a conceptual rollback/DR approach.

## PHASE 1: DEV & TEST ENVIRONMENT CONTAINERIZATION

### 1.1. Container Image Implementation & Refinement
1. **Refine Dockerfiles**
  - Incorporate any changes discovered in Phase 0 (base image updates, library installs).  
  - Ensure the Dockerfiles for both Ruby (1.9.3 + Rails 2) and Java services are consistent with the org's best practices (file paths, environment variables, logging to stdout/stderr, etc.).
2. **Add Dev/Debug Tools**
  - For the Dev environment, add extra debug packages (debuggers, logging/trace tools) in the container images.  
  - Keep the production images lean, but build a separate Dev tag or Dev stage if needed.
3. **Implement Minor Refactors**
  - If we identified small/medium code changes needed for container compatibility (changing file path references, removing deprecated gem calls), do so here.  
  - Validate any updated gems or system libraries by running the application locally before containerizing.

**Output/Deliverables**
- Fully functional **Dockerfiles** (or minimal multi-stage builds) for Ruby monolith and each Java microservice.  
- Verified container images tagged (`:dev-latest`).

### 1.2. Dev/Test Environment Setup
1. **Local Container Orchestration**
  - Decide on Docker Compose or a lightweight orchestrator (Docker Swarm, Minikube) for the dev/QA environment.  
  - Configure it to spin up the Ruby monolith, all relevant Java microservices, plus any backing services needed (Redis, River, etc.) if we are going to replicate them in test.
2. **Environment Variables & Secrets**
  - Externalize configurations in `.env` files or a secrets manager, per best practices discovered in Phase 0.  
  - Verify that container instances can read these values properly at runtime (`DB_HOST`, `API_KEYS`).
3. **Volume & File Handling**
  - Implement the strategy for file writes (uploads, logs, caches). For dev/test, we might use local volumes or ephemeral storage.  
  - Confirm that large file workflows (if applicable) work end-to-end in dev (a simple test upload).
4. **Log Aggregation**
  - Ensure containers send logs to stdout/stderr or to the chosen logging driver so that DevOps can quickly debug issues.  
  - If using SumoLogic or another agent-based approach, install or configure that agent in the dev environment.

**Output/Deliverables**
- A **docker-compose.yml** (or equivalent) that launches all required containers in dev/test.  
- Documented approach for environment variables and secrets.  
- Confirmed file-handling in a dev/test scenario.

### 1.3. Initial CI/CD Pipeline Integration
1. **Automated Build & Test**
  - Address cherry-picking-based merging issue
  - Update the CI/CD tool (Jenkins or TeamCity) to build containers on commit or on merge to a dev branch.
  - Run automated tests (unit, integration) inside the container or shortly after building the image.  
2. **Versioning & Tagging**
  - Implement the container versioning strategy decided in Phase 0 (using Git commit hashes, semantic version tags, etc.).  
  - Push images to the **dev** repository or an internal registry (`hub.docker.com/blurbbooks/monolith:dev-<commitHash>`).
3. **Basic Security/Compliance Steps** (Optional but recommended)  
  - If we decided on a minimal scanning approach (Trivy), integrate a scan step to detect obvious vulnerabilities in base images or gems.  
  - Report any major CVEs early so the team can decide how to patch or mitigate.

**Output/Deliverables**
- CI/CD pipeline jobs that successfully build, tag, and push dev images.  
- Automated test results (pass/fail) visible in the CI/CD dashboard.  
- (Optional) Container vulnerability scan reports for dev images.

### 1.4. Functional Testing & Validation
1. **Automated Functional Tests**
  - Run Ruby monolith tests inside the container environment.  
  - For Java microservices, ensure JUnit/TestNG (or other) tests pass when using the new container-based setup.  
  - Validate external service calls by mocking or using sandbox/test credentials (Braintree, shipping, etc.).
2. **Manual QA**
  - Spin up the full dev environment, run the application in a browser or test client, and walk through key user flows (login, book creation, book upload, etc.).  
  - Document any configuration or code changes needed to fix container-specific issues.
3. **Integration with Shared Services**
  - Confirm included Redis, Bookserve, Portkey, or other microservices communicate properly over the container network.  
  - Verify external API stubs or test endpoints (Zendesk sandbox, shipping API sandbox, etc.) are reachable.

**Output/Deliverables**
- Functional test coverage report showing the monolith and microservices pass at a baseline level.  
- List of issues found and resolved during manual QA.  
- Confirmation that container networking is working for inter-service calls.

### 1.5. Initial Performance & Load Checks
1. **Lightweight Load/Stress Testing**
  - Use a simple tool (JMeter, Locust) with a subset of the most-hit endpoints identified in Phase 0.  
  - Target moderate concurrency (20–50 concurrent users) to see if container overhead or any misconfigurations cause bottlenecks.  
2. **Resource Utilization Monitoring**
  - Keep an eye on CPU, memory usage, container restarts, etc., in the dev environment.  
  - If necessary, adjust container resource limits (CPU shares, memory reservations) to ensure stable performance.
3. **Compare Response Times to VM Baseline**
  - Do a quick comparison with previous NewRelic or APM metrics from the VM-based dev/test environment.  
  - Identify anomalies or improvements in average response times, error rates, etc.

**Output/Deliverables**
- Basic performance test results in dev/test environment.  
- Container resource allocation recommendations (increase memory, limit CPU, etc.)  
- Preliminary confidence that container overhead is not significantly impacting performance.

### 1.6. Stabilization & Sign-Off for Phase 1
1. **Fix Critical Dev Bugs**
  - Resolve any must-fix issues discovered during functional or performance tests (container crashes, network timeouts, missing dependencies).  
  - Triage less-critical bugs for future phases (minor logging improvements).
2. **Document Findings & Differences**
  - Record any key differences between the VM and container environment (startup procedures, new environment variable requirements, etc.).  
  - Update runbooks or developer confluence pages so the rest of the engineering team knows how to spin up containers for local testing.
3. **Phase 1 Approval**
  - Ensure all relevant stakeholders (DevOps leads, QA, product owners) sign off that the container-based environment is sufficiently stable for staging.  
  - Confirm readiness to proceed with **Phase 2: Staging Rollout & Partial DR Testing**.

**Output/Deliverables**
- Phase 1 acceptance report (all dev/test containers validated, performance is acceptable).  
- List of known issues to address in Phase 2 or beyond.  
- Green light to move forward to staging deployment.

### Acceptance Criteria:
1. **Containerized Dev/Test Setup**: Both the Ruby monolith and Java microservices are running in containers in a lower environment, passing core functional tests.  
2. **Integrated CI/CD**: Automated builds, tests, and image pushes are working.  
3. **Basic Performance Validation**: No severe regressions compared to the old VM setup; container overhead is understood.  
4. **Prepared Roadmap to Staging**: A to-do list or backlog of minor fixes/improvements for Phase 2, where we'll deploy to a staging environment that closely mirrors production.

## PHASE 2: STAGING ROLLOUT & PARTIAL DR TESTING

### 2.1. Staging Environment Setup
1. **Provision Staging Infrastructure**
  - Ensure we have sufficient Rocky 9 (or chosen OS) hosts or VMs to run the container environment in staging.  
  - Verify that any orchestrator (Docker Swarm, Kubernetes, or a simple Docker Compose with multiple hosts) is configured similarly to how production will be.
2. **Mirror Production-Like Config**
  - **Network Topology**: Use subnets, DNS, firewall rules, and load balancers resembling the actual production setup as closely as possible.  
  - **Data & Services**: Point to a staging database (or a sanitized copy of production data) and staging instances of external services if available (Braintree sandbox, shipping API sandbox).  
  - **Secrets & Environment Variables**: Use staging-appropriate credentials, ensuring they're managed securely (Vault, or environment variables).
3. **Set Up Blue-Green or Canary Approach (Optional for Staging)**
  - replicate blue-green or canary strategy approach in staging:
    - **Blue-Green**: Two identical staging setups: "blue" is the new container environment, and "green" is the old VM or older container version.  
    - **Canary**: Route a small portion of test traffic to the "blue" environment to validate stability before going "all in."

**Output/Deliverables**
- A **staging environment** that mirrors production as closely as possible in terms of network, data, and deployment methods.  
- Staging credentials and secrets in place (securely managed).  
- If relevant, a "blue" staging environment ready for partial traffic.

### 2.2. Container Deployment in Staging
1. **Automated Build & Deploy**
  - Extend the CI/CD pipeline to support **staging builds** (triggered on merges to a "release" branch).  
  - Define how images are tagged (`:staging-<version>`) and automatically pushed to a container registry.  
  - Create or refine a deployment job (Jenkins, TeamCity, etc.) to pull and run the staging-tagged containers on the staging hosts.
2. **Network & Firewall Validation**
  - Work with network/security teams to open necessary ports or configure firewall rules for staging.  
  - Verify connectivity to external APIs (if needed) and confirm internal microservices can talk to each other across container boundaries.
3. **Logging & Monitoring Integration**
  - Configure logs in staging to flow to the same aggregator (SumoLogic, Splunk, ELK, etc.) used by production, ensuring the same formatting and log levels.  
  - Hook up performance and availability monitoring (NewRelic, CheckMk) so we can track staging metrics similarly to production.

**Output/Deliverables**
- A fully deployed containerized environment in staging, reachable by internal users/testers.  
- Confirmed network paths (firewall, load balancer) and stable logging/monitoring in staging.

### 2.3. Advanced Performance & Load Testing
1. **High-Volume Load Tests**
  - Use tools like **Locust, JMeter, Gatling** to generate traffic that mimics **peak seasonal loads** (3× normal, as mentioned previously).  
  - Test end-to-end functionality, including book creation, file uploads, PDF generation, distribution, taxes, payments, Java microservice calls, etc.
2. **Stress & Soak Tests**
  - Run longer "soak" tests (multiple hours or overnight) to identify memory leaks, CPU spikes, or container restarts under sustained load.  
  - Monitor container health, logs for errors, and performance metrics from the APM/monitoring tools.
3. **Resource Tuning**
  - Adjust container CPU/memory requests/limits based on test outcomes.  
  - Validate scaling strategies (manual or auto-scaling, if applicable). Even if we aren't automating scaling right now, we may want to confirm how quickly we can spin up more containers for surges.

**Output/Deliverables**
- Load test reports comparing container-based staging performance to historical benchmarks (VM-based or previous releases).  
- Documented resource tuning or scaling plan for production.  
- Confidence that the new environment can handle peak traffic without critical performance regressions.

### 2.4. Partial DR or Rollback Drill (Staging)
1. **Define DR Scenarios**
  - Identify one or two **likely failure modes** (container misconfiguration, network outage, database unreachability) to simulate in staging.  
  - Decide on the rollback or failover procedure: revert container images, switch traffic back to "green" environment, etc.
2. **Perform the DR Drill**
  - Intentionally break or isolate the "blue" container environment in staging (block network traffic, stop containers).  
  - Validate that we can quickly revert to either the old environment (if still running in staging) or the previous container version.  
  - Time how long the rollback/failover takes, note any manual steps that can be automated.
3. **Post-Drill Analysis**
  - Document any obstacles (DNS caching, firewall rules, config version mismatches) that slow or block rollback.  
  - Update runbooks or DR procedures.  
  - Decide if we need a more comprehensive DR test in staging (involving partial data restore or backup testing).

**Output/Deliverables**
- A tested **rollback or DR procedure** in staging with measured time to recovery.  
- Updated runbooks detailing the exact steps for future reference.  
- Identification of any required automation or changes to make DR faster or more reliable.

### 2.5. Security & Compliance Validation (Optional or As Required)
1. **Container Image Scanning**
  - Run scans on the staging-tagged images and address any severe CVEs.  
  - Update (whenever possible) base images or gem/Java library versions if critical vulnerabilities are found.
2. **Penetration or Vulnerability Testing**
  - If possible, test the container staging environment to identify misconfigurations or insecure endpoints.
  - Address issues discovered before going live in production.
3. **Policy Compliance Checks**
  - Ensure container logs and data are stored in ways that meet any internal security or regulatory policies (check sensitive information).  
  - Confirm that secrets (DB passwords, API keys) are not being exposed in logs or environment variables.

**Output/Deliverables**
- Container security report for the staging environment.  
- Remediation plan for any vulnerabilities found.

### 2.6. Stabilization & Sign-Off for Phase 2
1. **Fix Critical Bugs Discovered**
  - Address any showstoppers or high-severity performance/security issues found during load tests or the DR drill.  
  - Decide which lower-priority bugs can be deferred to Phase 3 or 4.
2. **Conduct Final Review**
  - Gather DevOps, QA, and relevant stakeholders to review staging test results, DR outcomes, and performance metrics.  
  - Ensure the environment meets key success criteria (response times, reliability, rollback readiness).
3. **Green Light for Production Pilot**
  - If staging is stable, schedule the Phase 3 production pilot.  
  - If major issues remain, plan additional sprints in staging before moving to production.

**Output/Deliverables**
- Phase 2 acceptance: sign-off from the team that staging meets performance, reliability, and partial DR requirements.  
- A backlog of improvements or fixes to complete before or during Phase 3.

### Acceptance Criteria
1. **Production-Like Staging**: A stable environment with near-production network topology, services, and load patterns.  
2. **Verified Performance**: Load/stress tests indicate the container environment can handle peak seasonal traffic, or needed scaling strategies are identified.  
3. **Partial DR/Rollback Tested**: We've conducted at least one rollback scenario or DR drill to confirm the feasibility of reverting quickly if containers fail.  
4. **Clear Path to Production**: Stakeholders and the DevOps team have confidence in moving on to **Phase 3: Production Pilot & Full DR Test**.

## PHASE 3: PRODUCTION PILOT & FULL DR TEST

### 3.1. Production Environment Readiness
1. **Provision or Configure Production Hosts**
  - Ensure we have enough Rocky 9 (or the chosen OS) nodes—or a Docker Swarm cluster—ready in production.  
  - Validate that these hosts match the specs and configurations tested in staging (CPU, memory, disk, firewall, OS patches, etc.).
2. **Secure Production Credentials & Secrets**
  - Ensure all production environment variables, API keys, certificates, and secrets are stored securely (Vault, AWS Secrets Manager, Kubernetes Secrets, etc.).  
  - Double-check that none of the staging/test credentials are accidentally used in production.
3. **Finalize Load Balancer & DNS Setup**
  - Confirm the **blue-green** or **canary** routing approach in production: 
    - **Blue-Green**: The "Blue" environment is the new container setup, while "Green" is the legacy VM-based environment.  
    - **Canary**: Route a small percentage (5–10%) of real traffic to the container environment initially.  
  - Update DNS or load balancer rules (F5, NGINX, etc.) to support seamless traffic shifts.

**Output/Deliverables**
- Production hosts configured identically (or very close) to staging.  
- All production secrets set up in a secure manner.  
- LB/DNS strategy documented for switching between old (VM-based) and new (container-based) environments.

### 3.2. Pilot Deployment & Controlled Traffic Shift
1. **Automated Production Deployment**
  - Extend the CI/CD pipeline to build/tag production images (`:prod-<version>`) and automatically push them to the registry.  
  - Create or refine a pipeline job that deploys these images to the production container hosts.
2. **Partial Traffic Routing (Canary or Blue-Green)**
  - Start with a small fraction of incoming requests hitting the new container environment—monitor performance and error rates.  
  - Gradually ramp up traffic (10% → 25% → 50% → 100%) if no issues arise.  
  - Keep the old VM environment active in parallel, ready for an immediate rollback if critical errors occur.
3. **Initial Production Monitoring**
  - Watch logs, metrics, and alerts in real time (SumoLogic, NewRelic, CheckMk, etc.).  
  - Verify that **key transactions** (book creation, distribution, file upload, shipping rates, etc.) perform as expected.  
  - Collect feedback from any internal or external pilot users if applicable.

**Output/Deliverables**
- Containerized services running in production, receiving a controlled percentage of live traffic.  
- Validation that the application continues to meet performance and functional requirements under real load.  
- Quick rollback path to the old environment in case of severe issues.

### 3.3. Full DR / Rollback Test in Production
1. **Coordinate a Scheduled DR Drill**
  - Pick a low-traffic maintenance window (or a time pre-approved by the business) to test a **real** failover or rollback scenario.  
  - Communicate to stakeholders (product owners, support teams) about potential brief disruptions.
2. **Simulate a Container Failure**
  - Force a significant issue in the container environment (stop containers, inject a fatal configuration error) to see how quickly we can restore service.  
  - Validate the "failback" to the old VM environment (if still active) or a previous container release (`:prod-<previousVersion>`).
3. **Measure Recovery Time**
  - Record how long it takes to detect the failure, initiate rollback/failover, and confirm stable operation post-rollback.  
  - Evaluate communication steps—who gets notified, how on-call engineers respond—and note any friction.
4. **Update & Refine DR Procedures**
  - If the drill uncovers gaps (manual steps, missing documentation, unexpected firewall blockers), document these.  
  - Propose automation or process changes for a smoother DR response next time.

**Output/Deliverables**
- Successful DR drill or rollback test in production (or lessons learned if partially successful).  
- Documented **time-to-recover** metrics, known bottlenecks, and recommended improvements.  
- Updated DR runbook for production.

### 3.4. Ongoing Monitoring & Performance Validation
1. **24/7 Monitoring & Alerting**
  - Confirm all critical alerts (CPU/memory usage, service availability, error rates) are set up for the container environment.  
  - Ensure alerts are routed to the correct on-call team members, with escalation paths in place.
2. **Key Metrics & APM**
  - Track request latency, throughput, error rates, and resource usage continuously.  
  - Compare real-world production container performance against the staging load tests and the legacy VM performance.  
  - Look for any anomalies that might indicate memory leaks, container restarts, or sudden slowdowns.
3. **Periodic Performance Tuning**
  - Adjust container CPU and memory limits or reconfigure concurrency settings (unicorn/puma for Ruby, thread pools for Java, etc.) based on observed production patterns.  
  - Revisit the auto-scaling or manual scaling approach if traffic increases or if we approach the first seasonal peak.

**Output/Deliverables**
- A robust observability setup for the new container environment in production.  
- Performance baseline metrics in production, with ongoing tuning as needed.  
- Confidence that the container environment scales effectively for seasonal peaks.

### 3.5. Stabilization & Final Acceptance
1. **Resolve Remaining Issues**
  - Address any P1 or P2 bugs identified during the pilot period, especially those that could affect the upcoming seasonal peaks.  
  - Defer low-priority enhancements or edge-case fixes if they do not impact critical paths.
2. **Executive/Stakeholder Sign-Off**
  - Present production performance metrics, DR drill results, and final cost/benefit observations to leadership.  
  - Confirm that the container environment meets or exceeds initial performance, security, and reliability goals.
3. **Retire or Scale Down Old VM Environment**
  - If the new container setup is fully stable, begin decommissioning or scaling down the old environment to reduce infrastructure costs.  
  - Coordinate with finance or platform teams for any licensing or support contract implications.

**Output/Deliverables**
- Signed-off, **fully containerized** production environment.  
- Plan for either retiring or repurposing the old VM environment.  
- Completed "Phase 3" milestone, ready to proceed to any final steps (Phase 4, if applicable—such as further optimization or microservice refactoring).

### Acceptance Criteria
1. **Live Production Containers**: The Ruby monolith and Java microservices are serving real user traffic in containers.  
2. **Successful DR Drill**: We've tested a significant container failure scenario in production, verified rollback or failover, and documented improvements.  
3. **Performance & Reliability Validation**: Real-time metrics confirm that container performance is acceptable (comparable or better than VMs), no critical regressions, and stable resource usage.  
4. **Approval to Decommission VMs** (Optional): Stakeholders and leadership agree to retire or scale down the old platform if the container environment is stable.

## PHASE 4: POST-GO-LIVE OPTIMIZATIONS & FUTURE PROOFING
### 4.1. Operational Hardening & Continuous Improvement
1. **Auto-Scaling / Capacity Planning**
  - If we haven't already, implement or refine container auto-scaling policies (Docker Swarm scaling, or manual triggers).  
  - Revisit resource allocations: tune CPU/memory requests/limits based on real production metrics.  
  - Document a strategy to handle the remaining seasonal peaks before sunset, ensuring minimal manual intervention.
2. **Log & Metric Enhancements**
  - Improve observability by adding custom application metrics, distributed tracing (OpenTelemetry), or better APM instrumentation.  
  - Fine-tune alert thresholds (error rates, latency spikes, container restarts) to reduce false positives and catch real issues earlier.
3. **Security & Compliance Automation**
  - Integrate **container vulnerability scanning** (Trivy, Anchore, or Prisma) into CI/CD pipelines for continuous monitoring.  
  - Set up automated patching workflows or scheduled rebuilds of base images to ensure we're not running outdated OS/library packages.  
  - If required, adopt a “policy-as-code” approach (e.g., Open Policy Agent) to enforce standards across the container environment.
4. **Disaster Recovery (DR) Automation**
  - Based on lessons learned from the Phase 3 DR drill, automate more rollback steps (scripts, pipelines).  
  - Test partial failover or zone-level DR if we have multiple data centers or cloud regions.  
  - Schedule regular DR tests (quarterly or semi-annually) to maintain readiness.

**Output/Deliverables**
- Enhanced operational playbook with auto-scaling, logging, and DR procedures.  
- Updated CI/CD pipelines with security and compliance checks.  
- Better-defined on-call alerts and escalation paths.

### 4.2. Monolith Refactoring & Modernization (Optional)
1. **Module Extraction or Microservices Evolution**
  - If the organization plans to break the Ruby monolith into smaller components (e.g., e-commerce, user auth, marketing), define a high-level plan.  
  - Identify high-impact modules that could be **extracted first** (like auth or file processing) to reduce monolith complexity.
2. **Ruby Upgrade Path**
  - Ruby 1.9.3 and Rails 2 are EOL. Evaluate moving to a more modern Ruby (2.7, 3.x) and Rails 5+ or 6+ if feasible.  
  - Scope the code changes, gem replacements, or test updates needed. If the new platform is 16–30 months away, a modest upgrade could improve security in the meantime.
3. **Incremental Code Cleanup**
  - Remove deprecated gems or outdated plugins that are now wrapped in the container environment.  
  - Consolidate duplicate logic, unify config files, and reduce tight coupling between the monolith and microservices, if that was a known issue.

**Output/Deliverables**
- A backlog or roadmap for gradually modernizing the monolith, or splitting off major modules.  
- Proof-of-concept (POC) for upgrading Ruby/gems if that provides security or performance benefits.

### 4.3. Aligning with the New Platform Development
1. **Interoperability / Coexistence Strategy**
  - The new platform's first MVP is 2+ months away, with expected full coverage in 18-24 months (mid-2026). Ensure that the **containerized old platform** can seamlessly coexist with the new platform during the transition.  
  - Define how data synchronization or shared components (like shared databases, message brokers) will be managed between old and new.
2. **Shared Infrastructure & Tooling**
  - If the new platform is also using containers, standardize on the same image registry, orchestration (Kubernetes, Swarm?), CI/CD best practices, and monitoring tools.  
  - Document any lessons learned from containerizing the old platform so the new platform team can avoid similar pitfalls.
3. **Sunset Planning**
  - In about 30 months, the old platform is expected to be retired. Ensure there's a straightforward path to **decommission** these container services once the new platform is fully operational.  
  - Keep track of any components (databases, caches, external integrations) that will remain in use vs. those to be retired.

**Output/Deliverables**
- Coordinated plan ensuring minimal conflicts between old and new platforms (network, data, etc.).  
- Consistent DevOps toolchain and best practices across both teams.  
- High-level timeline to retire the old platform containers when business requirements are met.

### 4.4. Financial & Efficiency Review
1. **Cost Analysis**
  - Compare on-prem container hosting costs (Rocky 9 nodes, VM licensing, hardware) to the prior VM-based approach.  
  - Identify potential savings from retiring old infrastructure or repurposing freed-up VMs.
2. **ROI on Containerization**
  - Measure deployment speed improvements (time to release, frequency of deploys).  
  - Evaluate whether containerization truly improved security posture (fewer vulnerabilities, quicker patch cycles) and faster recovery from incidents.
3. **Future Hosting Options**
  - If the new platform is partly on AWS or another cloud, revisit whether some or all of the old platform container workloads could also **migrate to cloud** for further cost or reliability benefits.  
  - Weigh the pros/cons of an on-prem vs. hybrid approach.

**Output/Deliverables**
- Report on cost and ROI outcomes of containerizing the old platform.  
- Recommendations for next steps (e.g., partial cloud migration, continuing on-prem, or further optimization).

### 4.5. Final Wrap-Up & Handoff
1. **Documentation & Knowledge Transfer**
  - Consolidate all container runbooks, DR procedures, CI/CD configs, and environment definitions into a central repository (Confluence, GitHub wiki, etc.).  
  - Train support staff or the next-level operations team to handle day-to-day container maintenance.
2. **Post-Mortem / Lessons Learned**
  - Conduct a retrospective with the DevOps team, developers, and stakeholders: what went well, what to improve next time.  
  - Document major risks encountered and how they were resolved or mitigated.
3. **Official Project Closure**
  - Present final metrics to executives: uptime, performance, successful DR tests, improvements in release frequency, etc.  
  - Transition ongoing maintenance to the operational team or continue with incremental improvements if the project remains open.

**Output/Deliverables**
- Comprehensive documentation set for the containerized old platform.  
- Handoff completed to support/maintenance teams or final wrap-up if the project has met its objectives.  
- Official sign-off acknowledging successful completion of the containerization initiative.

### Acceptance Criteria
1. **Fully Optimized Container Environment**: Auto-scaling, advanced observability, and security scanning all in place.  
2. **Clear Modernization Roadmap**: (Optional) A plan for partial or full refactoring of the Ruby monolith if needed, or a decision to keep it as-is until the new platform is ready.  
3. **Alignment with New Platform**: The containerized old platform coexists smoothly with the emerging new platform, and plans are in place for eventual sunset.  
4. **Organizational Learning**: Documented best practices, improved DevOps processes, and a more mature approach to containerization for future endeavors.

# 2. Alternatives and Trade-Offs (within containerization approach)
1. Big-Bang vs. Phased Approach
  - **A big-bang migration** (all services at once) would be faster from a purely technical perspective but carries higher risk. A phased approach (service-by-service) or monolith-first approach is safer, especially given older Ruby dependencies and unknown network quirks.
2. **Stick to Ruby 1.9.3 vs. Upgrade**
  - Pros: Less immediate code refactor, faster to containerize.
  - Cons: Security patches, gem compatibility, and EOL concerns. Long term, we'll want to upgrade or break out modules into more modern frameworks.
3. **Jenkins vs. TeamCity**
  - Pros of Jenkins modernization: no additional licensing, the team already knows it.
  - Pros of moving to TeamCity: possibly a cleaner pipeline, better Docker integration out of the box (depending on our usage).
  - Trade-Off: The migration timeline might extend if we do both containerization and new CI/CD at once. We could opt to modernize Jenkins first for Docker builds, then transition to TeamCity after production stabilizes.
4. **Local Volumes vs. Shared Storage vs. Object Storage**
  - If the monolith writes large files, local container volumes can complicate scaling and data consistency. A networked or object storage solution is usually more resilient. But it can add latency or cost if not carefully configured.

# 3. Key Risks and Mitigations
## 3.1. Assessment Risk Matrix Overview

Scale used:

- **Likelihood**: Rare (1), Unlikely (2), Possible (3), Likely (4), Almost Certain (5)  
- **Impact**: Insignificant (1), Minor (2), Moderate (3), Major (4), Catastrophic (5)

**Risk Score** = Likelihood × Impact

Suggested interpretation:

- **1–4** = Low  
- **5–9** = Medium  
- **10–14** = High (or Medium-High)  
- **15–19** = High  
- **20–25** = Critical  

Below is a **summary table**, followed by explanations of each risk category.

| **Risk Category**                            | **Likelihood** | **Impact**     | **Score** | **Priority**             |
|----------------------------------------------|----------------|----------------|-----------|--------------------------|
| **1. Legacy Ruby Stack & Compatibility**     | Likely (4)     | Major (4)      | 16        | High                     |
| **2. Large File Handling & Storage**         | Possible (3)   | Major (4)      | 12        | High (Medium‑High)       |
| **3. DB Connectivity & Networking**          | Likely (4)     | Major (4)      | 16        | High                     |
| **4. CI/CD & Release Management**            | Possible (3)   | Moderate (3)   | 9         | Medium                   |
| **5. Deployment & Downtime Constraints**     | Likely (4)     | Catastrophic (5) | 20      | Critical                 |
| **6. Performance Testing Gaps**              | Possible (3)   | Moderate (3)   | 9         | Medium                   |
| **7. Organizational & Timeline Constraints** | Likely (4)     | Major (4)      | 16        | High                     |
| **8. Security & Compliance Oversight**       | Possible (3)   | Major (4)      | 12        | High (Medium‑High)       |

## 3.2. Explanation of Changes and Current Mitigations
### 1. Legacy Ruby Stack & Compatibility
- **Score**: 16 (High)  
- **Rationale**:  
  - The **phased approach** (Phase 0 and Phase 1 especially) ensures early identification of gem or library incompatibilities, slightly reducing the likelihood of “unknown unknowns.”  
  - However, Ruby 1.9.3 and Rails 2 remain **end-of-life**, with no official security patches. That keeps **impact** and **likelihood** high overall.  
  - **Mitigation**: Thorough container testing in dev/staging, fallback to VMs if containerization fails.
### 2. Large File Handling & Storage
- **Score**: 12 (High/Medium‑High)  
- **Rationale**:  
  - The plan to use a **hybrid** storage approach (NFS, object storage, or ephemeral volumes) during containerization still poses complexity.  
  - By detailing this in **Phase 1** (dev/test) and **Phase 2** (staging) with advanced load tests, we reduce the risk of last-minute surprises.  
  - Still, improper configuration could cause **data loss** or **performance hits**, keeping it High.  
  - **Mitigation**: Early file-handling validation in Phase 1, plus advanced load/stress testing in Phase 2.
### 3. DB Connectivity & Networking
- **Score**: 16 (High)  
- **Rationale**:  
  - Network/firewall complexities remain a major unknown for on-prem setups.  
  - The new roadmap includes **staging environment** that mirrors production (Phase 2) and thorough **blue-green/canary** approaches (Phase 3). This lowers the chance of being blindsided in production.  
  - However, the risk is still High because any misconfiguration can bring the system down (Major impact).  
  - **Mitigation**: Early collaboration with network/security teams, partial DR/rollback drills in Phase 2.
### 4. CI/CD & Release Management
- **Score**: 9 (Medium)  
- **Rationale**:  
  - The detailed plan for **Phase 0** (picking Jenkins vs. TeamCity, versioning strategy) and **Phase 1** (integrating container builds, automated tests) significantly reduces both the probability of pipeline chaos and its impact. However the cherry-picking merging issue could give us problems.  
  - But because it doesn't directly threaten production uptime (errors are mostly caught pre-deployment), we can rate it as Medium now.  
  - **Mitigation**: Well-defined container build and test pipelines with scanning or linting to detect image issues early.
### 5. Deployment & Downtime Constraints
- **Score**: 20 (Critical)  
- **Rationale**:  
  - Despite the robust **blue-green** or **canary** plan, the business requires **near-zero downtime** and has multiple **seasonal peaks**.  
  - A failure in the production cutover (Phase 3) could lead to catastrophic downtime if rollback or DR procedures falter.  
  - The plan includes robust DR drills, but the **impact** of an outage remains catastrophic, so overall we keep this as Critical.  
  - **Mitigation**: Rehearsed rollback paths, parallel VM environment, repeated fire drills before peak seasons.
### 6. Performance Testing Gaps
- **Score**: 9 (Medium)  
- **Rationale**:  
  - Phase 2 and Phase 3 incorporate more thorough load/stress testing in a staging environment. This reduces the likelihood of undiscovered performance bottlenecks.  
  - However, a possible partial DevOps availability means some advanced or repeated testing might not happen if timelines slip.
  - **Mitigation**: Implementation of JMeter/Locust tests, continuous observation with NewRelic, and real-world canary traffic in Phase 3.
### 7. Organizational & Timeline Constraints
- **Score**: 16 (High)  
- **Rationale**:  
  - The updated 5-phase roadmap includes fallback plans (e.g., remain on VMs for first seasonal peak if containerization isn't ready). That lowers the catastrophic potential if deadlines slip.  
  - However, a possible partial DevOps availability still threatens timely completion. A delay can cause friction with business demands and the parallel new platform development.  
  - the plan includes incremental sign-offs (Phases 0–3) and fallback approaches.  
  - **Mitigation**: Realistic scheduling, partial parallelization, and clear escalation if the timeline starts slipping.
### 8. Security & Compliance Oversight
- **Score**: 12 (High/Medium‑High)  
- **Rationale**:  
  - Container scanning, updated DR procedures, and a dedicated plan for secrets management in Phase 0–2 reduce the probability of major security gaps.  
  - However, the old Ruby stack still harbors potential unpatched vulnerabilities. Overall Impact is still Major, but we mark Likelihood as Possible rather than Likely now that scanning and structured patching are on the plan.  
  - **Mitigation**: Ongoing scanning (Trivy/Anchore), secure secrets management, plus actively monitoring OS/package CVEs.

## 3.3. Updated Visual Risk Matrix
Below is a textual representation of the **5×5** matrix, with each risk category labeled by number. The row is **impact** and the column is **likelihood**:

```
                           LIKELIHOOD
                 Rare(1) Unlikely(2) Possible(3) Likely(4) Almost(5)
   ----------------------------------------------------------------
Catastrophic (5)|        |          |           |    5    |        |  
Major        (4)|        |          |2,8        |1,3,7    |        |
Moderate     (3)|        |          |4,6        |         |        |
Minor        (2)|        |          |           |         |        |
Insignificant(1)|        |          |           |         |        |
```

- **(5)**: Deployment & Downtime Constraints (score 20) – at (4×5) in the matrix  
- **(1,3,7)**: Legacy Ruby Stack (16), DB Connectivity (16), Org & Timeline (16) – all at (4×4)  
- **(2,8)**: Large File Handling (12), Security & Compliance (12) – at (3×4) or (4×3) depending on how we visualize the grid  
- **(4,6)**: CI/CD & Release (9), Perf Testing Gaps (9) – at (3×3)

## 3.4. Summary & Next Steps
- **Top Critical Risk**: 
  - **Deployment & Downtime Constraints (#5)** remains at **Critical (20)**, reflecting the catastrophic impact of an outage or failed production cutover.

- **High Risks (16 or 12)**:
  - **Legacy Ruby Stack (#1), DB Connectivity (#3), Organizational Constraints (#7), Large File Handling (#2), and Security (#8)** each remain high priority.  
  - The 5-phase plan **lowers** certain likelihoods (particularly organizational constraints, security gaps) but they still pose serious challenges if not carefully managed.

- **Medium Risks (9)**:
  - **CI/CD (#4) and Performance Testing Gaps (#6)** are Medium under the revised approach (phased dev/staging, robust pipeline planning).

### Mitigation Highlights in the Updated Plan
1. **Phased Rollouts** (Dev/Test → Staging → Production Pilot) reduce the chances of big-bang surprises.  
2. **Detailed DR Drills** in Phase 2 (staging) and Phase 3 (production pilot) address the critical nature of downtime.  
3. **Fallback to VMs** for the first seasonal peak if container readiness is delayed, mitigating catastrophic scenario.  
4. **Active Monitoring & Scanning** across phases ensures that security vulnerabilities are less likely to go unnoticed.

# 4. 5-Phase Roadmap
## **Overall Timeline Estimate**
- **Best case**: ~3–4 months (if most tasks go smoothly, low network complexity, strong DevOps focus).  
- **Likely range**: ~4–5 months given partial DevOps capacity, DR testing, multiple seasonal peaks, and the need for minimal downtime.  
- **Extended**: Up to 5–6 months if major refactoring is needed or if you choose to incorporate deeper modernization (Ruby upgrades, microservice extractions).

## **Phase 0: Pre-Work & Discovery (Weeks 1–2)**
- **Team Ramp-Up & Old Container Blueprint Review** [DONE]
  - Onboard new Ruby/Java experts; revisit outdated Dockerfiles or container scripts.  
  - Confirm roles/responsibilities (DevOps lead, Ruby guru, Java SME).
- **Container Base Image & Dependency Analysis**
  - Inventory all gems/plugins for Ruby 1.9.3/Rails 2, plus Java microservice dependencies.  
  - Draft new or updated Dockerfiles (list known library conflicts).
- **CI/CD Pipeline Decision**
  - Choose whether to modernize Jenkins or pilot TeamCity.  
  - Outline a tagging/versioning strategy for container images.
- **Networking & Security Discovery**
  - Identify on-prem architecture, firewall rules, load balancer approach.  
  - Plan for partial or full blue-green/canary deployments.
- **Scheduling & Resource Alignment**
  - Present a **high-level timeline** (Phases 1–4) to leadership.  
  - Clarify fallback plans if deadlines can’t be met (e.g., partial containerization or remain on VMs for first seasonal peak).

## **Phase 1: Dev/Test Containerization (Weeks 3–5)**
- **Implement & Refine Dockerfiles**
  - Incorporate any Phase 0 changes (base image choice, library installs).  
  - Minimal or moderate refactors if absolutely required for container compatibility.
- **Dev/Test Environment Setup**
  - Use Docker Compose or a lightweight orchestrator to run all services (Ruby + Java) in a QA environment.  
  - Externalize configs (env variables, secrets), confirm file-writing logic (logs, uploads) in containers.
- **CI/CD Pipeline Integration**
  - Update Jenkins/TeamCity to build container images on code commits, run unit/integration tests, push to a registry.  
  - Optionally integrate basic container scanning (Trivy, etc.).
- **Functional & Basic Performance Testing**
  - Validate the containerized environment with your existing test suites.  
  - Perform small load tests to check overhead or potential bottlenecks.

## **Phase 2: Staging Rollout & Partial DR Testing (Weeks 6–8)**
- **Staging Environment Setup**
  - Mirror production-like network topology, DB (sanitized data), and external service integrations.  
  - Configure load balancer/firewall rules to replicate production.
- **Deploy Containers to Staging**
  - Extend CI/CD to handle “staging” image tags (e.g., `:staging-<version>`).  
  - Verify end-to-end connectivity with external APIs, logging, and monitoring setups.
- **Advanced Load/Stress Testing**
  - Use JMeter, Locust, or Gatling to simulate peak seasonal traffic.  
  - Adjust container resource allocations (CPU/memory) as needed.
- **Partial DR / Rollback Drill**
  - Simulate an outage in staging to test rollback/failover steps.  
  - Document time-to-recover, manual vs. automated steps.

## **Phase 3: Production Pilot & Full DR Test (Weeks 9–12+)**
- **Production Environment Readiness**
  - Provision or configure Rocky 9 nodes (or K8s/Docker Swarm) in production.  
  - Secure production secrets (Vault, environment variables) and ensure load balancer/DNS routing is in place.
- **Pilot Deployment & Controlled Traffic Shift**
  - Deploy “Blue” container environment in parallel with “Green” legacy VMs.  
  - Gradually route live traffic (canary-style: 10% → 50% → 100%) if stable.
- **Comprehensive DR / Rollback Drill**
  - During a scheduled maintenance window, simulate a critical container failure in production.  
  - Verify rollback to old VMs or prior container release, measure recovery times, refine runbooks.
- **Ongoing Monitoring & Validation**
  - Use real-time logs and metrics (NewRelic, SumoLogic) to confirm stable performance, no unusual error spikes.  
  - Tweak container resource limits or scaling approach for upcoming seasonal peaks.

## **Phase 4: Post-Go-Live Optimizations & Future Proofing (Weeks 13+)**
- **Operational Hardening & Continuous Improvement**
  - Implement or refine auto-scaling, advanced observability (APM, distributed tracing), and container scanning in CI/CD.  
  - Schedule regular DR drills (quarterly or semi-annual).
- **Monolith Refactoring (Optional)**
  - If desired, plan incremental extraction of modules from the Ruby monolith or upgrade Ruby from 1.9.3 to a more modern version.  
  - Identify which parts of the codebase can be broken into new microservices.
- **Alignment with New Platform**
  - Share best practices (container registry, orchestration, CI/CD) with the team building the new platform.  
  - Ensure smooth coexistence or data sync until the old platform is fully sunset (up to ~30 months from now).
- **Financial/ROI Review**
  - Compare containerized costs vs. old VM environment.  
  - Measure improvements in release velocity, security posture, or DR readiness.

## **Illustrative Timeline Overview**

- **Weeks 1–2 (Month 1)**
  - **Phase 0**: Discovery, team ramp-up, initial Dockerfiles, early CI/CD decisions.

- **Weeks 3–5 (Month 1-2)**
  - **Phase 1**: Dev/QA containerization, functional tests, minimal load testing.

- **Weeks 6–8 (Month 2+)**
  - **Phase 2**: Staging rollout, advanced performance/load tests, partial DR drill.

- **Weeks 9–12 (Month 3+)**
  - **Phase 3**: Production pilot (canary or blue-green), full DR/rollback test.

- **Weeks 13+ (Month 4 and beyond)**
  - **Phase 4**: Post-go-live optimizations (auto-scaling, deeper refactors, alignment with new platform).

> **Note**: If complexities arise (network hurdles, major refactors, extended DR testing), phases can slip by 2–3 weeks each, pushing the total closer to 6 months or more.

## **Key Success Factors**

1. **DevOps Focus & Resource Availability**
   - Ensure the DevOps team is shielded from non-critical tasks during crucial migration steps.
2. **Network/Firewall Alignment**
   - Early collaboration with security/network teams to avoid lengthy approval cycles in the middle of a phase.
3. **Detailed DR & Rollback Plans**
   - Prioritize repeated “fire drills” in staging before going live.  
   - Keep the old VM environment running until fully confident in containers.
4. **Incremental, Phased Approach**
   - Deploy in parallel (blue-green/canary) to reduce downtime risk.  
   - Validate each phase thoroughly before moving on.
5. **Alignment with Future Platform**
   - Continuously share containerization lessons learned with the new platform team.  
   - Avoid duplicating infrastructure or making contradictory design decisions.

# Final Thoughts
This **5-phase roadmap** provides a **structured, low-risk path** to containerizing your legacy Ruby 1.9.3/Rails 2 monolith and associated Java microservices. It balances:

- **Short-term business needs** (zero downtime, upcoming seasonal peaks).  
- **Longer-term improvements** (security, DR readiness, partial refactoring).  
- **Organizational realities** (partial DevOps availability, ongoing new platform development).  