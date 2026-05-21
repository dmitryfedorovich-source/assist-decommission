# Test & Migration Validation Plan
## Phase 1: Reference Letters — Assist → EPAM Docs

**Document type:** Migration Validation  
**Audience:** BA team, India Team specialists, DOCS platform team  
**Status:** DRAFT — requires Stage 1 internal review  
**Last updated:** May 2026

---

## 1. Objectives

This document defines the test scope, test phases, UAT test cases, and acceptance criteria for validating that Phase 1 reference letter workflows are correctly implemented in EPAM Docs.

**Test objectives:**

1. Validate all 5 Phase 1 letter types (Form 60, Address Proof, Service Letter, Visa Processing, LOR) work end-to-end in DOCS per D-16
2. Confirm routing tracks behave per confirmed decisions: Track A auto-verified including Visa Processing (D-24); Track B DV/EDV manual verification for LOR (D-13)
3. Confirm field pre-population works from People Portal data (domain_rules.md — Data Pre-population Rules)
4. Confirm rejection flow: specialist comment required, rejected form editable and resubmittable, specialist re-notified on resubmit (D-07); confirm forbidden behaviors absent: RM approval (D-15), "Country" field (D-09), WFH toggle (D-17)
5. Confirm all validate-docs checks pass across all Phase 1 output documents

---

## 2. Scope

| In scope | Out of scope |
|---|---|
| All 5 Phase 1 letter types (Form 60, Address Proof, Service Letter, Visa Processing, LOR) | Relocation Letter — Phase 4+ investigation (D-16) |
| Track A (auto-verified) routing for 4 letter types | Historical data / Assist data migration (D-11) |
| Track B (DV/EDV manual) routing for LOR | Cancel request feature (D-10) |
| Employee-facing request flow | Phase 2 / Phase 3 letter types |
| India Team DV/EDV queue and "Send Document" flow | Ex-employee LOR (D-02) |
| Notifications (employee + India Team) | Nomination Form / Phase 3 items |
| Letter generation and download | |
| Lifecycle events: auto-close (D-06), rejection (D-07) | |
| Self-Declaration Accept checkbox (D-21) | |

---

## 3. Test Phases

Tests are conducted in alignment with the 5 sign-off stages in the Feedback & Decisions Log.

| Phase | Stage | Who conducts | Entry criteria | Exit criteria |
|---|---|---|---|---|
| **Phase A — Document review** | Stage 1 — Internal | BA team (Daria, Hanna) | All 6 Phase 1 output docs drafted | Zero validate-docs errors; all output docs reviewed and approved |
| **Phase B — India SME review** | Stage 2 — India SME | Satish Malla, Satya Danam, Sasanka Yedlapati | Stage 1 signed off | India SME Validation doc (05) reviewed; sign-off table completed |
| **Phase C — Iteration** | Stage 3 — Post-feedback | BA team | Stage 2 feedback received | All Stage 2 comments resolved; docs updated; re-run validate-docs: zero errors |
| **Phase D — Platform UAT** | Stage 4 — Final sign-off + UAT | India Team + BA team | Stage 3 complete; DOCS platform configured | All UAT test cases pass (Section 5); no Blocker/Major defects open; sign-off table completed |
| **Phase E — Dev handoff** | Stage 5 — Dev handoff | DOCS platform team | Stage 4 signed | All epics/tickets confirmed accepted by DOCS platform team |

### validate-docs gate

Run `/validate-docs` at entry to each Phase A and C. The output must show zero `❌ Errors` before proceeding. Warnings (⚠️) must be reviewed and either resolved or explicitly accepted with a note in FDL.

---

## 4. Validation Checks — Alignment with validate-docs

Phases A–C validate documents. Phase D validates the DOCS platform implementation. Both run the same validate-docs skill; Phase D adds hands-on UAT (Section 5).

