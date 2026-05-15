# Reference Letters in EPAM Docs — Solution Validation
## Review & Sign-off: India Stakeholders

**Audience:** India SMEs — Satish Malla, Satya Danam, Sasanka Yedlapati, LalithaPavani Madiraju  
**Purpose:** Confirm the proposed target-state design before development begins  
**Version:** 1.0 — Draft for review  
**Date:** May 2026

---

## How to Use This Document

For each section, please:
- ✅ **Confirm** — the proposed behavior is correct
- ❌ **Reject** — something is wrong; add your comment
- 💬 **Comment** — correct but needs clarification or a change

A **sign-off table** at the end collects final approvals.

---

## Slide 1 — What We Are Validating

We are building the **Reference Letters** workflow in EPAM Docs to replace the current Assist process. Before development begins, we need your confirmation that:

1. The 5 letter types and their behavior are correctly understood
2. The form fields match what employees need to provide
3. The routing (auto vs. India Team specialist review) is correct for each letter
4. Open design questions are resolved

**Target go-live:** June 30, 2026

---

## Slide 2 — Letter Scope

We are migrating the following 5 reference letter types in Phase 1:

| # | Letter | Requester | Processing |
|---|---|---|---|
| 1 | Form 60 | Employee | Auto-verified (instant) |
| 2 | Address Proof Letter | Employee | Auto-verified (instant) |
| 3 | Service Letter | Employee | Auto-verified (instant) |
| 4 | Visa Processing Letter | Employee | Reviewed by India Team specialist |
| 5 | Letter of Recommendation (LOR) | Employee (active employees only) | Reviewed by India Team specialist |

> **Out of scope — Phase 1:** LOR for ex-employees (handled in Separation Letters phase); Relocation Letter (separate investigation needed — see note in Slide 5)

---

**Question 2.1 — Do these 5 letters cover the full scope of Reference Letters you need in Phase 1?**

> Your answer: ___________

**Question 2.2 — Are there any additional letter sub-types or variants not listed here (e.g. Bank Letter, SIM Card Letter, LPG Letter)?**

> Your answer: ___________  
> *(Note: Our understanding is that sub-types like Bank/SIM/LPG are handled via a "Purpose" dropdown within the same base letter template — please confirm.)*

---

## Slide 3 — Auto-Verified Letters (Instant)

The following letters are generated automatically — no India Team specialist action needed.

### Form 60

| Field | Filled By | Notes |
|---|---|---|
| Date | System (DOCS) | Read-only |
| Name | System (People system) | Read-only |
| Designation | System (People system) | Read-only |
| UID | System (People system) | Read-only |
| Work Location | System (People system) | Read-only |
| Birth Location | System (People system) | Read-only |
| Start Date | System (People system) | Read-only |
| Salutation | Employee | Dropdown (e.g. Mr. / Mrs.) |
| Father Name | Employee | Text input |
| Current address | Employee | Text input (2 lines) |
| Worksite city | Employee | Dropdown |
| UAN | Employee | Text input |
| State | Employee | Text input |
| Mobile number | Employee | Text input |
| PAN | Employee | Text input |

**Behavior:** Employee submits → letter generated immediately → available for download.

---

**Question 3.1 — Form 60: Are these fields correct and complete?**
> Your answer: ___________

---

### Address Proof Letter

| Field | Filled By | Notes |
|---|---|---|
| Date | System (DOCS) | Read-only |
| Name | System (People system) | Read-only |
| Designation | System (People system) | Read-only |
| UID | System (People system) | Read-only |
| Start Date | System (People system) | Read-only |
| Address as per People | System (People system) | Read-only — if address is incorrect, employee must update profile in People system (D-20) |
| Purpose | Employee | Dropdown |
| Custom Purpose text | Employee | Text input, max 100 characters — always visible; fill in when "Custom" is selected |

**Purpose dropdown options:** Personal Loan / Home Loan / Bank Connection / New Broadband Connection / Custom

**Special behavior:** If the employee's address is not found in the People system, the system shows an error: *"Please update your address in the People system before submitting."*

---

**Question 3.2 — Address Proof Letter: Are the Purpose dropdown options correct and complete?**
> Your answer: ___________

**Question 3.3 — Is the address always reliably available in the People platform for India employees? Are there common cases where it is missing?**
> Your answer: ___________

**~~Question 3.4 (OQ-14) — Resolved~~**

> **Decision D-20 (2026-05-12):** The address field is **locked (read-only)**. Employees cannot edit the address on the form. If the address is incorrect or missing, the form displays a note directing the employee to update their People system profile.

---

### Service Letter

