# WoW Proposal
Given the **sustainability-focused nature** of this project and the **complexity of the legacy system** (with technical debt, modernization tasks, and evolving business goals), different **agile methodologies** can be considered depending on the priorities and team dynamics.

---

### **1. Scrum: Best for Structured, Iterative Development**
**When to Use:**  
- If the team works on **time-boxed iterations (sprints)** with a need for regular delivery increments.  
- If there is **clear stakeholder involvement** (e.g., product owner, Scrum master, team).  
- If the roadmap has significant **unknowns or dependencies** that require frequent reprioritization.  

**Fit for This Project:**  
- **Pros:**  
  - Scrum ceremonies (e.g., sprint planning, retrospectives) are great for breaking down **large tasks** like containerization, security fixes, or database cleanup into manageable iterations.  
  - Regular sprint reviews would ensure frequent **stakeholder feedback** (e.g., validating security or fraud fixes with product owners or compliance).  
- **Challenges:**  
  - Scrum might be too rigid if tasks are unpredictable, especially when dealing with technical spikes or troubleshooting.

---

### **2. Kanban: Best for Continuous Flow of Work**
**When to Use:**  
- If the team handles **variable work priorities** (e.g., fraud handling, ad-hoc environment fixes).  
- If there's a need to continuously monitor **work-in-progress (WIP)** and focus on **throughput** rather than time-boxed delivery.

**Fit for This Project:**  
- **Pros:**  
  - **Flexibility:** Ideal for **sustaining engineering** projects where unexpected issues (e.g., DevOps bottlenecks or fraud spikes) arise frequently.  
  - **Visualization:** A Kanban board (with lanes like "To Do," "In Progress," "QA," "Done") is perfect for managing multiple **small, independent tasks** (e.g., fraud fixes, legacy patches).  
  - No time-boxing, so engineers can work through tasks at their own pace while focusing on priority.  
- **Challenges:**  
  - May lack structured ceremonies (e.g., retrospectives) unless explicitly added.  

---

### **3. Scrumban: Best for a Hybrid Approach**
**When to Use:**  
- If the team needs **flexibility of Kanban** but also **structured Scrum-like planning** and retrospectives.  
- If the work is a mix of **planned tasks** (e.g., containerization backlog) and **interrupt-driven tasks** (e.g., fraud prevention, environment issues).  

**Fit for This Project:**  
- **Pros:**  
  - Allows **time-boxed planning** for major roadmap goals (e.g., containerizing Java services in 3 months).  
  - Keeps **Kanban flexibility** for urgent, interrupt-driven tasks like DevOps security updates or fraud handling.  
  - **Work-in-progress limits (WIP)** can balance team load while enabling parallel streams of work (e.g., Java vs. Ruby priorities).  
- **Challenges:**  
  - Requires discipline in balancing **flow vs. iteration planning**, which can get chaotic without strong leadership.

---

### **4. Extreme Programming (XP): Best for Technical Complexity**
**When to Use:**  
- If the project involves **highly technical goals** (e.g., upgrading outdated stacks, containerization, improving legacy testing coverage).  
- If the team thrives on **engineering best practices** (e.g., pair programming, test-driven development).  

**Fit for This Project:**  
- **Pros:**  
  - Focus on **technical quality** (e.g., test coverage for legacy code, refactoring tasks).  
  - Encourages **rapid feedback loops** and small iterations.  
  - Collaboration methods (e.g., pair programming) can accelerate tasks like understanding legacy systems or debugging containerization.  
- **Challenges:**  
  - Heavy reliance on engineering discipline, which may not suit teams unfamiliar with XP practices.  
  - Not as process-driven for long-term planning or business alignment.

---

### **5. Lean Software Development: Focus on Eliminating Waste**
**When to Use:**  
- If the team’s priority is **efficiency** and reducing **waste** (e.g., redundant processes, unnecessary backlogs).  
- If the team handles tasks with **changing priorities** and a need for continuous improvement.  

