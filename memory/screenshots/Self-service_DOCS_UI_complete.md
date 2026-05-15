---
name: DOCS Platform UI — Self-Service Auto-Verified Flow (all 10 screenshots)
description: Complete DOCS platform UI for employee self-service reference letter request, form fill/submit, specialist view, and download
type: project
status: active
source: input/screenshots/Self-service.Auto-verified_flow.*.png (10 screenshots, 2026-05-11)
---

## Create Request Flow (Steps 1–3)

**Step 1 — My Requests page**
- URL entry point: My Requests tab
- Sub-tabs: "Active Requests" (count badge) / "Past Requests" (count badge)
- Button: "+ Request document from EPAM" — top RIGHT corner of the page (not inline)
- Page also shows "My Documents" section below (unrelated)

**Step 2 — Letter type selection modal**
- Modal title: "Request document from EPAM"
- Subtitle: "Please select the document type"
- Dropdown shows all 5 India letter types (typed "in" to filter):
  - IN Form 60
  - IN Visa Processing Letter
  - IN Address Proof Letter
  - IN Letter of Recommendation
  - IN Service Letter
- Exact names confirmed. NO "IN Relocation Letter" in live DOCS dropdown.

**Step 3 — Confirm and create**
- After selecting, modal shows the selected type in the dropdown
- "Create request" green button + "Cancel"
- Submit confirmation dialog: "Select 'Submit' button if you are ready to submit your document. Once you have done this, you cannot modify your form any further."
- IMPORTANT: Request creation requires TWO user actions — (1) select from dropdown, (2) click "Create request". Not a single step.

---

## Fill In & Submit Form (Steps 1–3)

**Step 1 — Request page before filling**
- Status badge: "In progress" (blue)
- Right panel "Your dedicated contact point": WFA Human Resource India / WFAHumanResourceIndia@epam.com
- "Required forms" section:
  - "Request details" card with yellow "Fill the form first" label + "Please fill in the form" text + FILL IN link
- **"Documents to download" section already shows the document** — Form 60 "Generated ✓" with DOWNLOAD link — BEFORE employee fills the form (platform constraint, documented in BRD assumptions)
- "Additional Documents" section: drag-and-drop file attachment, "You can upload up to 60 file(s) (pdf, jpg/jpeg, png, tif/tiff, doc, docx, xls, xlsx, cms, asice, edoc). Max file size is 199 MB."

**Step 2 — Form content (IN Form 60 employee-filled fields)**
Form header: "Employee details" (blue section header)
Fields visible in the form:
- **Salutation** — dropdown (e.g., Mrs.) [NOT in current documentation]
- **Father name** — text input
- **Current address** — 2-line text input (address + continuation line) [current docs say "Address"]
- **Worksite city** — dropdown (e.g., Pune) [current docs separate "City" (text) and "Work Location" (pre-populated)]
- **UAN** — text input
- **Mobile number** — text input
- **PAN** — text input

Below the fields: blank rows (likely pre-populated fields from System file — not visible as they're separate)

**Self-Declaration section** (bottom of form, before Submit):
- Section label: "Self-Declaration"
- Full text: "I hereby declare that the information provided by me is true and correct. The company doesn't confirm any factual correctness of information provided by you. This Letter is being issued on your request solely for the purpose mentioned in the application. Any declaration made by you well knowing it to be false or discovered at any point of time to be false, the company can't be held accountable for issuance of such letter. You shall be held for an appropriate disciplinary action for any such discovery."
- **"Accept" checkbox** — employee must check before submitting
- Buttons: Cancel / Save as draft / Submit

**CRITICAL NOTE re D-17**: BRD FR-07/D-17 states "The Assist confirmation popup (checkbox before 'Continue') is not implemented in EPAM Docs. A static disclaimer/notice text shall be displayed at the top of each request form." HOWEVER the actual DOCS form DOES have a Self-Declaration section with "Accept" checkbox — at the BOTTOM of the form (not top). D-17 needs revision.

**Step 3 — Submit confirmation dialog**
- Dialog: "Select 'Submit' button if you are ready to submit your document. Once you have done this, you cannot modify your form any further."
- Buttons: Cancel / Save as draft / Submit
- Placeholder text shows data source hints: "Father name (reuse data from Onboarding request or manual input)", "Personal address (reuse data from People platform or manual input)", "reuse data from Onboardin..." (UAN)

---

## Specialist View (Steps 1–2)

**Step 1 — Specialist sees the request**
- Same request page as employee but with additional "System file" form in "Required forms"
- "Request recipient": named employee (e.g., Lela Akobidze / Lela_Akobidze@epam.com)
- "Contact point": named BA/PM (e.g., Olga Chaban / Olga_Chaban@epam.com)
- Required forms section now shows TWO forms:
  - Left: "Request details" — "Fill the form first" / "The form is requested" / FILL IN
  - Right (highlighted): **"System file"** — "Verified ✓" / "The form is completed" / EDIT
- "Documents to download": Form 60 "Generated ✓" / DOWNLOAD
- "Actions" dropdown visible (top right) — specialist actions

**Step 2 — System File form (pre-populated data)**
- Page title: "System File"
- Date auto-populated at top right (e.g., May 11, 2026)
- "Employee details" section:
  - **First name** — pre-populated
  - **Last name** — pre-populated
  - **Start date in EPAM India** — pre-populated (e.g., June 6, 2022)
  - **UID** — pre-populated (e.g., 617225)
  - **Email address** — pre-populated
- Button: "Submit & Verify" — specialist action
- NOTE: This "System File" is the pre-populated People system data form. NOT mentioned in any current documentation.

---

## Employee Download (Steps 1–2)

**Step 1 — After submission, before auto-verification completes**
- Status badge: "Waiting for verification" (orange/amber)
- Contact point: WFA Human Resource India / WFAHumanResourceIndia@epam.com
- "Required forms": "Request details" — "Waiting for verification" (clock icon) / VIEW
- **"Documents to download": Form 60 "Generated ✓" with DOWNLOAD available** — already downloadable even in "Waiting for verification" state

**Step 2 — Request completed**
- Status badge: "Waiting for verification" (same — nightly batch hasn't run yet)
- Document still shows Generated ✓ and DOWNLOAD available
- Employee can download immediately without waiting for batch verification

---

## Status Labels Used in DOCS

| Status | Description |
|---|---|
| In progress | Request created, form not yet submitted |
| Waiting for verification | Form submitted (applies to auto-verified during batch window AND manual verification) |
| Generated ✓ | Document is ready and downloadable |
| Verified ✓ | System file verified by specialist |
| Completed | Request fully processed (seen after batch runs) |

**Important**: BRD uses "Completed" status for auto-verified letters, but employees see "Waiting for verification" during the nightly batch window — explained by the platform constraint in BRD Section 8 Assumptions.
