---
name: validate-docs
description: Validates all output documentation for factual accuracy, consistency, completeness, terminology, and audience fit. Run after any changes to the output/ folder.
---

## Mode

**Default (`/validate-docs`):** Runs Checks 1–7 and Check 9. Reads FDL + all output documents. Does NOT read RTM.md or dependency_model.md.

**Full (`/validate-docs --full`):** Runs all 10 checks including Check 8 (RTM traceability, reads `RTM.md`) and Check 10 (stale detection, reads `dependency_model.md`). Use before stage meetings and go-live.

For single-file spot checks after a routine edit, use `/validate-quick <doc-code>` instead.

---

Read all files in the `output/` directory, then validate the full documentation set against the criteria below. Output a structured report grouped by severity.

---

## Step 1 — Build the Source of Truth from the Feedback Log

**Before checking any output document**, read `output/shared/Feedback_Decisions_Log.md` in full.

From the Decisions Log, derive the following facts dynamically. Do NOT use hardcoded values — read them from the log each time:

| Fact | How to derive |
|---|---|
| Go-live date | Decision D-01 |
| Phase 1 letter count and names | All letters in scope (not deferred, not superseded by a later D-XX) |
| Routing per letter (auto vs. manual) | D-12, D-13, D-15, and any later routing decisions |
| Terminology rule (HRBP vs. India Team) | D-08 |
| Out-of-scope items for Phase 1 | D-02, D-10, D-11, D-16, and any item marked "out of scope" |
| Self-Declaration handling | D-17 |
| Auto-close interval | D-06 |
| Rejection flow | D-07 |
| Visa Processing Comments field spec | D-09 |
| Phase 2 letter count and type names | Phase 2 Decisions Log section (D-P2-01 etc.) |
| Phase 3 scope note (LOR ex-employees) | Phase 3 Decisions Log section (D-P3-01 etc.) |
| Phase 4 status | Phase 4 section — scope not yet defined |

**Constants (hardcoded — these do not change):**
- Platform names: `assist.epam.com` (source) → `docs.epam.com` (target)
- Document short codes: `PF` = Process Flow, `BRD` = Business Requirements Document, `PRES` = Internal Presentation, `KB1` = KB Onepager (Phase 1), `SME` = India SME Validation, `CG` = India Colleagues Guide, `FDL` = Feedback & Decisions Log, `RTM` = Requirements Traceability Matrix, `KB2` = Phase 2 KB Onepager, `KB3` = Phase 3 KB Onepager
- Target audience per doc: KB1/KB2/KB3 = management, SME = India SMEs, CG = India employees, PF/BRD/PRES = internal/platform team

When a decision is marked as **superseded** (e.g., D-03 superseded by D-16), the superseding decision takes precedence. Do not apply superseded decisions to output doc validation.

---

## Step 2 — Validation Checks

Run all checks below. For each failure, record: **file, location (section/slide/line)**, **what is wrong**, **what it should say**, and **which Decision ID is the source of correct content** (where applicable).

### HTML File Strategy

For the three HTML output files (`04_KB_Onepager.html`, `output/phase2_compensation/01_KB_Onepager.html`, `output/phase3_separation/01_KB_Onepager.html`): do NOT `Read` the whole file — each contains ~100 lines of inline CSS that waste context. Instead:

- Use `Grep` with each forbidden phrase (Check 2) and key factual strings (Check 1) as patterns
- Use `Grep` for terminology checks (Check 4)
- Use `Grep` for structural element presence (Check 5) — e.g., search for "June 30", "5 letter", phase names, roadmap sections
- Only call `Read` with a specific offset/limit if a Grep match needs surrounding lines to interpret or report accurately

---

### Check 1 — Factual Accuracy Against Locked Decisions

For each **locked decision** in the Decisions Log:

1. Read its "Reflected in" column — this lists which output docs must reflect this decision.
2. Open each listed document and verify the relevant content is consistent with the decision text.
3. Flag any document that contradicts or omits content the decision requires.

Additionally check:
- No output document uses the go-live date from before D-01 (i.e., no "July 1" anywhere)
- The Phase 1 letter count matches the current in-scope letter list derived in Step 1 — check every place a count or list of letters appears (headers, scopes, tables, roadmap cards)
- Phase 2 and Phase 3 onepager roadmap cards describe Phase 1 correctly (letter count, processing model) — cross-phase references must be internally consistent
- Routing per letter matches the confirmed flow for each letter type
- "Relocation Letter" is NOT described as in scope for Phase 1 anywhere in Phase 1 output docs