**Fit for This Project:**  
- **Pros:**  
  - Works well for reducing inefficiencies, such as handling **legacy dependencies**, modernizing slow pipelines, or fixing unnecessary WIP.  
  - Encourages **collaboration** across SMEs (e.g., DevOps, security, product).  
- **Challenges:**  
  - Not as structured for long-term, complex projects unless paired with Kanban or Scrum.

---

### **6. A Hybrid Approach: Combining Kanban + Scrum + Lean Principles**
For **sustaining engineering projects like this one**, the best approach is often **tailored to the team’s needs** and may combine multiple methodologies:

1. **Adopt Kanban for Day-to-Day Task Management**:  
   - Use a **Kanban board** to track bug fixes, fraud detection tasks, and DevOps updates.  
   - Focus on **limiting WIP** to prevent task overload.  

2. **Incorporate Scrum for Larger Planned Goals**:  
   - Use **sprints** (2-4 weeks) to organize **planned initiatives** like containerization, database cleanup, or fraud prevention updates.  
   - Include **structured retrospectives** to identify inefficiencies.  

3. **Lean Principles for Prioritization**:  
   - Focus on **high-value tasks** (e.g., containerization vs. patching, immediate fraud fixes).  
   - Regularly review backlogs for items that can be removed or postponed.  

4. **Integrate Peer Practices for Technical Quality**:  
   - For challenging legacy tasks, incorporate **pair programming**, **test-driven development (TDD)**, or **frequent code reviews**.

---

### **Final Recommendation**
For this sustainability project, **Scrumban with Lean influences** is likely the best fit:  

1. **Scrumban:** Allows the flexibility of Kanban to handle dynamic, interrupt-driven tasks, while leveraging Scrum ceremonies (planning, retrospectives) for larger roadmap goals.  
2. **Lean Influence:** Helps the team focus on **delivering value** by eliminating unnecessary tasks (e.g., low-priority tech debt vs. critical fraud fixes).  

**Why It Works:**  
- Matches the **hybrid nature** of sustaining engineering projects where tasks range from structured modernization efforts (containerization) to ad-hoc firefighting (fraud prevention, patching).  
- Balances **technical focus** with business priorities, ensuring that urgent and planned tasks both get addressed.  
- Flexible enough to evolve as you onboard the team further and refine the roadmap.

# Ceremonies

Below are the **core Scrum ceremonies** (or “events”) that you could **incorporate** into your sustaining engineering / hybrid methodology. Even if you’re **not** adopting *pure* Scrum, each of these offers **value** for iterative, incremental work:

---

## 1. **Daily Standup (Daily Scrum)**
- **What It Is**: A quick (usually ≤ 15 minutes) team sync each day. Everyone shares:
  1. *What they did since last standup*,  
  2. *What they plan to do today*,  
  3. *Any blockers or impediments*.
- **Benefit**:  
  - Promotes **short feedback loops**, ensuring the team stays aligned, especially on sustaining tasks that might pop up unexpectedly (e.g., urgent fraud fix).
  - Quickly addresses **dependencies** or requests for help (e.g., if the containerization pilot blocks on certain credentials).

---

## 2. **Sprint Planning**
- **What It Is**: A meeting at the *start* of each iteration (e.g., every 2 weeks) to determine **which backlog items** the team will complete in the coming sprint.
- **Benefit**:  
  - Provides **commitment** or forecast for the next iteration, balancing unplanned interrupts (like ad-hoc security tasks) with planned modernization (like containerization).
  - Encourages **prioritization** discussions with product owners or business stakeholders.

---

## 3. **Sprint Review**
- **What It Is**: A meeting at the *end* of each sprint to **demo completed work** and gather **stakeholder feedback**.
- **Benefit**:  
  - Ensures you **validate** changes (e.g., partial containerization of a Java service) with relevant SMEs or users.
  - Identifies if newly discovered tasks (like emergent security concerns) should be added to the backlog.

---

## 4. **Sprint Retrospective**
- **What It Is**: An **internal** team reflection after each sprint, discussing **what went well**, **what went wrong**, and **what to improve**.
- **Benefit**:  
  - **Continuous improvement**: Possibly refine processes (e.g., if daily standups are too long, or if the containerization approach needs better testing).
  - Catches friction points early (like environment setup, test coverage, or unexpected production incidents).

