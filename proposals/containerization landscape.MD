# Answers
## Current Architecture and Workloads
1. Service Composition
	- Beyond Ruby and Java microservices, are there additional components (e.g., databases, cache servers, message queues)
	that the monolith depends on?
	ANSWER: Yes there are several components interacting with the Ruby and Java microservices, let me share you two PlantUML diagrams, the first one is the high level architecture, and the second one is the detailed data flow through components.

	High Level Architecture
	```plantuml
	@startuml
	skinparam rectangle {
		RoundCorner 25
	}

	' =======================
	' COMPONENTS / BOXES
	' =======================
	rectangle "Customer Tools\n(e.g. BookWright, iOS App, InDesign Plug-Ins)" as CT #LightYellow
	rectangle "Portkey\n(Media / Large File Upload)" as PK #LightYellow

	rectangle "Presentation Channel\n(Browser blurby.com & API)" as PC #LightGreen

	rectangle "Ruby Monolith\n(Core: E-commerce, User, Admin,\nMarketing, Content)" as CORE #LightCoral

	rectangle "Java Microservices Ecosystem\n(Shipping, Payment, Auth,\nOrder, Tax, etc.)" as JMS #LightBlue

	rectangle "Bookserve\n(Book creation,\nPDF generation,\nPrintTalk validator, etc.)" as BKS #LightBlue

	rectangle "River\n(Workflow / message broker)" as RIVER #LightBlue

	rectangle "Redis\n(Server & Cache)" as REDIS #LightGray
	rectangle "PostgreSQL 11\n" as DB #LightGray

	rectangle "Integration\n(Braintree/PayPal,\nShippers, Amazon,\nZendesk, etc.)" as INT #LightGray

	rectangle "Backoffice\n(Data Warehouse,\nHelpdesk, Analytics)" as BO #LightGray

	rectangle "Infrastructure\n(Rules, i18n,\nLogging, SSO,\nExceptions)" as INF #White

	' =======================
	' RELATIONSHIPS / LINES
	' =======================
	' 1) Customer Tools feed into Portkey for large files or go via Presentation channel
	CT --> PC : (Customer/Agent -> Browser/API)
	CT -[hidden]-> PK

	' 2) Presentation channel is front-end, leading into Ruby Monolith
	PC --> CORE : Core Logic

	' 3) Ruby monolith connects to DB, Bookserve, River, Integrations
	CORE --> DB
	CORE --> BKS
	CORE --> RIVER
	CORE --> INT : Payment, shipments, etc.

	' 4) Java Microservices also talk to DB, River, and integrations
	JMS --> DB
	JMS --> RIVER
	INT --> JMS : Payment & shipping microservices
	BKS --> JMS  : Possibly PDF Generator, etc.

	' 5) Bookserve also uses River
	BKS --> RIVER

	' 6) Portkey persists uploaded files or references in DB
	PK --> DB
	PK --> JMS

	' 7) River depends on Redis for queue/cache; Bookserve or Java Services might rely on them as well
	RIVER --> REDIS

	' 8) Backoffice / analytics ties to main DB
	BO --> DB

	' 9) Infrastructure is a shared foundation for all
	INF -[hidden]-> CORE
	INF -[hidden]-> JMS
	INF -[hidden]-> BKS
	INF -[hidden]-> RIVER

	@enduml
	```

	```plantuml
	@startuml

	skinparam rectangle {
		RoundCorner 25
	}
	skinparam component {
		BackgroundColor White
	}

	' =======================
	' GROUPING PACKAGES
	' =======================
	package "Presentation & Tools" <<Node>> #LightYellow {
		rectangle "Customer Tools\n(BookWright, iOS, InDesign,\netc.)" as Tools
		rectangle "Presentation Channel\n(blurby.com + API)" as Presentation
	}

	package "Ruby Monolith (Core)" <<Node>> #LightCoral {
		rectangle "E-Commerce" as Ecom
		rectangle "User" as User
		rectangle "Admin" as Admin
		rectangle "Marketing" as Mktg
		rectangle "Content" as Content
	}

	package "Java Microservices Ecosystem" <<Node>> #LightBlue {
		rectangle "Uploader Service" as UpSvc
		rectangle "PDF Proc Service" as PdfSvc
		rectangle "Shipping Service" as ShipSvc
		rectangle "Payment Service" as PaySvc
		rectangle "Order Service" as OrdSvc
		rectangle "Printer Service" as PrintSvc
		rectangle "Tax Service" as TaxSvc
		rectangle "Auth Service" as AuthSvc
		rectangle "Metrics Service" as MetSvc
	}

	rectangle "Bookserve\n(Book creation,\nPDF generator,\nPrintTalk validator,\nJava connectors)" as Bookserve #LightBlue
	rectangle "Portkey\n(Large file uploads,\naudio/video ingest,\nrules mgmt?)" as Portkey #LightYellow
	rectangle "River\n(Workflow & message broker)" as River #LightBlue
	rectangle "Redis\n(Server & Cache)" as Redis #LightGray
	rectangle "PostgreSQL\nv11" as Postgres #LightGray
	rectangle "Integration\n(Braintree, Shippers,\nAmazon, Zendesk,\netc.)" as Integration #LightGray
	rectangle "Backoffice\n(DW, Helpdesk,\nAnalytics)" as Backoffice #LightGray
	rectangle "Infrastructure\n(Rules, i18n,\nLogging, SSO,\nExceptions)" as Infra #White

	' =======================
	' CONNECTIONS (Numbered lines)
	' =======================

	' 1. Tools -> Presentation channel
	Tools --> Presentation : (1)User requests, front-end

	' 2. Presentation channel -> Ruby monolith
	Presentation --> Ecom : (2)Add to cart, checkout
	Presentation --> User : (3)Sign-in, user mgmt
	' ... Marketing, Content, Admin used similarly
	Presentation -[hidden]-> Mktg
	Presentation -[hidden]-> Content
	Presentation -[hidden]-> Admin

	' 3. Ruby core uses DB
	Ecom --> Postgres : (4)Store orders, items
	User --> Postgres : (5)Store user profiles

	' 4. Bookserve interactions
	Ecom --> Bookserve : (6)Initiate book creation
	Bookserve --> Postgres : (7)Save job references
	Bookserve --> River : (8)Queue tasks or events

	' 5. Java microservices connect to DB & River
	UpSvc --> Postgres : (9)Metadata storage
	PdfSvc --> River : (10)Retrieve tasks for PDF
	ShipSvc --> Integration : (11)Call shipping rates
	PaySvc --> Integration : (12)Braintree/PayPal
	OrdSvc --> Postgres : (13)Order details
	PrintSvc --> Bookserve : (14)Finalize printing
	TaxSvc --> Postgres : (15)Tax tables
	AuthSvc --> Postgres : (16)Auth tokens
	' Possibly: MetSvc --> ???

	' 6. Portkey connects to DB, Java, & River
	Portkey --> Postgres : (17)Store large-file references
	Portkey --> UpSvc : (18)Offload file handling
	Portkey --> River : (19)Notify processing steps

	' 7. River <-> Redis for queue/caching
	River --> Redis : (20)Enqueue job states
	Redis --> River : (21)Workflow updates

	' 8. Ruby monolith uses Java services
	Ecom --> PaySvc : (22)Payment handshake
	Content --> UpSvc : (23)File ingest or retrieval
	Ecom --> ShipSvc : (24)Shipping quotes

	' 9. Integrations used by both monolith & Java
	PaySvc --> Integration : (25)Payment gateway
	ShipSvc --> Integration : (26)FedEx, DHL
	Mktg --> Integration : (27)Amazon distribution
	Admin --> Integration : (28)Zendesk? or ?

	' 10. Backoffice & Data Warehouse
	Backoffice --> Postgres : (29)Analytics queries
	Backoffice <-- Admin : (30)Helpdesk synergy
	' Possibly more lines if needed

	' 11. Infrastructure is shared
	Infra -[hidden]-> Ecom
	Infra -[hidden]-> Bookserve
	Infra -[hidden]-> UpSvc
	Infra -[hidden]-> River
	Infra -[hidden]-> Portkey
	...

	@enduml
	```

	- Do you already have any internal APIs or libraries that share logic among these services?
	ANSWER: Services are intended to be logically autonomous, using different schemas of the DB, however with the information I have now I cannot know completely what is the logic sharing percentage and neither the cohesion/coupling internal design

