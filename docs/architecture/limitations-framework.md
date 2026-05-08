# AI-Assisted Documentation Workflow — Limitations & Operational Risk Framework

**Project:** Assist → EPAM Docs Migration  
**Applies to:** All output documents (Phase 1–3), memory system, structured data layer  
**Maintained by:** BA team  
**Last updated:** 2026-05-08  
**Version:** 1.0

---

## Purpose

This framework makes the limitations of the AI-assisted documentation workflow explicit, categorized, and actionable. Its three goals:

1. **Increase stakeholder trust** — by being transparent about what the system can and cannot do, rather than presenting AI-generated content as unconditionally authoritative.
2. **Improve governance maturity** — by defining who is responsible for what, when human review is mandatory, and how errors are caught and corrected.
3. **Reduce AI overconfidence risk** — by defining the conditions under which content must be qualified, flagged, or blocked from publication.

This is a living document. Review it at the start of each new phase and after any significant workflow change.

---

## 1. System Boundary Map

Before enumerating risks, it is essential to understand what the AI component can and cannot access.

### What Claude CAN do

| Capability | How it's used in this project |
|---|---|
| Read and analyze text files | Memory files, transcripts, Confluence exports, YAML data |
| Query Confluence via MCP | Verify source facts against live KB pages |
| Read images/screenshots | Extract field names, UI structure, flow diagrams from Assist |
| Write structured output | Generate Markdown docs, HTML onepagers, YAML data files |
| Self-validate content | Run `/validate-docs` against the Feedback & Decisions Log |
| Maintain cross-session memory | Persist extracted facts in `memory/*.md` files |
| Track confidence levels | Assign evidence-type and confidence ratings to extracted facts |

### What Claude CANNOT do

| Limitation | Consequence |
|---|---|
| Access live DOCS platform | Cannot verify field names, UI behavior, or template structure in DOCS |
| Access live People Portal | Cannot verify what data is actually pre-populated for an employee |
| Access live Assist platform | Must rely on screenshots (static snapshots) for Assist UI knowledge |
| Verify India SME acceptance independently | Cannot confirm whether stakeholders actually agree with what transcripts say they agreed to |
| Execute code or run tests | Cannot verify that DOCS development specs are technically feasible |
| Learn between sessions without memory writes | Facts not written to memory files are lost at session end |
| Detect unknown unknowns | Cannot flag what it doesn't know it doesn't know |
| Independently timestamp its own actions | Memory files are undated unless the BA explicitly adds dates |

---

## 2. Risk Taxonomy

Six risk categories govern this framework. Each has a specific profile, detection mechanism, and response protocol.

---

### Category A — AI Knowledge Limitations

Risks that arise from the nature of language model generation.

| ID | Risk | Likelihood | Impact | Detection | 
|---|---|---|---|---|
| A-01 | **Hallucination** — Claude generates a plausible but factually incorrect statement not present in source materials | Low (controlled by evidence rules) | High | validate-docs Check 1; BA review |
| A-02 | **Transcript misinterpretation** — Claude infers a decision from discussion context when no explicit decision was made | Medium | High | Confidence flag (medium/low); OQ raised |
| A-03 | **Confidence miscalibration** — Claude assigns "high" confidence to a fact that is actually single-source or ambiguous | Medium | Medium | Traceability Check 9; independent source review |
| A-04 | **Assumption propagation** — an incorrect fact extracted early in a session propagates to all downstream documents in the same session | Medium | High | End-of-session checklist; validate-docs post-session |
| A-05 | **Scope creep blindspot** — Claude does not notice when new stakeholder input contradicts or expands a previously locked decision | Low | High | Decision change trigger in Check 10; BA attentiveness |
| A-06 | **Cross-phase contamination** — facts specific to Phase 2 or 3 appear in Phase 1 documents (or vice versa) | Low | Medium | validate-docs Check 7 (internal coherence); phase ID in YAML |
| A-07 | **Memory staleness** — Claude uses a memory file written weeks ago that no longer reflects current stakeholder alignment | Medium | High | `status: needs-review` flag; Confluence re-verification |