---

### Check 2 — Forbidden Phrases

These phrases must not appear in any output document. Flag every occurrence with file, location, and the correct alternative:

| Forbidden | Reason | Correct alternative |
|---|---|---|
| `RM approval` | Removed for all Phase 1 letters (D-12, D-13, D-15) | India Team specialist (DV/EDV) verifies |
| `HRBP` in docs KB1, SME, CG | Terminology rule D-08 | India Team specialists |
| `July 1` | Wrong decommission date (F-01) | June 30, 2026 |
| `10 days` as auto-close **in Phase 1 docs** | Wrong interval for Phase 1 (D-06) — Phase 2 uses 10 days per D-P2-05 | 2 days (Phase 1 only) |
| `Country` as a field on Visa Processing Letter | Wrong field name (D-09) | Comments (max 300 chars) |
| `Working From Home` / `WFH` toggle | Removed feature, not in DOCS | Omit entirely |
| `Self-Declaration` popup described as **required** | D-17 superseded by D-21 — DOCS implements an Accept checkbox at the bottom of each form, not a popup or static text at top | "Accept" checkbox at the bottom of each request form (D-21) |
| `employee opens a new request` on rejected request | Wrong rejection flow — D-07 corrected 2026-05-12: correct behavior is edit and resubmit same form | Employee edits and resubmits the same form |
| `6 letter types` in Phase 1 context | Phase 1 has 5 types (D-16) | 5 letter types |

---

### Check 3 — OQ Cross-Reference Integrity

1. Find every OQ ID referenced in any output document (e.g., "development pending — OQ-11", "per OQ-14").
2. Verify that OQ ID exists in the Feedback Log.
3. Check the OQ's current status in the log:
   - If **Resolved**: the output doc should not describe it as open or pending. Flag if it does.
   - If **Open**: the output doc may still reference it — no error, but note it as a live dependency.
   - If **Deferred/Closed**: the output doc should not treat it as active. Flag if it does.
4. Find every **Open** OQ in the Feedback Log. Check that at least one relevant output doc acknowledges it (or it is scoped to a future phase). Flag any Open OQ that appears to be silently ignored in the output documents that cover its scope.

---

### Check 4 — Terminology Consistency

- Docs KB1, SME, CG: must NOT contain "HRBP" — use "India Team specialists"
- Docs PF, BRD, PRES: may use "HRBP" as correct internal terminology
- "DV/EDV" and "India Team specialist" must be used consistently for the same role across all Phase 1 docs (not mixed with "HRBP" in the same document)
- Letter names must be spelled identically across all documents — flag any variation (e.g., "Letter of Recommendation" vs "Recommendation Letter")
- Platform name: always "EPAM Docs" or "docs.epam.com" — not "DOCs", "Docs Platform" used as the product name, or "EPAM Doc" (singular)

---

### Check 5 — Structural Completeness per Document

Check that each document has the required structural elements. Do NOT check for specific FR numbers, slide numbers, or question IDs — check for the *content* the structure must cover.

**PF — Process Flow:**
- [ ] All Phase 1 letter types listed (derived from Step 1) have a dedicated field table
- [ ] All routing tracks represented: auto-verified track AND manual-verification track
- [ ] Notifications table present (what triggers notifications, who receives them)
- [ ] Out-of-scope section present; includes Relocation Letter with deferral note
- [ ] Auto-close interval stated (must match D-06)

**BRD — Business Requirements Document:**
- [ ] Scope section lists all Phase 1 letter types and explicitly names out-of-scope items
- [ ] FR table covers: initiation, form pre-population, employee-entered fields, routing, verification workflow, letter generation/download, lifecycle/closure, notifications
- [ ] No FR gaps: FRs must be sequential with no skipped numbers
- [ ] Integration requirements section present (HR system + People system integrations)
- [ ] NFRs, Assumptions, Risks, Timeline sections present
- [ ] Sign-off table present

