Below is an **initial plan and roadmap** for **modernizing the Ruby 1.9.3/Rails 2 application** to **Ruby 3.1/Rails 7** (2-years away of the current modern versions but still stable and secure), while also **improving local development**, **optimizing the existing slow pipelines**, and **keeping Java microservices tested** in the environment. The plan is based on priorities, team constraints, and technical requirements (5 to 6-month plan - one person). It focuses on:

1. **Setting up a reproducible local environment** (Ruby monolith + Java microservices)
2. **Upgrading the CI/CD pipeline for faster builds**
3. **Incrementally upgrading Ruby/Rails** (Rails 2 → 3 → 4 → 5 → 6 → 7)
4. **Ensuring a safe rollback strategy** (blue-green/canary)

We'll cover **phases**, **major tasks**, and **approximate timelines**. We can refine laster these based on the refactor velocity and any newly discovered complexities.

# **High-Level Goals**

1. **Local Environment Consistency**
   - Fully replicate the old platform (Ruby monolith + Java microservices + DB + any caches) in a local environment (Docker Compose or equivalent).
   - Enable the team to run tests and do incremental Rails upgrades without relying on external VMs but locally.

2. **Pipeline Optimization**
   - Speed up test runs (caching, parallelization).
   - Reduce repeated overhead (DB setup, asset compilation, dependency installation).
   - Provide stable, consistent artifact management.
   - Provide a consistent way to release new changes (cherry-picking branch issue)

3. **Incremental Rails Upgrade**
   - Follow the path **Rails 2 → 3 → 4 → 5** to minimize breakage.
   - Use bridging gems/plugins and code modernization as needed.
   - Maintain or replace legacy gems that do not support Rails 5.

4. **Safe Deployment & Rollback**
   - Keep the old 1.9.3/Rails 2 system running in parallel for fallback.
   - Use blue-green or canary deployments to gradually introduce the upgraded application.

5. **Eventual Containerization**
   - Once upgraded, we plan to **containerize** the Rails 5 app and possibly do partial or full performance testing locally or on staging.
   - Remain on-prem but adopt container workflows for consistency.

# **Inventory, Assumptions and Concerns**

## **Inventory**
1. 250 DB models
2. 232 ruby dependencies to update
3. 576 endpoints
4. 532 compromised files in terms of critical Ruby 2.7 compatibility issues
5. A baseline of 2073 critical fixes to introduce in terms of critical Ruby 2.7 compatibility issues

## **Assumptions**
1. **Sufficient Test Coverage**
   - The existing test suite (unit, functional, system) is sufficiently robust to catch major regressions during incremental Rails upgrades.
   - Although tests are slow, they are reliable, and there are no large untestable areas that would block upgrades.

2. **Team Availability**
   - We have **one dedicated Ruby expert** with full availability to handle upgrades and gem/plugin replacements.
   - Other engineering (Java, DevOps, QA) can support the process, but the brunt of Ruby modernization tasks fall to this expert.

3. **Incremental Upgrade Path Is Viable**
   - The application can feasibly upgrade in steps: **Rails 2 → Rails 3 → Rails 4 → Rails 5 → Rails 6 → Rails 7**, without skipping major versions.
   - Bridging gems or community plugins (e.g., `rails_upgrade`) exist to smooth out migration between versions.

4. **Local Environment Can Be Replicated**
   - We can successfully containerize (or otherwise replicate) the old Ruby monolith plus Java microservices locally (e.g., Docker Compose).
   - Database migrations work end-to-end once any missing or inconsistent migrations are fixed.

5. **Pipeline Improvements Are Possible**
   - Jenkins can be updated (despite being from 2018) to handle caching, parallelization, and possibly Docker-based build stages.
   - There are no hard constraints preventing we from modifying the pipeline architecture (e.g., on-prem vs. cloud concerns).

6. **Legacy Gems/Plugins**
   - Most gems in the Gemfile either have updated versions compatible with Rails 3/4/5, or they can be replaced with alternatives.
   - Some showstoppers may appear (unmaintained plugins), but we are prepared to rewrite or replace them.

7. **Fallback / Parallel Environment**
   - The old environment (Ruby 1.9.3/Rails 2) **can remain running in parallel** to support rolling, blue-green, or canary releases without impacting users.
   - Downtime is not strictly zero, but we can handle minimal or canary-based cutovers.

8. **Incremental Deployment and Testing**
   - Each incremental upgrade (Rails 2→3, 3→4, 4→5, 5→6, 6→7) can be tested locally, then in a staging environment, before production rollout.
   - The organization is open to iterative merges or feature-flagged approaches rather than a single "big-bang" upgrade.

