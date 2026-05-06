# Process Flow: Reference Letters in EPAM Docs
**Version:** 1.0  
**Phase:** 1 — Reference Letters  
**Target platform:** docs.epam.com  
**Last updated:** May 2026

---

## 1. Overview

The Reference Letters process enables India-based EPAM employees to request official HR letters directly through the EPAM Docs platform. Depending on the letter type, requests are either completed automatically or routed to an HRBP for manual verification before the letter is made available for download.

---

## 2. Actors

| Actor | Role |
|---|---|
| **Employee** | Initiates the request (except Relocation Letter), fills in required details, downloads the completed letter |
| **RM / HRBP** | Initiates Relocation Letter requests on behalf of the employee |
| **DOCS Platform** | Creates the request, pre-populates employee data, auto-verifies eligible letters, manages request lifecycle |
| **HRBP** | Reviews and verifies requests that require manual approval; closes requests manually when needed |

---

## 3. Letter Types

### Auto-Verified Letters
Completed automatically by the system — no HRBP action required.

| Letter Type | Description |
|---|---|
| Form 60 | Declaration form for employees without PAN card |
| Address Proof Letter | Official confirmation of employee's residential address |
| Service Letter | Confirmation of employment and service details |

### Manually Verified Letters
Routed to HRBP for review and approval before completion.

| Letter Type | Description | Notes |
|---|---|---|
| Visa Processing Letter | Letter supporting visa applications | — |
| LOR — Letter of Recommendation | Recommendation letter for active employees | Ex-employees: handled in Separation Letters phase |
| Relocation Letter | Letter confirming approved relocation | Initiated by RM/HRBP, not the employee |

---

## 4. End-to-End Process Flow

### 4.1 High-Level Swim Lane

```
EMPLOYEE          │ DOCS PLATFORM              │ HRBP
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
                  │   └─ YES ──────────────────→│ All data correct?
        ↓         │                            │   ├─ YES → Verify manually
Download Letter   │                            │   │         → Request
(auto-verified)   │                            │   │           Completed
        ↓         │                            │   └─ NO → Reject Form
                  │ Close request?              │       Rejection reason
                  │   ├─ YES ←─────────────────│       sent to employee
                  │   │  HRBP closes manually   │
                  │   └─ NO → auto-close        │
                  │           after 2 days      │
```

### 4.2 Detailed Steps

**Step 1 — Employee initiates request**
- Employee navigates to docs.epam.com
- Opens "My Requests" tab
- Clicks "Request document from EPAM"
- Selects the desired letter type from the dropdown

**Step 2 — Requester fills in the request form**
- System pre-populates known employee data from HR systems
- Requester completes the remaining required fields (see Section 5)
- Requester submits the form

**Step 3a — Auto-verification path (Form 60, Address Proof, Service Letter)**
- DOCS platform validates the submitted data automatically
- Request status changes to **Completed**
- Letter is immediately available for download in the "Documents to download" section

**Step 3b — Manual verification path (Visa Processing, LOR, Relocation)**
- Request is routed to HRBP queue
- HRBP reviews the submitted information
  - If correct: HRBP approves → Request status changes to **Completed** → letter available for download
  - If incorrect: HRBP rejects → employee receives rejection reason by notification → employee must submit a **new request**

**Step 4 — Employee downloads the letter**
- Employee opens the completed request
- Downloads the generated letter from the "Documents to download" section

**Step 5 — Request closure**
- HRBP closes the request manually, OR
- System auto-closes the request after **2 days** once all forms are in a final status (Verified / Generated)

> **New request rule:** An employee cannot submit a new request for the same letter type until the previous request is closed. Minimum interval is 2 days.

---

## 5. Form Fields by Letter Type

### 5.1 Form 60

| Field | Source | Input Type |
|---|---|---|
| Name | Pre-populated (HR system) | Read-only |
| Designation | Pre-populated (HR system) | Read-only |
| UID | Pre-populated (HR system) | Read-only |
| Birth Location | Pre-populated (HR system) | Read-only |
| Start Date | Pre-populated (HR system) | Read-only |
| Father Name | Employee | Text input |
| PAN | Employee | Text input |
| Address | Employee | Text input |
| Mobile | Employee | Text input |

### 5.2 Address Proof Letter

| Field | Source | Input Type |
|---|---|---|
| Name | Pre-populated (HR system) | Read-only |
| Designation | Pre-populated (HR system) | Read-only |
| UID | Pre-populated (HR system) | Read-only |
| Address as per People | Pre-populated (People system) | Read-only |
| Start Date | Pre-populated (HR system) | Read-only |
| Purpose | Employee | Dropdown: Personal Loan / Home Loan / Bank Connection / New Broadband Connection / Custom |
| Custom Purpose | Employee (if Custom selected) | Text input, max 100 characters |

> **Note:** If address is not found in the People system, employee must update their profile before submitting.

### 5.3 Service Letter

| Field | Source | Input Type |
|---|---|---|
| Name | Pre-populated (HR system) | Read-only |
| Designation | Pre-populated (HR system) | Read-only |
| UID | Pre-populated (HR system) | Read-only |
| Work Location | Pre-populated (HR system) | Read-only |
| Start Date | Pre-populated (HR system) | Read-only |
| Purpose | Employee | Dropdown |

### 5.4 Visa Processing Letter

| Field | Source | Input Type |
|---|---|---|
| Name | Pre-populated (HR system) | Read-only |
| Designation | Pre-populated (HR system) | Read-only |
| UID | Pre-populated (HR system) | Read-only |
| Work Location | Pre-populated (HR system) | Read-only |
| Start Date | Pre-populated (HR system) | Read-only |
| Purpose | Employee | Dropdown (e.g. Personal Travel) |
| Comments | Employee | Text input, max 300 characters, single line |

### 5.5 Relocation Letter

| Field | Source | Input Type |
|---|---|---|
| Employee | Pre-populated (HR system) | Read-only |
| Name | Pre-populated (HR system) | Read-only |
| Designation | Pre-populated (HR system) | Read-only |
| Current Work Location | Pre-populated (HR system) | Read-only |
| New Work Location | RM/HRBP | Dropdown (city list) |
| Start/Effective Date | RM/HRBP | Date picker |
| Purpose | Pre-filled "Relocation" | Read-only |

### 5.6 LOR — Letter of Recommendation

| Field | Source | Input Type |
|---|---|---|
| Name | Pre-populated (HR system) | Read-only |
| Designation | Pre-populated (HR system) | Read-only |
| UID | Pre-populated (HR system) | Read-only |
| Work Location | Pre-populated (HR system) | Read-only |
| Start Date | Pre-populated (HR system) | Read-only |
| Purpose | Employee | Dropdown |
| Notes & Responsibilities | Employee | Rich text editor (formatting supported) |

---

## 6. Notifications

| Event | Recipient | Channel |
|---|---|---|
| Request submitted (manual verification) | Employee | System notification |
| Request rejected | Employee | Notification with rejection reason |
| Request completed | Employee | System notification |
| New request pending review | HRBP | System notification |

---

## 7. Out of Scope — Phase 1

- LOR for ex-employees (covered in Separation Letters phase)
- Compensation Letters
- Separation Letters
- Any Assist workflows not related to Reference Letters
