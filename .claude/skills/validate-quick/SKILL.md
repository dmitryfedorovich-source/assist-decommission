---
name: validate-quick
description: Targeted validation of a single output document — factual accuracy, forbidden phrases, terminology. Reads only FDL + target file. Use for routine edits. Run /validate-docs --full before stage meetings.
---

## Model Routing

**Delegate to Haiku — do not execute inline in the main session.** This skill runs 3 mechanical checks (string matching + factual lookup) on a single file.

```
Agent(
  subagent_type="general-purpose",
  model="haiku",
  description="validate-quick: spot check <doc-code>",
  prompt="""Context: EPAM Assist Decommission project — BA documentation workspace (no application code).
India HR workflows migrating from assist.epam.com → docs.epam.com (go-live June 30, 2026).
Task: Read the file `.claude/skills/validate-quick/SKILL.md` starting from the `## Usage`
heading and execute all steps for doc-code: <DOC-CODE-ARG>. Report all findings."""
)
```

Replace `<DOC-CODE-ARG>` with the argument the user passed (e.g. `BRD`, `05`, `CG`).
Relay the subagent's report to the user verbatim. Do not re-analyze.

---

## Usage

`/validate-quick <doc-code>`

`<doc-code>` is the short code or number for the document to check:

| Code | File |
|---|---|
| `PF` or `01` | `output/phase1_reference_letters/01_Process_Flow_Reference_Letters.md` |
| `BRD` or `02` | `output/phase1_reference_letters/02_BRD_Reference_Letters.md` |
| `PRES` or `03` | `output/phase1_reference_letters/03_Presentation_Internal_Team.md` |
| `KB1` or `04` | `output/phase1_reference_letters/04_KB_Onepager.html` |
| `SME` or `05` | `output/phase1_reference_letters/05_India_SME_Validation.md` |
| `CG` or `06` | `output/phase1_reference_letters/06_India_Colleagues_Guide.md` |
| `KB2` | `output/phase2_compensation/01_KB_Onepager.html` |
| `KB3` | `output/phase3_separation/01_KB_Onepager.html` |
| `FDL` | `output/shared/Feedback_Decisions_Log.md` |

If no argument is given, ask the user which document to validate.

---

## Step 1 — Load Source of Truth

Read `output/shared/Feedback_Decisions_Log.md` only.

Derive these facts dynamically — do NOT hardcode:

| Fact | Source |
|---|---|
| Go-live date | D-01 |
| Phase 1 letter count and names | All active (not superseded/deferred) letters |
| Routing per letter (auto vs. manual) | D-12, D-13, D-15 |
| Terminology rule | D-08 |
| Auto-close interval | D-06 |
| Rejection flow | D-07 |
| Visa Processing Comments field spec | D-09 |
| Self-Declaration handling | D-17 |
| Out-of-scope items for Phase 1 | D-02, D-10, D-11, D-16 |

**Do NOT read RTM.md. Do NOT read dependency_model.md. Do NOT read memory files.**

When a decision is marked superseded, the superseding decision takes precedence.

---

## Step 2 — Read the Target Document

**Markdown files:** Use `Read` to load the full file.

**HTML files (KB1/04, KB2, KB3):** Do NOT `Read` the whole file — it contains large CSS blocks that waste context. Instead:
- Use `Grep` with each forbidden phrase from Check 2 as the pattern
- Use `Grep` for key factual strings from Check 1 (e.g., "June 30", "5 letter", "HRBP", letter names)
- Only call `Read` on a specific line range if a Grep match needs surrounding context to interpret or report accurately

---

## Step 3 — Run 3 Checks

### Check 1 — Factual Accuracy

From the FDL "Reflected in" column, identify which decisions list this document. For each applicable decision, verify the document content is consistent with the decision text.

Also verify regardless of "Reflected in":
- No "July 1" appears anywhere (correct: June 30, 2026)
- Any Phase 1 letter count or list matches the current 5-letter scope
- Routing per letter matches confirmed track (auto-verified vs. DV/EDV manual)
- "Relocation Letter" is not described as in-scope for Phase 1

### Check 2 — Forbidden Phrases

Scan for each of these. For HTML: use `Grep`. For markdown: scan while reading.

| Forbidden | Correct alternative |
|---|---|
| `RM approval` | India Team specialist (DV/EDV) verifies |
| `HRBP` in KB1, SME, CG, KB2, KB3 | India Team specialists |
| `July 1` | June 30, 2026 |
| `10 days` as auto-close interval | 2 days |
| `Country` as field on Visa Processing Letter | Comments (max 300 chars) |
| `Working From Home` / `WFH` toggle | Omit entirely |
| `Self-Declaration` described as a required functional step | Static disclaimer text at top of form |
| `resubmit` in context of rejected request | Employee opens a new request |
| `6 letter types` in Phase 1 context | 5 letter types |

### Check 4 — Terminology

- KB1, SME, CG, KB2, KB3: must not contain "HRBP" — use "India Team specialists"
- All docs: platform name must be "EPAM Docs" or "docs.epam.com" — not "DOCs", "EPAM Doc" (singular), or "Docs Platform" as a product name
- Letter names must match their canonical spelling (e.g., "Letter of Recommendation" not "Recommendation Letter")

---

## Output Format

```
## Quick Validation — <DOC-CODE>

### ❌ Errors (N)
- **Location:** [section/line] — [what is wrong] → should be: [correct text] (D-XX)

### ⚠️ Warnings (N)
- **Location:** [section] — [concern]

### ✅ Passed — Checks 1, 2, 4. No issues found.
```

Keep findings to one line each. For full traceability + structural audit: run `/validate-docs --full`.
