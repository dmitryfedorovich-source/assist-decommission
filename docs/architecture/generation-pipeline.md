# Generation Pipeline Architecture

**Project:** Assist → EPAM Docs Migration  
**Maintainer:** BA team  
**Last updated:** 2026-05-08

---

## Overview

This document describes the structured-data-driven architecture for the documentation system. The core principle: **YAML files are the source of truth**; all output documents and views are generated from them.

```
docs/data/          ← CANONICAL SOURCE OF TRUTH
  decisions.yaml
  open-questions.yaml
  phases.yaml
  documents.yaml
  workflows.yaml

docs/schema/        ← JSON SCHEMA VALIDATION
  decision.schema.json
  open-question.schema.json
  phase.schema.json
  document.schema.json
  workflow.schema.json
  validation-rule.schema.json

docs/src/data/      ← VIEW-LAYER YAML (generated from canonical)
  meta.yaml         ← page metadata + stats (manually maintained)
  phases.yaml       ← roadmap cards (derived from docs/data/phases.yaml)
  outputs.yaml      ← document catalog (derived from docs/data/documents.yaml)
  validation.yaml   ← validator check list (manually maintained)

output/             ← GENERATED OUTPUT DOCUMENTS
  phase1_reference_letters/
  phase2_compensation/
  phase3_separation/
  shared/

Project_Overview.html  ← GENERATED (from docs/src/ via /build-overview)
```

---

## Canonical Data Layer (`docs/data/`)

### What belongs here

The canonical data layer contains **normalized, schema-validated facts** about the project that are:
- Sourced from meetings, transcripts, or Confluence pages
- Locked by a named decision-maker
- Referenced across multiple output documents

**Five canonical files:**

| File | Contents | Key schema |
|---|---|---|
| `decisions.yaml` | All 26+ decisions (D-01…D-P3-02) with full metadata | `decision.schema.json` |
| `open-questions.yaml` | All 21 OQs with status and resolution tracking | `open-question.schema.json` |
| `phases.yaml` | Phase scope, letter types, sign-off stages | `phase.schema.json` |
| `documents.yaml` | Output document catalog with audience rules | `document.schema.json` |
| `workflows.yaml` | Routing tracks and process steps | `workflow.schema.json` |

### What does NOT belong here

- CSS tokens, component templates → `docs/src/`
- Memory files with extracted field-level knowledge → `memory/`
- Feedback log narrative text → `output/shared/Feedback_Decisions_Log.md`

---

## View-Layer Data (`docs/src/data/`)

These files are optimized for the `/build-overview` HTML renderer. They are **derived from** the canonical layer, not independent sources.

| View file | Derived from | How to sync |
|---|---|---|
| `docs/src/data/phases.yaml` | `docs/data/phases.yaml` | Update manually when phase status changes |
| `docs/src/data/outputs.yaml` | `docs/data/documents.yaml` | Update manually when documents are added |
| `docs/src/data/meta.yaml` | Manually maintained (stats, nav, hero) | Update after each validator run |
| `docs/src/data/validation.yaml` | Manually maintained (check list) | Update when new validator checks added |

**Sync rule:** When you update `docs/data/phases.yaml`, also update `docs/src/data/phases.yaml` accordingly and re-run `/build-overview`.

---

## Output Channels

The generation pipeline supports five output channels. Claude is the generation engine for all of them.

### Channel 1 — Markdown (operational)

**Output:** `.md` files in `output/`  
**How:** Claude reads canonical YAML + memory files → writes Markdown  
**Used for:** 01 Process Flow, 02 BRD, 03 Presentation, 05 India SME, 06 Colleagues Guide, FDL, RTM  
**Validation:** `/validate-docs` after every write

```
docs/data/decisions.yaml  ──┐
docs/data/phases.yaml     ──┤→ Claude → output/phase1_reference_letters/01_...md
memory/phase1/state.md    ──┘
```

### Channel 2 — HTML (operational)

**Output:** `Project_Overview.html` (project root), `04_KB_Onepager.html`, `01_KB_Onepager.html` (phases 2, 3)  
**How:** `/build-overview` → reads `docs/src/data/*.yaml` + `docs/src/components/*.html` + `docs/src/styles/*.css` → writes assembled HTML  
**Used for:** Management-facing onepagers, project overview page  
**Validation:** Check for unresolved SLOT/LOOP markers after build

```
docs/src/data/phases.yaml     ──┐
docs/src/data/outputs.yaml    ──┤→ /build-overview → Project_Overview.html
docs/src/components/*.html    ──┤                  → 04_KB_Onepager.html
docs/src/styles/*.css         ──┘
```

### Channel 3 — Confluence (operational via MCP)

**Output:** Confluence pages in EPMEOADOCS space  
**How:** Claude reads `docs/data/*.yaml` + output Markdown → calls `mcp__confluence__*` tools  
**Used for:** Publishing approved documents to stakeholders  
**Validation:** Check page renders correctly in Confluence preview  

```
output/phase1_reference_letters/04_KB_Onepager.html ──→ mcp__confluence__update_page
output/shared/Feedback_Decisions_Log.md             ──→ mcp__confluence__update_page
```

**Key constraint:** HTML must be standalone (no external CSS) for Confluence HTML macros.

### Channel 4 — PDF (via browser print)

**Output:** PDF files for official letter template review  
**How:** Open HTML onepager in browser → Print → Save as PDF  
**Used for:** Sharing management onepagers in non-HTML environments  
**No automation planned** — manual browser print is sufficient.

### Channel 5 — PowerPoint (future)

