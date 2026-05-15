---
name: Phase 1 State — Reference Letters (confirmed domain facts)
description: All confirmed Phase 1 domain facts: letter types, field specs, decisions, 11 common behaviors, platform specifics, open items
type: project
status: active
last_updated: 2026-05-13
---

## Phase Summary

**Phase:** Phase 1 — Reference Letters  
**Go-live:** June 30, 2026  
**Assist decommissioned:** June 30, 2026  
**Stage:** SME validation session completed 2026-05-13; awaiting stakeholder sign-off  
**Current stage:** Stage 2 (India SME validation)

## Letter Scope — 5 Letters

| # | Letter | Track | Specialist action |
|---|---|---|---|
| 1 | Form 60 | A — auto-verified | None — instant |
| 2 | Address Proof Letter | A — auto-verified | None — instant |
| 3 | Service Letter | A — auto-verified | None — instant |
| 4 | Visa Processing Letter | B — manual review | DV/EDV verifies → "Send Document" |
| 5 | Letter of Recommendation (LOR) | B — manual review | DV/EDV verifies → "Send Document" (active employees only) |

**Out of Phase 1:** Relocation Letter (Phase 4+, D-16); LOR for ex-employees (Phase 3)

## Field Specifications

### Form 60 (D-22 — updated from DOCS screenshots 2026-05-13)

| Field | Filled by | Type | Notes |
|---|---|---|---|
| Date | System (DOCS) | Auto | Read-only |
| Name | People system | Auto | Read-only |
| Designation | People system | Auto | Read-only |
| UID | People system | Auto | Read-only |
| Work Location | People system | Auto | Read-only |
| Birth Location | People system | Auto | Read-only |
| Start Date | People system | Auto | Read-only |
| Salutation | Employee | Dropdown | e.g. Mrs./Mr. — confirmed in DOCS (D-22) |
| Father name | Employee | Text | Free text |
| Current address | Employee | Text | 2-line input (D-22, replaces "Address") |
| Worksite city | Employee | Dropdown | e.g. Pune (D-22, replaces "City" free text) |
| UAN | Employee | Text | Free text |
| State | Employee | Text | Free text |
| Mobile number | Employee | Text | Free text |
| PAN | Employee | Text | Free text |

### Address Proof Letter

| Field | Filled by | Type | Notes |
|---|---|---|---|
| Date | System (DOCS) | Auto | Read-only |
| Name | People system | Auto | Read-only |
| Designation | People system | Auto | Read-only |
| UID | People system | Auto | Read-only |
| Start Date | People system | Auto | Read-only |
| Address | People system | Auto | **Read-only (locked) — D-20**; if missing, employee updates People system profile |
| Purpose | Employee | Dropdown | Options TBD (OQ-05 — Address Proof confirmed: Personal Loan / Home Loan / Bank Connection / New Broadband Connection / Custom) |
| Custom Purpose text | Employee | Text | Always visible; max 100 chars, single line (F-09 platform constraint) |

**Special behavior:** If address not found in People system, form shows error directing to People system update.

### Service Letter

| Field | Filled by | Type | Notes |
|---|---|---|---|
| Date | System (DOCS) | Auto | Read-only |
| Name | People system | Auto | Read-only |
| Designation | People system | Auto | Read-only |
| UID | People system | Auto | Read-only |
| Work Location | People system | Auto | Read-only |
| Start Date | People system | Auto | Read-only |
| Purpose | Employee | Dropdown | **OQ-05 — values not yet confirmed by India HR** |
| Custom Purpose text | Employee | Text | Always visible; max 100 chars, single line |

### Visa Processing Letter (Track B)

Form section header in DOCS: **"Travel details"** (confirmed from screenshots 2026-05-13)

| Field | Filled by | Type | Notes |
|---|---|---|---|
| Date | System (DOCS) | Auto | Read-only |
| Name | People system | Auto | Read-only |
| Designation | People system | Auto | Read-only |
| UID | People system | Auto | Read-only |
| Work Location | People system | Auto | Read-only |
| Start Date | People system | Auto | Read-only |
| Purpose of Travel | Employee | Free text | Confirmed from DOCS screenshots |
| Destination Country | Employee | Free text | Confirmed from DOCS screenshots |
| Tentative Travel start date | Employee | Date picker | Confirmed from DOCS screenshots |
| Tentative Travel end date | Employee | Date picker | Confirmed from DOCS screenshots |
| Travel type | Employee | Dropdown | e.g. "Personal Travel" — confirmed from DOCS screenshots (**OQ-06 redirected: dropdown is Travel type, not Purpose**) |
| Comments | Employee | Text area | Confirmed from DOCS screenshots (prior spec "max 300 chars, single line" was assumption — actual DOCS type is text area) |

### Letter of Recommendation — LOR (Track B, active employees only)