**PRES — Internal Presentation:**
- [ ] Slide for each routing track (auto-verified flow AND manual-verification flow)
- [ ] Field spec table covering all Phase 1 letters
- [ ] Special behaviors slide (address-not-found, disclaimer text, custom purpose field, auto-close, rejection flow)
- [ ] Configuration checklist present and covers all routing types in scope
- [ ] "Decisions Needed" or "Actions Required" slide present
- [ ] Timeline/milestones slide present

**KB1 — KB Onepager (Phase 1):**
- [ ] Correct Phase 1 letter count in header/summary
- [ ] Letters shown with correct routing classification (auto vs. reviewed)
- [ ] Relocation Letter NOT shown in the in-scope letter list; Phase 4 investigation card present in roadmap
- [ ] Roadmap shows all phases (Phase 1 current, Phase 2, Phase 3, Phase 4)
- [ ] No "HRBP" text
- [ ] Go-live date correct

**SME — India SME Validation:**
- [ ] All Phase 1 letter types have a dedicated review section with at least one confirmation question
- [ ] Relocation Letter has a "not in Phase 1" notice (no validation questions)
- [ ] Open questions for Purpose dropdown values (Service, Visa Processing, LOR) present
- [ ] Address Proof address-edit question (OQ-14) present
- [ ] Sign-off table with India stakeholder names present
- [ ] Open Questions appendix present, consistent with Feedback Log status
- [ ] No "HRBP" text

**CG — India Colleagues Guide:**
- [ ] All Phase 1 letter types listed with plain-language description of use
- [ ] Step-by-step request instructions present
- [ ] Processing time table present (distinguishing instant vs. review-required)
- [ ] Rejection flow described in employee-friendly terms
- [ ] Address Proof "update People profile" note present
- [ ] Dates correct
- [ ] No "HRBP", no "DOCS", no technical jargon
- [ ] No migration rationale, no internal process detail (audience-fit check)

**FDL — Feedback & Decisions Log:**
- [ ] All locked decisions have a "Reflected in" value (not blank)
- [ ] All Open Questions have an owner assigned
- [ ] All Open Questions have a "Target resolution" stage or phase
- [ ] All Feedback Log items have a status (Done / Open)
- [ ] Stage sign-off table covers all 5 stages with status
- [ ] Phase 2, Phase 3, Phase 4 sections present (one section per active/planned phase)

---

### Check 6 — Audience Fit

**KB1 — KB Onepager (management):**
- No field-level technical detail (field names, character limits, component names)
- No DOCS platform implementation notes
- Language is business-outcome focused

**SME — India SME Validation:**
- Each section has explicit questions with answer fields (_____)
- Confirmation checkboxes present on sign-off table (☐ Approved / ☐ Changes needed)
- Questions are phrased for SMEs to answer, not for internal team to read

**CG — India Colleagues Guide:**
- No references to migration, Assist decommission rationale, or platform comparison
- No internal team process detail (e.g., specialist verification internals)
- Every instruction is actionable for an employee

---

### Check 7 — Internal Coherence per Document

For each document, check:
- No statement contradicts another statement within the same document
- No orphaned placeholders: `TBD`, `[INSERT]`, `___` left in a non-intentional location (answer blanks in 05 are intentional — do not flag those)
- No references to features confirmed as removed: Self-Declaration popup (as a functional step), WFH toggle, RM approval, "Country" field
- All Decision ID citations (e.g., `D-12`) reference a decision that exists in the Feedback Log and the citation is consistent with what that decision says

---

### Check 10 — Stale Detection & Change Impact *(--full only)*

> **Skip this check in default mode. Only run when `/validate-docs --full` is invoked.**

Read `memory/traceability/dependency_model.md` Section 5 (stale_triggers) and `docs/data/decisions.yaml`. Then apply:

1. **Superseded decision leak:** For every decision with `status: superseded` in docs/data/decisions.yaml (D-03, D-04, D-05, D-14), scan all output docs for any description that treats the superseded behavior as currently active. Example: any doc describing Relocation Letter as auto-approved on effective date as a Phase 1 feature = Error. References to Phase 4+ planning are allowed.

2. **Stale memory file warning:** Check the frontmatter of any memory file loaded during this session. If `status: needs-review` or `status: stale`, emit a Warning for every output doc listed in `memory_to_doc` for that memory file. Those docs may contain outdated content from the stale source.