---

### Category B — Source Input Limitations

Risks that arise from the quality and currency of raw source materials.

| ID | Risk | Likelihood | Impact | Detection |
|---|---|---|---|---|
| B-01 | **Screenshot staleness** — Assist UI screenshots do not reflect the current state of the platform (UI may have changed) | Medium | Medium | Date check on screenshot file; explicit note in memory file |
| B-02 | **Partial UI visibility** — screenshot crops UI elements at edges, leading to incomplete field extraction | Medium | Medium | Low-confidence annotation in memory file |
| B-03 | **Handwritten correction legibility** — scanned corrections (e.g., img_corrections7_5_2026.md) have interpretation uncertainty | Low | High | Explicit "needs SME confirmation" note in memory |
| B-04 | **Confluence page lag** — KB page content lags behind actual stakeholder decisions (page not updated after a meeting) | Medium | High | Confluence page last-modified date vs. transcript date |
| B-05 | **Transcript completeness** — meeting transcription is incomplete or inaccurate (speech-to-text errors, people talking over each other) | Medium | Medium | "Needs confirmation" OQ when transcript text is ambiguous |
| B-06 | **Single-source dependency** — a critical decision relies on one transcript or one KB page with no corroborating source | High | Medium | Confidence = `single_source`; Check 9 flags these |

---

### Category C — Governance Risks

Risks that arise from process and accountability gaps.

| ID | Risk | Likelihood | Impact | Detection |
|---|---|---|---|---|
| C-01 | **Self-referential validation** — `/validate-docs` validates output docs against `Feedback_Decisions_Log.md`, which was also written/maintained by Claude — validation cannot catch errors present in both | Medium | High | Human BA review of FDL before validation run |
| C-02 | **Missing human approval gate** — content is published to Confluence without a named human approver reviewing and signing off | Medium | High | Stage sign-off table in FDL; never publish without a stage sign-off |
| C-03 | **Audit trail gaps** — no timestamp or author recorded when a memory file is written or a decision is added | High | Medium | Structured data `last_updated` fields; session date in memory frontmatter |
| C-04 | **Approval theater** — sign-off stages exist but review criteria are not defined, so stakeholders sign off without knowing what to check | Medium | High | Stage criteria checklist (see Section 5) |
| C-05 | **Decision reversal without cascade** — a stakeholder verbally revises a locked decision during a meeting, but not all downstream documents are updated | Medium | High | CIA propagation sequence; Check 10 stale detection |
| C-06 | **AI accountability gap** — when Claude generates incorrect content, there is no clear process for attribution, correction, or notification | High | Medium | Error log in FDL F-XX entries; BA owns content regardless of generation method |
| C-07 | **Memory file ownership** — no formal owner or reviewer for memory files; a wrong fact may persist across many sessions undetected | High | High | Periodic memory audit (see Section 6); confidence review |
| C-08 | **Scope expansion without change control** — an OQ resolution or stakeholder conversation expands project scope without formal impact assessment | Medium | High | RTM OQ Impact Map; CIA propagation on resolution |

---

### Category D — Integration Dependencies

Risks that arise from external systems and people outside Claude's control.

| ID | Risk | Likelihood | Impact | Detection |
|---|---|---|---|---|
| D-01 | **Confluence MCP unavailability** — MCP connection fails, blocking source verification | Low | Medium | Fallback: use archived HTML exports; note in memory file |
| D-02 | **DOCS dev dependency (OQ-11)** — text field components for Visa Processing and LOR not yet developed; Phase 1 epics cannot be fully written | High | High | OQ-11 tracked in open-questions.yaml; blocks Stage 5 |
| D-03 | **India SME availability** — OQ-05/06/07/08/14 require India stakeholder input that is not yet scheduled | High | High | Blocking OQs in phases.yaml; escalate if no date by Stage 1 |
| D-04 | **People Portal data quality** — pre-populated fields in DOCS depend on People Portal accuracy; errors cause wrong data in letters | Medium | High | Cannot detect without live testing; note as Assumption in BRD |
| D-05 | **HRMS integration feasibility (Phase 3)** — OQ-P3-02 open: People system may not be able to publish auto-trigger events to DOCS | Medium | High | OQ-P3-02 tracking; Phase 3 scoping must resolve before dev |
| D-06 | **DOCS platform capability gap** — some BRD requirements may be technically infeasible (OQ-11, OQ-P3-04, PAN protection OQ-P2-02) | Medium | High | OQ-driven; each OQ has DOCS Platform Team as owner |
| D-07 | **India SME alignment drift** — India stakeholders (Satish, Sasanka, Satya) validate at Stage 2, but may change position at Stage 4 | Medium | High | Two-stage validation model; delta review at Stage 4 |