2. Resource Usage and System Footprint
	- What are the average and peak CPU, memory, and I/O usage for each of the 35 instances?
	ANSWER: Let me update this answer later, but for now let's say: AVG peak CPU 60%, Memory: 70%, I/O usage: 1.5MB sec avg writes 

	- How do you manage or allocate resources within the VMs? Any over-provisioning or under-provisioning concerns?
	ANSWER: Not for now since the platform runs catalogs and configuration operations, and workers that are running in background and dynamically are in charged of heavy tasks

3. Performance Baseline
	- You mentioned average response time is ~280ms with 1200 requests/min for each web server. How does that vary under peak load?
	ANSWER: requests are three times bigger, but avg response time is almost the same 

	- Do you have established performance SLAs or SLOs (Service-Level Objectives)?
	ANSWER: not really

	- What is the average time spent calling out to the Java microservices (latency, throughput, etc.)?
	ANSWER: do not have that information

4. Scalability Patterns
	- Is auto-scaling being used currently on VMs?
	ANSWER: no, there is no auto-scaling, only the instances I mentioned

	- When you see load spikes, how quickly can you spin up new VMs or reconfigure?
	ANSWER: not sure


## Application Dependencies and Configuration
5. Runtime and Framework Requirements
	- Which Ruby version are you on, and are there any specialized libraries or system dependencies that might complicate containerization (e.g., native extensions, shared libraries)?
	ANSWER: Ruby 1.9.3 and Rails 2, specialized libraries for image manipulation and encryption

	- Are you able to isolate and containerize the Java microservices in a similar manner?
	ANSWER: yes it is possible