9. **Timeline Flexibility**
   - Although the business wants the upgrade "as soon as possible," we can allocate the necessary weeks/months to do it safely.
   - If unexpected complexities arise, we have a fallback: continue using the old Rails 2 environment longer while we stabilize the upgrade.

10. **Eventual Containerization**
   - After reaching Rails 7, the app will likely be containerized in production. This future container goal does not conflict with the modernization-first approach.

## **Possible Concerns**
1. **Undiscovered Legacy/Untested Areas**
   - Despite a strong test suite, there could be hidden, fragile code paths (especially given 6+ years without major upgrades).
   - If these areas surface late, it may delay one of the incremental upgrade steps.

2. **Gem/Plugin Incompatibilities**
   - Some critical gems or plugins may be **unmaintained** or pinned to older Rails versions.
   - Replacing them (or finding patches) can be time-consuming and potentially introduces new bugs or refactor needs.

3. **Single Ruby Expert Bottleneck**
   - Relying on a single, full-time Ruby expert can slow down progress if they get pulled into other priorities or if they encounter large-scale architectural issues.
   - Knowledge transfer may be limited if that person is unavailable.

4. **Slow/Fragile Pipeline**
   - Even with pipeline improvements (caching, parallel testing), the test suite could remain slow. This can prolong feedback loops and hamper quick iteration on the upgrade branches.
   - Parallel test strategies can sometimes introduce flakiness if tests share state unintentionally.

5. **Unknown Database Issues**
   - Minor DB quirks or missing migrations might cause unexpected breakage when upgrading ActiveRecord across major versions.
   - Inconsistencies may not show up until we attempt a full Rails 4 or Rails 5 migration.

6. **Timeline Slips Due to Complexity**
   - Each major Rails upgrade can reveal new deprecations, removed APIs, or gem conflicts.
   - If multiple showstoppers appear at once, the 4–6 week estimates per upgrade step might extend significantly.

7. **Inadequate Rollback Plans**
   - While we can do blue-green or canary deployments, if rollback steps aren't fully tested or documented, production incidents could lead to downtime or data inconsistencies.
   - Relying on quickly switching traffic back to the old system is only safe if we've thoroughly tested that scenario.

8. **Partial Containerization Confusion**
   - We want eventually to containerize the modernized app, but at first we might only do Docker Compose for local dev. If not well-documented, environment drift between local dev and future production containers might cause confusion.

9. **Underestimating Code Changes**
   - Significant differences from Rails 2 to 7 (e.g., strong parameters, new routing) might require rewriting large portions of controllers or domain logic.
   - Even the upgrade bridging gems can't automatically resolve all changes.

10. **Performance Regressions**
   - Upgrading Rails can introduce overhead if certain new features or abstractions aren't optimized.
   - If not tested, we could discover performance issues only after partial production rollout.

# **Proposed Phases**

## **Phase 0: Environment & Pipeline Preparation (Weeks 0–4)**

### 0.1. Local Environment Finalization
- **Docker Compose Setup**
  - Finalize Docker Compose (or a similar tool) that spins up:
    - The Ruby monolith (still at Rails 2, Ruby 1.9.3).
    - Java microservices (HTTP/REST).
    - River workflow
    - DB (PostgreSQL/MySQL?) and caches (Redis).
  - Ensure we are **mocking or stubbing** the Java services if they are not all necessary for certain tests.
  - Document how developers run and debug locally.

- **Check Migrations/DB Consistency**
  - Validate that migrations run cleanly when setting up a fresh local DB.
  - Fix any inconsistent or missing migrations so devs can replicate the environment from scratch.

### 0.2. Pipeline Audit & Quick Wins
- **Analyze Jenkins Jobs**
  - Identify the biggest time sinks: DB setup, asset compilation, dependency installation, test suite length.
  - Plan to implement **caching** (e.g., `bundle cache`, `Maven/Gradle cache` for Java) and **parallel test runs** if feasible.

