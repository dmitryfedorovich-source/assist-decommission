---
name: validate-schema
description: Validates all canonical YAML data files in docs/data/ against their JSON schemas in docs/schema/ and checks cross-file referential integrity.
---

Validate all canonical YAML data files in `docs/data/` against their schemas and integrity rules.

---

## What This Skill Checks

This skill validates the **structured data layer** (`docs/data/`). It does NOT validate output documents — use `/validate-docs` for that.

Run `/validate-schema` after:
- Adding or updating any entry in `docs/data/*.yaml`
- Adding a new D-XX or OQ-XX entry
- Changing a decision status (draft → locked → superseded)
- Resolving an Open Question (Open → Resolved)
- Adding a new phase letter type or workflow track

---

## Step 1 — Read All Canonical Data Files

Read these files in full before running any checks:

| File | Schema |
|---|---|
| `docs/data/decisions.yaml` | `docs/schema/decision.schema.json` |
| `docs/data/open-questions.yaml` | `docs/schema/open-question.schema.json` |
| `docs/data/phases.yaml` | `docs/schema/phase.schema.json` |
| `docs/data/documents.yaml` | `docs/schema/document.schema.json` |
| `docs/data/workflows.yaml` | `docs/schema/workflow.schema.json` |

Also read `output/shared/Feedback_Decisions_Log.md` for the sync check (Check 6).

---

## Step 2 — Run All Checks

### Check 1 — Schema Conformance

For each YAML file, verify:
- All `required` fields are present (per JSON Schema `required` array)
- All `enum` fields contain only valid values
- All `pattern` fields match their regex (IDs, dates, etc.)
- No `additionalProperties` present if schema says `additionalProperties: false`

Flag each violation as an **Error** with: file, entry ID, field name, actual value, expected constraint.

### Check 2 — ID Format Validation

Verify ID patterns across all files:
- `decisions.yaml`: IDs match `^D(-[A-Z0-9]+)?-[0-9]+$` (e.g., D-01, D-P2-06, D-P3-01)
- `open-questions.yaml`: IDs match `^OQ(-[A-Z0-9]+)?-[0-9]+$` (e.g., OQ-05, OQ-P2-02)
- `phases.yaml`: IDs match `^phase[1-9]$`
- `documents.yaml`: IDs are non-empty strings
- `workflows.yaml`: IDs match known track names (Trk-A, Trk-B, Lifecycle, Form-UI, P2-Batch, P3-HRMS)

Flag any ID that does not match its expected pattern as an **Error**.

### Check 3 — Cross-File Referential Integrity

For every cross-reference field, verify the referenced ID exists in the target file:

| Field | In file | Must exist in |
|---|---|---|
| `superseded_by` | decisions.yaml | decisions.yaml (same file) |
| `supersedes[]` | decisions.yaml | decisions.yaml (same file) |
| `oqs_created[]` | decisions.yaml | open-questions.yaml |
| `oqs_resolved[]` | decisions.yaml | open-questions.yaml |
| `resolution_decision` | open-questions.yaml | decisions.yaml |
| `raised_by_decision` | open-questions.yaml | decisions.yaml |
| `documents_reflect[]` | decisions.yaml | documents.yaml (short_code or id field) |
| `documents_check[]` | decisions.yaml | documents.yaml |
| `decisions_reflect[]` | documents.yaml | decisions.yaml |
| `key_decisions[]` | phases.yaml | decisions.yaml |
| `blocking_oqs[]` | phases.yaml | open-questions.yaml |
| `decision_ref` | workflows.yaml steps | decisions.yaml |
| `decision_ref` | workflows.yaml special_behaviors | decisions.yaml |
| `source_decisions[]` | workflows.yaml | decisions.yaml |

Flag any broken reference as an **Error**.

### Check 4 — Supersession Consistency

For every decision with `status: superseded`:
- `superseded_by` must be non-null and reference a real decision
- The referenced superseding decision must list this decision's ID in its `supersedes[]` array

For every decision with items in `supersedes[]`:
- Its own `status` must be `locked` (not `superseded`)
- Each listed ID must have `status: superseded` and `superseded_by` pointing back to this decision

Flag any asymmetric supersession link as an **Error**.

### Check 5 — Completeness Rules

**Decisions:**
- Every decision with `status: locked` must have at least one entry in `documents_reflect` OR a note explaining why it applies to all docs
- Every decision must have a non-empty `made_by` field
- Every decision with `oqs_resolved[]` → those OQs must have `status: Resolved` in open-questions.yaml

**Open Questions:**
- Every OQ with `status: Open` must have a non-empty `owner` AND non-empty `target_resolution`
- Every OQ with `status: Resolved` must have either `resolution_decision` or `resolution_note` (not both null)
- Every OQ with `status: Deferred` must have `resolution_note` explaining the deferral

**Phases:**
- Every phase with `status: active` must have `go_live_date` set (not null)
- Every phase letter type with `in_scope: true` must appear in at least one workflow's `letter_types` list

Flag missing required completeness data as **Warnings** (not Errors).

### Check 6 — FDL Sync Check

Compare counts against `output/shared/Feedback_Decisions_Log.md`:
- Count locked decisions in `decisions.yaml` → compare with count of D-XX rows in FDL Decisions Log
- Count superseded decisions in `decisions.yaml` → verify they appear with "(superseded by D-XX)" note in FDL
- Count Open OQs in `open-questions.yaml` → compare with Open OQ count in FDL

Flag any mismatch as a **Warning** with the specific count discrepancy.

### Check 7 — View-Layer Sync Warnings

Compare canonical data with view-layer data files:
- `docs/data/phases.yaml` active phase letter count vs. `docs/src/data/phases.yaml` phase1 items (first bullet)
- `docs/data/phases.yaml` active phase go_live_date vs. date mentioned in `docs/src/data/phases.yaml`
- `docs/data/documents.yaml` document count vs. `docs/src/data/outputs.yaml` document count

Flag any discrepancy as a **Warning** with: "View-layer file may be out of sync — run /build-overview after fixing."

---

## Output Format

### ❌ Errors — must fix before next validate-docs run
- **File:** filename
- **Entry:** ID
- **Field:** field name
- **Issue:** what is wrong
- **Expected:** correct value or constraint
- **Check:** which check caught it

### ⚠️ Warnings — review recommended
- **File:** filename
- **Entry:** ID (if applicable)
- **Concern:** what may be incomplete or inconsistent
- **Suggested action:** specific next step

### ✅ Passed checks
Brief summary per check number.

### 📋 Coverage summary
```
decisions.yaml    → N locked, M superseded, P draft — CHECK
open-questions.yaml → N Open, M Resolved, P Deferred, Q Closed — CHECK
phases.yaml       → N phases, M active — CHECK
documents.yaml    → N documents across N phases — CHECK
workflows.yaml    → N tracks — CHECK
FDL sync          → PASS / MISMATCH (details)
```

If all checks pass, confirm: "All canonical data files conform to their schemas and are internally consistent."

---

## When to Run

Run `/validate-schema` after:
- Adding any new D-XX, OQ-XX, phase, document, or workflow entry
- Changing any `status` field (decision locked/superseded, OQ resolved/deferred)
- Updating `supersedes` / `superseded_by` chains
- Resolving an OQ (changing status from Open to Resolved)

Run `/validate-docs` after `/validate-schema` passes — the output-document validator assumes canonical data is correct.
