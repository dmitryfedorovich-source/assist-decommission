---
name: DOCS Platform UI — Track B Full Flows (Visa Processing + LOR)
description: Complete Track B UI for Visa Processing Letter and LOR — employee submit, specialist verify, Send Document, employee download, closed state; plus specialist dashboard, Files Dashboard, File Cabinet
type: project
status: active
source: input/screenshots/ — ~50 screenshots dated 2026-05-13
---

## Visa Processing Letter — Employee Flow

### Step 1 — Request page (before filling)
- Status: **In progress** (blue)
- Form card: **Letter request details** — tag: "Fill the form first" (yellow pill) / "Please fill in the form" / FILL IN
- Contact: WFA Human Resource India / WFAHumanResourceIndia@epam.com
- **NO "Documents to download" section visible** — document hidden from employee until specialist "Send Documents"
- Additional Documents: drag-and-drop upload area

### Step 2 — Employee form: Letter Request Details
- Section header: **Travel details** (blue bar)
- Fields:
  - **Purpose of Travel** — free text
  - **Destination Country** — free text
  - **Tentative Travel start date** — date picker
  - **Tentative Travel end date** — date picker
  - **Travel type** — dropdown (value seen: "Personal Travel")
  - **Comments** — text area (submitted empty in test — possible D-18 discrepancy)
- Self-Declaration section at bottom (same text as Form 60) + **Accept** checkbox
- Buttons: Cancel / Save as draft / Submit

### Step 3 — Submit modal
- "Select 'Submit' button if you are ready to submit your document. Once you have done this, you cannot modify your form any further."
- Buttons: Cancel / Save as draft / Submit

### Step 4 — After submission
- Status: **Waiting for verification** (yellow/orange)
- Toast: "Your document was successfully submitted for verification. We will contact you directly if we need any more information or clarification."
- Form card: **Letter request details** — "Waiting for verification" (orange clock icon) / "The form is waiting for check" / VIEW

---

## Visa Processing Letter — Specialist Flow

### Specialist notification email
- Subject-style heading: **[Request Name]**
- Body: "Dear Colleagues, Please be advised that the request for [Recipient Name] is awaiting your verification. Click the button below to access the request."
- Button: **OPEN DOCS**

### Specialist request view (Step 2)
- Status: **Waiting for verification**
- Two forms:
  - **System file** — Verified (green) / EDIT
  - **Letter request details** — Waiting for verification (orange) / **VERIFY** (link)
- Documents to download: **Visa Processing Letter** — Generated / DOWNLOAD (visible to specialist only)

### Specialist form view (Step 3) — Letter Request Details
- Same fields as employee form (read-only for specialist review)
- Buttons: **Reject** | **Verify** (green)

### Verify confirmation modal (Step 4)
- Title: **Verify: Letter request details**
- Text: "By verifying the form you confirm that the form is correct and completed. Once you verify you won't be able to process it again. Would you like to proceed?"
- Buttons: Cancel / **Verify**

### After verify — Send Document (Step 1)
- Status changes to: **Completed** (green)
- Toast: "The document has been verified"
- Actions dropdown (full list): **Download** / **Send for Signature** / **Close Request** / **Edit Request** / **Send Documents** / **Add/Remove Documents** / **Cancel Request** / **Show History**

### Send Documents modal (Step 2)
- Title: **Send documents**
- Checkboxes: **Visa Processing Letter** (checked) / **Download with signed archives** (unchecked)
- Buttons: Cancel / **Send**

### After Send (Step 3)
- Toast: "All documents have been successfully sent. The recipient will receive a notification with instructions and a download link."

---

## Visa Processing Letter — Employee Download

### Employee notification email
- Subject: (via button/modal preview)
- Body: "Dear Colleague(s), We would like to inform you that the documents for [Recipient Name] are now ready to be downloaded. [Recipient Name] could click the button below to download documents."
- Button: **GO TO DOWNLOAD**

### Download page (Step 2-3)
- Tabs: **Provide Documents** | **Download Documents** (active)
- Banner: "All documents are ready to download"
- Body: "Dear Colleague, We're pleased to inform you that the documents you requested have been carefully prepared and are now ready for download."
- Button: **Download** (green)

### Closed state
- Status: **Closed** (grey)
- Closed timestamp visible (specialist view: "12 May 2026, 11:00 AM" for test request)
- All forms: Verified / VIEW

---

## LOR (Letter of Recommendation) — Employee Flow

### Step 1 — Request page (before filling)
- Status: **In progress** (blue)
- Form card: **Request details** — tag: "Fill out first" (yellow pill) / FILL IN
- Contact: **Lela Akobidze** / Lela_Akobidze@epam.com (individual contact, not team — test env specific)
- Note: Form card tag reads "Fill out first" (not "Fill the form first" as in Visa Processing) — minor UI inconsistency

### Step 2 — Employee form: Request Details
- Section header: **Employee details** (blue bar)
- Fields:
  - **Designation** — pre-filled from People system (e.g. "Business Analyst")
  - **Work Location** — pre-filled from People system (e.g. "Ukraine")
  - **Purpose** — dropdown (value seen: "Higher Education")
  - Sub-label: "Enter your purpose below (only for 'Custom' option)"
  - **Custom purpose text field** — always visible
  - **Roles & Responsibilities** — large multi-line text area
- Self-Declaration section + **Accept** checkbox (checked shown in screenshot)
- Buttons: Cancel / Save as draft / Submit

### Steps 3-4 — Submit and waiting
- Same patterns as Visa Processing Letter

---

## LOR — Specialist Flow