| Field | Filled By | Notes |
|---|---|---|
| Date | System (DOCS) | Read-only |
| Name | System (People system) | Read-only |
| Designation | System (People system) | Read-only |
| UID | System (People system) | Read-only |
| Work Location | System (People system) | Read-only |
| Start Date | System (People system) | Read-only |
| Purpose | Employee | Dropdown |
| Custom field details | Employee | Text input |

---

**Question 3.5 — Service Letter: What values should be available in the Purpose dropdown?**
> Your answer: ___________

---

## Slide 4 — Review-Required Letters

The following letters are routed to India Team specialists for review before the letter is generated.

### Visa Processing Letter

| Field | Filled By | Notes |
|---|---|---|
| Date | System (DOCS) | Read-only |
| Name | System (People system) | Read-only |
| Designation | System (People system) | Read-only |
| UID | System (People system) | Read-only |
| Work Location | System (People system) | Read-only |
| Start Date | System (People system) | Read-only |
| Purpose | Employee | Dropdown (e.g. Personal Travel, Business Travel) |
| Comments | Employee | **Required.** Max 300 characters, single line, no paragraphs |

**Behavior:** Employee submits → EPAM specialist (DV/EDV) reviews and verifies → manually sends document to employee via "Send Document" action → employee receives notification and downloads letter. Document is not visible to employee before the specialist sends it. If incorrect: specialist rejects with required comment → employee is notified → employee edits and resubmits same form → specialist re-verifies. No limit on resubmissions.

---

**Question 4.1 — Visa Processing Letter: Are the Purpose dropdown options correct? Please list the required values.**
> *(We expect: Business Travel, Personal Travel — please confirm or correct.)*
> Your answer: ___________

---

### Letter of Recommendation (LOR)

| Field | Filled By | Notes |
|---|---|---|
| Date | System (DOCS) | Read-only |
| Name | System (People system) | Read-only |
| Designation | System (People system) | Read-only |
| UID | System (People system) | Read-only |
| Work Location | System (People system) | Read-only |
| Start Date | System (People system) | Read-only |
| Purpose | Employee | Dropdown |
| Custom field details | Employee | Text input |
| Notes & Responsibilities | Employee | **Required.** Multi-line plain text, paragraphs supported, max ~1000 chars |

**Behavior:** Active employee submits → EPAM specialist (DV/EDV) reviews and verifies → manually sends document to employee via "Send Document" action → employee downloads. Document is not visible before the specialist sends it. If incorrect: specialist rejects with required comment → employee edits and resubmits same form → specialist re-verifies. No limit on resubmissions.  
**LOR for ex-employees:** Out of scope for Phase 1 — handled in Separation Letters.

---

**Question 4.2 — LOR: What values should be in the Purpose dropdown?**
> Your answer: ___________

---

## Slide 5 — Relocation Letter — Not in Phase 1

> **The Relocation Letter has been moved out of Phase 1 scope.** We need more information before we can design this process for DOCS. We will address it in a separate later phase.
>
> Before scoping, we need to understand: what is the purpose of this letter, what triggers it, which employees receive it, and whether it can be auto-triggered from the People system. We will reach out separately with questions.

No validation questions for Relocation Letter at this stage.

---

## Slide 6 — Common Behaviors (All Letters)

Please confirm these behaviors apply consistently.

### Form Submission — Self-Declaration Checkbox

In Assist, a popup with a checkbox appeared before employees could press "Continue" to submit a request. **DOCS implements a Self-Declaration section at the bottom of each request form** with a full disclaimer text and an **"Accept" checkbox** that the employee must tick before clicking Submit. *(D-21 — confirmed from DOCS platform, 2026-05-13. Updates D-17.)*

**Question 6.0 — Is the Self-Declaration text correct and acceptable for EPAM India?**
> *(Current text: "I hereby declare that the information provided by me is true and correct. The company doesn't confirm any factual correctness of information provided by you. This Letter is being issued on your request solely for the purpose mentioned in the application. Any declaration made by you well knowing it to be false or discovered at any point of time to be false, the company can't be held accountable for issuance of such letter. You shall be held for an appropriate disciplinary action for any such discovery.")*
> Your answer: ___________

---

### Request Rejection
- EPAM specialist rejects the form/document with a **required comment** (mandatory — cannot reject without comment)
- System notifies the employee with the rejection reason
- Employee opens the **same rejected form**, makes corrections, and resubmits
- System notifies EPAM specialist to re-verify
- **No limit** on how many times the form can be rejected and resubmitted

*(Behavior confirmed 2026-05-12 — Q6.1 answered.)*

