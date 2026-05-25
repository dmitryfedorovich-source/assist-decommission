# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

BA/product documentation project migrating India HR document workflows from **assist.epam.com** (being decommissioned June 30, 2026) to **docs.epam.com**.

**Phases:** Phase 1 (Reference Letters, current) · Phase 2 (Compensation Letters) · Phase 3 (Separation Letters) · Phase 4+ (TBD)

## Repository Structure

```
input/
  screenshots/          # Assist platform screenshots (JPG/PNG) — hook intercepts re-reads
  confluence_exports/   # Static HTML exports (archived — use live MCP instead)
  transcriptions/       # Meeting transcripts; processed ones prefixed [processed]-
  meeting_notes/        # Background notes
  corrections/          # Stakeholder correction images

output/
  phase1_reference_letters/   # Phase 1 deliverables (01–06)
  phase2_compensation/        # Phase 2 deliverables
  phase3_separation/          # Phase 3 deliverables
  shared/                     # Feedback_Decisions_Log.md + RTM.md (source of truth)
  migration/                  # Migration readiness & operational docs (decommission, runbook, rollback, test plan)

docs/
  data/               # CANONICAL structured data (decisions, OQs, phases, documents, workflows)
  schema/             # JSON Schema files — one per entity type (decision, open-question, etc.)
  architecture/       # Generation pipeline architecture and design docs
  src/
    data/             # VIEW-LAYER YAML — derived from docs/data/, used by /build-overview
    components/       # HTML component templates (hero, nav, roadmap, etc.)
    styles/           # CSS source: tokens.css, base.css, components.css, responsive.css
    page-template.html  # Master assembler template

memory/                 # Claude persistent memory (tiered — see below)
CLAUDE.md               # This file
Project_Overview.html   # Generated — do not edit directly, use /build-overview
```

## Session Start Protocol

Every session, read these in order before doing any work:

1. `memory/context/project_state.md` — current phase status, open questions, next actions
2. `memory/context/domain_rules.md` — terminology rules, writing tone, invariant process rules
3. From project_state: identify active phase → read `memory/phase[N]/state.md`
4. For specific letter type work → read the relevant `memory/img_*.md` from MEMORY.md Source Knowledge section

Do NOT load all memory files. Do NOT load Archive-tier files. If a memory file has `status: needs-review`, verify against Feedback_Decisions_Log.md before using.

## Memory System — Tier Reference

Memory lives at `~/.claude/projects/.../memory/` and is indexed by `MEMORY.md`.

| Tier | Files | Load when |
|---|---|---|
| Session Bootstrap | `context/project_state.md`, `context/domain_rules.md`, `reference_confluence.md` | Every session |
| Phase Knowledge | `phase1/state.md`, `phase2/state.md`, `phase3/state.md` | When working on that phase |
| Source Knowledge | `img_*.md`, `kb_*.md` | Only for specific letter type or technical area |
| Archive | files marked `status: archived` | Only if explicitly needed for historical reference |

Domain facts live exclusively in memory — not in this file. If you need domain facts, read the appropriate phase state file.

## Deliverables

### Phase 1 — Reference Letters (`output/phase1_reference_letters/`)

| File | Audience | Purpose |
|---|---|---|
| `01_Process_Flow_Reference_Letters.md` | Internal | Target-state process in Docs |
| `02_BRD_Reference_Letters.md` | Docs platform team | Business requirements |
| `03_Presentation_Internal_Team.md` | Docs platform team | Detailed briefing + action items |
| `04_KB_Onepager.html` | EPAM management | Business case, scope, timeline |
| `05_India_SME_Validation.md` | India stakeholders | SME review & sign-off |
| `06_India_Colleagues_Guide.md` | India employees | What changes + how to use Docs |

### Phase 2 — Compensation Letters (`output/phase2_compensation/`)

| File | Audience | Purpose |
|---|---|---|
| `01_KB_Onepager.html` | EPAM management | Phase 2 scope preview |

### Phase 3 — Separation Letters (`output/phase3_separation/`)

| File | Audience | Purpose |
|---|---|---|
| `01_KB_Onepager.html` | EPAM management | Phase 3 scope preview |

### Shared (`output/shared/`)

| File | Audience | Purpose |
|---|---|---|
| `Feedback_Decisions_Log.md` | BA team | Cross-phase decisions, open questions, feedback log — **authoritative source of truth** |
| `RTM.md` | BA team | Requirements Traceability Matrix — Decision×Document, Decision×Workflow, OQ impact map, source index |

## Skill Model Routing

