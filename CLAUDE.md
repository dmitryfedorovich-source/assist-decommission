# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a BA/product documentation project for migrating India HR document workflows from **assist.epam.com** (being decommissioned) to **docs.epam.com** (the existing EPAM document platform).

**Phase 1 (current):** Reference Letters  
**Future phases:** Compensation Letters, Separation Letters, and others  
**Deadline:** June 30, 2026

## Repository Structure

```
input/
  screenshots/          # Assist platform screenshots (JPG/PNG)
  confluence_exports/   # Confluence page HTML exports
  meeting_notes/        # Meeting notes, open questions (DOCX, TXT)
  corrections/          # Stakeholder correction images and notes

output/
  phase1_reference_letters/   # All Phase 1 deliverables
  phase2_compensation/        # Phase 2 deliverables (in progress)
  phase3_separation/          # Phase 3 deliverables (planned)
  shared/                     # Cross-phase documents (Feedback & Decisions Log)

memory/         # Claude persistent memory (do not edit manually)
CLAUDE.md       # This file
```

## Deliverables

Documents are organized by phase. Within each phase folder, files are numbered 01–NN.

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
| `Feedback_Decisions_Log.md` | BA team | Cross-phase decisions, open questions, feedback |

## Key Domain Knowledge

**Three routing tracks (Phase 1):**
- **Auto-verified (instant):** Form 60, Address Proof Letter, Service Letter
- **Review required (under clarification):** Visa Processing Letter, LOR (active employees only) — approval step may be removed before go-live
- **Date-triggered auto-verification:** Relocation Letter — initiated by RM / India Team specialist; system auto-approves on effective date; past-date requests approved immediately

**Process actors:** Employee · RM / India Team specialist · DOCS platform (automated)  
**Rejection flow:** India Team specialist rejects → employee opens a brand-new request (no resubmit on same request)  
**Auto-close:** Requests auto-close after **2 days** once all forms reach final status (Verified / Generated)  
**LOR for ex-employees:** Out of scope for Phase 1 — handled in Separation Letters phase (Phase 3)

**Data pre-population:** Employee name, designation, UID, work/birth location, and start date are pulled from backend HR systems. Fields like Father Name, PAN, Address, Mobile, and Purpose are manually entered by the employee.

**Visa Processing Letter:** uses a "Comments" field (max 300 chars, single line) — not a "Country" field.  
**Self-Declaration popup:** Not required in EPAM Docs (skip).  
**"Are you Working From Home" field:** Not required in EPAM Docs (skip).

## Writing Guidelines

- **Process Flow:** Document target state only (no as-is Assist flow needed)
- **BRD:** Follow standard BA format — context, objectives, scope, stakeholders, functional requirements per letter type, integrations, non-functional requirements, assumptions, risks
- **India colleagues presentation:** Tone is user-friendly and practical — "what changes and how to use it." No rationale for the migration needed.
- **Management presentation:** High-level — business value, scope, timeline, risks
- **Internal team presentation:** Detailed — process flows, field specs, integration points, action items
