# Insurance Policy & Claims Management

A portfolio-quality Salesforce application for managing insurance policies and their claims lifecycle — built with SFDX source format, declarative automation (record-triggered Flows, validation rules), bulkified Apex with full test coverage, and a Lightning Web Component dashboard.

> Part of the [Batch32Dev portfolio repository](README.md). All metadata lives under `force-app/main/default/`.

## ✨ Features

- **Policy lifecycle management** — Draft → Active → Under Claim Review → Expired/Cancelled, with auto-numbered policy IDs (`PM-00001`)
- **Claims processing** — claims (`CLM-00001`) filed against policies via Master-Detail, with status flow New → Under Review → Approved/Rejected → Paid
- **Automated policy status** — approving a claim automatically flags the parent policy as *Under Claim Review* (record-triggered Flow)
- **Cancellation cascade** — cancelling a policy auto-rejects all of its open claims, leaving Approved/Paid claims untouched (record-triggered Flow)
- **Guardrails** — validation rules stop claims above the coverage limit, claims outside the coverage period, non-positive amounts, and invalid date ranges
- **Real-time roll-ups** — total claim count and total claimed amount summarized on the policy (native roll-up summary fields)
- **Claims dashboard LWC** — KPI tiles, coverage-consumption bar with warning threshold, and the 10 most recent claims on the Policy record page

## 🗂 Data Model

```
Account (standard)          Contact (standard)
    ▲ Policyholder (lookup)     ▲ Primary Contact (lookup)
    │                           │
    └────────── Policy_Master__c ──────────► Coverage_Type__c (lookup)
                     ▲                        · Line_of_Business__c (Auto/Home/Health/Life)
                     │ Master-Detail          · Active__c, Description__c
                 Insurance_Claim__c
                 · Claim_Date__c, Status__c
                 · Claim_Amount__c, Description__c
```

| Object | Purpose | Key fields |
|---|---|---|
| `Policy_Master__c` | The insurance contract | Status, Start/End Date, Premium Amount, Coverage Limit, roll-ups (Total Claims, Total Claims Amount) |
| `Insurance_Claim__c` | A claim filed against a policy (Master-Detail child) | Claim Date, Status, Claim Amount, Description |
| `Coverage_Type__c` | Coverage product catalog | Line of Business picklist, Active flag |

Sharing: `Insurance_Claim__c` is *Controlled by Parent*; deleting Accounts or Coverage Types in use is blocked by restrict-delete lookups.

## ⚙️ Automation

| Component | Type | Behaviour |
|---|---|---|
| `Claim_Approved_Update_Policy_Status` | Record-triggered Flow (after save) | Claim status *changes to* Approved → parent policy set to Under Claim Review |
| `Policy_Cancelled_Reject_Open_Claims` | Record-triggered Flow (after save) | Policy cancelled → open claims (New/Under Review) auto-rejected |
| `Claim_Amount_Within_Coverage_Limit` | Validation rule | Claim amount ≤ parent policy's coverage limit |
| `Claim_Date_Within_Policy_Period` | Validation rule | Claim date must fall inside the policy Start/End dates |
| `Claim_Amount_Positive` | Validation rule | Claim amount > 0 |
| `End_Date_After_Start_Date` | Validation rule | Policy End Date after Start Date |

Both flows use `doesRequireRecordChangedToMeetCriteria` so they fire only on the actual status *transition* — the flow equivalent of an `ISCHANGED()` check.

## 🧑‍💻 Code

| Component | Description |
|---|---|
| `ClaimsDashboardController` | `@AuraEnabled(cacheable=true)` controller; 3 SOQL queries total (policy, GROUP BY aggregate, recent list), `WITH USER_MODE` for FLS/CRUD enforcement, no SOQL/DML in loops |
| `ClaimsDashboardControllerTest` | 6 test methods: aggregation, empty state, null-input error path, validation rule enforcement, flow behaviour, and a 200-record bulk test |
| `InsuranceTestDataFactory` | `@isTest` factory used by all tests; builds records that always satisfy the validation rules |
| `policyClaimsDashboard` (LWC) | Wire-based dashboard for the Policy record page: KPI tiles, SLDS progress bar (red above 75% consumption), `lightning-datatable` of recent claims |

## 🚀 Setup

```bash
# 1. Authorize your org (skip if already done)
sf org login web --alias myOrg --set-default

# 2. Deploy the app metadata
sf project deploy start \
  -d force-app/main/default/objects/Coverage_Type__c \
  -d force-app/main/default/objects/Policy_Master__c \
  -d force-app/main/default/objects/Insurance_Claim__c \
  -d force-app/main/default/flows \
  -d force-app/main/default/classes/ClaimsDashboardController.cls \
  -d force-app/main/default/classes/InsuranceTestDataFactory.cls \
  -d force-app/main/default/classes/ClaimsDashboardControllerTest.cls \
  -d force-app/main/default/lwc/policyClaimsDashboard \
  -d force-app/main/default/permissionsets/Insurance_Claims_Manager.permissionset-meta.xml

# 3. Assign the permission set to yourself
sf org assign permset --name Insurance_Claims_Manager

# 4. Run the tests (expect 100% pass, 85%+ coverage on the controller)
sf apex run test --tests ClaimsDashboardControllerTest --result-format human --code-coverage --wait 10
```

### Post-deploy (point-and-click, ~5 minutes)

1. **Tabs** — Setup → Tabs → create custom tabs for *Policy Master*, *Insurance Claim* and *Coverage Type*.
2. **Record page** — open any Policy Master record → ⚙️ → *Edit Page* → drag **Policy Claims Dashboard** into the sidebar → Save & Activate as org default.
3. **Sample data** — create a Coverage Type (e.g. "Auto Standard", Line of Business = Auto), a policy for any Account, then a few claims to see the dashboard populate.

## 🧪 Testing Notes

The test class deliberately exercises the **whole stack**, not just Apex: it asserts that the validation rule blocks an oversized claim, that the flow moves the policy to *Under Claim Review* when a claim is approved, and that a 200-record bulk insert behaves correctly — proving the automation is bulk-safe.

## 👤 Author

**Elnur Majidov** — [github.com/elnurmajidov](https://github.com/elnurmajidov)