- **Short-Term Fixes**
  - Introduce or update Docker-based build stages in Jenkins (optional for local env only if we want).
  - Turn on parallel test execution (RSpec's `--parallel`, or split by test files) if the test suite can handle it.

**Deliverables / Outcomes**
1. **Fully reproducible local dev environment** for Ruby + Java.
2. **List of pipeline improvements** (caching, parallel test, DB seeding approach).
3. **Verified DB migration stability** (able to spin up from scratch).
4. **New changes workflow** introduced and documented

## **Phase 1: Incremental Rails Upgrade Foundations (Weeks 4–8)**

### 1.1. Gem & Plugin Audit
- **Inventory Gems & Plugins**
  - Create a spreadsheet or structured doc listing all gems (including those pinned to old versions).
  - Check for known compatibility with Rails 3, 4, 5, 6, and 7.
  - Identify any showstoppers (unmaintained libraries) and plan replacements or code rewrites.

- **Branching / Feature Toggle Strategy**
  - Decide if we'll do this on a **long-running "upgrade" branch** or if we want feature toggles for partial upgrades.
  - Typically, a dedicated branch for each major Rails step (2 → 3, 3 → 4, 4 → 5, 5 → 6, 6 → 7) can work well.

### 1.2. Rails 3 Prep
- **Use bridging gems** (e.g., `rails_upgrade` or older community plugins) that help identify code changes needed to get from Rails 2 to Rails 3.
- **Remove or replace** obviously outdated code (e.g., old vendor/plugins that are not gemified).
- **Target a buildable "Rails 3–compatible" codebase** on the branch (though we might still be running in Rails 2 mode initially).

### 1.3. Pipeline Enhancements for Upgrade Testing
- **Separate "Upgrade Pipeline"**
  - We may want a dedicated Jenkins job that runs only the "upgrade branch" tests to isolate breakages.
  - Continue improving test speed: add caching for bundler, add parallelization.
  - Possibly skip asset compilation if we don't yet rely heavily on the Rails 3 asset pipeline (this might come into play more in Rails 4+).

**Deliverables / Outcomes**
1. **Clear gem upgrade plan** (which ones can be updated right away, which ones need rework).
2. **A dedicated upgrade branch** with partial changes for Rails 3.
3. **Improved Jenkins pipeline** that can handle repeated upgrade attempts quickly.

## **Phase 2: Rails 3 & 4 Migration, Local Testing (Weeks 8–14)**

### 2.1. Execute Rails 3 Upgrade
- **Update Code & Fix Deprecations**
  - Convert old code patterns, handle routing changes, ActiveRecord naming changes, and gem references.
  - Resolve any test failures that appear once the code is truly on Rails 3.
- **Test in Local + CI**
  - Use the newly improved local environment + Jenkins to run the full suite.
  - Confirm no major regressions in the Java microservices integration.

- **Stabilize & Merge**
  - Once stable, **merge** the Rails 3 upgrade into the main branch if we want to release it, or keep it in a separate environment if the next step is quick.

### 2.2. Move from Rails 3 → Rails 4
- **Repeat Gem/Deprecation Cleanup**
  - Rails 4 introduced changes to strong_parameters, the asset pipeline, and more.
  - Address gem updates again (some gems that worked on Rails 3 might break on 4).

- **Validate & Merge**
  - Run the full test suite (unit + functional + system tests).
  - Resolve any performance hits or memory leaks discovered during local runs.

### 2.3. Pipeline & Performance Checks
- **Performance Testing (Optional)**
  - At this stage, we might do a small load test locally (or in a staging environment) to see if the upgrade introduced performance issues.
- **Further Pipeline Speedups**
  - If test suites are still too slow, refine parallelization or selectively skip slow tests that aren't critical to every build.

**Deliverables / Outcomes**
1. **Rails 4–compatible codebase** running in local dev and CI.
2. **All known gem and plugin issues** for Rails 4 resolved or worked around.
3. **Stable pipeline** that can run these migration tests swiftly.

## **Phase 3: Rails 7 Final Upgrade & Blue-Green Pilot (Weeks 14–20)**

### 3.1. Rails 5, 6, 7 Code Changes
- **Main Code Adjustments**
  - Switch to Rails 5, 6, 7 features (ActiveStorage, ActionMailer or Secrets optional, but watch for changes in config).
  - Migrate away from any Rails 4–only syntax, fix more deprecations.
- **Gem Replacements**
  - If we discovered any final showstopper gems that only support up to Rails 4, now is the time to replace or remove them.

### 3.2. Complete Test & Integration with Java Services
- **System & Integration Tests**
  - Make sure the end-to-end flows (REST calls to Java microservices) still work under Rails 7.
  - Mock or stub out external calls to ensure no random network dependencies slow the tests.

- **Pre-Production Validation**
  - Possibly spin up a **staging environment** with the new Rails 7 app in parallel, ensuring DB migrations and compatibility are solid.

### 3.3. Blue-Green (or Canary) Deployment in Production
- **Roll Out the Upgraded Rails App**
  - Keep the old (Ruby 1.9.3/Rails 2) environment as "green," and the new Rails 7 environment as "blue."
  - Route a small percentage of traffic to Rails 5, watch logs, performance metrics, error rates.

- **Rollback / DR Plans**
  - If something fails, revert traffic to the old environment.
  - Document any discovered bugs, fix them, and redeploy until stable.

**Deliverables / Outcomes**
1. **Rails 7 in production** receiving real traffic (blue environment).
2. **Tested rollback plan** (keep the old platform live for a set period).
3. **Confidence** that the app meets or surpasses performance and functionality on the new version.

## **Phase 4: Post-Upgrade Refinements & Containerization Readiness (Weeks 20+)**

### 4.1. Clean Up Legacy Code & Finalize Gems
- **Remove Old Shims**
  - If we used bridging gems or temporary monkey patches, remove them once stable.
  - Clean up any leftover "Rails 2/3" code that's no longer needed.

- **Finalize App Structure**
  - Consider reorganizing the monolith if we want smaller engines/gems internally.
  - Ensure code is consistent with modern Rails conventions.

### 4.2. Pipeline & Infrastructure Next Steps
- **Containerization**
  - Now that we're on Rails 7 + Ruby 3.1, build Docker images for the app.
  - Test them locally (Docker Compose) with Java microservices, then eventually in staging/prod.
- **Security / Vulnerability Checks**
  - If we plan to adopt scanning tools (Snyk, Trivy, etc.), integrate them now to maintain good security hygiene.

### 4.3. Performance & Future Upgrades
- **Monitor Peak Seasons**
  - Confirm the upgraded app handles production load as well or better than before.
- **Plan Next Ruby Upgrade**
  - Ruby 3.1 is nearing EOL. Consider planning for Ruby 3.3 if we want to stay current.

**Deliverables / Outcomes**
1. **Fully modernized Rails 7 app** with minimal legacy baggage.
2. **Dockerized** local version ready for on-prem container orchestration (if desired).
3. **Well-documented pipeline** with caching, parallel tests, stable DR procedures.

# **Rough Timeline**

- **Phase 0 (Weeks 0–4)**:
  - Finalize local environment (Docker Compose), quick pipeline fixes, DB migration cleanup.
- **Phase 1 (Weeks 4–8)**:
  - Gem/Plugin Audit, partial code cleanup, set up Rails 3 bridging.
- **Phase 2 (Weeks 8–14)**:
  - Upgrade to Rails 3, stabilize, then Rails 4, stabilize. Local + CI pipeline improvements.
- **Phase 3 (Weeks 14–22)**:
  - Upgrading incrementally to final Rails 7, staging tests, blue-green deploy in production, rollback readiness.
- **Phase 4 (22+ Weeks)**:
  - Post-upgrade cleanup, containerization, performance checks, plan for future Ruby upgrades.

*(This timeline can flex based on the actual size of the codebase, number of incompatible gems, and how many tests we need to fix. If the code is massive or has tricky plugins, each step might extend by a few weeks.)*

# **Additional Recommendations**

1. **Incremental Merges into Main**
   - If possible, merge the partial upgrades (Rails 3, then 4, 5, 6, then 7) into the main branch **sequentially**—each step is less risky than a single big jump.

2. **Parallel Environments**
   - Keep the old platform fully operational until we confirm the new environment is stable. This provides a fallback (rollback strategy) during each major Rails step.

3. **Pipeline Parallelization**
   - Invest time in **test parallelization** and **dependency caching**. This will pay off significantly given the test suite is large and slow.

4. **Communication & Planning**
   - Update stakeholders on each milestone (Rails 3 done, Rails 4 done, etc.). That way they understand the progressive nature of the upgrade.

5. **Document Everything**
   - Keep a running log of code changes, gem upgrades, monkey patches removed. Future maintenance to move to Rails 8 later will use this.

# **Conclusion**

This **modernization-first plan** focuses on upgrading the **Ruby 1.9.3/Rails 2** monolith to **Ruby 3.1/Rails 7** step by step, **improving local development** workflows, and **enhancing CI/CD pipelines** for speed and reliability. Throughout, we'll:

- Maintain backward compatibility or keep a safe fallback environment (blue-green/canary).
- Audit and replace legacy gems, ensuring minimal breakage.
- Prepare for **eventual containerization** once we're on a more modern Ruby/Rails stack.