| Field | Filled by | Type | Notes |
|---|---|---|---|
| Date | System (DOCS) | Auto | Read-only |
| Name | People system | Auto | Read-only |
| Designation | People system | Auto | Read-only |
| UID | People system | Auto | Read-only |
| Work Location | People system | Auto | Read-only |
| Start Date | People system | Auto | Read-only |
| Purpose | Employee | Dropdown | **OQ-07 — values not yet confirmed by India HR** |
| Custom Purpose text | Employee | Text | Always visible; max 100 chars, single line |
| Roles & Responsibilities | Employee | Text area | **Required** (D-18); max ~6000 chars, multi-line, paragraphs supported (field name confirmed from DOCS screenshots 2026-05-13) |

## 11 Common Behaviors (Slide 6 of 07 presentation)

1. **Self-Declaration checkbox** at bottom of every form — "Accept" checkbox, full text confirmed (D-21, supersedes D-17)
2. **Rejection → edit & resubmit same form** — specialist rejects with mandatory comment; employee edits same form and resubmits; no limit (D-07, D-19)
3. **Auto-close 2 days** after all forms reach final status (Verified/Generated) — Phase 1 (D-06)
4. **One active request at a time** — cannot create new request for same letter type while previous is open
5. **Notifications** — employee: letter ready / form rejected (with reason); specialist: new request waiting for verification
6. **Data pre-population from People system** — Date (DOCS), Name/Designation/UID/Start Date (all 5); Work Location (Form 60, Service, Visa, LOR); Birth Location (Form 60); Address (Address Proof — locked)
7. **"Comments" / "Roles & Responsibilities" field required** — Visa Processing Comments: text area (D-18); LOR active Roles & Responsibilities: max ~6000 chars, multi-line (D-18)
8. **RM approval removed; DV/EDV verifies** — Track B: Visa Processing, Relocation Letter, LOR active. Specialist verifies then uses "Send Document" (D-12, D-13, D-15)
9. **Auto-verification status change** — Track A: status shows "Waiting for verification" after submit; nightly batch changes to "Verified" — no action needed (platform behavior)
10. **Purpose field "Custom" text** — Address Proof, Service Letter, LOR: always visible, optional, max 100 chars, single line
11. **Address field read-only** — Address Proof Letter: address from People system, locked; update via People system profile (D-20)

## Confirmed Decisions Summary

| Decision | Summary |
|---|---|
| D-01 | Go-live June 30, 2026 |
| D-06 | Auto-close 2 days (Phase 1) |
| D-07 | Rejection: edit & resubmit same form (corrected 2026-05-12) |
| D-08 | Terminology: "India Team specialists" (not HRBP) |
| D-09 | Visa Processing Comments: max 300 chars, single line |
| D-10 | Cancel request: not in Phase 1 MVP |
| D-11 | Historical data migration: out of scope |
| D-12 | Visa Processing: RM approval removed; DV/EDV verifies → "Send Document" |
| D-13 | LOR active: RM approval removed; DV/EDV verifies → "Send Document" |
| D-15 | All Phase 1 letters: RM approval removed entirely |
| D-16 | Relocation Letter: out of Phase 1 (Phase 4+) |
| D-17 | Superseded by D-21 |
| D-18 | Comments (Visa) and Notes (LOR) are required fields |
| D-19 | Rejection comment mandatory; approval requires no comment |
| D-20 | Address Proof: address field locked (read-only) |
| D-21 | Self-Declaration "Accept" checkbox confirmed in DOCS (bottom of form) |
| D-22 | Form 60 fields: Salutation (new), "Current address" (2-line), "Worksite city" (dropdown) |

## Open Questions (Phase 1, as of 2026-05-13)

| ID | Question | Owner |
|---|---|---|
| OQ-05 | Service Letter Purpose dropdown values | India HR |
| OQ-06 | Visa Processing Letter **Travel type** dropdown values (not "Purpose" — Purpose of Travel is free text) | India HR |
| OQ-07 | LOR Purpose dropdown values | India HR |
| OQ-08 | Bank/SIM/LPG sub-types via Purpose dropdown? | India Team |
| OQ-11 | DOCS dev effort: Comments (Visa) and Notes (LOR) text fields | DOCS Platform / Michael |

## Stakeholders

- **India sign-off:** Satish Malla, Satya Danam, Sasanka Yedlapati, LalithaPavani Madiraju
- **India HR Team contact:** WFAHumanResourceIndia@epam.com
- **Internal BA:** Darya Taranda, Hanna Vasilenka, Dzmitry Fedarovich, Olga Chaban

## Next Actions (after 2026-05-13 SME session)

1. India stakeholders sign off on `07_India_SME_Presentation.html`
2. India HR provide OQ-05/06/07 dropdown values → update field specs in 01, 02, 03, 05
3. Docs Platform confirm People system integration availability
4. India HR finalize 5 letter templates for DOCS
5. HR Operations confirm DV/EDV user list and role assignment in DOCS
6. Schedule UAT with India Team specialists and pilot employees