---

### Category E — Validation Blind Spots

Risks that the current validation system structurally cannot detect.

| ID | Risk | Likelihood | Impact | Detection |
|---|---|---|---|---|
| E-01 | **Unknown unknowns** — validate-docs checks for known-bad content; it cannot check for required content that was never identified | High | High | BA domain expertise; stakeholder review; staged sign-offs |
| E-02 | **Business logic correctness** — validate-docs confirms terminology and factual consistency, but not whether the described business process actually works end-to-end | High | High | UAT (Stage 4); pilot testing with real DOCS environment |
| E-03 | **Readability and usability** — docs are validated for accuracy, not for whether the target audience will understand them | Medium | Medium | User testing in Stage 2 (India SMEs) and Stage 4 |
| E-04 | **Cultural and linguistic fit** — India Colleagues Guide (06) validated for factual accuracy but not for cultural appropriateness or local communication norms | Medium | Medium | India SME review in Stage 2 |
| E-05 | **Legal and compliance gaps** — no legal review of decision content (e.g., acceptance policy in D-P2-02, PAN data handling in D-P2-03) | Low | High | Flag to legal if any decisions involve employee data or policy |
| E-06 | **Stakeholder interpretation divergence** — what the SME understood to be confirmed in a call may differ from what was recorded in the transcript | Medium | High | SME validation doc (05) explicit confirmation questions |
| E-07 | **Template-level rendering** — HTML onepagers validated for content; not tested for rendering in all Confluence versions or browser environments | Low | Medium | Manual Confluence preview before publishing |
| E-08 | **Dependency on Claude-assigned priorities** — validate-docs assigns Error/Warning severity; Claude's judgment about severity may differ from the BA team's | Medium | Low | BA review of all Warnings (not just Errors) before sign-off |

---

### Category F — Operational Continuity Risks

Risks to the workflow's ability to function consistently over time.

| ID | Risk | Likelihood | Impact | Detection |
|---|---|---|---|---|
| F-01 | **Session context loss** — conversation compaction at context limits removes nuance from earlier in the session | High | Medium | End-of-session checklist; post-session validate-docs |
| F-02 | **Memory file proliferation** — too many overlapping memory files lead to contradictory facts being loaded simultaneously | Medium | Medium | Memory compression trigger (>8 Phase files); periodic audit |
| F-03 | **Workflow halts without Claude** — if Claude Code is unavailable, all document generation, validation, and traceability updates stop | Low | High | Document process in non-AI fallback notes (see Section 5) |
| F-04 | **Knowledge handover gap** — if the BA lead changes, a new BA cannot quickly reconstruct the decision history and process state | Medium | High | `memory/context/project_state.md` always current; FDL as standalone reference |
| F-05 | **Phase overlap confusion** — as Phase 1 moves to completion while Phase 2/3 are being designed, facts from different phase states may conflict | Low | Medium | Phase ID in all YAML entries; phase-specific memory files |

---

## 3. Risk Register Summary

Consolidated view sorted by residual risk level.