| validate-docs Check | What it tests | When it applies |
|---|---|---|
| Check 1 — Factual accuracy | Output docs match locked decisions in FDL | Phases A, B, C, D |
| Check 2 — Forbidden phrases | No RM approval, July 1, HRBP in wrong docs, Country field, WFH, etc. | Phases A, B, C, D |
| Check 3 — OQ cross-references | Cited OQs exist; resolved OQs not described as open | Phases A, B, C, D |
| Check 4 — Terminology consistency | Letter names, platform names, role names consistent | Phases A, B, C, D |
| Check 5 — Structural completeness | Each doc has required sections per its type | Phases A, B, C, D |
| Check 6 — Audience fit | Management / SME / employee tone rules followed | Phases A, B, C, D |
| Check 7 — Internal coherence | No contradictions, no orphaned placeholders | Phases A, B, C, D |
| Check 8 — Traceability | RTM rows, Source Index, OQ Impact Map complete | Phase A, C |
| Check 9 — Confidence quality | Uncertainty markers appropriate per doc type | Phase A, C |
| Check 10 — Stale detection | No superseded decisions, stale memory files, orphaned pending markers | Phases A, C |

---

## 5. UAT Test Cases (Phase D — Stage 4)

UAT is conducted on the DOCS platform in production or staging environment. India Team specialists execute Track B test cases; BA team executes Track A cases.

### TC-01 — Employee Request Submission & Field Pre-population

**Applies to:** All 5 letter types  
**Precondition:** Tester has a valid EPAM employee account with complete People Portal profile

| Sub-case | Letter type | Verify |
|---|---|---|
| TC-01a | Form 60 | Name, employee ID, designation, joining date pre-populated from People Portal |
| TC-01b | Address Proof | Address fields pre-populated from People Portal; address-not-found warning shown if missing |
| TC-01c | Service Letter | Employee details pre-populated; Purpose dropdown present |
| TC-01d | Visa Processing | Comments field present (max 300 chars, single line — D-09); employee details pre-populated |
| TC-01e | LOR | Notes/Responsibilities field present (multi-line — D-13); employee details pre-populated |

**Pass criteria:** All fields match People Portal data; no blank mandatory fields; no "Country" field on Visa Processing (D-09); no WFH toggle on any form (D-17).

---

### TC-02 — Track A Auto-Verification Flow

**Applies to:** Form 60, Address Proof, Service Letter, Visa Processing Letter (D-15, D-24)

| Step | Action | Expected result |
|---|---|---|
| 1 | Employee submits request | Request created; status moves to processing |
| 2 | System auto-verifies | Letter generated without any India Team action |
| 3 | Employee notified | Employee receives notification that letter is ready |
| 4 | Employee downloads letter | Letter downloads successfully; content matches request |

**Pass criteria:** No India Team action required. No RM approval step present. Letter generated within the DOCS platform's auto-verify timing window (OQ-11 pending — timing TBD). No "Country" field or WFH toggle visible.

---

### TC-03 — Track B DV/EDV Manual Verification Flow

**Applies to:** LOR (D-13)

| Step | Action | Expected result |
|---|---|---|
| 1 | Employee submits request | Request created; enters DV/EDV queue; does NOT auto-generate |
| 2 | India Team specialist opens queue | Request visible in queue; all employee details and employee-entered fields visible |
| 3 | Specialist verifies document | Verification action available (no RM approval option — D-15) |
| 4 | Specialist uses "Send Document" | Letter sent to employee |
| 5 | Employee notified | Employee receives notification |
| 6 | Employee accesses letter | Letter accessible; content correct |

**Pass criteria:** No RM approval option at any step. Request does not auto-generate. DV/EDV specialist can verify and send without any external approval dependency.

---

### TC-04 — Rejection Flow

**Applies to:** All letter types that can be rejected (Track B: LOR)

| Step | Action | Expected result |
|---|---|---|
| 1 | India Team specialist attempts to reject without a comment | System blocks rejection — comment is required |
| 2 | Specialist rejects with a comment | Request status: Rejected; rejection reason visible to employee |
| 3 | Employee receives rejection notification | Notification includes rejection reason |
| 4 | Employee opens the same rejected form | Form is editable; employee can correct the data |
| 5 | Employee resubmits the corrected form | System notifies India Team specialist for re-verification |
| 6 | Repeat rejection/resubmit cycle | No limit — process repeats until specialist approves |

**Pass criteria:** Rejection comment is mandatory. Rejected form remains open and editable. Employee can resubmit without creating a new request. Specialist receives re-verification notification on each resubmission.

---

