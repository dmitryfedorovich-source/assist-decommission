# Business Requirements Document
## Reference Letters Migration: Assist → EPAM Docs

**Version:** 1.0  
**Status:** Draft  
**Date:** May 2026  
**Project Phase:** Phase 1 — Reference Letters

---

## 1. Business Context

EPAM India employees currently use **assist.epam.com** to request official HR reference letters. Assist is being decommissioned as part of EPAM's platform consolidation. **docs.epam.com** is the designated successor platform for document workflows across EPAM.

This document defines the business requirements for migrating the Reference Letters functionality from Assist to the EPAM Docs platform.

---

## 2. Objectives

- Replicate and improve the Reference Letters request process within EPAM Docs
- Eliminate dependency on the Assist platform for India HR letter workflows
- Maintain continuity of service for India employees with no degradation in experience
- Leverage Docs platform capabilities for automated letter generation and India Team specialist verification workflows

---

## 3. Scope

### In Scope
- 5 reference letter types for active India employees:
  - Form 60
  - Address Proof Letter
  - Service Letter
  - Visa Processing Letter
  - Letter of Recommendation (LOR) — active employees only
- Auto-verification workflow for Form 60, Address Proof Letter, Service Letter
- India Team specialist (DV/EDV) manual verification workflow for Visa Processing Letter, LOR — specialist verifies then manually sends document to employee (D-12, D-13)
- Employee request form with HR data pre-population
- Letter generation and download
- Request lifecycle management (completion, closure, auto-close)
- Employee notifications (submission confirmation, rejection, completion, document sent)

### Out of Scope
- **Relocation Letter** — deferred to Phase 4+ pending investigation (D-16); purpose and trigger mechanism need clarification before scoping
- LOR for ex-employees (addressed in Phase 3: Separation Letters)
- Compensation Letters (Phase 2)
- Separation Letters (Phase 3)
- Migration of historical request data from Assist
- Cancel request by requester (nice to have — not in Phase 1 MVP)
- Any Assist workflows outside of Reference Letters

---

## 4. Stakeholders

| Stakeholder | Role | Interest |
|---|---|---|
| India Employees | End users | Ability to request reference letters without disruption |
| India Team specialists (DV/EDV) | Process verifiers | Efficient verification and document delivery workflow |
| Docs Platform Team | Implementation owners | Clear requirements for platform configuration |
| EPAM India HR Management | Business owners | Compliance, process continuity, go-live readiness |

---

## 5. Functional Requirements

### 5.1 Letter Request Initiation

**FR-01:** The system shall provide a "Request document from EPAM" entry point accessible from the employee's "My Requests" tab in EPAM Docs.

**FR-02:** The system shall present a dropdown list of available letter types for India employees:
- IN Form 60
- IN Address Proof Letter
- IN Service Letter
- IN Visa Processing Letter
- IN Letter of Recommendation

**FR-03:** Upon selecting a letter type, the system shall create a request record and redirect the employee to the request form.

---

### 5.2 Request Form and Data Pre-Population

**FR-04:** The system shall pre-populate the following fields from HR backend systems, making them read-only for the employee:

| Field | Applicable Letters |
|---|---|
| Name | All 5 letters |
| Designation | All 5 letters |
| UID | All 5 letters |
| Work Location | Service Letter, Visa Processing, LOR |
| Birth Location | Form 60 |
| Start Date | All 5 letters |

**FR-05:** For Address Proof Letter, the employee's address shall be pre-populated from the People system. The employee may edit this field if the pre-populated value is outdated. If no address is found, the system shall display an error prompting the employee to update their People profile before submitting.

> **OQ-14:** India team to confirm whether the address field should be editable by the employee, or locked (forcing People Portal update).

---

### 5.3 Employee-Entered Fields

**FR-06:** Each letter type shall include the following manually entered fields:

**Form 60:**
- Father Name (text)
- PAN (text)
- Address (text)
- Mobile number (text)

**Address Proof Letter:**
- Purpose (dropdown): Personal Loan, Home Loan, Bank Connection, New Broadband Connection, Custom
- Custom purpose text (text, max 100 characters) — always visible; employee fills in when "Custom" is selected

