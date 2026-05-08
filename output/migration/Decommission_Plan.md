# Decommission Plan — Assist → EPAM Docs
## Phase 1: Reference Letters

**Document type:** Migration Operational  
**Audience:** Internal BA team, DOCS platform team, India Team leads  
**Status:** DRAFT — requires Stage 1 internal review  
**Last updated:** May 2026

---

## 1. Overview

This plan governs the decommissioning of reference letter workflows from **assist.epam.com** and their transfer to **docs.epam.com** for India employees.

| Item | Value |
|---|---|
| Go-live / Assist retirement date | **June 30, 2026** (D-01) |
| Phase 1 letter types in scope | 5 (Form 60, Address Proof, Service Letter, Visa Processing, LOR) — per D-16 |
| Letter types deferred | Relocation Letter (Phase 4+ investigation — D-16) |
| Out of scope (Phase 1) | Ex-employee LOR, historical data migration (D-02, D-11) |
| Cancel request feature | Not in Phase 1 MVP (D-10) |

**What is being decommissioned:** The Assist portal request flows for all 5 Phase 1 letter types. Assist remains operational for other HR processes not in scope for this migration.

**What continues operating:** EPAM Docs platform at docs.epam.com. India Team specialists continue their verification role via the DV/EDV queue (D-12, D-13, D-15).

---

## 2. Key Decision References

All dates, scope, and process rules are governed by the Feedback & Decisions Log (`output/shared/Feedback_Decisions_Log.md`).

| Decision | Summary | Impact on Decommission |
|---|---|---|
| D-01 | Go-live: June 30, 2026 | Hard cutover date — Assist retirement on this date |
| D-11 | Historical data migration: out of scope | No Assist request data needs to move to DOCS |
| D-15 | RM approval removed from all Phase 1 flows | DOCS routing config applies to all 5 letters without RM involvement |
| D-16 | Relocation Letter removed from Phase 1 | Phase 4+ deferred — do not disable Relocation in Assist on June 30 |
| D-17 | Self-Declaration popup not in DOCS | Static disclaimer text in DOCS forms — no functional gate to configure |

---

## 3. Pre-Cutover Milestone Checklist

All items must be complete before the Go/No-Go decision at T-1 day. Owner to sign off each item in the Stage Sign-off table (FDL).

### Documentation sign-offs

- [ ] **Stage 1 complete** — Internal alignment (Daria, Hanna): Process Flow, BRD, Presentation reviewed with zero validate-docs errors
- [ ] **Stage 2 complete** — India SME sign-off (Satish Malla, Satya Danam, Sasanka Yedlapati): SME Validation document reviewed and signed
- [ ] **Stage 3 complete** — Post-Stage-2 iteration: all India SME feedback resolved, docs updated
- [ ] **Stage 4 complete** — Final India sign-off + UAT: all UAT test cases pass, no Blocker/Major defects open (see Test & Migration Validation Plan)

### Open questions resolved

- [ ] **OQ-05** — Service Letter: Purpose dropdown values confirmed by India Team
- [ ] **OQ-06** — Visa Processing Letter: Purpose dropdown values confirmed by India Team
- [ ] **OQ-07** — LOR: Purpose dropdown values confirmed by India Team
- [ ] **OQ-08** — Bank/SIM/LPG sub-types: approach confirmed (via Purpose dropdown or separate types)
- [ ] **OQ-11** — DOCS dev: Comments field (Visa Processing) + LOR Notes field implemented and tested
- [ ] **OQ-14** — Address Proof: address field lock/edit decision confirmed by India Team

### Platform readiness

- [ ] DOCS platform configured: all 5 letter types active
- [ ] Track A (auto-verified): Form 60, Address Proof, Service Letter routing live
- [ ] Track B (DV/EDV queue): Visa Processing, LOR routing live
- [ ] Data pre-population from People Portal: name, employee ID, designation, date confirmed working
- [ ] 2-day auto-close rule active (D-06)
- [ ] Rejection flow configured: new request, not resubmit (D-07)
- [ ] Static disclaimer text added to relevant forms (D-17)
- [ ] Stage 5 complete — Dev epics/tickets confirmed closed by DOCS platform team

---

## 4. Cutover Sequence — Phase 1 (Reference Letters)

All timings are relative to the go-live date of **June 30, 2026**.