All skills delegate to subagents to keep the main session context clean and reduce costs on mechanical tasks:

| Skill | Model | Reason |
|---|---|---|
| `/validate-schema` | **haiku** | Mechanical YAML schema checks — no domain reasoning |
| `/validate-quick` | **haiku** | String matching + factual lookup on single file |
| `/validate-docs` | **sonnet** | Complex validation — isolates large file reads from main context |
| `/build-overview` | **sonnet** | Mechanical HTML assembly — isolates template/CSS reads |
| `/status-check` | **sonnet** | Report generation — isolates FDL/state reads |

Each skill's SKILL.md contains a `## Model Routing` section at the top with the exact `Agent(...)` call to make. When a skill is invoked, spawn the subagent as specified — do not execute the task in the main session.

---

## Working in this Repo

**Before writing any output document:** check `output/shared/Feedback_Decisions_Log.md` for confirmed decisions. Read the relevant phase state memory file for current facts.

**After editing any file in `output/`:** run `/validate-docs`. It validates factual accuracy, terminology, consistency, and completeness across the full doc set.

**After editing any file in `docs/src/`:** run `/build-overview` to regenerate `Project_Overview.html`. Do NOT manually edit `Project_Overview.html` — it is a generated file and changes will be overwritten. Edit the appropriate source file in `docs/src/data/` or `docs/src/components/` instead.

**Input screenshots hook:** A PreToolUse hook intercepts every read of `input/screenshots/` images. If `memory/img_<safe_name>.md` already exists → hook blocks the read and redirects you there. If no memory file exists yet → read the image, then immediately save extracted knowledge to `memory/img_<safe_name>.md`. Apply the confidence schema from `memory/traceability/confidence_schema.md` when writing new memory files (frontmatter confidence fields + inline annotations for low/assumed facts).

**Confluence MCP:** Source pages are in EPMEOADOCS space on kb.epam.com. Use `mcp__confluence__*` tools to look up or verify information. Page IDs are in `memory/reference_confluence.md`.

**Processing a new transcript:** Read → extract decisions/facts → update Feedback_Decisions_Log.md → update relevant phase state memory file → rename transcript file with `[processed]-` prefix → update `context/project_state.md` open items → add F-XX entry to Feedback_Decisions_Log → run `/validate-docs` if output files affected.

**Adding a new decision or OQ:** Follow the templates in `memory/traceability/templates.md`. Every D-XX must be added to three places: Feedback_Decisions_Log.md, RTM.md, and `docs/data/decisions.yaml`. Run `/validate-schema` after updating `docs/data/decisions.yaml` to confirm sync with FDL. Every OQ-XX must be added to Feedback_Decisions_Log.md AND `docs/data/open-questions.yaml`. Use the end-of-session checklist in templates.md before closing the session.

**After editing any file in `docs/data/`:** run `/validate-schema` to check schema conformance and cross-file referential integrity. Run `/validate-docs` afterward if output documents are affected.

**Structured data architecture:** `docs/data/` is the canonical source of truth for decisions, OQs, phases, documents, and workflows. `docs/src/data/` is the view layer used by `/build-overview`. When canonical data changes, sync the view layer manually and re-run `/build-overview`. See `docs/architecture/generation-pipeline.md` for the full architecture.

**Migration readiness docs** live in `output/migration/`. These cover the June 30, 2026 cutover: Decommission Plan, Rollback & Recovery Plan, Go-Live Runbook, Test Validation Plan, Acceptance Criteria, Communication Plan, Monitoring Plan, and Reconciliation Report Template. Run `/validate-docs` after updating any file that references FDL decision IDs. Rollback Plan and Decommission Plan must be reviewed and signed off before Stage 4 (UAT) begins.

**Memory compression trigger:** When >8 Layer 3 files exist for a single phase, or when a phase reaches Stage 3 sign-off, consolidate into that phase's `state.md`, mark source files `status: archived`, and remove them from the active sections of MEMORY.md.

## Writing Guidelines

Full tone rules per document type are in `memory/context/domain_rules.md`. Summary:

- **04 KB Onepager:** management language — no field-level detail, no jargon
- **05 India SME Validation:** structured for review — explicit questions, confirmation checkboxes
- **06 India Colleagues Guide:** user-friendly, practical — no migration rationale, no internal process detail
- **01 Process Flow:** target state only — no as-is Assist flow descriptions
- **02 BRD:** standard BA format — context, objectives, scope, stakeholders, FRs, integrations, NFRs, assumptions, risks
- **03 Internal Presentation:** detailed — process flows, field specs, integration points, action items