| ID | Category | Summary | Likelihood | Impact | Current Control | Residual Risk |
|---|---|---|---|---|---|---|
| C-01 | Governance | Self-referential validation | M | H | BA reviews FDL independently | **High** |
| A-07 | AI | Memory staleness | M | H | needs-review flag; re-verify trigger | **High** |
| C-07 | Governance | Memory file ownership | H | H | Periodic audit | **High** |
| E-01 | Validation | Unknown unknowns | H | H | BA expertise + staged sign-offs | **High** |
| E-02 | Validation | Business logic not testable | H | H | UAT Stage 4 | **High** |
| D-02 | Integration | DOCS dev OQ-11 blocking | H | H | OQ tracking | **High** |
| A-02 | AI | Transcript misinterpretation | M | H | Confidence flag + OQ | **Medium** |
| A-04 | AI | Assumption propagation | M | H | End-of-session checklist | **Medium** |
| C-05 | Governance | Decision reversal without cascade | M | H | CIA + Check 10 | **Medium** |
| C-08 | Governance | Scope expansion without change control | M | H | RTM OQ Impact Map | **Medium** |
| D-03 | Integration | India SME availability | H | H | OQ tracking; escalate if unscheduled | **Medium** |
| D-04 | Integration | People Portal data quality | M | H | Noted as Assumption in BRD | **Medium** |
| D-06 | Integration | DOCS capability gaps | M | H | OQ-driven tracking | **Medium** |
| B-06 | Source | Single-source dependency | H | M | `single_source` flag; Check 9 | **Medium** |
| C-02 | Governance | Missing human approval gate | M | H | Stage sign-off process | **Medium** |
| C-04 | Governance | Approval theater | M | H | Stage criteria checklist (new) | **Medium** |
| E-06 | Validation | Stakeholder interpretation divergence | M | H | Doc 05 explicit questions | **Medium** |
| A-03 | AI | Confidence miscalibration | M | M | Check 9 | **Low** |
| B-01 | Source | Screenshot staleness | M | M | Date note in memory file | **Low** |
| C-03 | Governance | Audit trail gaps | H | M | `last_updated` fields | **Low** |
| E-05 | Validation | Legal/compliance gaps | L | H | Flag to legal if needed | **Low** |
| F-01 | Continuity | Session context loss | H | M | End-of-session checklist | **Low** |

---

## 4. Known Limitations Language — Per Document Type

The following copy-paste blocks should appear in each document type at the specified location. These are transparency statements, not error disclosures — they set accurate expectations before stakeholders read the content.

---

### 04 — KB Onepager (Management)

**Location:** Footer or last section, after the roadmap  
**Tone:** Confident, factual. No hedging language. Acknowledges process, not uncertainty.

```
---
**Document status:** Draft — pending Stage 1 internal review and Stage 2 India SME validation.  
This document reflects decisions confirmed as of [DATE]. Open questions that could affect 
scope or timeline are tracked separately and will be incorporated before final sign-off.  
**Source of confirmed decisions:** Feedback & Decisions Log v[VERSION], [DATE].
```

---

### 05 — India SME Validation

**Location:** Section header (before first letter section), and in the sign-off table  
**Tone:** Transparent about AI-assisted extraction; emphasizes stakeholder role as verifier.

```
---
**How this document was prepared:**  
Content in this document was extracted from meeting transcripts, Confluence KB pages, 
and stakeholder calls by an AI-assisted BA workflow. Each section lists the source 
and confidence level of the information presented.

**Your role:** Review each section and confirm whether the described behaviour, 
field names, and routing rules match your understanding of the DOCS process. 
Where you see ⚠️ or ❓ markers, your input is needed before this section can be finalized.

**Confidence legend:**
- ✅ Confirmed by named stakeholder or official KB page
- ⚠️ Based on transcript or single source — please verify
- ❓ Not yet confirmed — your input required

**Important:** If anything in this document contradicts your knowledge of the actual 
DOCS process, mark it as "Changes needed" in the sign-off table and describe the 
correct behaviour. AI-generated content is always subject to stakeholder correction.
---
```

---

### 01 — Process Flow

**Location:** Assumptions section  
**Tone:** Standard BA document disclaimer language.

