# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a BA/product documentation project for migrating India HR document workflows from **assist.epam.com** (being decommissioned) to **docs.epam.com** (the existing EPAM document platform).

**Phase 1 (current):** Reference Letters  
**Future phases:** Compensation Letters, Separation Letters, and others  
**Deadline:** June 30, 2026

## Repository Structure

```
input/          # Source materials: flow diagrams (PDF), Assist screenshots (images)
output/         # All deliverable documents produced for this project
memory/         # Claude persistent memory (do not edit manually)
CLAUDE.md       # This file
```

## Deliverables

Every document goes into `output/`. The full set for Phase 1:

| File | Audience | Purpose |
|---|---|---|
| `01_Process_Flow_Reference_Letters.md` | Internal | Target-state process in Docs |
| `02_BRD_Reference_Letters.md` | Docs platform team | Business requirements |
| `03_Presentation_Internal_Team.md` | Docs platform team | Detailed briefing + action items |
| `04_Presentation_Management.md` | EPAM management | Business case, timeline, risks |
| `05_Presentation_India_Colleagues.md` | India employees | What changes + how to use Docs |

## Key Domain Knowledge

**Two letter tracks:**
- **Auto-verified** (no HRBP needed): Form 60, Address Proof Letter, Service Letter
- **Requires HRBP approval**: Visa Processing Letter, LOR (active employees only), Relocation Letter

**Process actors:** Employee · DOCS platform (automated) · HRBP  
**Rejection flow:** HRBP rejects → employee opens a brand-new request (no resubmit on same request)  
**Auto-close:** Requests auto-close after 10 days if HRBP does not close manually  
**LOR for ex-employees:** Out of scope for Phase 1 — handled in Separation Letters phase

**Data pre-population:** Employee name, designation, UID, work/birth location, and start date are pulled from backend HR systems. Fields like Father Name, PAN, Address, Mobile, Purpose, and Country are manually entered by the employee.

**Self-Declaration popup** is required before submission for: Service Letter, Relocation Letter, LOR.

## Writing Guidelines

- **Process Flow:** Document target state only (no as-is Assist flow needed)
- **BRD:** Follow standard BA format — context, objectives, scope, stakeholders, functional requirements per letter type, integrations, non-functional requirements, assumptions, risks
- **India colleagues presentation:** Tone is user-friendly and practical — "what changes and how to use it." No rationale for the migration needed.
- **Management presentation:** High-level — business value, scope, timeline, risks
- **Internal team presentation:** Detailed — process flows, field specs, integration points, action items
