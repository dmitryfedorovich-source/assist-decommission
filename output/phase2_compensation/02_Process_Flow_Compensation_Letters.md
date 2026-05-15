# Process Flow: Compensation Letters in EPAM Docs
**Version:** 0.1 — Draft for review  
**Phase:** 2 — Compensation Letters  
**Target platform:** docs.epam.com  
**Last updated:** May 2026

---

## 1. Overview

The Compensation Letters process enables the India Compensation Team to notify India-based EPAM employees about compensation changes (salary revision, promotion, increment, variable pay) through the EPAM Docs platform. Unlike Phase 1 Reference Letters, this is a **push model**: the Compensation Team specialist initiates the process by uploading a batch file — employees do not self-request compensation letters.

Each employee receives a notification, opens the request in DOCS, accepts the letter, and downloads it. The letter is generated automatically; no manual specialist verification is required per letter.

**Phase 2 covers 4 letter types.** Target go-live: aligned with overall Assist decommission schedule (June 30, 2026 or later — TBD).

---

## 2. Actors

| Actor | Role |
|---|---|
| **Compensation Team specialist** | Initiates mass request for affected employees via XLS file upload; monitors completion status |
| **DOCS Platform** | Generates compensation letters, sends notifications, tracks acceptance, auto-closes requests |
| **Employee** | Receives notification, opens request, accepts consent, downloads letter |

> **Note:** Employees do not initiate compensation letter requests. RM approval is not part of the Phase 2 flow — this is an automated notification process, not a request-and-approval process.

---

## 3. Letter Types

Phase 2 covers 4 compensation letter types, all based on a **single base template** with conditional text blocks (D-P2-06). Flex-to-fixed letter types are out of scope — removed after the GDO merge effective April 1, 2026 (D-P2-01).

| # | Letter Type | Description |
|---|---|---|
| 1 | Salary Revision | Annual or off-cycle base salary change |
| 2 | Promotion | Role change with associated compensation update |
| 3 | Increment | Merit-based salary increase |
| 4 | Variable Pay | Bonus or variable component notification |

### Template Structure — Conditional Text Blocks

All 4 letter types are generated from one base template. Each template variant is defined by which text blocks are active:

| Variant | Active blocks |
|---|---|
| Salary Hike only | Salary Hike block |
| Promotion + Salary Hike | Promotion block + Salary Hike block |
| Promotion + Salary Hike + OTB | Promotion + Salary Hike + OTB block |
| Promotion + OTB + Bonus/LTI | Promotion + OTB + Retention Bonus / Deferred Bonus / One-Time Bonus + LTI |

> Activation of each block is controlled by Yes/No flags in the XLS upload file. Each letter type must be sent as a **separate mass request** — one mass request per compensation letter type per campaign.

---

## 4. End-to-End Process Flow

### 4.1 High-Level Swim Lane

```
Compensation Team specialist │ DOCS Platform                   │ Employee
─────────────────────────────┼─────────────────────────────────┼──────────────────────
Prepare XLS with employee    │                                 │
data + text block flags      │                                 │
             ↓               │                                 │
Create mass request in DOCS  │                                 │
(one per letter type)        │                                 │
             ↓               │                                 │
                             │ Generate compensation letters   │
                             │ (one per employee in XLS)       │
                             │ Send invitation notifications   │
                             │          ↓                      │
                             │                                 │ Receive notification
                             │                                 │         ↓
                             │                                 │ Open DOCS request
                             │                                 │         ↓
                             │                                 │ Accept Consent
                             │                                 │         ↓
                             │                                 │ Download letter
                             │                                 │         ↓
                             │ Record view / download events   │
                             │ Send reminders (if not opened)  │
                             │          ↓                      │
                             │ Auto-close (10 days completed / │
                             │ 3 days inactive)                │
```

### 4.2 Detailed Steps

**Step 1 — Compensation Team specialist prepares batch file**
- Specialist prepares an XLS file containing:
  - Employee list (UID, name, email, or equivalent identifier)
  - Compensation data per employee (salary figures in INR — D-P2-04)
  - Text block activation flags (Yes/No) per employee row (D-P2-06)
- One XLS file per compensation letter type

**Step 2 — Specialist creates mass request in DOCS**
- Specialist navigates to DOCS → **Mass Requests** tab on the specialist dashboard
- Creates a new mass request for the selected letter type (e.g. "IND Compensation Letter — Salary Revision")
- Uploads the XLS file; DOCS parses employee data and generates individual requests
- One mass request must be created **per letter type** — separate mass requests for Salary Revision, Promotion, Increment, Variable Pay

**Step 3 — DOCS generates letters and sends notifications**
- DOCS generates a compensation letter for each employee in the batch, applying the relevant conditional text blocks and INR-formatted amounts (D-P2-04)
- Letters are **password-protected using the employee's PAN number** (D-P2-03). If PAN protection is not technically feasible on the platform, a disclaimer/caution note is displayed before the employee can open the letter (D-P2-03 fallback). *(Platform feasibility: OQ-P2-02 — open)*
- DOCS sends an **invitation email notification** to each employee with a link to their request
- A **confidentiality notice** is embedded as a text paragraph within the letter itself (D-P2-07): *"This letter is confidential — do not share with third parties."*

