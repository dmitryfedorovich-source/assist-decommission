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
- Leverage Docs platform capabilities for automated letter generation and HRBP verification workflows

---

## 3. Scope

### In Scope
- 6 reference letter types for active India employees:
  - Form 60
  - Address Proof Letter
  - Service Letter
  - Visa Processing Letter
  - Letter of Recommendation (LOR) — active employees only
  - Relocation Letter
- Auto-verification workflow for Form 60, Address Proof Letter, Service Letter
- HRBP manual verification workflow for Visa Processing Letter, LOR *(approval requirement under clarification — may be removed or redesigned prior to go-live)*
- Date-triggered auto-verification for Relocation Letter (system auto-approves on relocation date; past-date requests approved immediately)
- Employee request form with HR data pre-population
- Letter generation and download
- Request lifecycle management (completion, closure, auto-close)
- Employee notifications (submission confirmation, rejection, completion)

### Out of Scope
- LOR for ex-employees (addressed in Phase 3: Separation Letters)
- Compensation Letters (Phase 2)
- Separation Letters (Phase 3)
- Migration of historical request data from Assist
- Any Assist workflows outside of Reference Letters

---

## 4. Stakeholders

| Stakeholder | Role | Interest |
|---|---|---|
| India Employees | End users | Ability to request reference letters without disruption |
| HRBP (India) | Process approvers | Efficient review and approval workflow |
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
- IN Relocation Letter

**FR-03:** Upon selecting a letter type, the system shall create a request record and redirect the employee to the request form.

---

### 5.2 Request Form and Data Pre-Population

**FR-04:** The system shall pre-populate the following fields from HR backend systems, making them read-only for the employee:

| Field | Applicable Letters |
|---|---|
| Name | All |
| Designation | All |
| UID | Form 60, Address Proof, Service Letter, Visa Processing, LOR |
| Work Location | Service Letter, Visa Processing, LOR |
| Birth Location | Form 60 |
| Current Work Location | Relocation Letter |
| Start Date | Form 60, Address Proof, Service Letter, Visa Processing, LOR |

**FR-05:** For Address Proof Letter, the employee's address shall be pre-populated from the People system. If no address is found, the system shall display an error prompting the employee to update their People profile before submitting.

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
- Custom purpose text (text, max 100 characters) — displayed only when "Custom" is selected

**Service Letter:**
- Purpose (dropdown)

**Visa Processing Letter:**
- Purpose (dropdown, e.g. Personal Travel)
- Comments (text, max 300 characters, single line — no paragraphs)

**Relocation Letter** *(initiated by RM/HRBP, not the employee):*
- New Work Location (dropdown — list of available EPAM India office cities)
- Start/Effective Date (date picker — past dates are allowed; system auto-approves immediately for past/present dates)

**LOR — Letter of Recommendation:**
- Purpose (dropdown)
- Notes & Responsibilities (rich text editor with text formatting support)

---

### 5.4 Self-Declaration

### 5.5 Verification Routing

**FR-08:** Upon form submission, the system shall route the request according to letter type:

| Letter Type | Routing | Notes |
|---|---|---|
| Form 60 | Auto-verification | Immediate |
| Address Proof Letter | Auto-verification | Immediate |
| Service Letter | Auto-verification | Immediate |
| Visa Processing Letter | HRBP manual verification | Approval requirement under clarification — may be removed |
| LOR | HRBP manual verification | Approval requirement under clarification — may be removed |
| Relocation Letter | Date-triggered auto-verification | System auto-approves on effective date; past dates approved immediately |

**FR-09:** Auto-verified requests shall transition to **Completed** status immediately upon successful submission.

**FR-09a:** Relocation Letter requests shall be held in a **Pending** state and auto-transition to **Completed** on the specified effective date. If the effective date is equal to or earlier than the submission date, the request shall auto-complete immediately.

**FR-10:** Manually verified requests shall transition to **Pending Approval** status and appear in the HRBP's review queue.

---

### 5.6 HRBP Verification Workflow

**FR-11:** The HRBP shall be able to review all submitted request details within EPAM Docs.

**FR-12:** The HRBP shall have two actions available on a pending request:
- **Approve / Verify** — transitions the request to Completed; letter becomes available for download
- **Reject** — transitions the request to Rejected; requires HRBP to provide a rejection reason