**Output:** `.pptx` presentation files  
**How (planned):** Claude reads `03_Presentation_Internal_Team.md` + `docs/data/*.yaml` → generates structured PPTX via python-pptx template or equivalent  
**Used for:** Formal presentation to DOCS platform team  
**Status:** Not yet implemented. Current approach: Markdown → manual PPTX conversion.

**Roadmap note:** PPTX generation is the highest-effort channel. Recommended approach when ready:
1. Define a slide schema in `docs/schema/slide.schema.json`
2. Add a `docs/data/slides.yaml` for slide content
3. Use a Python script or prompt-based PPTX template to assemble

---

## Schema Versioning

Every canonical data file includes a `_meta` block:

```yaml
_meta:
  schema_version: "1.0"
  schema_ref: "../schema/decision.schema.json"
  last_updated: "2026-05-08"
  maintainer: "BA team"
```

### Version increment rules

| Change type | Version change | Example |
|---|---|---|
| Add optional field | Patch: `1.0` → `1.0.1` | Add `notes` field |
| Add required field | Minor: `1.0` → `1.1` | Add new required metadata |
| Rename or remove field | Major: `1.0` → `2.0` | Rename `made_by` → `decision_maker` |
| Change enum values | Minor: `1.0` → `1.1` | Add new routing type |

When incrementing the version:
1. Update the `$id` and version-related comment in `docs/schema/<name>.schema.json`
2. Update `_meta.schema_version` in all affected data files
3. Run `/validate-schema` to verify all data files still conform

---

## Migration Strategy

### Phase A — Parallel operation (current)

- Canonical YAML files exist alongside Markdown FDL
- `Feedback_Decisions_Log.md` remains the primary operational log (BAs update it first)
- Canonical YAML files are updated in sync after each FDL update
- No output document is yet auto-generated from YAML

**When to do this:** Now. All 26 decisions and 21 OQs are already in YAML.

### Phase B — YAML-primary for new decisions

- When a new D-XX or OQ-XX is added: write to YAML first, then generate FDL entry from YAML
- Output documents generated from YAML data + memory files (Claude prompts)
- `/validate-schema` added to the post-update workflow alongside `/validate-docs`

**When to do this:** After Phase 1 Stage 1 sign-off.

### Phase C — FDL as a generated view

- `Feedback_Decisions_Log.md` becomes a generated output (Claude regenerates it from YAML)
- `/validate-schema` catches structural issues before they reach FDL
- All output documents reference YAML for facts; memory files for field-level detail

**When to do this:** After Phase 2 scoping complete.

### Phase D — Full multi-channel automation

- `/build-all` skill: reads all YAML → generates all output documents → validates → reports
- Confluence sync is semi-automated (Claude proposes updates, human approves)
- PPTX generation added if business need emerges

**When to do this:** After Phase 3 planning complete.

---

## Validation Rules for Structured Data

The `/validate-schema` skill checks:

1. **Schema conformance** — every YAML file matches its JSON Schema (required fields, enum values, pattern constraints)
2. **Cross-file referential integrity** — every `decision_ref` in an OQ resolves to a real D-ID in `decisions.yaml`; every `raised_by_decision` resolves; every `resolution_decision` resolves
3. **Status consistency** — every D-ID with `status: superseded` has a non-null `superseded_by`; every superseded D-ID is referenced in the superseding decision's `supersedes` list
4. **Coverage completeness** — every locked decision has at least one document in `documents_reflect`; every document in `documents_reflect` exists in `documents.yaml`
5. **OQ completeness** — every Open OQ has an `owner` and `target_resolution`; every Resolved OQ has a `resolution_decision` or `resolution_note`
6. **Sync check** — count of locked decisions in `decisions.yaml` matches count in `output/shared/Feedback_Decisions_Log.md`; mismatches flag as warnings

---

## Anti-Patterns to Avoid

| Anti-pattern | Why it's wrong | What to do instead |
|---|---|---|
| Editing `docs/src/data/phases.yaml` without updating `docs/data/phases.yaml` | View layer diverges from canonical | Always update canonical first, then sync view layer |
| Adding a new decision only to FDL | Breaks cross-file referential integrity | Use the three-artifact rule: FDL + RTM + impact_index (+ decisions.yaml Phase B+) |
| Hardcoding a decision fact in an output doc | Will drift when decision changes | Reference the fact from YAML via Claude prompt |
| Treating `Project_Overview.html` as a source file | Will be overwritten by `/build-overview` | Edit `docs/src/` files and rebuild |
| Adding a new letter type to `phases.yaml` without updating `workflows.yaml` | Workflow coverage gap | Always update both together |

---

## Quick Reference — Which File to Edit

| You want to... | Edit this file |
|---|---|
| Record a new locked decision | `output/shared/Feedback_Decisions_Log.md` + `output/shared/RTM.md` + `memory/traceability/impact_index.md` + `docs/data/decisions.yaml` |
| Update a phase's status (active/done/next) | `docs/data/phases.yaml` AND `docs/src/data/phases.yaml` → run `/build-overview` |
| Add a new output document | `docs/data/documents.yaml` AND `docs/src/data/outputs.yaml` → run `/build-overview` |
| Add a new workflow track | `docs/data/workflows.yaml` |
| Change a validator check | `.claude/skills/validate-docs/SKILL.md` AND `docs/src/data/validation.yaml` → run `/build-overview` |
| Change page stats (e.g., decision count) | `docs/src/data/meta.yaml` → run `/build-overview` |
| Change CSS design tokens | `docs/src/styles/tokens.css` → run `/build-overview` |
