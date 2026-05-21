# Process Flow: Reference Letters in EPAM Docs
**Version:** 1.0  
**Phase:** 1 — Reference Letters  
**Target platform:** docs.epam.com  
**Last updated:** May 2026

---

## 1. Overview

The Reference Letters process enables India-based EPAM employees to request official HR letters directly through the EPAM Docs platform. Depending on the letter type, requests are either completed automatically (auto-verified) or routed to an India Team specialist for manual verification before the letter is sent to the employee for download. Phase 1 covers 5 letter types. **Target go-live: June 30, 2026.**

---

## 2. Actors

| Actor | Role |
|---|---|
| **Employee** | Initiates the request, fills in required details, downloads the completed letter |
| **India Team specialist (DV/EDV)** | Reviews and verifies LOR requests; manually sends the document to the employee via "Send Document" action |
| **DOCS Platform** | Creates the request, pre-populates employee data, auto-verifies eligible letters, manages request lifecycle |

---

## 3. Letter Types

### Auto-Verified Letters
Completed automatically by the system — no India Team specialist action required.

| Letter Type | Description |
|---|---|
| Form 60 | Declaration form for employees without PAN card |
| Address Proof Letter | Official confirmation of employee's residential address |
| Service Letter | Confirmation of employment and service details |
| Visa Processing Letter | Letter supporting visa applications; Track A per D-24 with notification checkbox, no RM or specialist approval |

### Manually Verified Letters
Routed to India Team specialist (DV/EDV) for review. After verification, specialist manually sends the document — employee receives notification and downloads.

| Letter Type | Description | Notes |
|---|---|---|
| LOR — Letter of Recommendation | Recommendation letter for active employees | DV/EDV → "Send Document" flow; ex-employees: out of scope Phase 1 (D-13) |

---

## 4. End-to-End Process Flow

### 4.1 High-Level Swim Lane

```
EMPLOYEE          │ DOCS PLATFORM              │ India Team specialist (DV/EDV)
──────────────────┼────────────────────────────┼──────────────────────────
Request reference │                            │
letter            │                            │
        ↓         │                            │
Open Docs &       │                            │
select letter type│                            │
        ↓         │                            │
                  │ Request created             │
        ↓         │                            │
Fill in required  │                            │
information       │                            │
        ↓         │                            │
                  │ Verification required?      │
                  │   ├─ NO → Auto-verification │
                  │   │       → Request         │
                  │   │         Completed       │
                  │   │       → auto-close      │
                  │   │         after 2 days    │
                  │   └─ YES ──────────────────→│ All data correct?
        ↓         │                            │   ├─ YES → Verify manually
Download Letter   │                            │   │         → Request
(auto-verified)   │                            │   │           Completed
        ↓         │                            │   └─ NO → Reject Form
                  │                             │       Rejection reason
                  │ Close request?              │       sent to employee
                  │   ├─ YES ←─────────────────│
                  │   │  Specialist closes manually│
                  │   └─ NO → auto-close        │
                  │           after 2 days      │
```

### 4.2 Detailed Steps

**Step 1 — Employee initiates request**
- Employee navigates to docs.epam.com
- Opens "My Requests" tab → **"Active Requests"** sub-tab (the default view; "Past Requests" sub-tab shows closed requests)
- Clicks **"+ Request document from EPAM"** button (top-right of the page)
- In the modal: selects the desired letter type from the dropdown
- Clicks **"Create request"** button to confirm

**Step 2 — Requester fills in the request form**
- System pre-populates known employee data from People system (read-only "System file" form within the request)
- Employee fills in the required fields in "Request details" form (see Section 5)
- A **Self-Declaration section** appears at the bottom of the form with full disclaimer text. Employee must tick the **"Accept" checkbox** before submitting (D-21)
- Optional: employee may click **"Save as draft"** to return later before submitting
- Requester submits the form; a confirmation dialog appears: *"Once you have done this, you cannot modify your form any further"*

**Step 3a — Auto-verification path (Form 60, Address Proof, Service Letter, Visa Processing Letter)**
- DOCS platform validates the submitted data automatically
- For Visa Processing Letter, employee ticks the notification checkbox confirming they informed the relevant person (D-24)
- Request status changes to **Completed**
- Letter is immediately available for download in the "Documents to download" section

**Step 3b — Manual verification path (LOR)**
- Request enters verification queue for India Team specialist (DV/EDV)
- Specialist reviews the submitted information
  - If correct: specialist verifies → clicks **"Send Document"** action → employee receives notification → document available for download. Note: the document is **not visible** to the employee until the specialist sends it.
  - If incorrect: specialist rejects with **required comment** → employee receives notification with rejection reason → employee edits and resubmits **same form** → specialist re-verifies. No limit on resubmissions.
- **Request closure:** India Team specialist closes manually, OR system auto-closes after 2 days if no manual closure

**Step 4 — Employee downloads the letter**
- Employee opens the completed request
- Downloads the generated letter from the "Documents to download" section