```
### Limitations and Assumptions

The following process descriptions are based on information available as of [DATE]:
- Field names and dropdown values reflect Assist platform screenshots and India Team KB pages.
  Actual DOCS field names will be confirmed during DOCS platform configuration.
- Dropdown option lists (Purpose field for Service Letter, Visa Processing Letter, LOR) 
  are pending India Team confirmation (OQ-05, OQ-06, OQ-07).
- Pre-populated data accuracy depends on People Portal data quality, which has not 
  been validated through live testing.
- Auto-verify timing and one-request-per-process constraints are noted as DOCS platform 
  limitations (see DOCS Technical Limits memory file); final confirmation pending UAT.
```

---

### 02 — BRD

**Location:** Section 7 — Assumptions and Constraints (existing section)  
**Tone:** Formal BA requirement language.

```
### AI-Assisted Authoring Note

This BRD was authored using an AI-assisted documentation workflow. All functional 
requirements are based on confirmed decisions recorded in the Feedback & Decisions Log. 
Requirements marked with [OQ-XX] depend on open questions that must be resolved before 
those requirements can be finalized. The DOCS platform team should treat [OQ-XX] markers 
as pending items that may require requirement revision.

The following areas contain requirements with known uncertainty:
- Text field development (OQ-11): Comments field and LOR Notes field specifications 
  are confirmed but delivery depends on DOCS dev assessment.
- Purpose dropdown values (OQ-05, OQ-06, OQ-07, OQ-08): Requirements reference 
  "TBD from India Team" for specific option lists.
- Address field editability (OQ-14): Locking vs. editable address field for Address 
  Proof Letter to be confirmed by India Team at Stage 2.
```

---

### 03 — Internal Presentation

**Location:** First slide / intro section  
**Tone:** Internal, direct. Teammates understand the AI workflow.

```
**Preparation note:** This presentation was generated by an AI-assisted BA workflow 
from meeting transcripts, KB pages, and stakeholder calls. Decisions marked [D-XX] 
are locked in the Feedback & Decisions Log. Items marked [OQ-XX] are open questions 
that need resolution before those slides can be finalized. Run `/validate-docs` 
before any stakeholder meeting to verify the presentation is current.
```

---

### 06 — India Colleagues Guide

**Location:** Not displayed. Keep limitations internal. The guide is a user document — limitations language would undermine its purpose.  
**Instead:** Ensure Stage 2 and Stage 4 sign-offs are complete before publishing. The human sign-off is the trust mechanism, not a disclaimer.

**Internal pre-publication checklist (for BA):**
- [ ] All OQs affecting employee-visible content are Resolved
- [ ] Stage 4 India stakeholder sign-off complete
- [ ] Date confirmed: June 30, 2026 go-live still valid
- [ ] No "HRBP", "DOCS", "Assist" rationale, or technical jargon present
- [ ] Processing time table matches confirmed routing (Trk-A vs Trk-B per letter type)

---

### FDL and RTM

**Location:** Top of document, after the "How to Use" section  
**Tone:** Internal BA reference — transparent about AI maintenance.

```
> **Maintenance note:** This document is maintained by the BA team with AI-assisted 
> drafting (Claude Code). The AI extracts and structures decisions from meeting transcripts 
> and Confluence pages; a human BA is responsible for reviewing and approving all entries 
> before they are treated as locked. Decisions marked **locked** have been reviewed by 
> the BA lead. Entries without a named decision-maker or date should be treated as 
> provisional until confirmed.
```

---

## 5. Warning and Escalation Mechanism

A three-level model governs when AI-generated content requires escalating levels of human attention.

---

### 🟢 GREEN — Proceed normally

**Conditions (all must be true):**
- All facts are `sme_confirmed` or `high` confidence
- All relevant decisions are `locked`
- No open blocking OQs affect the section being written
- validate-docs reports zero Errors for the affected files
- Memory files for the affected area have no `status: needs-review` flags

**Action:** Write and publish content with standard human review.

---

### 🟡 YELLOW — Flag to BA lead before proceeding

