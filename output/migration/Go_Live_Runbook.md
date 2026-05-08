# Go-Live Runbook
## Phase 1: Reference Letters — June 30, 2026

**Document type:** Migration Operational  
**Audience:** BA lead, DOCS platform team, India Team specialists, Assist admin  
**Status:** DRAFT — requires Stage 4 review before execution  
**Last updated:** May 2026

---

## 1. Purpose & Scope

This runbook provides the step-by-step procedure for executing the Phase 1 go-live on **June 30, 2026** (D-01). It covers pre-go-live preparation, the cutover execution, smoke testing, and immediate post-go-live actions.

**Letter types going live:** Form 60, Address Proof, Service Letter, Visa Processing, LOR (5 types — D-16)  
**Routing:** Track A (auto-verified): Form 60, Address Proof, Service Letter | Track B (DV/EDV manual): Visa Processing, LOR (D-15)  
**Not in scope for this runbook:** Relocation Letter (Phase 4+, D-16), Phase 2/3 letters

If any go/no-go gate below fails, stop execution and follow the Rollback & Recovery Plan (`output/migration/Rollback_Recovery_Plan.md`).

---

## 2. Roles & Contacts

| Role | Responsibility on go-live day | Contact |
|---|---|---|
| Run owner (BA lead) | Coordinates all steps; makes go/no-go calls | Dzmitry Fedarovich |
| Internal reviewer | Confirms docs are clean before cutover | Daria / Hanna |
| DOCS platform contact | Confirms platform config; executes platform steps | TBD |
| India Team specialist lead | Confirms DV/EDV queue access; validates Track B | Satish Malla |
| Assist platform admin | Disables Assist flows; adds redirect notice | TBD |
| BA backup | Covers run owner if unavailable | TBD |

All contacts must be reachable from **June 29, 17:00 IST through June 30, 18:00 IST**.

---

## 3. Pre-Go-Live Checklists

### T-30 Days (June 1, 2026)

- [ ] Stage 1 sign-off obtained (Daria, Hanna)
- [ ] Communication Plan T-30 message sent to India employees
- [ ] Phase 1 KB Onepager (04) distributed to management

### T-14 Days (June 16, 2026)

- [ ] DOCS platform: all 5 letter types configured and accessible in staging/UAT
- [ ] Track A routing: Form 60, Address Proof, Service Letter auto-verified — confirmed
- [ ] Track B routing: Visa Processing, LOR enter DV/EDV queue — confirmed
- [ ] Data pre-population: People Portal fields (name, ID, designation, joining date) confirmed working
- [ ] Static disclaimer text present on relevant forms (D-17)
- [ ] 2-day auto-close rule configured (D-06)
- [ ] Rejection flow: employee directed to open new request, not resubmit (D-07)
- [ ] Comments field for Visa Processing: max 300 chars, single line (D-09) — OQ-11 resolved
- [ ] LOR Notes/Responsibilities field: multi-line text (D-13) — OQ-11 resolved
- [ ] All blocking OQs resolved or formally accepted with FDL notes
- [ ] India Colleagues Guide (06) distributed to India employees
- [ ] Stage 2 sign-off obtained (Satish Malla, Satya Danam, Sasanka Yedlapati)

### T-7 Days (June 23, 2026)

- [ ] Stage 4 UAT sign-off obtained — all test cases pass (see Test Validation Plan)
- [ ] validate-docs run: **zero errors** across all Phase 1 output docs
- [ ] Stage 5: dev tickets and epics confirmed closed by DOCS platform team
- [ ] Rollback & Recovery Plan reviewed; escalation contacts confirmed available
- [ ] Assist admin briefed on cutover steps and rollback trigger criteria

### T-1 Day (June 29, 2026)

- [ ] Final validate-docs run — result: zero errors
- [ ] DOCS platform confirmed up and responsive
- [ ] **Go/No-Go decision** held — outcome logged in FDL as F-XX
- [ ] T-1 reminder communication sent to India employees
- [ ] All contacts (Section 2) confirmed available for June 30

**If Go/No-Go is NO-GO:** stop here and execute Rollback & Recovery Plan Section 4.

---

## 4. Go-Live Execution (T=0, June 30, 2026)

Execute steps in order. Each step has a checkpoint — do not proceed to the next step if the checkpoint fails.

### Step 1 — Confirm DOCS Platform Availability

| Action | Checkpoint | Failure action |
|---|---|---|
| Open docs.epam.com and confirm it is accessible | Page loads; no maintenance/outage notices | Trigger RT-01 rollback |
| Confirm letter request creation is functional (create one test request) | Test request created successfully | Trigger RT-01 rollback |

**Responsible:** DOCS platform contact  
**Target time:** June 30, 07:00 IST

### Step 2 — Execute Smoke Tests (Section 5)

Run all smoke tests per letter type before disabling Assist.

**Responsible:** BA lead + India Team specialist lead  
**Target time:** June 30, 07:00–09:00 IST

If any smoke test fails for a letter type: do not proceed. Triage issue — if not resolvable within 1 hour, trigger rollback.

### Step 3 — Disable Assist Reference Letter Flows

Only execute after smoke tests pass for all 5 letter types.

| Action | Checkpoint |
|---|---|
| Disable Form 60 request creation in Assist | Flow no longer accessible to employees |
| Disable Address Proof request creation in Assist | Flow no longer accessible |
| Disable Service Letter request creation in Assist | Flow no longer accessible |
| Disable Visa Processing request creation in Assist | Flow no longer accessible |
| Disable LOR request creation in Assist | Flow no longer accessible |
| **Leave Relocation Letter ENABLED in Assist** (D-16) | Relocation flow still accessible |