**Step 5 — Request closure**
- **Auto-verified letters (Form 60, Address Proof, Service Letter, Visa Processing Letter):** System auto-closes the request after **2 days** once all forms reach a final status (Verified / Generated)
- **Manually verified letters (LOR):** India Team specialist closes the request manually after sending the document, OR system auto-closes after **2 days** if no manual closure occurs

> **New request rule:** An employee cannot submit a new request for the same letter type until the previous request is closed. Minimum interval is 2 days. Note: resubmitting a rejected form does not count as a new request — the same request stays open.

---

## 5. Form Fields by Letter Type

### 5.1 Form 60

| Field | Source | Input Type |
|---|---|---|
| Date | Auto (DOCS system) | Read-only |
| Name | Pre-populated (People system) | Read-only |
| Designation | Pre-populated (People system) | Read-only |
| UID | Pre-populated (People system) | Read-only |
| Work Location | Pre-populated (People system) | Read-only |
| Birth Location | Pre-populated (People system) | Read-only |
| Start Date | Pre-populated (People system) | Read-only |
| Salutation | Employee | Dropdown (e.g. Mr. / Mrs.) |
| Father Name | Employee | Text input |
| Current address | Employee | Text input (2 lines) |
| Worksite city | Employee | Dropdown |
| UAN | Employee | Text input |
| Mobile number | Employee | Text input |
| PAN | Employee | Text input |
| State | Employee | Text input |

### 5.2 Address Proof Letter

| Field | Source | Input Type |
|---|---|---|
| Date | Auto (DOCS system) | Read-only |
| Name | Pre-populated (People system) | Read-only |
| Designation | Pre-populated (People system) | Read-only |
| UID | Pre-populated (People system) | Read-only |
| Start Date | Pre-populated (People system) | Read-only |
| Address as per People | Pre-populated (People system) | Read-only — if address is incorrect, employee must update profile in People system (D-20) |
| Purpose | Employee | Dropdown: Personal Loan / Home Loan / Bank Connection / New Broadband Connection / Custom |
| Custom Purpose text | Employee | Text input, max 100 characters — always visible; fill in when "Custom" is selected |

> **Note:** If address is not found in the People system, employee must update their profile before submitting.

### 5.3 Service Letter

| Field | Source | Input Type |
|---|---|---|
| Date | Auto (DOCS system) | Read-only |
| Name | Pre-populated (People system) | Read-only |
| Designation | Pre-populated (People system) | Read-only |
| UID | Pre-populated (People system) | Read-only |
| Work Location | Pre-populated (People system) | Read-only |
| Start Date | Pre-populated (People system) | Read-only |
| Purpose | Employee | Dropdown |
| Custom field details | Employee | Text input |

### 5.4 Visa Processing Letter

| Field | Source | Input Type |
|---|---|---|
| Date | Auto (DOCS system) | Read-only |
| Name | Pre-populated (People system) | Read-only |
| Designation | Pre-populated (People system) | Read-only |
| UID | Pre-populated (People system) | Read-only |
| Work Location | Pre-populated (People system) | Read-only |
| Start Date | Pre-populated (People system) | Read-only |
| Purpose of Travel | Employee | Free text |
| Destination Country | Employee | Free text |
| Tentative Travel start date | Employee | Date picker |
| Tentative Travel end date | Employee | Date picker |
| Travel type | Employee | Dropdown (e.g. Personal Travel — full list pending India team confirmation, OQ-06) |
| Comments | Employee | **Required.** Text area (DOCS dev required — OQ-11) |
| Notification confirmation | Employee | Checkbox confirming the employee has informed the relevant person; no approval workflow required (D-24) |

### 5.5 LOR — Letter of Recommendation

| Field | Source | Input Type |
|---|---|---|
| Date | Auto (DOCS system) | Read-only |
| Name | Pre-populated (People system) | Read-only |
| Designation | Pre-populated (People system) | Read-only |
| UID | Pre-populated (People system) | Read-only |
| Work Location | Pre-populated (People system) | Read-only |
| Start Date | Pre-populated (People system) | Read-only |
| Purpose | Employee | Dropdown |
| Custom field details | Employee | Text input |
| Notes & Responsibilities | Employee | **Required.** Multi-line plain text, paragraphs supported, max ~1000 chars (DOCS dev required — OQ-11) |

---

## 6. Notifications

| Event | Recipient | Channel |
|---|---|---|
| Request submitted (manual verification) | Employee | System notification |
| Request rejected | Employee | Notification with rejection reason |
| Request completed | Employee | System notification |
| New request pending review | India Team specialist (DV/EDV) | System notification |

---

## 7. Out of Scope — Phase 1

- Relocation Letter (D-16 — deferred to Phase 4+; purpose and trigger need investigation)
- LOR for ex-employees (covered in Separation Letters phase)
- Compensation Letters
- Separation Letters
- Any Assist workflows not related to Reference Letters