---

## 5. **Backlog Refinement (Grooming)**
- **What It Is**: An ongoing or recurring session (often 1–2 times per sprint) where the team **clarifies** upcoming backlog items, splits them if needed, and **updates priorities**.
- **Benefit**:  
  - Aligns on **requirements** and estimates, especially crucial if your tasks range from quick security fixes to larger “epic” containerization work.
  - Prevents the backlog from getting **cluttered** with stale or ambiguous tickets.

  Below is a **generic “Definition of Ready” (DoR) template** tailored to **sustaining engineering (maintenance) work**—often involving **legacy code**, **technical debt**, and **ongoing operational tasks**. This template ensures that each **backlog item** or **user story** is sufficiently prepared before the team begins work, minimizing ambiguities and interruptions.

---

# Templates

## **Definition of Ready (DoR) Template**

### **1. Clear Problem Statement or Goal**
- **Description**: The backlog item explicitly states **why** it’s needed:
  - Is it **fixing a defect** in the legacy code?
  - Is it **resolving** a security vulnerability or compliance risk?
  - Is it **enhancing** an existing workflow or containerizing a service?

**Example**: “We need to patch the out-of-date library in Shipping Service to address a zero-day vulnerability.”

### **2. Business or Operational Impact Understood**
- **Criteria**:
  - The item **articulates** how it affects the product, customers, or ops team.
  - **Priority** is set based on **risk level** (e.g., fraud, performance, compliance).
  - Stakeholders (e.g., DevOps lead, product owner) confirm **urgency**.

**Example**: “Failure to patch this library could allow credit card fraud attempts or cause holiday downtime.”

### **3. Acceptance Criteria & Success Measures**
- **Criteria**:
  - At least **2–3 bullet** acceptance items describing “**done**” conditions:
    1. The patch is applied and passes smoke tests.
    2. No new blocking dependencies or errors introduced.
    3. Observability updated to verify no performance regressions.
  - If relevant, reference **test** coverage or environment checks.

**Example**: “We see no new error logs in Splunk after containerizing Payment Service; daily transactions remain stable.”

### **4. Dependencies & Environments Identified**
- **Criteria**:
  - **Dependencies** on other teams, microservices, or tools are stated and **resolved** if possible.
  - Which environment(s) (e.g., staging or an ephemeral test cluster) will be used for QA?
  - Confirm **access** to relevant repos, Jenkins pipelines, or Docker registries.

**Example**: “Requires updated shipping library from `repo.blurb.com`; staging environment must have Docker engine version X installed.”

### **5. Technical Details / Constraints**
- **Criteria**:
  - The item specifies **technical version** or library constraints (e.g., “Ruby 1.9, Tomcat 6, CentOS 7”).  
  - Clear **scope**: Are we only patching one library or refactoring a more extensive code path?

**Example**: “Upgrading from Java 8 to 11 in the Auth Service requires ephemeral test environment plus Docker Compose version 2.2.0+.”

### **6. Testing & QA Approach Confirmed**
- **Criteria**:
  - A plan exists for **functional tests**, regression checks, or container build validations.
  - If **automated tests** need updating, that’s accounted for in the story’s tasks.
  - **SME** (QA or Tim/Tyler) is aware if specialized testing is needed (e.g., concurrency or fraud flow tests).

**Example**: “QA will run end-to-end shipping quotes test suite on staging after patch. Container image must pass Travis CI’s integration tests.”

### **7. Estimate & Size Agreed**
- **Criteria**:
  - Team has **estimated** complexity or story points, with acceptance from the product owner or scrum master.
  - Large tasks are **split** into smaller ones if needed, ensuring feasible completion in one iteration or controlling WIP in Kanban.

**Example**: “Story is about a 5-point complexity; if it’s higher, we split out ‘refactor old gem’ vs. ‘test & deploy container build’ tasks.”