**Triggers (any one is sufficient):**
- A fact has confidence `medium` or `low`
- A decision is present in only one source (single_source validation state)
- An OQ is open but does not block the section (non-blocking dependency)
- validate-docs reports Warnings (not Errors)
- A memory file used has `status: needs-review`
- The section references a DOCS capability that has not been confirmed feasible

**Action:**
1. Add an inline annotation: `<!-- conf:medium | ev:transcript | state:single_source | oq:OQ-XX -->`
2. Add a visible `⚠️` marker in Doc 05 sections
3. Notify BA lead in writing before the document moves to sign-off stage
4. Do NOT publish management-facing documents (04, KB2, KB3) while yellow flags remain

---

### 🔴 RED — Block; resolve before writing

**Triggers (any one is sufficient):**
- A fact confidence is `assumed` or the fact was inferred without any source
- A decision is marked `superseded` but the superseding decision has not yet been locked
- validate-docs reports Errors in the affected document
- A key stakeholder has verbally contradicted a locked decision but the decision has not yet been formally revised
- The section being written requires OQ resolution that is marked as blocking a stage

**Action:**
1. Do NOT write or update the affected section
2. Create or update the relevant OQ in `docs/data/open-questions.yaml` and FDL
3. Notify BA lead with specific blocker
4. In the document, write: `[BLOCKED — pending resolution of OQ-XX. See Feedback & Decisions Log.]`
5. Do NOT mark any validation check as passing while red flags are outstanding

---

### Escalation Path

```
Claude flags issue
    ↓
BA lead reviews flag + source
    ↓ (if decision change needed)
BA lead updates FDL + decisions.yaml
    ↓
CIA propagation → update affected docs
    ↓
/validate-docs run → confirm clear
    ↓
Stakeholder notification if confirmed change affects signed-off content
```

**Who escalates to whom:**

| Issue type | Escalate to |
|---|---|
| Factual conflict between two locked decisions | BA lead → decision-maker (named in decision) |
| DOCS platform capability gap | BA lead → Olga Chaban / DOCS Platform Team |
| India SME availability block | BA lead → Hanna Vasilenka |
| Legal/compliance question (e.g., acceptance policy, PAN data) | BA lead → EPAM Legal |
| Decision reversal from a stakeholder | BA lead → note in FDL + re-trigger CIA propagation |
| Memory file known-wrong | BA lead → update memory + add F-XX correction entry to FDL |

---

## 6. Operational Safeguards

Concrete process controls that reduce residual risk when followed consistently.

### S-01 — Human-in-the-Loop Gates (mandatory)

No document is published to Confluence or shared with stakeholders without a named human approver completing the gate review.

| Gate | Trigger | Required reviewer | Must check |
|---|---|---|---|
| Internal draft ready | Doc 01, 02, 03 first complete draft | BA lead | validate-docs clean; no Red flags; OQ list current |
| Stage 1 sign-off | Internal alignment meeting | Daria + Hanna | Scope correct; FRs complete; routing tracks accurate |
| Stage 2 SME review package | India SME meeting scheduled | BA lead | Doc 05 questions accurate; no HRBP in 05/06; Yellow flags disclosed |
| Stage 4 publish gate | India final sign-off complete | Named India stakeholder (Satish) | Doc 06 language clear; doc 04 scope accurate; all OQs resolved or explicitly deferred |
| Dev epic handover | Stage 5 | BA + DOCS Platform lead | All [OQ-XX] markers resolved in BRD; FRs complete; no pending decisions |

### S-02 — Stage Criteria Checklist (addresses C-04)

Each stage sign-off must explicitly confirm the following criteria (not just "looks good"):

**Stage 1 — Internal:**
- [ ] All 5 Phase 1 letter types described with correct routing track
- [ ] No forbidden phrases present (run validate-docs Check 2)
- [ ] BRD FR numbering sequential; no gaps
- [ ] All locked decisions D-01 through D-17 reflected appropriately
- [ ] OQ list is complete and owners assigned

