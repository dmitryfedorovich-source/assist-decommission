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
- Phase 1 covers **Reference Letters** — 6 letter types used by India employees
- Target go-live: **July 1, 2026**

---

## Slide 2 — Scope: 6 Letter Types

| Track | Letter Type |
|---|---|
| **Auto-verified** | Form 60 |
| **Auto-verified** | Address Proof Letter |
| **Auto-verified** | Service Letter |
| **HRBP approval required** | Visa Processing Letter |
| **HRBP approval required** | Letter of Recommendation (LOR) |
| **HRBP approval required** | Relocation Letter |

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
   │                         ├─ (HRBP or auto-close after 2 days)
```

**Used for:** Form 60, Address Proof Letter, Service Letter

---

## Slide 4 — Process Flow: HRBP-Verified Letters

```
Employee                DOCS Platform              HRBP
   │                         │                      │
   ├─ Select letter type ────→│                      │
   │                         ├─ Create request       │
   ├─ Fill in form ──────────→│                      │
   │                         ├─ Route to HRBP ──────→│
   │                         │                      ├─ Review
   │                         │              Approve ─┤
   │                         │←─────────────────────┤
   │                         ├─ Generate letter      │  Reject (+ reason)
   ├─ Download letter ←───────┤                      ├──→ Notify employee
   │                         │                      │    (new request needed)
```

**Used for:** Visa Processing Letter, LOR, Relocation Letter

---

## Slide 5 — Form Fields: What Comes from Where

### Pre-populated from HR systems (read-only)

| Field | Letters |
|---|---|
| Name, Designation | All 6 |
| UID | Form 60, Address Proof, Service, Visa, LOR |
| Work Location | Service, Visa Processing, LOR |
| Birth Location | Form 60 |
| Current Work Location | Relocation |
| Start Date | Form 60, Address Proof, Service, Visa, LOR |
| Address | Address Proof Letter (from People system) |

### Manually entered by employee

| Letter | Employee Fields |
|---|---|
| Form 60 | Father Name, PAN, Address, Mobile |
| Address Proof | Purpose (dropdown + custom text, max 100 chars) |
| Service Letter | Purpose (dropdown) |
| Visa Processing | Purpose (dropdown), Comments (max 300 chars, single line) |
| Relocation | New Work Location (dropdown), Effective Date *(entered by RM/HRBP)* |
| LOR | Purpose (dropdown), Notes & Responsibilities (rich text) |

---

## Slide 6 — Special Behaviors to Implement

**Address not found — Address Proof Letter**
- When People system returns no address: show error banner
- Message: employee must update their profile in People system before requesting

**Custom purpose — Address Proof Letter**
- When "Custom" is selected from Purpose dropdown: show free-text field
- Max 100 characters

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

- [ ] Create 6 India request types (IN prefix) in Docs
- [ ] Configure form fields per letter type (read-only vs. editable)
- [ ] Connect HR system data source for pre-population
- [ ] Connect People system for address pre-population
- [ ] Set up auto-verification workflow (Form 60, Address Proof, Service Letter)
- [ ] Set up HRBP approval workflow (Visa, LOR, Relocation)
- [ ] Configure rejection notification with reason field
- [ ] Configure completion notification to employee
- [ ] Configure 2-day auto-close rule (triggers when all forms reach final status)
- [ ] Configure 2-day cooldown preventing duplicate requests
- [ ] Load India letter templates into Docs template engine
- [ ] Test letter generation output against EPAM India letter format standards

---

## Slide 9 — Timeline & Milestones

| Milestone | Target |
|---|---|
| BRD sign-off | June 2026 |
| Platform configuration complete | June 2026 |
| India letter templates finalized | June 2026 |
| UAT — HRBP and pilot employees | June 2026 |
| Go-live | **July 1, 2026** |
| Assist Reference Letters retired | July 1, 2026 |

---

## Slide 10 — Risks & Dependencies

| Item | Owner | Status |
|---|---|---|
| HR system API availability | Docs Platform | To confirm |
| India letter templates ready | India HR Team | To confirm |
| HRBP accounts/roles in Docs | HR Operations | To confirm |
| Assist decommission date aligned | Platform/PM | To confirm |

---

## Slide 11 — Next Steps

1. **Docs Platform Team:** Confirm integration availability (HR system, People system)
2. **India HR Team:** Finalize 6 letter templates for Docs
3. **HR Operations:** Confirm HRBP user list and role assignment in Docs
4. **PM:** Align Assist decommission date with July 1 go-live
5. **BA/PM:** Schedule UAT with HRBP and India pilot users
