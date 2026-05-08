# Reference Letters Migration: Assist → EPAM Docs
## Internal Team Briefing

**Audience:** Docs Platform Team  
**Date:** May 2026  
**Phase:** 1 — Reference Letters  

---

## Slide 1 — Context

**What we're doing and why**

- **Assist (assist.epam.com)** is being decommissioned
- India HR document workflows currently live in Assist — these need to move to **EPAM Docs (docs.epam.com)**
- Phase 1 covers **Reference Letters** — 5 letter types used by India employees
- Target go-live: **June 30, 2026**

---

## Slide 2 — Scope: 5 Letter Types

| Track | Letter Type | Notes |
|---|---|---|
| **Auto-verified (instant)** | Form 60 | |
| **Auto-verified (instant)** | Address Proof Letter | |
| **Auto-verified (instant)** | Service Letter | |
| **India Team specialist review** | Visa Processing Letter | DV/EDV verifies → "Send Document" → employee downloads; document hidden until sent (D-12) |
| **India Team specialist review** | Letter of Recommendation (LOR) | Same flow as Visa Processing (D-13); active employees only; ex-employee LOR out of scope Phase 1 |

> LOR for ex-employees is out of scope — addressed in Phase 3 (Separation Letters)

---

## Slide 3 — Process Flow: Auto-Verified Letters

```
Employee                DOCS Platform
   │                         │
   ├─ Select letter type ────→│
   │                         ├─ Create request
   ├─ Fill in form ──────────→│
   │                         ├─ Pre-populate HR data
   │                         ├─ Auto-verify
   │                         ├─ Generate letter
   │                         ├─ Status → Completed
   ├─ Download letter ←───────┤
   │                         ├─ (India Team specialist or auto-close after 2 days)
```

**Used for:** Form 60, Address Proof Letter, Service Letter

---

## Slide 4 — Process Flow: India Team Specialist (DV/EDV) Verification

```
Employee                DOCS Platform              India Team specialist (DV/EDV)
   │                         │                      │
   ├─ Select letter type ────→│                      │
   │                         ├─ Create request       │
   ├─ Fill in form ──────────→│                      │
   │                         ├─ Route to specialist ─→│
   │                         │                      ├─ Review request
   │                         │                      │
   │                         │    Verify + "Send Document" action
   │                         │←─────────────────────┤
   │                         ├─ Notify employee      │  Reject (+ reason)
   ├─ Download letter ←───────┤                      ├──→ Notify employee
   │  (hidden until sent)    │                      │    (new request needed)
```

**Used for:** Visa Processing Letter, LOR  
> Document is **not visible** to the employee until the India Team specialist explicitly triggers the "Send Document" action (D-12, D-13).

---

> **Relocation Letter — Deferred:** Removed from Phase 1 scope (D-16). Purpose, trigger mechanism, and eligibility require investigation before this can be designed. Will be addressed in a separate later phase.

---

## Slide 5 — Form Fields: What Comes from Where

### Pre-populated from HR systems (read-only)

| Field | Letters |
|---|---|
| Name, Designation | All 5 |
| UID | All 5 |
| Work Location | Service, Visa Processing, LOR |
| Birth Location | Form 60 |
| Start Date | All 5 |
| Address | Address Proof Letter (from People system) |

### Manually entered by employee

| Letter | Employee Fields |
|---|---|
| Form 60 | Father Name, PAN, Address, Mobile |
| Address Proof | Purpose (dropdown); Custom purpose text (max 100 chars, always visible — fill in when "Custom" selected) |
| Service Letter | Purpose (dropdown) |
| Visa Processing | Purpose (dropdown), Comments (max 300 chars, single line) |
| LOR | Purpose (dropdown), Notes & Responsibilities (plain text, multi-line — no formatting) |

---

## Slide 6 — Special Behaviors to Implement

**Address not found — Address Proof Letter**
- When People system returns no address: show error banner
- Message: employee must update their profile in People system before requesting

**Self-Declaration popup not implemented**
- Assist shows a confirmation popup with a checkbox before employees press "Continue"
- DOCS does not support this — a static disclaimer text appears at the top of the form instead (D-17)

**Custom purpose text — Address Proof Letter**
- Free-text field is always visible in the form (DOCS cannot conditionally show/hide fields)
- Max 100 characters — employee fills in when "Custom" is selected from Purpose dropdown

**Auto-close**
- Once all forms reach final status (Verified / Generated) → auto-close after **2 days** if not manually closed

**New request cooldown**
- Employee cannot submit a new request for the same letter type until 2 days after previous request closes

**Rejection → New request**
- No resubmit on rejected request; employee starts fresh

---

## Slide 7 — Integration Requirements

| Integration | Purpose | Data retrieved |
|---|---|---|
| HR System | Pre-populate employee details | Name, Designation, UID, Work Location, Birth Location, Start Date |
| People System | Pre-populate address | Residential address for Address Proof Letter |

**Key questions for the platform team:**
- Are these integrations already active for other Docs workflows?
- Is the People system address field reliably populated for India employees?
- What is the data refresh cadence on pre-populated fields?

---

## Slide 8 — Configuration Checklist

- [ ] Create 5 India request types (IN prefix) in Docs
- [ ] Configure form fields per letter type (read-only vs. editable)
- [ ] Connect HR system data source for pre-population
- [ ] Connect People system for address pre-population
- [ ] Set up auto-verification workflow (Form 60, Address Proof, Service Letter)
- [ ] Set up India Team specialist (DV/EDV) verification workflow for Visa Processing Letter and LOR (including "Send Document" action; document hidden until specialist sends it)
- [ ] Add static disclaimer text at top of each request form (replaces Assist self-declaration popup, D-17)
- [ ] Configure rejection notification with reason field
- [ ] Configure completion/document-sent notification to employee
- [ ] Configure 2-day auto-close rule (triggers when all forms reach final status)
- [ ] Configure 2-day cooldown preventing duplicate requests
- [ ] Load India letter templates into Docs template engine (5 templates)
- [ ] Test letter generation output against EPAM India letter format standards

---

## Slide 9 — Timeline & Milestones

| Milestone | Target |
|---|---|
| BRD sign-off | June 2026 |
| Platform configuration complete | June 2026 |
| India letter templates finalized | June 2026 |
| UAT — India Team specialists and pilot employees | June 2026 |
| Go-live | **June 30, 2026** |
| Assist Reference Letters retired | June 30, 2026 |

---

## Slide 10 — Risks & Dependencies

| Item | Owner | Status |
|---|---|---|
| HR system API availability | Docs Platform | To confirm |
| India letter templates ready | India HR Team | To confirm |
| India Team specialist (DV/EDV) accounts/roles in Docs | HR Operations | To confirm |
| Assist decommission date aligned | Platform/PM | To confirm |

---

## Slide 11 — Decisions Needed from Management

> Items requiring management sign-off before go-live.

1. **Confirm June 30, 2026** as the go-live and Assist decommission date for Reference Letters
2. **Assign India HR team** ownership for letter template finalization
3. **Approve communication plan** to India employees ahead of go-live
4. **Confirm next phase timeline** (Compensation Letters) to maintain migration momentum

---

## Slide 12 — Next Steps

1. **Docs Platform Team:** Confirm integration availability (HR system, People system)
2. **India HR Team:** Finalize 5 letter templates for Docs
3. **HR Operations:** Confirm India Team specialist (DV/EDV) user list and role assignment in Docs
4. **PM:** Align Assist decommission date with **June 30, 2026** go-live
5. **BA/PM:** Schedule UAT with India Team specialists and pilot employees