**Stage 2 — India SME:**
- [ ] India Team confirms Purpose dropdown values for Service Letter, Visa Processing, LOR (OQ-05/06/07)
- [ ] India Team confirms Address Proof field editability (OQ-14)
- [ ] India Team confirms Bank/SIM/LPG sub-type handling (OQ-08)
- [ ] All Doc 05 confirmation checkboxes signed as ☑ Approved or ☑ Changes needed (with notes)
- [ ] No section left blank or unanswered

**Stage 4 — Final India sign-off:**
- [ ] Doc 06 reviewed by at least one India employee (not just SME)
- [ ] All post-Stage-2 changes are reflected in the updated doc set
- [ ] Processing time table in Doc 06 matches final confirmed routing
- [ ] Satish Malla sign-off confirmed in writing

### S-03 — End-of-Session Checklist (already in templates.md — enforced here)

After every working session that modifies output documents or decisions:
1. Run `/validate-docs` and resolve all Errors before closing session
2. Update `memory/context/project_state.md` with current status
3. Rename processed transcripts with `[processed]-` prefix
4. Add new F-XX entry to FDL for any stakeholder feedback received
5. Sync `docs/data/decisions.yaml` if new D-XX or OQ-XX was added
6. Run `/validate-schema` if any YAML data files were modified

### S-04 — Source Verification Before Stage Sign-off

Before any Stage 1 or Stage 2 sign-off:
1. Re-read all Confluence pages referenced in `memory/reference_confluence.md`
2. Check `last_modified` date of each page against the dates in memory files
3. If a page was modified after the memory file was written: re-read the page, update memory, re-run validate-docs
4. Check that all memory files used have no `status: needs-review` flag outstanding

### S-05 — Content Separation Discipline

AI-generated content and human-verified content must remain distinguishable during drafting:
- In draft documents: use `<!-- AI-DRAFT: needs review -->` comments on AI-generated sections
- Remove all `<!-- AI-DRAFT: -->` markers only after human review confirms the content
- In the FDL: decisions without a named decision-maker or date are treated as provisional — not locked

### S-06 — Non-AI Fallback

If Claude Code is unavailable for more than one working day:
1. Use `output/shared/Feedback_Decisions_Log.md` directly as the source of truth
2. Update documents manually following the same decision reflection rules
3. Run a manual check against the forbidden phrases list (Check 2) before sharing
4. After Claude Code is restored: run `/validate-docs` on all files touched during the outage

---

## 7. Periodic Review Process

### 7.1 — Pre-Stage Review (before each sign-off stage)

**Frequency:** Before each of the 5 sign-off stages  
**Who:** BA lead  
**Process:**
1. Run `/validate-schema` on all `docs/data/` files
2. Run `/validate-docs` on all `output/` files
3. Re-verify all Confluence source pages (S-04)
4. Check all Open OQs — confirm owners and target resolution stages are current
5. Check all `status: needs-review` memory files — re-verify or resolve
6. Confirm all `_meta.last_updated` fields in YAML files are within the past 30 days

**Output:** Sign-off readiness report (can be a simple ✅/❌ checklist saved to `output/shared/`)

---

### 7.2 — OQ Aging Review (monthly)

**Frequency:** Monthly during active phase  
**Who:** BA lead  
**Process:**
1. List all Open OQs from `docs/data/open-questions.yaml`
2. For each Open OQ, check: is the owner still assigned? Is the target resolution stage still valid?
3. Escalate any OQ that has been open for >30 days without progress
4. Update `blocking_stage` field if the dependency has shifted

**Escalation trigger:** Any OQ blocking Stage 2 that remains unresolved 2 weeks before the India SME meeting is scheduled.

---

### 7.3 — Decision Lock Audit (per phase)

**Frequency:** Once per phase, at Stage 3 (post-feedback iteration)  
**Who:** BA lead + relevant decision-makers  
**Process:**
1. Review all locked decisions for the active phase
2. For each decision, confirm: is it still accurate? Has any stakeholder indicated a change?
3. Mark any at-risk decisions with `change_risk: high` and add a note
4. Cross-check RTM Source Index — all decisions should have `confidence: high` or `sme_confirmed`
5. Identify any decisions with null `date` or vague `made_by` — chase for confirmation before Stage 4