**Service Letter:**
- Purpose (dropdown — values pending India team confirmation, OQ-05)

**Visa Processing Letter:**
- Purpose (dropdown, e.g. Business Travel, Personal Travel — full list pending India team confirmation, OQ-06)
- Comments (text, max 300 characters, single line — no paragraphs; requires new text field component development, OQ-11)

**LOR — Letter of Recommendation:**
- Purpose (dropdown — values pending India team confirmation, OQ-07)
- Notes & Responsibilities (multi-line plain text input — no formatting; requires new text field component development, OQ-11). **Note:** Client names must not be included in this field (confirmed by Satish Malla).

> **OQ-08:** Bank/SIM/LPG letter variants (Bank Letter, SIM Card Letter, LPG Letter) are expected to be handled via a "Purpose" dropdown selection on the same base Address Proof Letter or Service Letter template — not as separate letter types. India team to confirm this sub-type handling approach at Stage 2 review.

---

### 5.4 Verification Routing

> **FR-07:** The Assist confirmation popup (checkbox before "Continue") is not implemented in EPAM Docs. A static disclaimer/notice text shall be displayed at the top of each request form in its place (D-17).

**FR-08:** Upon form submission, the system shall route the request according to letter type:

| Letter Type | Routing | Notes |
|---|---|---|
| Form 60 | Auto-verification | Immediate |
| Address Proof Letter | Auto-verification | Immediate |
| Service Letter | Auto-verification | Immediate |
| Visa Processing Letter | India Team specialist (DV/EDV) verification | Specialist verifies → "Send Document" → employee downloads; document hidden until sent (D-12) |
| LOR | India Team specialist (DV/EDV) verification | Same flow as Visa Processing (D-13) |

**FR-09:** Auto-verified requests shall transition to **Completed** status immediately upon successful submission. Letter is available for download.

**FR-10:** Manually verified requests shall transition to **Pending Verification** status and appear in the India Team specialist's review queue.

---

### 5.5 India Team Specialist Verification Workflow

**FR-11:** The India Team specialist (DV/EDV) shall be able to review all submitted request details within EPAM Docs.

**FR-12:** The India Team specialist shall have two actions available on a pending request:
- **Verify** — specialist verifies the request; then manually triggers **"Send Document"** action to make the letter available to the employee
- **Reject** — transitions the request to Rejected; requires specialist to provide a rejection reason

**FR-12a:** The document shall **not** be visible or downloadable by the employee until the India Team specialist sends it via the "Send Document" action.

**FR-13:** Upon rejection, the system shall notify the employee with the rejection reason provided by the specialist.

**FR-14:** A rejected request cannot be resubmitted. The employee must initiate a new request.

---

### 5.6 Letter Generation and Download

**FR-15:** Upon request completion (auto or manual), the system shall generate the letter document and make it available in the "Documents to download" section of the request.

**FR-16:** The employee shall be able to download the generated letter as a file (PDF).

---

### 5.7 Request Lifecycle and Closure

**FR-17:** Completed requests shall remain open for employee download until explicitly closed.

**FR-18:** The India Team specialist shall be able to manually close a completed request.

**FR-19:** Once all forms within a request reach a final status (Verified / Generated), the system shall auto-close the request after **2 days** if no manual closure has occurred.

**FR-20:** The employee's "My Requests" tab shall display all requests with their current status (Active / Completed / Closed / Rejected).

**FR-21:** The system shall prevent an employee from submitting a new request for the same letter type if a previous request is still open. The minimum interval between requests is **2 days** after the previous request closes.

---

### 5.8 Notifications

**FR-22:** The system shall send notifications as follows:

| Trigger | Recipient | Content |
|---|---|---|
| Request submitted (manual verification letters) | Employee | Confirmation that request was submitted for India Team specialist review |
| Request rejected | Employee | Rejection notification including rejection reason provided by specialist |
| Document sent (manual verification letters) | Employee | Notification that letter is ready for download |
| Request completed (auto-verified letters) | Employee | Notification that letter is ready for download |
| New request pending | India Team specialist (DV/EDV) | Notification of new request requiring review |

---

## 6. Integration Requirements