### Specialist request view
- Two forms:
  - **system file** (lowercase in UI) — Verified / EDIT | DOWNLOAD
  - **Request details** — Waiting for verification / **VERIFY**
- Documents to download: **LOR - Letter of Recommendation** — Generated / DOWNLOAD

### Verify modal
- Title: **Verify: Request details**
- Same body text as Visa Processing verify modal

### Send Documents modal (LOR specific)
- Checkboxes: **system file** (checked) / **LOR - Letter of Recommendation** (checked) / **Download with signed archives** (unchecked)
- NOTE: For LOR, both the system file AND the LOR letter are sent together (vs Visa Processing where only the letter is sent)

---

## LOR — Employee Download

### Actual email (Outlook view confirmed)
- Subject: **EPAM Documents: Documents are ready to be downloaded**
- Sender: Auto EPM-EOA Test Notifications
- Body: "Dear Colleague(s), We would like to inform you that the documents for **Olga Chaban** are now ready to be downloaded. Olga Chaban could click the button below to download documents."
- Button: **GO TO DOWNLOAD**

---

## Document Preview — LOR Letter Content
From File Cabinet preview (LOR - Letter of Recommendation):
- EPAM logo
- "May 12, 2026"
- "TO WHOMSOEVER IT MAY CONCERN"
- "This is to certify that - test, UID: is employed with **EPAM Systems India Private Limited** from till present date."
- "This letter is issued at the request of the employee for the purpose of **Higher Education**."
- "**Employee's Role and Responsibilities at EPAM:**" (blank if Roles & Responsibilities field left empty)
- Contact: "+91-40-47979900 or WFAHumanResourceIndia@epam.com"

## Document Preview — Visa Processing Letter Content
From specialist slide-in panel:
- "Strictly Private & Confidential"
- "TO WHOMSOEVER IT MAY CONCERN"
- "This is to confirm that -, UID: is employed with EPAM Systems India Private Limited since till present date."
- "The document is needed to confirm my employment with EPAM and that the organization has no objection to my travel during the mentioned period."
- "Travel Details: Purpose of Travel: [value] / Destination Country: [value] / Tentative Travel Dates: [start] – [end]"

---

## EPAM Specialist Dashboard

### Dashboard page
- Navigation: Dashboard | Templates | My Requests | Processes | Presets | Permissions | Files Dashboard
- Tabs: **Requests** | **People** | **Mass Requests**
- Table columns: REQUEST DATE / NAME / PROCESS / STATUS / START DATE / DUE DATE / DOCUMENTS / LOCATION
- Status values seen: Closed (grey) / Canceled (red) / In progress (blue) / Completed (green)
- Statuses confirm Track B lifecycle: In progress → Waiting for verification → Completed → Closed

### Slide-in panel (from dashboard)
- Tabs: **Documents** | **Requests**
- Shows all documents for employee: Name / Type / Status / Process / ID

### Files Dashboard page
- Filter: Country (India) / Search by name
- Columns: OWNER / FILE CATEGORY / FILE CLASS / FILE TYPE / PROCESS / DOCUMENT ID / DOCUMENT NAME / STATUS
- Compensation / LOR / Visa Processing letter categories visible

### File Cabinet (per employee)
- Employee shown with avatar
- Columns: DOCUMENT NAME / DOCUMENT ID / FILE TYPE / PROCESS / FILE CATEGORY / STATUS
- Context menu per row (Generated docs): View document / View request / Download
- Context menu per row (Created docs): View request only

---

## Status Sequence (confirmed across screenshots)
| Status | Badge color |
|---|---|
| In progress | Blue |
| Waiting for verification | Orange/yellow |
| Completed | Green |
| Closed | Grey |
| Canceled | Red |
| Verified | Green (form-level) |
| Generated | Green (document-level) |

## SVG Flow Diagram Key Facts (IndiaDOCS_flow_diagrams.DOCS_Reference_forms_13.05.2026.svg)
- "Request is auto-closed in 2(two) days after request completion by the system" — confirms D-06
- "Employee can create a new request in scope of 1(one) process only if all previous one were closed"
- "Request details form is auto-verified next day after submitting by the system"
- Swim lanes: Auto-verified letters | Letters require verification
- Track B steps: "EPAM specialist verify the request form" → "EPAM specialist send letter to employee"

---

## SVG Flow Diagram — 14.05.2026 Update (India DOCs flow diagrams - DOCS Reference forms 14.05.2026.svg)

**Process flow and Documents availability sections: unchanged from 13.05.2026.**

**NEW section added: "Statuses in DOCS"** — formal three-tier status model:

### 1. DOCS Request Statuses (request-level)
| Status | Notes |
|---|---|
| Draft | Request created, not yet submitted |
| New | Submitted, not yet picked up |
| Open | Being processed |
| In Progress | Actively in progress |
| Completed | Request fully processed |
| Closed | Auto-closed 2 days after completion |
| Rejected | Request rejected (see note below) |

> **Note:** Screenshots showed "Canceled" (red badge) on specialist dashboard. SVG uses "Rejected". May be two distinct statuses or UI inconsistency — treat as unresolved until confirmed.

### 2. Request Form (document in the request) Statuses
| Status | Meaning |
|---|---|
| Waiting for verification | Form submitted, awaiting specialist or system verification |
| Verified | Form verified by specialist (Track B) or auto-verified by system (Track A) |

### 3. Documents to Download Statuses
| Status | Meaning |
|---|---|
| Generated | Document is ready and available for download |

**Key architectural insight from the SVG:** DOCS uses three separate status objects on a single request — the request itself, the form inside it, and the downloadable document. These progress independently. Employees see all three when viewing a request page.