---

### 7.4 — Memory File Integrity Audit (per phase at Stage 3)

**Frequency:** Stage 3 sign-off  
**Who:** BA lead  
**Process:**
1. List all memory files used in the current phase from MEMORY.md
2. For each file, verify: does its content match the current state of decisions? Does it have `last_updated` set?
3. Mark files that are no longer needed as `status: archived`
4. Run memory compression if >8 Phase 1 files exist
5. Remove archived files from the active MEMORY.md index sections

---

### 7.5 — Post-Phase Retrospective

**Frequency:** After each phase reaches Stage 5 (dev handover)  
**Who:** Full BA team  
**Process:**
1. Review this limitations framework — did any risk materialize? What mitigated it? What didn't work?
2. Update risk likelihood ratings for any risk that materialized or was confirmed as non-applicable
3. Add any newly discovered risk category
4. Update operational safeguards based on lessons learned
5. Archive phase-specific memory files and update MEMORY.md

---

## 8. Governance Maturity Model

Where the workflow stands today and where it should grow.

### Level 1 — Documented (current)

✅ Risks are identified and categorized  
✅ Confidence levels assigned to all extracted facts  
✅ Validate-docs checks run after every output change  
✅ Decision traceability from source to output document  
✅ Known Limitations language defined per document type  
✅ Escalation model defined (Green/Yellow/Red)  

**Gap:** Maturity Level 1 still depends heavily on BA discipline to apply the framework.

---

### Level 2 — Enforced (target: Phase 1 Stage 3)

⬜ Stage criteria checklists completed and filed for each sign-off (S-02)  
⬜ All memory files have `last_updated` and `confidence` frontmatter  
⬜ End-of-session checklist run verifiably (logged in project_state.md)  
⬜ Source verification documented before each Stage sign-off (S-04)  
⬜ No document published to Confluence without named approver on record  

---

### Level 3 — Systematic (target: Phase 2+)

⬜ `/validate-schema` integrated into standard post-update workflow  
⬜ FDL generated from canonical YAML (not manually maintained)  
⬜ OQ aging review automated via scheduled check  
⬜ Memory audit runs automatically at phase completion milestone  
⬜ AI draft markers (`<!-- AI-DRAFT: -->`) enforced by hook  

---

### Level 4 — Auditable (target: Phase 3 or as needed)

⬜ Full decision audit trail with timestamps and author attribution  
⬜ Change history for every locked decision (when it was locked, by whom, what changed)  
⬜ Legal review completed for decisions involving employee data or policy compliance  
⬜ External validation of AI confidence model (spot-check: human re-reads source and assigns confidence independently)  
⬜ Incident log for any case where AI content was found incorrect after publication  

---

## Appendix A — Quick Reference Card

Print or bookmark this section for use during active work.

### Before writing any output document
- [ ] Read current phase state memory file
- [ ] Check validate-docs for any outstanding Errors
- [ ] Verify no blocking OQs affect the section you're writing
- [ ] Confirm confidence level of key facts you're about to state

### Before sharing any document with stakeholders
- [ ] Validate-docs: zero Errors
- [ ] Named human approver has reviewed
- [ ] Known Limitations language present (where required)
- [ ] Yellow flags disclosed to BA lead

### Red-flag stop conditions (do not proceed until resolved)
- Assumed fact about to go into management doc
- Locked decision has verbal revision not yet recorded in FDL
- validate-docs Error outstanding
- OQ that blocks the section is unresolved

### Most likely risks to watch for in this project
1. Memory staleness (A-07) — check `needs-review` flag before using any memory file
2. India SME availability blocking OQs (D-03) — escalate if unscheduled 2 weeks before meeting
3. DOCS dev capability gap (D-06 / OQ-11) — don't finalize BRD FRs for affected sections until Michael assesses
4. Self-referential validation (C-01) — BA lead must read FDL independently, not just run validate-docs
