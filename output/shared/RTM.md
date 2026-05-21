# Requirements Traceability Matrix
## Assist → EPAM Docs Migration | All Phases

**Maintained by:** BA team  
**Source of truth:** `output/shared/Feedback_Decisions_Log.md`  
**Last updated:** 2026-05-08

---

## How to Use

| Goal | Go to |
|---|---|
| A decision changed — what docs need updating? | Section 1 (Decision × Document) + Section 5 |
| A decision changed — what workflows are affected? | Section 2 (Decision × Workflow) |
| An OQ just resolved — what docs need updating? | Section 3 (OQ Impact Map) |
| Who confirmed this decision and when? | Section 4 (Source Index) |
| Adding a new decision or OQ — what to update? | `memory/traceability/templates.md` |

---

## Section 1: Decision × Document Matrix

**Legend:**  
✓ = document must directly reflect this decision ("Reflected in" column in Feedback Log)  
↻ = indirect impact — review when decision changes  
— = not applicable  
*(S)* = superseded decision — applies to Phase 4+ planning only, not validated in Phase 1 output docs

**Document codes:**  
PF = 01 Process Flow · BRD = 02 BRD · PRES = 03 Internal Presentation  
KB1 = 04 KB Onepager Ph1 · SME = 05 India SME Validation · CG = 06 Colleagues Guide  
KB2 = Phase 2 Onepager · KB3 = Phase 3 Onepager

### Phase 1 Decisions

| Decision | Summary | PF | BRD | PRES | KB1 | SME | CG | KB2 | KB3 |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| D-01 | Go-live: June 30, 2026 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| D-02 | LOR ex-employees: out of Phase 1 scope | ✓ | ✓ | ↻ | — | ✓ | — | — | ↻ |
| D-03 *(S)* | Relocation Letter: auto-approved on effective date | — | — | — | — | — | — | — | — |
| D-04 *(S)* | Relocation Letter: past-date allowed, auto-approved | — | — | — | — | — | — | — | — |
| D-05 *(S)* | Relocation Letter: RM/India Team initiates | — | — | — | — | — | — | — | — |
| D-06 | Auto-close: 2 days after all forms reach final status | ✓ | ✓ | ↻ | ↻ | — | ↻ | — | — |
| D-07 | Rejection: specialist required comment → employee edits &amp; resubmits same form → specialist re-verifies (no limit) | ✓ | ✓ | ↻ | — | ↻ | ✓ | — | — |
| D-08 | Terminology: "India Team specialists" not "HRBP" | — | — | — | ✓ | ✓ | ✓ | ✓ | ✓ |
| D-09 | Visa Processing: Comments field, max 300 chars | ✓ | ✓ | ↻ | — | ✓ | — | — | — |
| D-10 | Cancel request: not in Phase 1 MVP | — | ✓ | — | — | — | — | — | — |
| D-11 | Historical data migration: out of scope | — | ✓ | — | — | — | — | — | — |
| D-12 *(S)* | Visa Processing: DV/EDV verifies → Send Document; superseded for routing by D-24 | ↻ | ↻ | ↻ | — | ↻ | — | — | — |
| D-13 | LOR: DV/EDV verifies → Send Document; Notes multi-line | ✓ | ✓ | ↻ | — | ↻ | ↻ | — | — |
| D-14 *(S)* | Relocation Letter: India Team specialist initiates only | — | — | — | — | — | — | — | — |
| D-15 | RM verification removed from ALL Phase 1 letters | ✓ | ✓ | ↻ | — | ↻ | ↻ | — | — |
| D-16 | Relocation Letter removed from Phase 1 → Phase 4+ | ✓ | ✓ | ↻ | ✓ | ✓ | ↻ | ↻ | ↻ |
| D-17 | Self-Declaration: static disclaimer text, no popup | ✓ | ✓ | ↻ | — | ✓ | — | — | — |
| D-18 | Comments (Visa Processing) and Notes & Responsibilities (LOR) are required fields | ✓ | ✓ | — | — | ✓ | — | — | — |
| D-19 | Approval comment unavailable — comment only required on rejection | ✓ | ✓ | — | — | — | — | — | — |
| D-20 | Address Proof Letter address field: read-only (locked); update via People system (OQ-14 resolved) | ✓ | ✓ | ✓ | — | ✓ | — | — | — |
| D-21 | Self-Declaration checkbox confirmed in DOCS — updates D-17: Accept checkbox at bottom of form (not static text at top) | ✓ | ✓ | ✓ | — | ✓ | ↻ | — | — |
| D-22 | Form 60 field updates: Salutation (dropdown) added; "Address" → "Current address"; "City" (text) → "Worksite city" (dropdown) | ✓ | ✓ | ✓ | — | ✓ | ✓ | — | — |
| D-23 | Track A letters (Form 60, Address Proof, Service Letter) — India SME validation approved (D-23); proceed to development | — | — | — | — | ✓ | — | — | — |
| D-24 | Visa Processing Letter: Track A routing (no approval, notification checkbox) — supersedes D-12 routing *(verbal 18.05.2026, written pending)* | ✓ | ✓ | ↻ | — | ↻ | ↻ | — | — |

