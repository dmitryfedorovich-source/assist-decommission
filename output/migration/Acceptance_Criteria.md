# Acceptance Criteria — Definition of Done
## Phase 1: Reference Letters

**Document type:** Migration Governance  
**Audience:** BA team, internal reviewers, India Team leads  
**Status:** DRAFT  
**Source:** Consolidated from `docs/architecture/limitations-framework.md` §6 and FDL Stage Sign-off table  
**Last updated:** May 2026

---

## 1. Phase 1 Definition of Done

Phase 1 is complete and ready for go-live when **all** of the following are satisfied:

### 1.1 Documentation: all validate-docs checks pass

Run `/validate-docs` — the output must show **zero ❌ Errors** across all Phase 1 output docs.

| Document | Required state |
|---|---|
| `01 — Process Flow` | Zero errors; all 5 letter types present; both routing tracks described; notifications table present; Relocation Letter in out-of-scope section |
| `02 — BRD` | Zero errors; all Phase 1 FRs complete; integration requirements section present; sign-off table populated |
| `03 — Internal Presentation` | Zero errors; routing slides for Track A and Track B present; field spec table complete; config checklist covers all 5 letter types |
| `04 — KB Onepager` | Zero errors; no "HRBP"; go-live date June 30, 2026 (D-01); Relocation Letter not shown as Phase 1 scope; Phase 4 card present in roadmap |
| `05 — India SME Validation` | Zero errors; all 5 letter types have a review section; Relocation Letter has "not in Phase 1" notice; sign-off table complete with India stakeholder names |
| `06 — India Colleagues Guide` | Zero errors; no migration rationale; no HRBP; all 5 letter types listed; dates correct; step-by-step instructions actionable |

Warnings (⚠️) must be reviewed. Each warning must be either resolved or explicitly accepted with a note added to FDL.

### 1.2 Stage sign-offs (all 5 stages)

| Stage | Required sign-off | Acceptance condition |
|---|---|---|
| Stage 1 — Internal | Daria + Hanna | Both reviewers confirm: process flow, BRD, and presentation are correct and complete |
| Stage 2 — India SME | Satish Malla + Satya Danam + Sasanka Yedlapati | All three confirm: 05_India_SME_Validation.md reviewed; no blocking concerns; sign-off table signed |
| Stage 3 — Iteration | BA team | All Stage 2 feedback items resolved; no open Stage 2 action items remain; validate-docs re-run shows zero errors |
| Stage 4 — Final + UAT | India Team + BA lead | All UAT test cases pass (see Test Validation Plan §5); zero Blocker/Major defects open; India Team sign-off on 05 renewed after Stage 3 changes |
| Stage 5 — Dev handoff | DOCS platform team | All dev epics/tickets accepted; platform team confirms go-live readiness |

### 1.3 Open questions resolved or formally accepted

The following OQs must be resolved (or formally accepted with justification in FDL) before Stage 4 sign-off:

| OQ | Question summary | Required action |
|---|---|---|
| OQ-05 | Service Letter Purpose dropdown values | India Team to confirm values |
| OQ-06 | Visa Processing Purpose dropdown values | India Team to confirm values |
| OQ-07 | LOR Purpose dropdown values | India Team to confirm values |
| OQ-08 | Bank/SIM/LPG sub-types approach | India Team (Sasanka) to confirm |
| OQ-11 | DOCS dev: Comments + LOR Notes fields | DOCS platform team to confirm implementation |
| OQ-14 | Address Proof: lock or allow address edit | India Team to confirm preference |

### 1.4 Platform acceptance criteria

All UAT smoke test cases (Go-Live Runbook §5) pass with no Blocker or Major defects open.

### 1.5 Go/No-Go gate (T-1 day)

The following must all be true on June 29, 2026:

- [ ] All 5 stage sign-offs obtained
- [ ] All blocking OQs resolved or formally accepted
- [ ] validate-docs clean (zero errors)
- [ ] Rollback plan reviewed; escalation contacts confirmed
- [ ] Employee communication (T-1 reminder) sent

---

## 2. Per-Stage Acceptance Detail

### Stage 1 — Internal Sign-off

**Entry:** All 6 Phase 1 output docs exist in a reviewable state  
**Activities:** Daria and Hanna review 01–06 for factual accuracy, completeness, and process correctness  
**Exit criteria:**
- All validate-docs errors resolved
- No factual contradictions with FDL locked decisions (D-01 through D-17)
- Process flow covers both Track A and Track B
- BRD FRs are complete and sequentially numbered with no gaps

### Stage 2 — India SME Sign-off

**Entry:** Stage 1 complete; 05_India_SME_Validation.md shared with India Team  
**Activities:** India SME team reviews 05; confirms field specs, routing, Purpose dropdown answers  
**Exit criteria:**
- 05_India_SME_Validation.md sign-off table signed by Satish Malla, Satya Danam, Sasanka Yedlapati
- All answer fields in 05 completed or marked "TBD pending OQ resolution"
- OQ-05/06/07/08 status updated in FDL based on India Team responses

### Stage 3 — Post-Feedback Iteration

**Entry:** Stage 2 feedback received  
**Activities:** BA team applies all Stage 2 corrections; re-runs validate-docs  
**Exit criteria:**
- All corrections from Stage 2 reflected in output docs
- validate-docs: zero errors
- F-XX entry added to FDL for each correction batch applied

### Stage 4 — Final Sign-off + UAT

**Entry:** Stage 3 complete; DOCS platform configured and ready for UAT  
**Activities:** India Team + BA execute test cases TC-01 through TC-09 (Test Validation Plan §5)  
**Exit criteria:**
- Zero Blocker/Major defects open
- All Minor defects triaged (fix committed or deferred with justification)
- Stage 4 sign-off table signed

### Stage 5 — Dev Handoff

**Entry:** Stage 4 signed; dev tickets written  
**Activities:** DOCS platform team reviews and accepts all epics/tickets  
**Exit criteria:**
- All epics/tickets accepted into DOCS platform sprint/backlog
- No rejected tickets without resolution path
- DOCS platform team confirms go-live readiness in writing

---

## 3. What Acceptance Does Not Cover

The following are **explicitly out of scope** for Phase 1 acceptance:

- Relocation Letter (Phase 4+ — D-16)
- Ex-employee LOR (Phase 3 — D-02)
- Historical Assist data migration (D-11)
- Cancel request feature (D-10)
- Phase 2 / Phase 3 letter types