---

### Auto-Close
- Once a request reaches final status (letter generated), it auto-closes after **2 days** if the India Team specialist has not closed it manually

**Question 6.2 — Auto-close: Is 2 days the correct interval, or should it be different?**
> Your answer: ___________

---

### New Request Cooldown
- An employee cannot submit a new request for the same letter type while a previous request is still open
- Minimum interval: previous request must be closed first (closure takes up to 2 days)

**Question 6.3 — Cooldown: Is this behavior acceptable to users?**
> Your answer: ___________

---

### Notifications
Employees receive system notifications for:
- Request submitted (for review-required letters)
- Request approved / letter ready for download
- Request rejected (with reason)

India Team specialist receives a notification for each new request pending review.

**Question 6.4 — Notifications: Is this set sufficient, or are additional notification triggers needed?**
> Your answer: ___________

---

## Slide 7 — Data Pre-Population

The system pre-fills employee data automatically — employees cannot edit these fields.

| Field | Source System | Letters |
|---|---|---|
| Date | DOCS system (auto) | All 5 letters |
| Name | People system | All 5 letters |
| Designation | People system | All 5 letters |
| UID | People system | All 5 letters |
| Work Location | People system | Form 60, Service Letter, Visa Processing, LOR |
| Birth Location | People system | Form 60 |
| Start Date | People system | All 5 letters |
| Address | People system | Address Proof only (read-only — D-20) |

**Question 7.1 — Are there any fields currently missing that should be pre-populated from HRMS/People systems?**
> Your answer: ___________

**Question 7.2 — Are there fields we list as pre-populated that should instead be manually entered by the employee?**
> Your answer: ___________

---

## Slide 8 — Out of Scope — Confirming Boundaries

Please confirm the following items are correctly excluded from Phase 1.

| Item | Our Understanding | Your Confirmation |
|---|---|---|
| Relocation Letter | Out of scope — Phase 1. Requires further investigation before scoping. | _____ |
| LOR for ex-employees | Out of scope — Phase 3 | _____ |
| Cancel request by requester | Nice to have — NOT in Phase 1 | _____ |
| Historical request data migration from Assist | Out of scope | _____ |
| RM initiating requests on behalf of employees | RM does not have direct access to create DOCS requests for other employees. RM routes via ServiceNow → India Team specialist. | _____ |

---

## Slide 9 — Sign-off

By signing below, you confirm that the proposed solution for Reference Letters in EPAM Docs correctly represents the required behavior for Phase 1.

| Name | Role | Status | Comments | Date |
|---|---|---|---|---|
| Satish Malla | India Stakeholder | ☐ Approved ☐ Changes needed | | |
| Satya Danam | India Stakeholder | ☐ Approved ☐ Changes needed | | |
| Sasanka Yedlapati | Assist SME | ☐ Approved ☐ Changes needed | | |
| LalithaPavani Madiraju | India People Ops | ☐ Approved ☐ Changes needed | | |

---

## Appendix — Open Questions Summary

| # | Question | Owner | Status |
|---|---|---|---|
| OQ-01 | Visa Processing Letter: India Team specialist approval — keep or remove? | Darya Taranda / India Team | Resolved — D-12: RM approval removed; DV/EDV (India Team specialist) verifies and manually sends document |
| OQ-02 | LOR: India Team specialist approval — keep or remove? | Darya Taranda / India Team | Resolved — D-13: RM approval removed; DV/EDV (India Team specialist) verifies and manually sends document |
| OQ-03 | LOR: Can RM initiate on behalf of employee? | India Team | Resolved — No; employee self-service for active employees; ex-employee LOR via India Team specialist in Separation module |
| OQ-04 | Relocation Letter: City list for New Work Location dropdown | India HR | **Deferred** — Relocation Letter moved to Phase 4+ (D-16) |
| OQ-05 | Service Letter: Purpose dropdown values | India HR | Open — Question 3.5 |
| OQ-06 | Visa Processing Letter: Purpose dropdown values | India HR | Open — Question 4.1 |
| OQ-07 | LOR: Purpose dropdown values | India HR | Open — Question 4.2 |
| OQ-08 | Bank/SIM/LPG sub-types: handled via Purpose dropdown on base template? | India Team | Open — Question 2.2 |
| OQ-13 | Relocation Letter: purpose, trigger, eligibility, auto-trigger feasibility — questions to follow separately | India Team / Hanna Vasilenka | Open — separate discussion |
| OQ-14 | Address Proof Letter: employee manual address edit — lock or allow? | India Team | **Resolved — D-20: field is locked (read-only); update via People system** |