### **8. No Major Blockers**
- **Criteria**:
  - The team has **no open questions** requiring answers from security, BI, or product management.
  - **Credentials** and environment set-up are completed (no missing domain accounts or AWS tokens).
  - If partial, the item remains in “Backlog Refinement” until resolved.

**Example**: “We verified Braintree test keys are in Vault, the DevOps contact is available, and all libraries exist in the internal repo.”

### **9. Stakeholder Agreement**
- **Criteria**:
  - The story is **reviewed** by the relevant SME(s) (e.g., Dave for security, Michael for user flows).
  - Product owner or sustaining lead has **signed off** on the scope, acceptance, and priority.

**Example**: “Fraud manager acknowledges these acceptance criteria, DevOps confirms the environment is ready.”

---

### **How to Use This Template**
- **Attach** it as a **checklist** in your backlog tool (e.g., Jira, Azure DevOps).  
- Ensure **each item** meets the “ready” bar before pulling it into a sprint or Kanban column (“Ready for Dev”).  
- For sustaining engineering, you might keep tasks flexible, but verifying these points curtails random blockers.

---

Below is a **generic “Definition of Done” (DoD) template** tailored to **sustaining engineering projects**, where tasks might include **bug fixes**, **technical debt work** (like containerization), **database cleanups**, or **security patches**. This ensures that once a task is claimed to be “done,” it’s truly complete from both **technical** and **business** perspectives.

---

## **Definition of Done (DoD) Template**

### **1. Code Meets Project Standards**
- **Criteria**: 
  - Changes follow **naming conventions**, **coding guidelines**, or style guides.  
  - A **peer review** or code review from at least one team member is completed and any requested revisions are addressed.

**Example**: “One engineer merges the PR only after a second engineer from DevOps has approved code consistency.”

### **2. Passing Automated Tests & QA**
- **Criteria**:  
  - **All relevant tests** (unit, integration, or end-to-end) pass in the CI pipeline.  
  - **New or modified tests** (e.g., for container readiness or new security checks) are written if the feature or fix requires it.  
  - QA sign-off on acceptance criteria, especially for user-facing or critical systems.

**Example**: “Jenkins pipeline is green: 100% pass rate on shipping microservice test suite + no new regressions in the smoke tests.”

### **3. No Open Bugs or Known Regressions**
- **Criteria**:  
  - The item introduces **no known high/critical severity** issues.  
  - If new issues were discovered along the way, they have been either fixed or explicitly logged and prioritized separately.

**Example**: “No major user sign-up issues, no existing shipping breaks remain unresolved. If discovered, they’re documented in a new backlog ticket.”

### **4. Documentation & Knowledge Transfer**
- **Criteria**:  
  - Any **significant architectural or containerization** changes are documented (Confluence, README, or internal wiki).  
  - If it’s a **security fix**, note the update in a **changelog** or Slack channel for the security team.  
  - Ops or support staff understand how the fix or new feature changes runbooks or service behaviors.

**Example**: “The Payment microservice README includes the new Docker run instructions. Customer support has updated their knowledge base if relevant.”

### **5. Env & Configuration Updated**
- **Criteria**:  
  - If environment variables, config files, or container images changed, they are updated in **secrets management** (Vault, 1Password) or **pipeline definitions** (Jenkins/TeamCity).  
  - **Deployment scripts** for staging and production reflect the changes.  

**Example**: “We added `SHIPPING_API_KEY` to Vault, updated the pipeline to reference it, ensuring the environment is consistent across dev, staging, and prod.”

### **6. Tested in Appropriate Environments**
- **Criteria**:  
  - If it’s a containerization task, the new container builds and runs in at least a **staging** or ephemeral test environment.  
  - For a security fix, it’s validated in a scenario mimicking production data or usage.  
  - Performance checks or smoke tests pass under typical or peak load if relevant.

**Example**: “We validated the updated Auth service Docker image in a staging cluster, verifying memory usage and CPU overhead remain stable.”

### **7. Acceptance Criteria Met**
- **Criteria**:  
  - The item’s **original acceptance criteria** (from your backlog or Definition of Ready) are confirmed.  
  - Possibly re-demonstrate or re-review the final solution with the product owner or the sustaining engineering lead.