6. Configuration Management
	- How are environment variables, secrets, and config files handled today in the monolith?
	ANSWER: through configuration files, but I need to confirm to be 100% sure

	- Would these configurations need to be stored in something like HashiCorp Vault, AWS Parameter Store, or Kubernetes Secrets?
	ANSWER: not sure, may be using some AWS service as you said

7. Database and Persistent Storage
	- Do your Ruby services write any files to local disk that need to be persisted (uploads, logs, cache)?
	ANSWER: yes all of them (uploads, logs, cache)

	- Are your databases running on separate VMs/bare metal, or do they reside in the same environment?
	ANSWER: yes they are running on RHEL 7.7 independently, and they are running a Postgres 11 version


## Infrastructure and Platform Considerations
8. Container Platform Choice
	- Are you considering Docker on bare metal, Docker on VMs, or a Kubernetes-based platform (EKS, AKS, GKE, on-prem Kubernetes, etc.)?
	ANSWER: Docker on bare metal, the OS will be Rocky 9 x86_64

	- Are there organizational preferences or existing expertise for a specific container orchestrator (e.g., Kubernetes, ECS, Nomad)?
	ANSWER: I need to verify this

9. Hosting Environment
	- Will you remain on-premise using VMware or shift to a public cloud provider?
	ANSWER: for this migration, we will remain on-premise, however we can analyse other alternatives whenever they are good in terms of cost-benefit

	- Are there requirements around multi-cloud or hybrid cloud deployments?
	ANSWER: Some Java services are running on AWS and some blob storage are running on-premise

10. Network and Security
	- Does your environment have strict firewall rules, complex networking, or zero-trust policies that might affect container networking?
	ANSWER: we have some complicated networking rules that have been creating some problems so far

	- Do you need to handle SSL/TLS termination inside containers or use an ingress/load balancer?
	ANSWER: may be not, but I am not 100% sure

