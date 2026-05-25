---
name: Compensation Letter User Flow (22.05.2026 SVG)
description: Detailed DOCS user flow, full XLS field mapping, conditional letter logic, status model, and data source breakdown from 22.05.2026 SVG + KB page 2806069235
type: project
status: active
source: input/screenshots/India DOCs flow diagrams - DOCS Compensation letters. User flow 22.05.2026.svg
kb_source: https://kb.epam.com/spaces/EPMEOADOCS/pages/2806069235/2.+Compensation+Letters (modified 2026-04-24)
---

## Process Flow Summary

Two actors:
1. **EPAM specialist** (KB: HRBP) — creates mass request
2. **Employee** — downloads the letter

No approval step. No employee form-filling (push model — data comes entirely from XLS + People system).

## Status Model (DOCS)

| Level | Statuses |
|---|---|
| Request | Completed → Closed |
| Request form (document in request) | Verified → Generated |
| Documents to download | Generated |

Auto-close: **10 days** after request creation/completion (confirmed from SVG label: "10 (ten) days after request creation (completion)").

## Data Sources

### AUTO — populated by DOCS/People system
| Field | Source |
|---|---|
| Letter date | DOCS — date of request creation |
| Employee name | People — Legal first name, Legal last name |
| UID | People — Employee UID |
| Job title / Designation | People — Job title |
| All monetary amounts (INR) | AUTO: DOCS converts to India monetary format |

### XLSX — provided via Excel upload
**Compensation components (Current / Revised pairs):**
- Basic, HRA, Statutory Bonus, Special Allowances, Gross, Gratuity, PF (Employer's contribution), Fixed Compensation, On Target Bonus, Retention Bonus, Total CTC

**Bonus types:**
- OTB: OTB Value, OTB Date, OTB Year
- Retention Bonus: RB1–RB4, RB1–RB4 Dates, RB Effective Date
- Deferred Bonus: DB1–DB3, DB1–DB3 Dates, DB Effective Date
- One-Time Bonus: One Time, One Time1–4, One Time1–4 Dates
- LTI: LTI value
- Promo Eligibility Date (format: YYYY)
- Salary Effective Date (format: Month DD, YYYY)

**Scenario flags (Y/N) — ASSIST only, N/A in DOCS:**
- SalaryHike(P0), SalaryHike-Promotion(P1–P4)
- RecoveryTerms-RB, RecoveryTerms-DB, RecoveryTerms-One Time

**Password field — DOCS = N/A (resolves OQ-P2-02):**
KB page explicitly marks Password → N/A in DOCS column. PDF password protection is NOT being migrated. This was an Assist-only feature.

### Key behavioral change: Assist vs DOCS
> "Assist: Retention bonus, Deferred bonus => sum calculated automatically. DOCS: prefill from XLSX"

In Assist, RB and DB totals were auto-calculated. In DOCS, the XLS must provide the explicit values. This is a data preparation dependency for the HRBP/Compensation Team.

## Conditional Letter Template Logic

DOCS uses data-driven conditions to include/exclude paragraphs:

| Condition | Paragraphs shown |
|---|---|
| RevisedCTC > 0 | Salary change paragraph |
| Job Title changed (People) | Promotion paragraphs (multiple) |
| OTB accrued | OTB paragraphs |
| RB accrued | Retention bonus paragraphs |
| DB accrued | Deferred bonus paragraphs |
| One Time Bonus accrued | One-time bonus paragraphs |
| LTI accrued | LTI paragraph |

**Letter template note**: "text confirmed for all letters" appears 4 times in the SVG — standard text blocks are confirmed for all letter types.

## Unknown Field

One field in the SVG is labeled `XLSX: ????` with an unknown XLSX key — likely a one-time bonus variant or an edge-case amount. Needs clarification.

## KB Page MVP Timeline (page ID: 2806069235)

| Item | Status | Deadline |
|---|---|---|
| Development: Compensation amount in words | TO DO | 2026-05-23 |
| Business Process configuration | TO DO | 2026-05-31 |

Note: "23/04/2026 arranged meeting with India stakeholders to clarify requirements."

## Open Items / Decisions Implied

- **OQ-P2-02 RESOLVED**: Password = N/A in DOCS. No PDF password protection. Should be formally closed as a new decision (D-P2-XX).
- **XLSX: ???? field** needs identification — raise with DOCS Platform team.
- **Power BI report?** — shown with a question mark in SVG. Not confirmed — possible future reporting integration.
- **Download timestamp** visible in diagram ("Downloaded 22 May 2026, 10:30") — DOCS tracks download events per employee.
- Each compensation letter type is sent as a **separate mass request** (confirmed from existing memory, reinforced here).
