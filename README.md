# Salesforce Development Portfolio

Hands-on Salesforce development work built during an intensive Salesforce Developer training program (Batch 32). This repository showcases practical experience with **Apex**, **Lightning Web Components (LWC)**, **SOQL**, **REST/SOAP integrations**, and Salesforce platform automation.

## 🛠 Tech Stack

- **Apex** — classes, triggers, batch & schedulable jobs, asynchronous processing
- **Lightning Web Components (LWC)** — 55+ components using `@wire` adapters, Lightning Data Service, parent-child communication, and Lightning Message Service
- **SOQL / DML** — data querying and manipulation patterns
- **Integrations** — REST callouts (GET/POST/DELETE), SOAP via WSDL, external API consumption
- **Tooling** — Salesforce CLI (sf), VS Code, Data Loader, ESLint, Prettier, Jest, Husky

## 📂 Repository Structure

| Path | Description |
|---|---|
| `force-app/main/default/classes/` | 120+ Apex classes: services, trigger handlers, batch jobs, REST callouts, test classes |
| `force-app/main/default/triggers/` | Triggers on Account, Contact, Opportunity, Case, Lead and custom objects, following the handler pattern |
| `force-app/main/default/lwc/` | Lightning Web Components covering forms, record operations, picklists, composition and messaging |
| `force-app/main/default/objects/` | Custom objects and fields (e.g. Recipe, Booking, Customer) |
| `scripts/apex/`, `scripts/soql/` | Anonymous Apex and SOQL practice scripts |
| `data/` | Sample data exports used with Data Loader |
| `Turkish_Revision/`, `apex/` | Additional callout exercises and revision material |

## ✨ Highlights

- **⭐ Insurance Policy & Claims Management app** — end-to-end mini application (custom objects, record-triggered Flows, validation rules, bulkified Apex + tests, LWC dashboard). See [README-insurance-app.md](README-insurance-app.md)
- **Trigger framework practice** — `CustomerTriggerHandler`, `OpportunityTrigger`, `AccountTrigger` with separation of trigger logic and handler classes
- **Asynchronous Apex** — `CreateTaskClosed5DaysBatch`, `DeleteClosedLostOpportunitiesBatch` + `Schedulable` implementations, `AsyncParksServices` (Queueable/Future callouts)
- **API integrations** — `BookingRestCallouts`, `MovieRestCallOuts`, `CommentCallouts`, `ParksServices` (SOAP/WSDL)
- **Service layer & testing** — `RecipeService` with `RecipeServiceTest`, utility classes such as `ApexUtility` and `OperationsHelper`
- **LWC patterns** — wire adapters (`getObjectInfo`, `getPicklistValuesByRecordType`), record forms (create/delete), parent-to-child and child-to-parent communication, conditional rendering, and a multi-component `fusionApp`

## 🚀 Getting Started

```bash
# Clone the repository
git clone git@github.com:elnurmajidov/salesforce-dev-portfolio.git

# Authorize a Salesforce org
sf org login web --alias myOrg

# Deploy the source
sf project deploy start --target-org myOrg
```

## 👤 About Me

**Elnur Majidov** — Salesforce Developer

- GitHub: [@elnurmajidov](https://github.com/elnurmajidov)
- Email: elnurmajidov@icloud.com
