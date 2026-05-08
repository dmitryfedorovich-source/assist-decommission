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
| Name | System (HR) | Read-only |
| Designation | System (HR) | Read-only |
| UID | System (HR) | Read-only |
| Birth Location | System (HR) | Read-only |
| Start Date | System (HR) | Read-only |
| Father Name | Employee | Text input |
| PAN | Employee | Text input |
| Address | Employee | Text input |
| Mobile | Employee | Text input |

**Behavior:** Employee submits → letter generated immediately → available for download.

---

**Question 3.1 — Form 60: Are these fields correct and complete?**
> Your answer: ___________

---

### Address Proof Letter

| Field | Filled By | Notes |
|---|---|---|
| Name | System (HR) | Read-only |
| Designation | System (HR) | Read-only |
| UID | System (HR) | Read-only |
| Address | System (People platform) | Pre-filled from People; employee can edit if needed |
| Start Date | System (HR) | Read-only |
| Purpose | Employee | Dropdown |
| Custom Purpose text | Employee | Text input, max 100 characters — always visible; fill in when "Custom" is selected |

**Purpose dropdown options:** Personal Loan / Home Loan / Bank Connection / New Broadband Connection / Custom

**Special behavior:** If the employee's address is not found in the People platform, the system shows an error: *"Please update your address in the People system before submitting."*

---

**Question 3.2 — Address Proof Letter: Are the Purpose dropdown options correct and complete?**
> Your answer: ___________

**Question 3.3 — Is the address always reliably available in the People platform for India employees? Are there common cases where it is missing?**
> Your answer: ___________

**⚠️ Question 3.4 (OQ-14) — Address Proof Letter: The pre-filled address can be edited by the employee directly in the form. Is this acceptable, or should the field be locked so employees must update their address in the People system first?**
> Your answer: ___________

---

### Service Letter

| Field | Filled By | Notes |
|---|---|---|
| Name | System (HR) | Read-only |
| Designation | System (HR) | Read-only |
| UID | System (HR) | Read-only |
| Work Location | System (HR) | Read-only |
| Start Date | System (HR) | Read-only |
| Purpose | Employee | Dropdown |

---

**Question 3.5 — Service Letter: What values should be available in the Purpose dropdown?**
> Your answer: ___________

---

## Slide 4 — Review-Required Letters

The following letters are routed to India Team specialists for review before the letter is generated.

### Visa Processing Letter

| Field | Filled By | Notes |
|---|---|---|
| Name | System (HR) | Read-only |
| Designation | System (HR) | Read-only |
| UID | System (HR) | Read-only |
| Work Location | System (HR) | Read-only |
| Start Date | System (HR) | Read-only |
| Purpose | Employee | Dropdown (e.g. Personal Travel, Business Travel) |
| Comments | Employee | Max 300 characters, single line — no paragraphs |

**Behavior:** Employee submits → India Team specialist (DV/EDV) reviews and verifies → manually sends document to employee via "Send Document" action → employee receives notification and downloads letter. Document is not visible to employee before the specialist sends it. If incorrect: specialist rejects → employee notified with reason → employee opens a new request.

---

**Question 4.1 — Visa Processing Letter: Are the Purpose dropdown options correct? Please list the required values.**
> *(We expect: Business Travel, Personal Travel — please confirm or correct.)*
> Your answer: ___________

---

### Letter of Recommendation (LOR)

| Field | Filled By | Notes |
|---|---|---|
| Name | System (HR) | Read-only |
| Designation | System (HR) | Read-only |
| UID | System (HR) | Read-only |
| Work Location | System (HR) | Read-only |
| Start Date | System (HR) | Read-only |
| Purpose | Employee | Dropdown |
| Notes & Responsibilities | Employee | Plain text, multi-line (no formatting) |

**Behavior:** Active employee submits → India Team specialist (DV/EDV) reviews and verifies → manually sends document to employee via "Send Document" action → employee downloads. Document is not visible before the specialist sends it. If incorrect: specialist rejects → employee opens a new request.  
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

### Form Submission — No Confirmation Popup

In Assist, a popup with a checkbox appeared before employees could press "Continue" to submit a request. **DOCS does not support this popup.** Instead, a brief disclaimer text will appear at the top of the form — employees read it and proceed directly to filling in the form without clicking a checkbox.

**Question 6.0 — Is replacing the Assist confirmation popup with a static text notice acceptable?**
> Your answer: ___________

---

### Request Rejection
- India Team specialist can reject a request with a reason
- Employee is notified with the rejection reason
- Employee must **open a new request** — rejected requests cannot be resubmitted

**Question 6.1 — Rejection flow: Is "open a new request" correct, or should there be a resubmit option on the same request?**
> Your answer: ___________

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
| Name | HR system | All 5 letters |
| Designation | HR system | All 5 letters |
| UID | HR system | All 5 letters |
| Work Location | HR system | Service Letter, Visa Processing, LOR |
| Birth Location | HR system | Form 60 |
| Start Date | HR system | All 5 letters |
| Address | People platform | Address Proof only |

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
| OQ-14 | Address Proof Letter: employee manual address edit — lock or allow? | India Team | Open — Question 3.4 |