### Phase 2 Decisions

| Decision | Summary | PF | BRD | PRES | KB1 | SME | CG | KB2 | KB3 |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| D-P2-01 | 4 compensation letter types in scope | — | — | — | ↻ | — | — | ✓ | — |
| D-P2-02 | Employee acceptance: one-click Accept + timestamp | — | — | — | ↻ | — | — | ✓ | — |
| D-P2-03 | PAN-number PDF password protection | — | — | — | ↻ | — | — | ✓ | — |
| D-P2-04 | INR currency format for all amounts | — | — | — | — | — | — | ✓ | — |
| D-P2-05 | Auto-close ~1 week after letter generated | — | — | — | ↻ | — | — | ✓ | — |
| D-P2-06 | Single base template + conditional text blocks | — | — | — | — | — | — | ✓ | — |
| D-P2-07 | Confidentiality notice: inline paragraph in letter | — | — | — | — | — | — | ✓ | — |

### Phase 3 Decisions

| Decision | Summary | PF | BRD | PRES | KB1 | SME | CG | KB2 | KB3 |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| D-P3-01 | Ex-employee data on People platform: min 2 years | — | — | — | — | — | — | — | ✓ |
| D-P3-02 | People platform collects personal email pre-exit | — | — | — | — | — | — | — | ✓ |

---

## Section 2: Decision × Workflow Matrix

**Workflow codes:**  
Trk-A = Auto-verified track (Form 60, Address Proof, Service Letter, Visa Processing *(D-24, 18.05.2026)*)  
Trk-B = Manual verify track (LOR only — DV/EDV specialist; Visa Processing moved to Trk-A by D-24)  
Lifecycle = Auto-close, rejection, status transitions  
Form-UI = Form fields, pre-population, disclaimer text  
P2-Batch = Phase 2 compensation XLS batch upload flow  
P3-HRMS = Phase 3 separation HRMS integration / ex-employee flow

| Decision | Summary | Trk-A | Trk-B | Lifecycle | Form-UI | P2-Batch | P3-HRMS |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|
| D-01 | Go-live date | — | — | ↻ | — | ↻ | ↻ |
| D-06 | Auto-close 2 days | — | — | ✓ | — | — | — |
| D-07 | Rejection = edit &amp; resubmit same form | — | — | ✓ | — | — | — |
| D-09 | Visa Comments field (not Country) | — | ✓ | — | ✓ | — | — |
| D-12 | Visa DV/EDV verifies → Send Document *(superseded for routing by D-24)* | — | ↻ | ↻ | — | — | — |
| D-24 | Visa Processing Letter: Track A (notification checkbox, no approval) | ✓ | — | ↻ | ✓ | — | — |
| D-13 | LOR DV/EDV verifies → Send Document + Notes field | — | ✓ | ↻ | ✓ | — | — |
| D-15 | RM verification removed from all Phase 1 letters | ✓ | ✓ | — | — | — | — |
| D-16 | Relocation Letter removed from Phase 1 | ✓ | ✓ | — | ✓ | — | — |
| D-17 | Static disclaimer text (no popup) — superseded by D-21 | ✓ | ✓ | — | ✓ | — | — |
| D-20 | Address Proof: address locked (read-only), update via People system | ✓ | ✓ | — | ✓ | — | — |
| D-21 | Self-Declaration Accept checkbox at bottom of form (updates D-17) | ✓ | ✓ | — | ✓ | — | — |
| D-22 | Form 60: Salutation added; "Current address"; "Worksite city" dropdown | ✓ | ✓ | — | ✓ | ✓ | — |
| D-P2-01 | 4 compensation letter types | — | — | — | — | ✓ | — |
| D-P2-02 | Accept button + timestamp | — | — | ↻ | — | ✓ | — |
| D-P2-03 | PAN protection | — | — | — | ↻ | ✓ | — |
| D-P2-05 | Auto-close ~1 week | — | — | ✓ | — | ↻ | — |
| D-P3-01 | Ex-employee data 2 years | — | — | — | — | — | ✓ |
| D-P3-02 | Personal email collected pre-exit | — | — | — | — | — | ✓ |

---

## Section 3: OQ Impact Map