**Example**: “Distribution manager reviews the new container logging approach, verifying logs flow properly to Datadog with no errors.”

### **8. Merged/Deployed Without Deployment Issues**
- **Criteria**:  
  - Code merges to the **main branch** (or the relevant stable branch) with a **passing CI** pipeline.  
  - Deployment scripts or Docker images are published to the correct registry or environment.  
  - *If continuous deployment is used*, the changes are successfully running in production or the target environment.  

**Example**: “Container image v1.3.1 for Payment Service is pushed to ECR, production ECS tasks are updated, service is healthy with no rollback needed.”

### **9. Communication to Stakeholders**
- **Criteria**:  
  - (Optional but recommended) The team or lead engineer **announces** completion, especially if this addresses a previously known issue or if any downtime or user impact might have occurred.  
  - If relevant to the **fraud** or **compliance** teams, they are notified the fix is live.

**Example**: “We posted in Slack #devops: ‘Payment container patch is live in prod—monitoring logs for the next 24 hrs. Thank you, team!’”

---

## **Summary**
This **Definition of Ready (DoR)** template ensures **sustainability tasks**—be they containerization, patches, or security fixes—are well-defined. It includes **technical** constraints (legacy OS, microservice dependencies), **business** impacts (risk, fraud, performance), and **test** planning. Using these 8–9 bullet points, your team can quickly decide if a **sustaining engineering** story is ready for development.

A well-defined **Definition of Done** ensures each **sustaining engineering** task—from **OS patching** to **containerizing** a Java service—hits **technical completeness** (tests, docs, environment updated) and **operational acceptance** (no regressions, stakeholders aware). By matching these 9 bullet points, your team maintains **consistent quality** across new or legacy code fixes.

# Issue types
Below is a **generic scheme** for **Jira ticket classification** especially suited for a **sustaining engineering** (maintenance, modernization) context. These **issue types** and **categories** help capture **both day-to-day support tasks** and **larger modernization initiatives** (like containerization, security upgrades, or data cleanups).

---

## **1. High-Level Issue Types**

1. **Epic**  
   - **Purpose:** Large, overarching work item that may span multiple sprints or iterations (e.g., “Containerize Java Services,” “Migrate Database to a New Version”).  
   - **Usage:** Group multiple stories / tasks under a **bigger strategic goal**.  
   - **Example:** An epic titled “Containerization Initiative” might encompass “Dockerizing Payment Service,” “Updating the Pipeline for Shipping Service,” and “Adjusting QA tests for container environment.”

2. **Story** (or **User Story**)  
   - **Purpose:** A **functional requirement** from an end-user or business perspective (e.g., “As a DevOps Engineer, I want to run Payment Service in Docker so that security patches can be simpler”).  
   - **Usage:** Encourages **acceptance criteria** and user acceptance test definitions, bridging business needs and technical tasks.  
   - **Example:** “As a Security Officer, I want an email validation step so that fraudulent signups are minimized.”

3. **Task**  
   - **Purpose:** A **technical or operational** item that might not map directly to a user story.  
   - **Usage:** Use for **infra work**, **environment configuration**, or **chore-like** improvements.  
   - **Example:** “Update Jenkins pipeline to handle Docker build for Shipping microservice” or “Refactor River logging to new Splunk endpoint.”

4. **Bug**  
   - **Purpose:** An **error, defect, or broken functionality** discovered in production or staging.  
   - **Usage:** Distinguish from a story or task when existing functionality is **failing** or **not working as intended**.  
   - **Example:** “Shipping quotes fail for Canada addresses,” “Payment microservice returns 500 after 10 concurrency requests.”

5. **Spike** (Investigation / Research)  
   - **Purpose:** Time-boxed research to explore **unknowns** (feasibility of containerizing the Ruby monolith, new zero-day vulnerability, or new technology adoption).  
   - **Usage:** Typically, no direct user-facing deliverable, but yields **findings** that shape further tasks.  
   - **Example:** “Spike: Evaluate rewriting legacy PDF Processing in Docker,” “Spike: Investigate email blocking ML approach.”