| Milestone | Target Date | Owner | Action |
|---|---|---|---|
| T-30 days | June 1, 2026 | BA team | Send advance communication to India employees (use Communication Plan T-30 message) |
| T-30 days | June 1, 2026 | BA / Management | Distribute Phase 1 KB Onepager (04) to EPAM management |
| T-14 days | June 16, 2026 | DOCS platform team | Confirm all 5 letter types configured; routing rules active |
| T-14 days | June 16, 2026 | BA team | Distribute India Colleagues Guide (06) to India employees |
| T-14 days | June 16, 2026 | BA team | All blocking OQs must be resolved or formally accepted (with justification in FDL) |
| T-7 days | June 23, 2026 | India Team + BA | UAT sign-off (Stage 4) deadline |
| T-7 days | June 23, 2026 | BA team | Final validate-docs run — zero errors required |
| T-7 days | June 23, 2026 | All | Rollback Plan reviewed; escalation contacts confirmed |
| T-3 days | June 27, 2026 | DOCS platform team | Stage 5 dev tickets confirmed closed |
| T-1 day | June 29, 2026 | BA lead | **Go/No-Go decision** — log outcome in FDL as F-XX entry |
| T-1 day | June 29, 2026 | BA team | Send T-1 reminder communication to India employees |
| T=0 | June 30, 2026 | See Runbook | Execute Go-Live Runbook (output/migration/Go_Live_Runbook.md) |
| T+1 | July 1, 2026 | BA / India Team | Begin monitoring window (see Monitoring Plan) |

---

## 5. Assist Retirement Steps

These steps are executed on June 30, 2026 as part of the Go-Live Runbook.

| Step | Action | Responsible |
|---|---|---|
| 5.1 | Disable Assist request creation for Phase 1 letter types (Form 60, Address Proof, Service Letter, Visa Processing, LOR) | Assist platform admin |
| 5.2 | Add redirect/notice in Assist pointing users to docs.epam.com | Assist platform admin |
| 5.3 | Confirm in-progress Assist requests: communicate status to affected employees | India Team specialists |
| 5.4 | **Do NOT disable Relocation Letter in Assist** — Phase 4+ deferred (D-16) | Assist platform admin |
| 5.5 | Archive Assist letter request data per data retention policy | Data/compliance team |

**Data retention:** Per D-11, no historical data migration is in scope. Assist records must be retained according to EPAM data retention policy (confirm policy with compliance team — TBD before cutover).

---

## 6. Phase 2 / Phase 3 Cutover Notes

| Phase | Letter Types | Decommission Timing |
|---|---|---|
| Phase 2 — Compensation Letters | Salary Revision, Promotion, Increment, Variable Pay | TBD — post Phase 1 go-live |
| Phase 3 — Separation Letters | Experience Letter, Relieving Letter, LOR (ex-employees) | TBD — post Phase 2 go-live |
| Phase 4 — Relocation Letter | Relocation Letter | TBD — pending Phase 4 investigation (OQ-13) |

This plan will be extended with Phase 2/3/4 cutover sequences once those phases reach Stage 1 sign-off.

---

## 7. Escalation & Contacts

| Role | Name | Contact |
|---|---|---|
| Go/No-Go decision authority | TBD (project sponsor) | — |
| BA lead | Dzmitry Fedarovich | — |
| Internal sign-off | Daria / Hanna | — |
| India SME lead | Satish Malla | — |
| India Team SMEs | Satya Danam, Sasanka Yedlapati | — |
| DOCS platform lead | TBD | — |
| Assist platform admin | TBD | — |

> **Note:** If go-live conditions are not met at T-1 day, execute the Rollback & Recovery Plan (`output/migration/Rollback_Recovery_Plan.md`) immediately.

---

## 8. Sign-off Table

| Role | Name | Date | Status |
|---|---|---|---|
| BA lead | | | ⬜ Pending |
| Internal reviewer (Stage 1) | Daria | | ⬜ Pending |
| Internal reviewer (Stage 1) | Hanna | | ⬜ Pending |
| India SME (Stage 4) | Satish Malla | | ⬜ Pending |
| India SME (Stage 4) | Satya Danam | | ⬜ Pending |
| India SME (Stage 4) | Sasanka Yedlapati | | ⬜ Pending |
| DOCS platform team lead | | | ⬜ Pending |
