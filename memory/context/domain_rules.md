---
name: Domain Rules — Terminology, Tone, Invariant Process Rules
description: Canonical terminology, per-document writing tone rules, and invariant process rules that must not vary across deliverables
type: project
status: active
last_updated: 2026-05-13
---

## Terminology — Always Use

| Use this | Not this | Context |
|---|---|---|
| India Team specialists | HRBP | Any India/management-facing document (D-08) |
| India Team specialists | HR specialists, local specialists | India/management-facing docs |
| DV/EDV (local specialist) | RM, HRBP | When describing who verifies Track B letters |
| Document Verifier (DV) / Extended Document Verifier (EDV) | Any other role name | Technical description of specialist role in DOCS |
| EPAM Docs / docs.epam.com | EPAM DOCS (all caps), Docs platform | User-facing docs |
| Assist / assist.epam.com | Assist portal, the old system | When naming the decommissioned system |
| People system / People platform | HRMS, HR system, People Portal | When referencing HR data source |
| Form 60 | Form60, form-60 | Always with space |
| Letter of Recommendation (LOR) | LOR (first mention should spell out) | Standard abbreviation |
| Compensation Team specialist | India HR team, HR specialist | For Phase 2 batch initiator (D from flow diagrams) |
| June 30, 2026 | July 1, 2026 | Go-live and decommission date (D-01, F-01) |

## Track Classification

- **Track A (auto-verified):** Form 60, Address Proof Letter, Service Letter — instant letter generation, no specialist action
- **Track B (manual review):** Visa Processing Letter, LOR (active employees) — DV/EDV verifies, then manually sends via "Send Document"

## Invariant Process Rules (must not vary across docs)

- RM approval is **removed** from all Phase 1 DOCS flows (D-15). Do not describe RM approval anywhere.
- DV/EDV specialist verifies Track B letters and **manually sends** the document via "Send Document" (D-12, D-13)
- Rejection requires a **mandatory comment** from specialist (D-19). Approval requires no comment.
- Rejected form stays open — employee **edits and resubmits the same form** (not a new request) (D-07)
- No limit on rejection/resubmission cycles
- Auto-close: **2 days** after all forms in a request reach final status (D-06) — Phase 1 only
- Self-Declaration "Accept" checkbox is at the **bottom** of each form (D-21, supersedes D-17)
- Address field in Address Proof Letter is **read-only** — update via People system (D-20)
- Employee cannot submit a new request for the same letter type while a previous request is still open
- Form 60 field label: **"Current address"** (2-line), **"Worksite city"** (dropdown), **"Salutation"** (dropdown, e.g. Mrs./Mr.) (D-22)
- LOR is for **active employees only** in Phase 1 (ex-employee LOR is Phase 3)
- Relocation Letter is **out of Phase 1** — Phase 4+ (D-16)

## Writing Tone by Document Type

### 04 KB Onepager (management audience)
- Executive, no jargon, business value framing
- No field-level detail, no technical constraints
- Bullets: short, outcome-oriented
- Avoid: "DV/EDV", dropdown values, character limits, auto-close intervals

### 05 India SME Validation (India stakeholders)
- Structured for review: explicit numbered questions, blank answer boxes
- Factual, precise — include field names, routing, behavior specifics
- Each section ends with a confirmable question
- Format: ✅ Confirm / ❌ Reject / 💬 Comment

### 06 India Colleagues Guide (India employees)
- User-friendly: step-by-step, plain language
- No migration rationale, no internal process detail, no decision IDs
- Focus: what you need to do, what you need to fill in, how long it takes
- Contact: WFAHumanResourceIndia@epam.com

### 01 Process Flow (internal BA team)
- Target-state only — do not describe Assist as-is flow
- Include field specs, routing logic, status transitions
- Use decision IDs (D-XX) as references

### 02 BRD (Docs platform team)
- Standard BA format: context, objectives, scope, stakeholders, FRs, integrations, NFRs, assumptions, risks
- Include FR IDs, link to decision IDs
- Technical precision required

### 03 Internal Presentation (Docs platform team)
- Detailed briefing: process flows, field specs, integration points, action items
- Audience understands DOCS platform internals

### 07 India SME Presentation (India SME slide deck)
- Behavior cards: factual, no confirmation language (behaviors are DOCS platform defaults — no need to ask for acceptance)
- Slide structure: context → scope → flows → fields → common behaviors → sign-off
- 11 behavior cards on Slide 6; one Comments textarea at end

## DOCS Platform Facts (invariants)

- Status "Waiting for verification" shows after form submission — even for auto-verified Track A letters (until nightly batch runs)
- Track A letters: letter is already downloadable from "Documents to download" **before** and **after** the "Waiting for verification" status
- Request creation requires TWO actions: (1) select type from dropdown, (2) click "Create request" button
- "Save as draft" option available on all forms
- "Additional Documents" upload section on all requests (up to 60 files, max 199 MB each)
- Contact point shown on India letters: WFA Human Resource India / WFAHumanResourceIndia@epam.com
- Specialist sees a "System File" form (pre-populated People data: First name, Last name, Start date in EPAM India, UID, Email)
- Custom Purpose text field: always visible (cannot be conditionally shown), max 100 characters, single line
- Letter type names in DOCS dropdown: "IN Form 60", "IN Visa Processing Letter", "IN Address Proof Letter", "IN Letter of Recommendation", "IN Service Letter" — "IN Relocation Letter" is NOT in live DOCS dropdown

## Open Questions Affecting Docs (as of 2026-05-13)

- OQ-05: Service Letter Purpose dropdown values — India HR (affects 01, 02, 05)
- OQ-06: Visa Processing Letter Purpose dropdown values — India HR (affects 01, 02, 05)
- OQ-07: LOR Purpose dropdown values — India HR (affects 01, 02, 05)
- OQ-08: Bank/SIM/LPG sub-types via Purpose dropdown? — India Team (affects 05)
- OQ-11: DOCS dev effort for Comments/Notes fields — currently only number marker supported (affects 02)
- OQ-13: Relocation Letter scoping questions — Phase 4+
