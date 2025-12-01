---
marp: true
---

# eCommerce Technology Demos

**Disclaimer**
I will be the voice here today, but this have been a whole teamwork so far!

---

## Gift Card Report

### The problem

Through July 2023, Blurb has continued to offer gift cards to customers even though the customer-facing program was discontinued around 2016.
We found this in the Blurby Admin tools: https://www.blurb.com/admin/gift_cards/code/search
About 25K records of gift card orders, internal and external, with a large sum of them not redeemed.

There's no export function in the Admin tool. I'd like to get a dump of all the data available in the DB for gift card orders.

---

### The process

- Analysis and records collection
- Report creation
- Create the notes

---

### The result

go to spreadsheet

---

## 23&me deletion

disclaimer: for future development

### The inquiry and Result

**Inquiry**
23&Me is asking that we delete all customer data in our system.

**Result**
Deletion general report

---

### Process

- Situation
- Collaboration
- Analysis
- Plan
- Iteration and revision
- Deletion plan
- Execution
- Verification
- Monitoring

---

### The good things

- Isomorphism well respected: privacy as business driver was successfully addressed
- Fundamental legal aspects were accomplished
- Isolation:
  - Architecture Components
  - Database: tenant oriented, distributed schemas, object storage (assets)
- Existence of holding bin

---

### Things to improve and take aways

- Support contractual requirements with features
  - Runbook
  - Interfaces
  - deletion-oriented records
- Backup & interval time commitment
- Monitor what is important
- Data privacy standard contraints
- Identify intentionally all data nature involved (financial, marketing, orders, ...)
- Identify intentionally sensible data residency
