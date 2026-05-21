# validate-docs

Running `/validate-docs` triggers a full consistency check across all output documents in this project. The skill reads the Feedback & Decisions Log first, derives all facts dynamically, then runs all checks. **No hardcoded values** — the validator always reflects the latest locked decisions.

---

## How to Run

1. Read `output/shared/Feedback_Decisions_Log.md` — this is the source of truth. Extract all D-XX decisions and OQ-XX open questions with their current status.
2. Read `output/shared/RTM.md` — verify traceability completeness.
3. Read each output document listed below and run all 10 checks against it.

**Documents to check:**

| File | Audience |
|---|---|
| `output/phase1_reference_letters/01_Process_Flow_Reference_Letters.md` | Internal |
| `output/phase1_reference_letters/02_BRD_Reference_Letters.md` | Docs platform team |
| `output/phase1_reference_letters/03_Presentation_Internal_Team.md` | Docs platform team |
| `output/phase1_reference_letters/04_KB_Onepager.html` | EPAM management |
| `output/phase1_reference_letters/05_India_SME_Validation.md` | India stakeholders |
| `output/phase1_reference_letters/06_India_Colleagues_Guide.md` | India employees |
| `output/phase1_reference_letters/07_India_SME_Presentation.html` | India stakeholders (presentation) |
| `output/migration/Decommission_Plan.md` | Ops / PM |
| `output/migration/Go_Live_Runbook.md` | Ops / PM |
| `output/migration/Test_Validation_Plan.md` | QA / PM |

---

## The 10 Checks

### Check 1 — Factual Accuracy
For every claim about process behavior, field specs, routing, letter types, and actors: verify it matches a locked D-XX decision in the Feedback & Decisions Log.

Flag any statement that contradicts a locked decision — even partially (e.g., wrong field constraint, wrong actor name, wrong routing direction).

### Check 2 — Forbidden Phrases
Flag any occurrence of the following deprecated terms or patterns:

- "HR specialist" or "HR team" when referring to the EPAM Docs reviewer role → correct term: "India Team specialist (DV/EDV)" or "EPAM specialist"
- "open a new request" / "submit a new request" in the context of a rejected form → correct behavior per D-07: employee edits and resubmits the **same** form
- "approve" as a specialist action label → correct term per D-12/D-13: "Verify" (then "Send Document")
- "confirmation popup" or "checkbox popup" without noting it is replaced by static disclaimer text (D-17)
- Any reference to Relocation Letter as in-scope for Phase 1 → it is deferred to Phase 4+ (D-16)
- Any claim that comments are optional on rejection → rejection comment is **required** (D-07, D-19)
- Any claim that a comment is required when verifying/approving → only rejection requires a comment; verification has no comment field (D-19)

### Check 3 — Open Question Cross-Reference
For every OQ-XX that is still **Open** in the Feedback & Decisions Log:

- Confirm the document acknowledges the open question (e.g., "pending India team confirmation" or equivalent note)
- Flag any document that presents an OQ as resolved when it is not, or that omits any mention of a dependency on an unresolved OQ

### Check 4 — Terminology Consistency
Check that the following terms are used consistently across all documents:

- Letter names: "Form 60", "Address Proof Letter", "Service Letter", "Visa Processing Letter", "Letter of Recommendation (LOR)"
- Platform name: "EPAM Docs" / "docs.epam.com" (not "DOCS", "Docs platform", or "the system" unless contextually clear)
- Specialist role: "India Team specialist (DV/EDV)" on first use; "specialist" acceptable on subsequent references within same section
- Employee action on rejection: "edits and resubmits the same form" (not "opens a new request", not "creates a new request")
- Auto-close interval: "2 days" (flag if any document says a different number)
- Go-live date: "June 30, 2026" (flag any inconsistency)

### Check 5 — Structural Completeness
Each document must contain its required sections:

- **01 Process Flow:** Overview, Actors, Letter Types (auto vs manual), End-to-End Flow, Form Fields per letter, Notifications, Out of Scope
- **02 BRD:** Business Context, Objectives, Scope (in/out), Stakeholders, Functional Requirements, Integration Requirements, NFRs, Assumptions, Dependencies, Risks, Timeline, Approval
- **05 India SME Validation:** Sign-off table, at least one open question per unresolved OQ
- **06 India Colleagues Guide:** What changes, how to submit, what to expect, rejection handling
- **Migration docs:** Must reference go-live date, rollback trigger, and at least one test case for rejection flow

Flag any required section that is missing or empty.

### Check 6 — Audience Fit
Verify that each document's content is appropriate for its target audience:

- **04 KB Onepager / management-facing docs:** must NOT contain field-level technical detail, FR numbers, or internal decision IDs (D-XX). High-level only.
- **06 India Colleagues Guide:** must NOT contain migration rationale, internal process detail, or references to Assist decommission complexity. User-friendly language only.
- **05 India SME Validation / 07 Presentation:** must NOT contain implementation assumptions or platform constraints unless explicitly framed as questions for the audience.
- **01/02/03:** Technical detail is appropriate — no audience fit issues expected here.

### Check 7 — Internal Coherence
Within each document, check for contradictions:

- A letter described as "auto-verified" in one section must not appear as "manually reviewed" in another section of the same document
- Field listed as "required" in one place must not be listed as "optional" in another
- The same field must have the same character limit throughout the document (e.g., Comments = 300 chars; Notes & Responsibilities = ~1000 chars)
- The rejection flow must be described consistently in all sections of the same document

### Check 8 — Traceability Completeness
Check `RTM.md`:

- Every D-XX in the Feedback & Decisions Log must appear in the RTM Phase 1 decisions table
- Every document that implements a decision must be listed in the RTM's decision×document mapping
- Every OQ-XX must appear in the OQ impact map section of RTM with at least one affected document listed

Flag any D-XX or OQ-XX that exists in the Feedback & Decisions Log but is absent from RTM.

### Check 9 — Confidence Quality (memory files only)
If any memory files under `memory/` are loaded during this session and have `status: needs-review`, flag them:

- Report the file name and the specific field or claim that needs verification
- Do not use unverified memory facts as the basis for flagging document errors — mark them as "confidence uncertain" instead

### Check 10 — Stale Detection
Flag any document that:

- References a date that has already passed as a future milestone (relative to today's date from `currentDate`)
- Contains placeholder text such as `___`, `TBD`, `[pending]`, `[TODO]`, or blank table cells in sign-off tables
- Contains a version number of "Draft" on a document that should already be finalized (based on project state)
- References a feature or behavior that was superseded by a later decision (e.g., a reference to RM approval flow that was removed by D-12)

---

## Output Format

Report results grouped by file, then by check number. Use this structure:

```
## [filename]

❌ ERROR — Check N: [check name]
  Location: [section / line reference]
  Issue: [what is wrong]
  Correct content: [what it should say]
  Source: [D-XX or OQ-XX]

⚠️ WARNING — Check N: [check name]
  Location: [section / line reference]
  Concern: [what may be an issue]
  Suggested action: [what to review or clarify]

✅ PASS — Checks [list of passing check numbers]
```

After all files, print a **Summary** table:

```
## Summary

| File | ❌ Errors | ⚠️ Warnings | Status |
|---|---|---|---|
| 01_Process_Flow... | 0 | 1 | ⚠️ |
| 02_BRD...         | 0 | 0 | ✅ |
...

Total errors: N
Total warnings: N
```

If there are errors, list the highest-priority fix first (errors before warnings; within errors, factual contradictions before structural issues).
