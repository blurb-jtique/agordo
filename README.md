# Blurby Knowledge Repository

This repository serves as a comprehensive collection of documentation, sprint information, technical notes, and proposals related to the Blurby ecosystem. It's designed to help team members and new contributors quickly understand the Blurby platform, its components, ongoing modernization efforts, and development processes.

## What is Blurby?

Blurby is a book creation and publishing platform that allows users to create, design, and order printed books, magazines, and other print products. The system consists of several interconnected components including:

- **BookWright**: A Java-based desktop application for book creation and design
- **BookWizard**: A Java service built on the Dropwizard framework that manages book dimensions, handles ISBN content submissions, and manages printer communications for trade books
- **BookServe**: A Java service responsible for book upload, preflight, PDF processing, order management, printer integration, and communication with PrintTalk printers for photobooks and magazines
- **BBF (Blurb Book Format)**: A format used by BookWright and the Online Ebook Editor for creating and managing book projects in XML or JSON formats

## Repository Structure

```txt
agordo/
├── agile/                      # documentation about our way of work (practices, HL agenda, and similar)
│   └── ceremonies/             # documentation about our ceremonies
├── blurb/                      # Core Blurb documentation
├── blurby/                     # Blurby service documentation
├── deployments/                # Deployment strategies and resources
│   └── resources/              # SQL scripts and deployment resources
├── migration/                  # Migration notes and findings (Ruby/Rails upgrades)
├── modernization/              # Modernization proposals and documentation
├── optimitizations/            # Performance optimization documentation
├── proposals/                  # Various project proposals and approaches
│   └── res/                    # Supplemental resources for proposals
├── setup/                      # Environment setup instructions
├── sprints/                    # Sprint documentation and artifacts
│   ├── 0-alpha.md              # Sprint naming conventions
│   ├── 1-arche/                # Sprint 1 documentation
│   ├── 2-hydor/                # Sprint 2 documentation
│   ├── 3-dome/                 # Sprint 3 documentation
│   └── 4-diaplase/             # Sprint 4 documentation
├── tests/                      # Testing documentation and strategies
├── troubleshooting/            # Common issues and solutions
└── utils/                      # Utility documentation and resources
```

## Key Sections

### Blurby Service Documentation

- [BookWizard](blurby/bookwizard.md): Centralized book dimension data, Ingram integration, and printer communications for trade books
- [BookServe](blurby/bookserve.md): Book upload, preflight, PDF processing, and printer integration for photobooks and magazines
- [BBF](blurby/bbf.md): Blurb Book Format documentation

### Modernization

- [Context](modernization/0-context.md): Details about the Rails upgrade path from 2.3 to 7.0 and coexistence strategy with Blurb 2.0
- [Refined Proposal](modernization/1-refined-proposal.md): Updated modernization approach

### Migration

- [Migration Findings](migration/findings-refined.md): Issues and workarounds encountered when migrating from Ruby 1.9/Rails 2 to Ruby 2.7/Rails 3
- [Postgres Migration](migration/postgres-migration.md): Database migration details

### Sprints

- [Sprint Naming](sprints/0-alpha.md): Greek-themed sprint naming system
- Individual sprint folders containing tickets, specifications, and documentation

### Setup

- [Blurby Setup](setup/blurby-2004.md): Environment setup instructions
- [Blurby Issues](setup/blurby-2004-issues.md): Common setup problems and solutions

## Current Modernization Efforts

The Blurby platform is currently undergoing a modernization process with the following key goals:

1. Upgrading Rails from 2.3 to 7.0 to improve security, maintainability, and development efficiency
2. Establishing coexistence between Blurby and the new Blurb 2.0 platform
3. Minimizing initial changes to Blurby while enabling gradual migration to Blurb 2.0
4. Introducing new APIs and features to enable compatibility between platforms

The modernization timeline includes:

1. Environment and infrastructure preparation
2. Rails upgrades in incremental steps
3. API development for cross-platform compatibility
4. Progressive feature migration

## How to Use This Repository

1. **New Team Members**: Start with the [modernization context](modernization/0-context.md) to understand the current state and goals
2. **Developers**: Review the [sprint documentation](sprints/) for current and planned work
3. **Environment Setup**: Follow the instructions in the [setup folder](setup/) to configure your development environment
4. **Issue Resolution**: Check the [troubleshooting guide](troubleshooting/) for common problems and solutions

## Contributing

When adding documentation to this repository:

1. Place it in the most appropriate folder based on the content
2. Use clear, descriptive filenames
3. Include links to related resources when applicable
4. Use Markdown formatting for consistency

## Additional Resources

- Internal Jira boards
- Confluence documentation
- Git repositories for individual services