6. **Improvement** (Optional)  
   - **Purpose:** Track a **minor enhancement** or tweak to existing code.  
   - **Usage:** Could also be replaced with “Story” or “Task,” but many teams like “Improvement” for small iterative upgrades.  
   - **Example:** “Improve indexing on user table to speed up sign-up validations.”

7. **Sub-Task**  
   - **Purpose:** A **granular step** or chunk of work under a parent story, task, or bug.  
   - **Usage:** Break down complex items into smaller ones for better ownership or parallelism.  
   - **Example:** Within a containerization story, you might have sub-tasks like “Create Dockerfile,” “Update Jenkins pipeline,” “Test container in staging,” etc.

---

## **2. Labeling or Components for Sustaining Engineering**

- **Labels**  
  - **“Security”**: For tasks addressing vulnerabilities, IP blocking, or fraud detection.  
  - **“Containerization”**: For tasks specifically about Docker, Kubernetes, or rocky upgrade.  
  - **“DBCleanup”** or **“DataQuality”**: For partial user database cleansing, spam/fraud account removal.  
  - **“CriticalBug”** or **“MajorDefect”**: Tag especially urgent or high-severity issues.  
  - **“OpsInfra”**: Tag environment config or pipeline changes that are mostly invisible to users but critical for stability.  

- **Components** (Optional JIRA Feature)  
  - **“RubyLegacy”**: For monolith code areas.  
  - **“JavaMicroservice”**: To group tasks or bugs by microservice (e.g. Payment, Shipping).  
  - **“Bookserve,” “Portkey,” “River,”** etc.: For their specific modules.

---

## **3. Priority & Severity**

- **Priority** (e.g., **Highest**, **High**, **Medium**, **Low**)  
  - **Highest**: Production down, critical security hole, major fraud or high business impact.  
  - **High**: Significant user impact or compliance risk, but not an immediate production outage.  
  - **Medium**: Typical backlog items or medium user annoyance.  
  - **Low**: Cosmetic issues, small enhancements, or “nice to have.”

- **Severity** (Optional Extra Field)  
  - Could be used for **bugs** only, e.g. **Blocker**, **Critical**, **Major**, **Minor**, **Trivial**.

---

## **4. Generic Workflow Example in JIRA**

1. **Epic**: “Containerize All Java Microservices”  
   1. **Story**: “Dockerize Payment Service”  
      - **Sub-task**: “Create Dockerfile & build in Jenkins”  
      - **Sub-task**: “QA end-to-end test in staging environment”  
   2. **Story**: “Dockerize Shipping Service”  
      - **Sub-task**: “Migrate environment variables to Vault”  
      - **Sub-task**: “Review performance logs in staging”  
   3. **Bug**: “Memory leaks after containerizing Payment Service”  
   4. **Spike**: “Investigate rocky base image performance impact”

2. **Epic**: “Spam & Fraud Cleanups”  
   1. **Story**: “Integrate IP-based email check in sign-up flow”  
   2. **Task**: “Remove 100k flagged user accounts from DB” (labeled **DBCleanup**)  
   3. **Bug**: “Sign-up blocking logic ignoring certain domain patterns”  
   4. **Spike**: “Explore ML model for suspicious email detection”

---

## **5. Summary**

**Ticket classification** in JIRA for **sustaining engineering** commonly includes:

1. **Issue Types**:  
   - Epics, Stories (or User Stories), Tasks, Bugs, Spikes, (optionally) Improvements and Sub-Tasks.  
2. **Labels or Components**:  
   - Tag by domain or special category (e.g., “Security,” “Containerization,” “DBCleanup”).  
3. **Priority** & (Optional) **Severity**:  
   - Distinguish urgent from routine tasks, ensuring high-impact issues get immediate attention.

This approach helps your team **organize** the day-to-day or backlog-driven tasks in **JIRA**—from **urgent bug fixes** to **strategic modernization** epics—while **maintaining** a coherent view of what's truly needed for your sustaining engineering project.