### TC-05 — Auto-Close

**Applies to:** All letter types  
**Note:** Full functional test requires waiting 2 days. For go-live UAT, confirm the rule is configured; functional verification is post-go-live.

| Verify | Expected |
|---|---|
| Auto-close rule is configured: 2 days after all forms reach final status (D-06) | Config confirmed by DOCS platform team in writing |

**Pass criteria:** DOCS platform team confirms 2-day auto-close is active; no "10 days" configuration present.

---

### TC-06 — Download

**Applies to:** All letter types  
**Precondition:** TC-02 or TC-03 completed (letter is in "Generated" state)

| Step | Action | Expected result |
|---|---|---|
| 1 | Employee clicks download | Letter downloads as PDF |
| 2 | PDF opens | Content is correct; EPAM India company details present; no blank fields |

**Pass criteria:** PDF downloads successfully. Content matches the request. Letter is in the expected format.

---

### TC-07 — Notifications

**Applies to:** All letter types

| Trigger | Expected recipients | Expected content |
|---|---|---|
| Request submitted | Employee (confirmation) | Request received; reference number |
| Track B request enters queue | India Team specialists | New verification request pending |
| Letter generated (Track A) | Employee | Letter is ready for download |
| Letter sent by specialist (Track B) | Employee | Letter is available |
| Request rejected | Employee | Request rejected; rejection reason included |
| Request resubmitted after rejection | India Team specialist (DV/EDV) | Resubmitted request awaiting re-verification |

**Pass criteria:** All expected notifications sent to expected recipients. No extraneous notifications.

---

### TC-08 — Address Proof: Address-Not-Found Warning

**Applies to:** Address Proof Letter only

| Step | Action | Expected result |
|---|---|---|
| 1 | Employee with no address in People Portal submits Address Proof request | Warning shown: address not found, update People Portal profile first |
| 2 | Warning visible before submission completes | Employee can see warning and take action |

**Pass criteria:** Warning is shown. Employee is not allowed to generate an address proof with empty address field.

---

### TC-09 — Self-Declaration Accept Checkbox

**Applies to:** All 5 India letter types (D-21)

| Verify | Expected |
|---|---|
| Self-Declaration section visible at bottom of form | 'Accept' checkbox present and enabled (D-21) |
| Employee must tick checkbox before Submit | Submit button activates only after checkbox is ticked |

**Pass criteria:** Accept checkbox visible, ticked by employee, Submit enabled. No static-text-only form (D-17 superseded by D-21).

---

## 6. Defect Classification

| Severity | Definition | Examples | Resolution required by |
|---|---|---|---|
| **Blocker** | Prevents letter generation or core flow completion | DOCS down, Track A doesn't generate, Track B never enters queue, download fails | Before Stage 4 sign-off — must be fixed |
| **Major** | Incorrect data, wrong routing, wrong notification | Wrong field pre-populated, RM approval step present, rejection comment not required, form not editable after rejection, "Country" field present | Before Stage 4 sign-off — must be fixed |
| **Minor** | Cosmetic, non-blocking, UX text issues | Wrong button label, UI spacing, non-critical notification wording | Before Stage 5 (dev handoff) |
| **Observation** | Suggestion, improvement, not a defect | "Would be better if…" | Log as OQ-XX or note for future phase |

Any open Blocker or Major defect = Stage 4 sign-off cannot be granted = go-live not approved.

---

## 7. Sign-off Table

| Stage | Role | Name | Date | Status |
|---|---|---|---|---|
| Stage 1 | Internal reviewer | Daria | | ⬜ Pending |
| Stage 1 | Internal reviewer | Hanna | | ⬜ Pending |
| Stage 2 | India SME | Satish Malla | | ⬜ Pending |
| Stage 2 | India SME | Satya Danam | | ⬜ Pending |
| Stage 2 | India SME | Sasanka Yedlapati | | ⬜ Pending |
| Stage 3 | BA lead (iteration complete) | | | ⬜ Pending |
| Stage 4 | India Team UAT | Satish Malla | | ⬜ Pending |
| Stage 4 | BA lead (UAT witnessed) | | | ⬜ Pending |
| Stage 5 | DOCS platform team | | | ⬜ Pending |