3. **Orphaned pending markers:** Scan all output docs for `(pending — OQ-XX)` or `(to confirm — OQ-XX)` inline markers. For each: look up OQ-XX in the Feedback Log. If the OQ is now Resolved, the inline marker is stale — flag as Error (document should reflect the resolved answer, not "pending").

4. **Missing Tier 1 update:** When called after a specific change (e.g., a new decision was just added to the Feedback Log), check that all docs with ✓ in RTM Section 1 for that decision have been updated. If a Tier 1 doc still contains the old text, flag as Error.  *(This check is best-effort when run in isolation — the validator cannot always detect "old text" without knowing what changed. Apply judgment.)*

5. **Consistency between phases:** Cross-reference the Phase 1 letter count and go-live date in KB2 (Phase 2 Onepager) and KB3 (Phase 3 Onepager) against KB1 (Phase 1 Onepager). These cross-phase references must be identical. Flag any mismatch as Error.

---

### Check 9 — Confidence Quality

Read `memory/context/confidence_framework.md` for the confidence level definitions. Then apply these checks:

1. **Management doc protection (04, 06):** Scan docs 04 (KB Onepager) and 06 (Colleagues Guide) for any uncertainty markers: `TBD`, `to confirm`, `pending`, `assumed`, `under investigation`, `?`, or any similar hedge. These documents must only contain confirmed facts. Flag every occurrence as an Error.

2. **BRD Assumptions coverage:** For every Open OQ in the Feedback Log that is Phase 1 scoped and marked `Open`, check that doc 02 (BRD) either: (a) references the OQ inline as "(pending — OQ-XX)" in the relevant FR, or (b) lists it in the Assumptions section. Flag missing coverage as a Warning.

3. **SME doc question coverage:** For every Open OQ in the Feedback Log with `Stage 2 review` as the target resolution, verify that doc 05 (India SME Validation) contains a corresponding question with an answer blank (`_____`) or checkbox. Missing question = Error.

4. **Source Index completeness** *(--full only):* In RTM.md Section 4, flag any locked decision row where the Source Reference column is blank or `—` (unless the decision is also marked as superseded). A locked decision with no traceable source is a traceability gap.

5. **Inferred lock warning** *(--full only):* In RTM.md Section 4, flag any locked decision where Source Type is `inferred` or `internal_agreement` and the decision materially affects a workflow (has a ✓ in Section 2). These decisions have no external stakeholder evidence — warn that they should be validated at Stage 2.

6. **Stale memory files:** If any memory file referenced during this session is marked `status: needs-review` or `status: stale` in its frontmatter, warn that the content may be outdated and should be verified before the next output update.

---

### Check 8 — Traceability Completeness *(--full only)*

> **Skip this check in default mode. Only run when `/validate-docs --full` is invoked.**

Read `output/shared/RTM.md`. Verify:

1. Every **locked** decision in the Feedback Log appears as a row in RTM.md Section 1. Flag any locked decision with no RTM row.
2. Every D-ID cited in RTM.md Section 1 exists in the Feedback Log (no phantom IDs).
3. For every ✓ cell in RTM.md Section 1: verify that document's "Reflected in" column in the Feedback Log includes that doc code. Flag mismatches where RTM says ✓ but "Reflected in" does not list the doc (or vice versa).
4. Every locked decision has a non-blank row in RTM.md Section 4 (Source Index).
5. Every Open OQ in the Feedback Log appears in RTM.md Section 3 (OQ Impact Map). Flag any Open OQ missing from Section 3 that is not explicitly scoped to a future phase.

---

## Output Format

Produce the report in four sections:

### ❌ Errors — must fix before next stakeholder meeting
For each error:
- **File:** filename
- **Location:** section/slide/table row
- **Issue:** what is wrong
- **Should be:** exact correct content or phrasing
- **Source:** Decision ID or rule that defines the correct value (where applicable)

### ⚠️ Warnings — review recommended
For each warning:
- **File:** filename
- **Location:** section/slide
- **Concern:** what may be inconsistent or incomplete
- **Suggested action:** specific next step

### ✅ Passed checks
Brief summary of what passed — grouped by check number (Check 1 through Check 10).

### 📋 Coverage summary
One-line status per document: `PASS` / `ISSUES FOUND (N errors, M warnings)`

If no issues are found, confirm clearly that the documentation set is consistent with the Feedback & Decisions Log and ready for the next stage.