When an Open Question resolves, update all documents in the "Update on resolution" column and mark status Resolved in the Feedback Log.

| OQ-ID | Phase | Summary | Status | Update on resolution |
|---|---|---|---|---|
| OQ-05 | 1 | Service Letter: Purpose dropdown values | Open | PF (field table), BRD (FR spec), SME (answer blank) |
| OQ-06 | 1 | Visa Processing Letter: Purpose dropdown values | Open | PF (field table), BRD (FR spec), SME (answer blank) |
| OQ-07 | 1 | LOR: Purpose dropdown values | Open | PF (field table), BRD (FR spec), SME (answer blank) |
| OQ-08 | 1 | Bank/SIM/LPG sub-types via Purpose dropdown | Open | PF, BRD, SME |
| OQ-09 | Cross | Nomination Form (Form F, Form 2): scope and phase assignment | Open | Assign to phase → create new phase onepager or add to phase scope |
| OQ-11 | 1 | DOCS dev: Comments field (Visa) + LOR Notes field | Open | BRD (FR implementation spec), PRES (dev actions slide) |
| OQ-12 | 2 | Compensation acceptance: activity log vs Accept button | Open | KB2 (flow description), future Phase 2 BRD |
| OQ-13 | 4 | Relocation Letter Phase 4 investigation (5 questions) | Open | Phase 4 scope document (to be created once answered) |
| OQ-15 | 1 | LOR Track B: RM approval solution required *(Visa Processing resolved by D-24, 18.05.2026)* | Open — LOR only | BRD (FR for LOR Track B), 01 (Track B flow), dev planning |
| OQ-16 | 1 | Track A forms — employee-filled fields to pre-populate from People/DOCS (awaiting Satish email) | Open | 01 (field tables), 02 (FR field spec), 05 (validation section) |
| OQ-14 | 1 | Address Proof: editable address or locked to People Portal? | **Resolved — D-20** | PF ✓, BRD ✓, PRES ✓, SME ✓, 07 ✓ |
| OQ-P2-02 | 2 | PAN-number PDF protection: DOCS feasibility | Open | KB2 (security section), future Phase 2 BRD |
| OQ-P3-02 | 3 | Separation letter auto-trigger from People system | Open | KB3 (trigger section), future Phase 3 BRD |
| OQ-P3-03 | 3 | Nominee Details: DOCS self-service + migration scope | Open | Phase scoping → assign to phase, then future phase onepager |
| OQ-P3-04 | 3 | Ex-employee DOCS access via personal email | Open | KB3 (access section), future Phase 3 BRD |

---

## Section 4: Source Index

Evidence behind each decision — used for audit trail and change justification.