11. Existing CI/CD Pipelines
	- How do you currently build, test, and deploy the Ruby monolith and microservices?
	ANSWER: Jenkins but it is very inefficient and need a lot of tuning and refactor, if containerization is possible, we could migrate to TeamCity from Jetbrains

	- Will you need to refactor or rebuild your pipeline for container-based builds, push to a container registry, and orchestrate deployments?
	ANSWER: yes


## Operations and Monitoring
12. Monitoring and Logging
	- Which tools are you using for application performance monitoring (APM), logging, and metrics (e.g., Datadog, Prometheus, ELK stack)?
	ANSWER: Yes using Sumo, NewRelic, and CheckMk al of that well configured for RHEL-like environments

	- Will moving to containers require changes in how logs are aggregated or how metrics are scraped?
	ANSWER: maybe not, taht part is being consolidated using SumoLogic

13. Observability
	- Do you use distributed tracing today to observe interactions between the Ruby service and the Java microservices?
	ANSWER: yes mainly focused on NewRelic tools and instrumentation

	- Are there potential gaps in tracing or instrumentation you’d need to address when migrating to containers?
	ANSWER: Instrumentation could be improved but most important flows are being traced

14. Incident Response and On-Call
	- How are you alerted to performance or availability issues right now?
	ANSWER: NewRelic and CheckMk has automatic alerts in different channels of our team

	- Do you have processes in place for scaling out or rolling back in a container-based environment?
	ANSWER: not sure

## Organizational and Team Factors
15. Skill Set and Learning Curve
	- Do your teams have experience with container technologies, or is there a learning curve?
	ANSWER: we have experience

	- Is there sufficient DevOps or platform engineering support to manage container orchestration?
	ANSWER: yes, but we could analyse if there are enough engineers, for now devops team is made up of 4 Sr Engineers

16. Change Management
	- Are you prepared to refactor parts of the monolith if necessary (e.g., for 12-factor compliance)?
	ANSWER: Yes, but I would need a comprehensive roadmap

	- How much downtime or disruption can the organization tolerate during migration?
	ANSWER: barely nothing, interrumption should be minimal

17. Governance and Compliance
	- Are there industry or internal compliance requirements that dictate how container images are built, scanned, or stored?
	ANSWER: not really, for now aour images are stored on docker registry

	- Do you have a strategy for vulnerability scanning and patching container images?
	ANSWER: not sure, maybe not


## Cost and ROI Analysis
18. Licensing and Operational Costs
	- Will containerizing reduce or shift costs from VMware licensing to container orchestration, or from on-prem servers to cloud?
	ANSWER: maybe costs on VM machines but not sure, also for me it is unclear if for on-prem that could be beneficial

	- Is there a cost model comparison between the current VM-based setup and the proposed container environment (in terms of hardware usage, hosting, storage, etc.)?
	ANSWER: not sure

19. Potential Efficiency Gains
	- Do you expect to reduce idle resources by running containers vs. separate VMs?
	ANSWER: no, what we expect and it is the most important benefit is to add a robust security layers to wrap legacy and for now un-mantainable Ruby services 

	- Are there any environments (e.g., staging, dev) that will benefit from faster spin-up times in containers?
	ANSWER: Yes specially testing and staging

20. Timeline and Resource Allocation
	- What is the proposed timeline for migration, and how does it align with other business or product initiatives?
	ANSWER: that is the thing I need to provide with your help

	- Do you have resources (budget, personnel) dedicated to the migration and the subsequent maintenance?
	ANSWER: Yes that is the main idea, if not, we need to justify why other people would be necessary


## Migration Strategy and Risks
21. Migration Approach
	- Do you plan a “lift-and-shift” approach (containerizing the existing monolith without code changes) or a more incremental refactor to microservices?
	ANSWER: that is part of the approach I need to analyse, but maybe becuse of the security urgency, lift-and-shift is more convenient but with a future incremental refactor approach, but we need to analyse this

	- Will you run in parallel (blue-green deployment, canary release) to ensure minimal disruption?
	ANSWER: that is part of the approach, I need to provide those strategies. but blue-green and canary releases with feature flags could work well, however I need your help to see other options

