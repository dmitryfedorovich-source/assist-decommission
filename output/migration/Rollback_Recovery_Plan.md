# Rollback & Recovery Plan
## Phase 1: Reference Letters — Assist → EPAM Docs

**Document type:** Migration Operational  
**Audience:** BA team, DOCS platform team, India Team leads  
**Status:** DRAFT — requires Stage 1 internal review  
**Last updated:** May 2026

---

## 1. Purpose & Scope

This document defines the conditions, procedure, and recovery criteria for rolling back the Phase 1 go-live if EPAM Docs is not ready to replace Assist on June 30, 2026 (D-01).

**Scope:** Phase 1 — Reference Letters (5 letter types: Form 60, Address Proof, Service Letter, Visa Processing, LOR per D-16).

A rollback means: Assist reference letter flows remain active beyond June 30, 2026. DOCS Phase 1 go-live is deferred to a new target date (see Section 6).

> **This plan does not apply to Relocation Letter** — Relocation Letter remains in Assist regardless of Phase 1 outcome (D-16).

---

## 2. Rollback Trigger Conditions

A rollback must be considered if **any one** of the following conditions exists at T-1 day (June 29, 2026):

| ID | Trigger | Severity |
|---|---|---|
| RT-01 | DOCS platform is unavailable or letter generation is non-functional | Critical — automatic rollback |
| RT-02 | Stage 4 UAT has open Blocker or Major defects (see Test Validation Plan, Section 6) | Critical — automatic rollback |
| RT-03 | India Team sign-off (Stage 4) not obtained by June 29, 2026 | High — rollback recommended |
| RT-04 | Any of the 4 blocking OQs (OQ-11, OQ-14, or critical routing OQs OQ-05/06/07/08) unresolved and not formally accepted | High — rollback recommended |
| RT-05 | DOCS routing configuration not verified for all 5 letter types | High — rollback recommended |
| RT-06 | Employee communications not sent (T-14 and T-1 messages) | Medium — defer only if comms can be sent on go-live day |

For RT-01 and RT-02: rollback is automatic — no decision meeting required.
For RT-03 through RT-06: BA lead convenes a Go/No-Go decision call with stakeholders (see Section 3).

---

## 3. Rollback Decision Authority

| Decision type | Authority | Required quorum |
|---|---|---|
| Critical rollback (RT-01, RT-02) | BA lead — unilateral, no approval needed | — |
| Recommended rollback (RT-03–RT-06) | BA lead + one India SME lead (Satish Malla or Satya Danam) | BA lead + India SME alignment |
| Overriding a recommended rollback and proceeding | Project sponsor + India SME lead | Both must agree |

**Decision window:** The Go/No-Go call must conclude by **June 29, 2026, 17:00 IST**. If no decision is reached within the window, default action is rollback.

---

## 4. Rollback Procedure

### 4.1 Immediate Actions (T=0 through T+4h)

If rollback is triggered on go-live day or during the T+1 monitoring window:

| Step | Action | Owner | SLA |
|---|---|---|---|
| R1 | Declare rollback — notify all contacts in Section 7 of Decommission Plan | BA lead | Immediate |
| R2 | **Do NOT disable Assist** reference letter flows — leave in original state | Assist admin | Immediate |
| R3 | If DOCS go-live was already executed partially: disable DOCS letter types to prevent parallel operation | DOCS platform team | Within 2 hours |
| R4 | Send employee communication: "Assist letter requests remain available — DOCS migration postponed" (see Section 5.3) | BA team | Within 4 hours |
| R5 | Log rollback event in FDL as F-XX entry: date, trigger ID, action taken | BA team | Within 4 hours |

### 4.2 Assist Re-enablement Verification

Confirm Assist is fully operational after rollback:

- [ ] All 5 Phase 1 letter request flows accessible in Assist
- [ ] India Team can process Track B LOR requests via Assist
- [ ] Employees can submit Form 60, Address Proof, Service Letter via Assist
- [ ] No partial DOCS configuration is active (dual-system conflict risk)

### 4.3 DOCS Platform Notification

- Notify DOCS platform team of rollback cause (trigger ID, brief description)
- Request assessment of fix timeline
- Log as a project risk in FDL with target resolution date

---

## 5. Assist Extension Protocol

A rollback requires Assist to operate beyond its planned June 30, 2026 retirement date.

### 5.1 Extension Request Process

| Step | Action | Owner |
|---|---|---|
| E1 | BA lead submits formal Assist extension request to Assist platform owner | BA lead |
| E2 | Assist platform owner confirms extension feasibility and SLA | Assist owner |
| E3 | Extension approval logged in FDL as a new decision (D-XX) | BA team |
| E4 | Extension duration communicated to India employees | BA team |

> **Note:** The Assist extension process and approval authority are not currently documented. This must be investigated and confirmed before Stage 1 sign-off. Add as OQ if not resolved.

### 5.2 Maximum Extension Window

| Scenario | Maximum extension | Rationale |
|---|---|---|
| Minor DOCS fix (1–2 weeks) | +30 days (July 31, 2026) | Minimal disruption; Assist team can support short extension |
| Major platform issue (4+ weeks) | To be determined with project sponsor | Requires re-planning of Phase 1 timeline |

Extensions beyond 30 days require project sponsor approval and FDL decision update (supersede D-01 with new date).

### 5.3 Employee Communication on Delay

Template (send within 4h of rollback declaration):

> Subject: Update on HR Letter Request System — Action Required  
>
> Dear colleagues,
>
> The planned transition of HR letter requests from Assist to EPAM Docs has been postponed. Assist remains fully available for all your letter requests.
>
> You can continue to request HR letters at assist.epam.com as normal. We will communicate a new go-live date as soon as it is confirmed.
>
> We apologize for any inconvenience. Please contact [India Team contact] if you have questions.

---

## 6. Recovery & Retry Criteria

Before a retry go-live can be scheduled, all of the following must be true:

| Criterion | Description |
|---|---|
| Trigger resolved | The specific trigger condition (Section 2) that caused the rollback is fully remediated |
| Full test cycle re-run | All UAT test cases re-executed with zero Blocker/Major defects |
| validate-docs clean | Full validate-docs run across all Phase 1 output docs shows zero errors |
| India Team sign-off re-obtained | Stage 4 sign-off renewed (original sign-off is voided by rollback) |
| New date communicated | T-14 communications sent for the new go-live date |

**Minimum stabilization period:** 5 business days between "trigger resolved" confirmation and retry go-live. This allows time for a focused re-test cycle without rushing to a new cutover.

---

## 7. Post-Rollback Review

Within **5 business days** of any rollback:

| Action | Output | Owner |
|---|---|---|
| Root cause analysis | Document: trigger ID, timeline, contributing factors | BA lead |
| FDL update | Add F-XX entry with: date, trigger, root cause, remediation decision (new D-XX if date changes) | BA team |
| RTM update | Update D-01 if go-live date changes | BA team |
| Risk register update | Downgrade or add risks based on what was learned | BA team |
| Stakeholder briefing | 1-page summary to project sponsor and India SME leads | BA lead |

---

## 8. Sign-off Table

This plan must be reviewed and signed off before Stage 4 (UAT) begins.

| Role | Name | Date | Status |
|---|---|---|---|
| BA lead | | | ⬜ Pending |
| Internal reviewer | Daria | | ⬜ Pending |
| Internal reviewer | Hanna | | ⬜ Pending |
| India SME lead | Satish Malla | | ⬜ Pending |