| D-ID | Source Type | Source Reference | Source Date | Confidence |
|---|---|---|---|---|
| D-01 | Official document | EPMEOADOCS Confluence discovery page | 2026-04-16 | Authoritative |
| D-02 | Internal agreement | BA team internal | — | High |
| D-03 *(S)* | Official document | EPMEOADOCS Confluence discovery page | 2026-04-16 | Superseded by D-16 |
| D-04 *(S)* | Official document | EPMEOADOCS Confluence discovery page | 2026-04-16 | Superseded by D-16 |
| D-05 *(S)* | Stakeholder input | Stakeholder input | — | Superseded by D-16 |
| D-06 | Stakeholder confirmation | India stakeholder verbal confirmation | — | High |
| D-07 | Stakeholder confirmation | India stakeholder verbal confirmation | — | High |
| D-08 | Internal alignment | Daria Taranda / Hanna Vasilenka internal rule | — | Authoritative |
| D-09 | Stakeholder confirmation | India stakeholder verbal confirmation | — | High |
| D-10 | Official document | EPMEOADOCS Confluence discovery page | 2026-04-16 | Authoritative |
| D-11 | Official document | EPMEOADOCS Confluence discovery page | 2026-04-16 | Authoritative |
| D-12 | KB page content | Darya Taranda, Reference Letters KB page (EPMEOADOCS) | 2026-05-06 | Authoritative |
| D-13 | KB page content | Darya Taranda, Reference Letters KB page (EPMEOADOCS) | 2026-05-06 | Authoritative |
| D-14 *(S)* | Meeting + internal review | Olga Chaban, DOCS internal review | 2026-05-06 | Superseded by D-16 |
| D-15 | Meeting transcript | Darya Taranda decision, confirmed in DOCS internal review | 2026-05-05 | Authoritative |
| D-16 | Meeting transcript | Dzmitry Fedarovich / Hanna Vasilenka / Darya Taranda meeting | 2026-05-07 | Authoritative |
| D-17 | Meeting transcript | Dzmitry Fedarovich / Darya Taranda / Hanna Vasilenka meeting | 2026-05-07 | Superseded by D-21 |
| D-21 | DOCS platform screenshots | DOCS platform UI, IN Form 60 auto-verified flow | 2026-05-13 | High (visual confirmation) |
| D-22 | DOCS platform screenshots | DOCS platform UI, IN Form 60 Request Details form | 2026-05-13 | High (visual confirmation) |
| D-P2-01 | Stakeholder call | Satish Malla (India HR) call | 2026-05-04 | Authoritative |
| D-P2-02 | Stakeholder call | Satish Malla (India HR) call | 2026-05-04 | Authoritative |
| D-P2-03 | Stakeholder call | Satish Malla (India HR) call | 2026-05-04 | Authoritative |
| D-P2-04 | Stakeholder call | Satish Malla (India HR) call | 2026-05-04 | Authoritative |
| D-P2-05 | Stakeholder call | Satish Malla (India HR) call | 2026-05-04 | Authoritative |
| D-P2-06 | KB page + stakeholder call | KB Open Questions page + Satish Malla confirmation | 2026-05-07 | Authoritative |
| D-P2-07 | Meeting transcript | Darya Taranda / Hanna Vasilenka / Dzmitry Fedarovich meeting | 2026-05-07 | Authoritative |
| D-18 | Data file | Assist reference letters data file (input 12.05.2026) | 2026-05-12 | Authoritative |
| D-23 | India SME meeting | Satish Malla India SME validation meeting | 2026-05-14 | Authoritative |
| D-24 | Stakeholder verbal (Teams) | Satish Malla verbal via Hanna Vasilenka Teams message; written confirmation pending | 2026-05-18 | Medium (verbal only; written confirmation awaited) |
| D-19 | Data file | Assist reference letters data file (input 12.05.2026) | 2026-05-12 | Authoritative |
| D-20 | Data file | Assist reference letters data file (input 12.05.2026) — address field comment | 2026-05-12 | Authoritative |
| D-P3-01 | Stakeholder call | Dzmitry Fedarovich (People team) call | 2026-05-04 | Authoritative |
| D-P3-02 | Stakeholder confirmation | Darya Taranda confirmed | 2026-05-04 | Authoritative |

---

## Section 5: Change Impact Guide

Use this when a decision is revised to scope required update work.

### High-Impact Decisions — changing these requires updating 4+ docs

| Decision | Current value | Impact if changed |
|---|---|---|
| D-01 | Go-live: June 30, 2026 | Update date in all 8 output docs; review all milestone timelines |
| D-08 | "India Team specialists" not "HRBP" | Affects terminology in KB1, SME, CG, KB2, KB3 |
| D-15 | RM verification removed from all Phase 1 letters | Reverts routing logic in PF, BRD; update SME validation tables, CG employee guide |
| D-16 | Relocation Letter → Phase 4+ | If added back: re-add to PF field tables, BRD scope, PRES slide, KB1 roadmap, SME validation section, CG letter list |

### Medium-Impact Decisions — changing these requires updating 2–3 docs

| Decision | Current value | Impact if changed |
|---|---|---|
| D-06 | Auto-close: 2 days | Update PF (Lifecycle section), BRD (FR), potentially CG |
| D-07 | Rejection = edit &amp; resubmit same form | Update PF (rejection flow), BRD (FR), CG (employee step) |
| D-12 | Visa Processing: DV/EDV verifies *(superseded for routing by D-24)* | Historical reference only; current updates are driven by D-24 |
| D-13 | LOR: DV/EDV verifies + Notes field | Update PF (Track B flow), BRD (FR for LOR), SME (validation questions) |
| D-17 | Static disclaimer (no popup) | Update PF (form behavior note), BRD (FR for disclaimer), SME (validation Q) |
| D-P2-01 | 4 compensation types | Update KB2 scope card; check KB1 cross-phase reference |

### Low-Impact Decisions — scope-limited to 1–2 docs

| Decision | Current value | Impact if changed |
|---|---|---|
| D-09 | Visa Comments, max 300 chars | Update PF (field table), BRD (FR field spec) |
| D-10 | Cancel request not in MVP | Update BRD (out-of-scope note) |
| D-11 | Migration out of scope | Update BRD (out-of-scope note) |
| D-P2-04 through D-P2-07 | Phase 2 letter spec details | Update KB2 only (until Phase 2 BRD exists) |
| D-P3-01 / D-P3-02 | Ex-employee data + personal email collection | Update KB3 only (until Phase 3 BRD exists) |

---

*RTM is maintained alongside `Feedback_Decisions_Log.md`. Update both together when decisions are added, changed, or superseded.*  
*For entry templates see `memory/traceability/templates.md`.*