**IR-01:** The Docs platform shall integrate with the HR data system to retrieve and pre-populate: Name, Designation, UID, Work Location, Birth Location, Start Date.

**IR-02:** The Docs platform shall integrate with the People system to retrieve the employee's residential address for the Address Proof Letter.

**IR-03:** Data retrieved from integrated systems shall be displayed as read-only and shall not be editable by the employee on the request form, with the exception of the Address Proof Letter address field which is pre-populated but editable (pending OQ-14 India team confirmation).

---

## 7. Non-Functional Requirements

**NFR-01 — Availability:** The Reference Letters functionality shall be available during standard EPAM working hours for India (IST timezone), with the same SLA as the broader Docs platform.

**NFR-02 — Data accuracy:** Pre-populated employee data must reflect the current state of the HR system at the time of request creation.

**NFR-03 — Letter format:** Generated letters must conform to EPAM India official letter templates (branding, signatory details, format).

**NFR-04 — Access control:** Only the requesting employee may view and download their own letters. India Team specialist access is scoped to requests assigned to their region.

---

## 8. Assumptions

- EPAM Docs platform supports configurable request forms, workflow routing, and document generation natively.
- HR and People system APIs are available and accessible to the Docs platform.
- EPAM India letter templates (Form 60, Address Proof, Service Letter, Visa Processing, LOR) exist or will be prepared by the HR team prior to go-live.
  - **LOR template:** The COVID-related paragraph present in the current Assist LOR template is confirmed outdated (Satish Malla, Apr 2026) and must be removed from the DOCS LOR template before go-live.
- India Team specialist (DV/EDV) users already have accounts and appropriate roles in EPAM Docs.
- **DOCS platform technical constraints (accepted for Phase 1 MVP):**
  - *Auto-verify timing:* DOCS auto-verification runs as a nightly batch job — not real-time. Employee may see request in "In Verification" status until the next day's job completes; this is cosmetic only and does not block letter download after completion.
  - *Download button visibility:* DOCS displays the download button before the employee submits the form. This cannot be blocked without custom development. Mitigation: "Fill form first" instructional label and user guide note. Accepted by India team (2026-05-07).
  - *One request per process:* An employee cannot create a new request for the same letter type while a previous request is still open. New request can only be submitted after the previous one closes (minimum 2 days per auto-close rule, D-06).
  - *Custom Purpose text field:* DOCS cannot conditionally show or hide fields based on dropdown selection. The custom purpose text field on the Address Proof Letter is always visible; employees fill it in only when they select "Custom" from the Purpose dropdown. Same 100-character limit as in Assist.

---

## 9. Dependencies

| Dependency | Owner | Impact if delayed |
|---|---|---|
| HR system integration / API availability | Docs Platform Team | Pre-population will not work; forms cannot be auto-filled |
| India letter templates finalized (5 types) | India HR Team | Letter generation cannot be configured |
| India Team specialist onboarding to Docs | HR Operations | Manual verification workflow cannot function |
| Assist decommission date | EPAM Platform | Overlap period and cutover timing |

---

## 10. Risks

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| HR system data gaps (missing fields) | Medium | Medium | Identify unmapped fields early; provide manual fallback where possible |
| Address not found in People system | High | Low | System warning guides employee to update profile; documented in user guidance |
| India Team specialist adoption of new tool | Medium | High | Training and onboarding before go-live; include Docs workflow in India HR communication |
| Letter template approval delays | Medium | High | Start template review process in parallel with technical implementation |
| Assist cutover timing misalignment | Low | High | Confirm decommission date and plan for overlap period |

---

## 11. Timeline

| Milestone | Target Date |
|---|---|
| BRD sign-off | June 2026 |
| Docs platform configuration complete | June 2026 |
| UAT with India Team specialists and pilot employees | June 2026 |
| Go-live: Reference Letters in Docs | **June 30, 2026** |
| Assist Reference Letters decommissioned | June 30, 2026 |

---

## 12. Approval

| Role | Name | Signature | Date |
|---|---|---|---|
| Business Owner | | | |
| Docs Platform Lead | | | |
| India HR Representative | | | |
| Project Manager | | | |