**Step 4 — Employee opens request and accepts consent**
- Employee receives invitation email and clicks the link, or navigates directly to docs.epam.com → "My Requests"
- Employee opens the compensation letter request
- Employee completes the **Accept Consent** step: confirms receipt and acknowledges letter contents (D-P2-02)
  - There is no reject option — employee either accepts or leaves unaccepted; salary processing is not conditional on acceptance (D-P2-02)

> **Acceptance tracking mechanism — OQ-12 (open):** The exact mechanism for acceptance tracking requires alignment with Satish Malla. Two options under consideration: (a) an explicit **Accept** button that records a date-timestamp in DOCS, or (b) recording "view" and "download" events from the activity log as the audit trail. Option (a) may require DOCS platform development. The description above reflects the requirement (D-P2-02) — the implementation approach is pending OQ-12 resolution.

**Step 5 — Employee downloads the letter**
- After accepting, employee downloads the PDF compensation letter
- Letter is PAN-password-protected (or shows disclaimer if PAN protection unavailable — D-P2-03)

**Step 6 — Reminder notifications**
- DOCS sends automated reminder notifications to employees who have not opened or acted on their request:
  - **Reminder 1:** 2 days after invitation email
  - **Reminder 2:** 5–6 days after Reminder 1

**Step 7 — Request auto-closure**
- **Completed request:** auto-closes after **10 days** from completion date (D-P2-05)
- **Inactive request** (employee has not acted): auto-closes after **3 days** of inactivity (D-P2-05)
- Compensation Team specialist can also close requests manually at any time

---

## 5. Form Fields and Data

### 5.1 Data Source — XLS Upload

The compensation letter content is driven by the XLS batch file, not by employee self-entry. Employees do not fill in form fields.

| Data Element | Source | Notes |
|---|---|---|
| Employee name | XLS / People system | Pre-populated in letter |
| UID | XLS / People system | Pre-populated in letter |
| Designation | XLS / People system | Pre-populated in letter |
| Effective date | XLS (per employee row) | Date of compensation change |
| New salary / component amounts | XLS (per employee row) | Must be in INR format (D-P2-04) |
| Text block flags (Yes/No) | XLS (per employee row) | Determines which letter variant is generated (D-P2-06) |
| RM / responsible person email | Optional field in request settings | For notification routing |

### 5.2 Letter Content — Conditional Blocks

| Block | Included when |
|---|---|
| Salary Hike | `Salary Hike = Yes` |
| Promotion | `Promotion = Yes` |
| OTB (One-Time Bonus) | `OTB = Yes` |
| Retention Bonus | `Retention Bonus = Yes` |
| Deferred Bonus | `Deferred Bonus = Yes` |
| One-Time Bonus | `One-Time Bonus = Yes` |
| LTI (Long-Term Incentive) | `LTI = Yes` |
| Confidentiality notice | Always included (D-P2-07) |

---

## 6. Notifications

| Event | Recipient | Channel | Timing |
|---|---|---|---|
| Letter ready | Employee | Invitation email (DOCS system) | On mass request creation |
| Reminder 1 | Employee | Reminder email | 2 days after invitation (if no action) |
| Reminder 2 | Employee | Reminder email | 5–6 days after Reminder 1 (if no action) |
| Letter accepted/downloaded | None (logged in activity log) | Activity log entry | On employee action |
| eSignature (if applicable) | Employee | DOCS notification | On signing event |

---

## 7. Specialist Monitoring

The Compensation Team specialist monitors campaign completion via the DOCS specialist dashboard:

- **Mass Requests tab:** overall campaign status per letter type
- **Requests tab:** individual employee request statuses (In Progress / Completed / Closed)
- **Files Dashboard:** filter by Country (India) and process to view all generated compensation letters
- **Key tracked status:** "Generated" per employee — confirms letter was created (D-P2-05)

Specialist does not need to track whether each employee opened or downloaded the letter — acceptance tracking is via activity log (OQ-12).

---

## 8. Annual Compensation Campaign Context

Compensation letters are issued primarily as part of the **annual compensation review campaign** (Q2):

- All affected India employees receive letters within the same campaign window
- Number of compensation letter forms may increase up to 16–17 variants in a given campaign year (per BA notes from flow diagrams)
- Each type is a separate mass request; the specialist manages multiple concurrent mass requests during campaign period
- Post-campaign, ad-hoc compensation letters may be issued outside the annual cycle (same process, smaller batch)

---

## 9. Open Items Affecting This Document

| OQ | Question | Impact |
|---|---|---|
| OQ-12 | Acceptance tracking mechanism: activity log (view + download) vs. custom Accept button. Needs Satish Malla alignment. | Step 4 detail; Section 6 (notification tracking) |
| OQ-P2-02 | Can DOCS implement PAN-number PDF password protection? If not, is a disclaimer/caution note sufficient? | Step 3; Section 5.2 |

---

## 10. Out of Scope — Phase 2

- Flex-to-fixed letters (removed after GDO merge April 1, 2026 — D-P2-01)
- Reference letters (Phase 1)
- Separation / experience letters (Phase 3)
- Nominee Form / Relocation Letter (Phase 4+)
- Compensation letters for non-India employees