**Responsible:** Assist platform admin  
**Target time:** June 30, 09:00–10:00 IST

### Step 4 — Enable Redirect Notice in Assist

| Action | Checkpoint |
|---|---|
| Add redirect notice in Assist: "Reference letters are now available at docs.epam.com" | Notice visible to employees accessing Assist for letter requests |

**Responsible:** Assist platform admin  
**Target time:** June 30, 10:00 IST

### Step 5 — Notify India Team Specialists

| Action | Checkpoint |
|---|---|
| Send go-live notification to Satish Malla, Satya Danam, Sasanka Yedlapati | Confirmation received from at least one India Team specialist |
| Confirm DV/EDV queue is accessible and functioning in DOCS | India Team specialist confirms queue access |

**Responsible:** BA lead  
**Target time:** June 30, 10:00 IST

### Step 6 — Log Go-Live Event in FDL

| Action |
|---|
| Add F-XX entry to `output/shared/Feedback_Decisions_Log.md`: date June 30 2026, all steps executed, smoke test results, go-live confirmed |
| Update RTM and `docs/data/decisions.yaml` if any new decisions were made during go-live |

**Responsible:** BA lead  
**Target time:** June 30, 12:00 IST

---

## 5. Smoke Tests — Per Letter Type

Execute before disabling Assist (Step 2). One test per letter type is sufficient for go-live validation; full UAT was completed at Stage 4.

For each test: confirm the complete flow end-to-end.

### Track A — Auto-Verified Letters

**Form 60**
- [ ] Employee submits Form 60 request
- [ ] Form pre-populates: name, employee ID, designation, joining date (from People Portal)
- [ ] Request auto-verified — letter generated without manual action
- [ ] Employee can download the generated letter

**Address Proof Letter**
- [ ] Employee submits Address Proof request
- [ ] Address pulled from People Portal; address-not-found warning appears if missing
- [ ] Purpose dropdown present; custom purpose field visible (100-char limit)
- [ ] Request auto-verified — letter generated
- [ ] Employee can download the generated letter

**Service Letter**
- [ ] Employee submits Service Letter request
- [ ] Purpose dropdown present
- [ ] Request auto-verified — letter generated
- [ ] Employee can download the generated letter

### Track B — DV/EDV Manual Verification

**Visa Processing Letter**
- [ ] Employee submits Visa Processing request
- [ ] Comments field present (max 300 chars, single line — D-09)
- [ ] Request enters DV/EDV queue (does not auto-generate)
- [ ] India Team specialist (Sasanka / test account) verifies request in queue
- [ ] Specialist uses "Send Document" to deliver letter to employee
- [ ] Employee receives/can access the letter

**LOR (Letter of Recommendation)**
- [ ] Employee submits LOR request
- [ ] Notes/Responsibilities field present (multi-line — D-13)
- [ ] Request enters DV/EDV queue
- [ ] India Team specialist verifies and sends document
- [ ] Employee receives/can access the letter

### Cross-Cutting Checks

- [ ] 2-day auto-close: confirm rule is configured (functional test not required on go-live day — D-06)
- [ ] Rejection: confirm reject option routes to "new request" instruction, not resubmit (D-07)
- [ ] Static disclaimer text visible on at least one form (D-17)

---

## 6. Post-Go-Live Monitoring (T+1 Through T+7)

Refer to the Monitoring Plan (`output/migration/Monitoring_Plan.md`) for full metrics and alert thresholds.

**Daily actions (T+1 through T+7):**

- [ ] Check DOCS: letter requests submitted count per type (verify non-zero after Day 1)
- [ ] Check Track B queue: no unprocessed Visa Processing or LOR requests older than 24h
- [ ] Check for employee support tickets or complaints (India Team reports)
- [ ] Confirm Assist redirect notice is still in place

**Day 3 (July 3, 2026):**
- [ ] Produce first Reconciliation Report (use template `output/migration/Reconciliation_Report_Template.md`)

**Day 7 (July 7, 2026):**
- [ ] Stakeholder check-in call with Satish Malla
- [ ] Log any issues as new OQ-XX or F-XX entries in FDL

---

## 7. Escalation Procedure

| Severity | Condition | Action | SLA |
|---|---|---|---|
| **Severity 1** | DOCS platform down; letters cannot be generated | Trigger rollback (RT-01) — notify all contacts; keep Assist flows available | Decision within 2 hours |
| **Severity 2** | Routing issue: Track A not auto-verifying, or Track B not entering DV/EDV queue | Notify India Team specialists; India Team uses manual workaround if possible; log as F-XX; DOCS platform team to fix | Workaround within 4 hours |
| **Severity 3** | Data issue: wrong field values, address not pre-populated, wrong letter content | Log as new OQ-XX or F-XX in FDL; no rollback; fix in next DOCS platform release | Log within 24 hours |
| **Severity 4** | Minor UX issues, cosmetic errors | Log as F-XX; no immediate action | Log within 3 business days |

---

## 8. Post-Go-Live Sign-off

Completed after Day 7 monitoring confirms stable operation.

| Role | Name | Date | Status |
|---|---|---|---|
| BA lead (confirms go-live complete) | | | ⬜ Pending |
| DOCS platform lead (confirms platform stable) | | | ⬜ Pending |
| India Team lead (confirms India Team operational) | Satish Malla | | ⬜ Pending |