22. Potential Bottlenecks or Constraints
	- Are there any external systems (internal enterprise systems, external services, APIs) that may not be easily container-friendly?
	ANSWER: the most difficult could be the large Ruby monolith service becuase it is too old

	- Are there runtime dependencies that conflict with container isolation?
	ANSWER: not sure yet, partially I would say no

23. Rollback and Disaster Recovery
	- Do you have a robust rollback strategy if the containerized environment faces issues?
	ANSWER: no, we do not have them

	- How do you plan to handle backups and DR in containerized environments?
	ANSWER: I do not have a plan, I would need to provide at least one plan

24. Performance Testing in Containers
	- Will you perform load/stress testing on containerized instances to ensure performance remains at or better than the current 280ms response time?
	ANSWER: That is the main idea, but I need to provide an approach with your help

	- How will you simulate real traffic in the new environment before going live?
	ANSWER: we have plenty of information patterns identified, but we do not have sysnthetic data created, so that would be another task to do









1. Ruby Version and OS Compatibility
Question: Have you already confirmed that all your gems (especially native extensions for image manipulation/encryption) can be recompiled and run correctly on Rocky 9? ANSWER: they are not going to run on Rocky, Rocky will be the host of the docker machine and containers/images will have the appropriate stack to be compatible with the current codebases Does taht make sense? for now upgrading Ruby is not an option (we could analyse it later)

2. Large File Handling and Local File Writes
How do you plan to handle these in containers? Will you use shared volumes, an NFS mount, or S3-like storage for persistence? ANSWER: using and hybrid combination of different protocols, however we could highlight this as a risk

3. Database Containerization (or Not)
Question: Do you plan to keep the DB on those VMs/bare metal, or is there any desire to containerize the database too? ANSWER: no migration pllaned for DB but that could be part of the proposed agenda 
Follow-up: If the DB remains on RHEL 7.7, does your network design (firewall rules, ports) need re-checking to handle container-based traffic? ANSWER: yes, maybe

4. Network Security and Ingress
Question: Do you have a network architecture diagram for the proposed container environment, or do you need help designing it (e.g., a reverse proxy or load balancer approach)? ANSWER: I would need help to deisng an approach, however I need to understand better the current implementation
Follow-up: Are there any internal certificates, self-signed certs, or proxies that might need reconfiguration once you move to containers? ANSWER: not sure

5. Build and Release Strategy
You have Jenkins that’s “inefficient” and might move to TeamCity.
Question: Are there any interim steps planned to modernize the Jenkins pipeline (e.g., Docker build stages) before you switch entirely to TeamCity, or will that happen in tandem with the migration? ANSWER: that is part of the proposal, I need to see what is more convenient and explain why

6. Zero Downtime and Rollback Plan
Question: Can you tolerate a phased (service-by-service) containerization approach, or do you need a big-bang release for the entire monolith? ANSWER: I believe can tolerate service-by-service approach, but specially for Ruby  prefer a blue-green approach where we keep the VM-based setup as a fallback until we confirm container stability

7. Performance Testing and Synthetic Data
Question: Are you comfortable building or scripting synthetic load tests now, or do you need assistance in creating a load-testing pipeline (e.g., using Locust, JMeter, or Gatling) specifically for the container environment? ANSWER: I would need help later

8. Longer-Term Refactoring Plans
Question: Do you have a rough timeline or priority list for splitting out major modules from the Ruby monolith (e.g., authentication, e-commerce, admin)? Or is that still undefined? ANSWER: that is still undefined, I could provide a roadmap based on some criteria

9. Governance and Compliance
Question: Do you need help evaluating container scanning tools (e.g., Trivy, Anchore, Twistlock/Prisma) or setting up a container registry with scanning capabilities? ANSWER: maybe not, but good point

10. Resource Constraints and Rollout Timeline
Question: Do you have a “must go live” date or a notional timeframe (e.g., 6 months, 1 year) that we can use as a guideline to structure milestones? ANSWER: I was expecting to have 3 to 6 months approach, being 3 months the expected timeframe