**FR-13:** Upon rejection, the system shall notify the employee with the rejection reason provided by the HRBP.

**FR-14:** A rejected request cannot be resubmitted. The employee must initiate a new request.

---

### 5.7 Letter Generation and Download

**FR-15:** Upon request completion (auto or manual), the system shall generate the letter document and make it available in the "Documents to download" section of the request.

**FR-16:** The employee shall be able to download the generated letter as a file (PDF).

---

### 5.8 Request Lifecycle and Closure

**FR-17:** Completed requests shall remain open for employee download until explicitly closed.

**FR-18:** The HRBP shall be able to manually close a completed request.

**FR-19:** Once all forms within a request reach a final status (Verified / Generated), the system shall auto-close the request after **2 days** if no manual closure has occurred.

**FR-20:** The employee's "My Requests" tab shall display all requests with their current status (Active / Completed / Closed / Rejected).

**FR-21-a:** The system shall prevent an employee from submitting a new request for the same letter type if a previous request is still open. The minimum interval between requests is **2 days** after the previous request closes.

---

### 5.9 Notifications

**FR-22:** The system shall send notifications as follows:

| Trigger | Recipient | Content |
|---|---|---|
| Request submitted (manual verification letters) | Employee | Confirmation that request was submitted for HRBP approval |
| Request rejected | Employee | Rejection notification including HRBP-provided reason |
| Request completed | Employee | Notification that letter is ready for download |
| New request pending | HRBP | Notification of new request requiring review |

---

## 6. Integration Requirements

**IR-01:** The Docs platform shall integrate with the HR data system to retrieve and pre-populate: Name, Designation, UID, Work Location, Birth Location, Start Date.

**IR-02:** The Docs platform shall integrate with the People system to retrieve the employee's residential address for the Address Proof Letter.

**IR-03:** Data retrieved from integrated systems shall be displayed as read-only and shall not be editable by the employee on the request form.

---

## 7. Non-Functional Requirements

**NFR-01 — Availability:** The Reference Letters functionality shall be available during standard EPAM working hours for India (IST timezone), with the same SLA as the broader Docs platform.

**NFR-02 — Data accuracy:** Pre-populated employee data must reflect the current state of the HR system at the time of request creation.

**NFR-03 — Letter format:** Generated letters must conform to EPAM India official letter templates (branding, signatory details, format).

**NFR-04 — Access control:** Only the requesting employee may view and download their own letters. HRBP access is scoped to requests assigned to their region.

---

## 8. Assumptions

- EPAM Docs platform supports configurable request forms, workflow routing, and document generation natively.
- HR and People system APIs are available and accessible to the Docs platform.
- EPAM India letter templates (Form 60, Address Proof, Service Letter, Visa Processing, LOR, Relocation) exist or will be prepared by the HR team prior to go-live.
- HRBP users already have accounts and appropriate roles in EPAM Docs.
- The city list for the Relocation Letter New Work Location dropdown will be provided by India HR.

---

## 9. Dependencies

| Dependency | Owner | Impact if delayed |
|---|---|---|
| HR system integration / API availability | Docs Platform Team | Pre-population will not work; forms cannot be auto-filled |
| India letter templates finalized | India HR Team | Letter generation cannot be configured |
| HRBP onboarding to Docs platform | HR Operations | Manual verification workflow cannot function |
| Assist decommission date | EPAM Platform | Overlap period and cutover timing |

---

## 10. Risks

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| HR system data gaps (missing fields) | Medium | Medium | Identify unmapped fields early; provide manual fallback where possible |
| Address not found in People system | High | Low | System warning guides employee to update profile; documented in user guidance |
| HRBP adoption of new tool | Medium | High | Training and onboarding before go-live; include Docs workflow in India HR communication |
| Letter template approval delays | Medium | High | Start template review process in parallel with technical implementation |
| Assist cutover timing misalignment | Low | High | Confirm decommission date and plan for overlap period |

---

## 11. Timeline

| Milestone | Target Date |
|---|---|
| BRD sign-off | June 2026 |
| Docs platform configuration complete | June 2026 |
| UAT with India HRBP and pilot employees | June 2026 |
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
