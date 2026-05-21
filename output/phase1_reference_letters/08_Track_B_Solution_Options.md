# Track B — RM Approval: Solution Options
**Version:** 0.1 — Draft for review  
**Phase:** 1 — Reference Letters  
**Document type:** Solution options paper  
**Status:** Pending stakeholder decision  
**Last updated:** May 2026

---

## 1. Background

Phase 1 Reference Letters are split into two routing tracks:

| Track | Letters | Routing |
|---|---|---|
| **Track A** | Form 60, Address Proof Letter, Service Letter, Visa Processing Letter | Auto-verified — no specialist action required |
| **Track B** | Letter of Recommendation (LOR) | Requires India Team specialist verification before document is sent to employee |

**Track A was approved by Satish Malla at the India SME validation meeting on 14 May 2026 (D-23). Track B development is currently blocked.**

---

## 2. Problem Statement

At the India SME validation meeting (14 May 2026), Satish Malla confirmed that **RM (Reporting Manager) approval is a mandatory step** in the current Assist process for both the Visa Processing Letter and the LOR (for active employees). After follow-up on 18 May 2026, Visa Processing Letter was moved to Track A by D-24. OQ-15 now applies to LOR only.

The DOCS platform does not currently include a built-in mechanism to route a document to an RM for approval before a specialist proceeds with verification.

**Consequence:** Track B cannot proceed to development until a technically feasible and India HR-approved RM approval solution is agreed.

**Blocking OQ:** OQ-15

---

## 3. Current Assist Flow (as-is reference)

For LOR in Assist:

1. Employee submits request
2. **RM receives notification and approves** (or rejects) the request
3. India Team specialist (HR) reviews and verifies the document
4. Employee downloads the letter

The RM step is a formal in-system gate: the specialist cannot act until the RM has approved.

---

## 4. Solution Options

### Option A — Email-Based RM Confirmation (In-System Gate)

**Description:** Employee enters their RM's email address on the DOCS request form. DOCS sends a verification email to the RM. The RM clicks "Approve" in the email. The system records the RM's approval and timestamp. The India Team specialist receives the request in their queue only after RM approval is registered.

**Flow:**
```
Employee submits form (incl. RM email)
        ↓
DOCS sends approval email to RM
        ↓
RM clicks "Approve" link in email
        ↓
DOCS records approval + timestamp
        ↓
Specialist queue — request visible → Specialist verifies
        ↓
Specialist sends document → Employee downloads
```

| Dimension | Assessment |
|---|---|
| Audit trail | Full — RM name, email, approval timestamp recorded in DOCS |
| Dev effort | Medium-high — new "RM email approval" component required in DOCS |
| RM DOCS account | Not required — email link works for any EPAM email |
| Process fidelity to Assist | High — preserves formal RM gate |
| Risk | RM email bottleneck — delayed approvals delay the specialist queue; RM typos/unavailability |
| Go-live feasibility (June 30) | At risk — depends on DOCS platform dev capacity |

---

### Option B — Off-System RM Confirmation (No Dev Required)

**Description:** The DOCS form does not change. After the employee submits, the specialist contacts the RM directly (email or Teams) to confirm approval before verifying the request. The specialist records the RM's confirmation in the request's history or a notes field. Specialist then verifies and sends the document.

**Flow:**
```
Employee submits form
        ↓
Specialist receives request
        ↓
Specialist contacts RM (email / Teams) — off-system
        ↓
RM replies with approval (off-system)
        ↓
Specialist records confirmation in request notes → Verifies
        ↓
Specialist sends document → Employee downloads
```

| Dimension | Assessment |
|---|---|
| Audit trail | Partial — specialist's note in DOCS; RM approval email not natively recorded |
| Dev effort | Zero — no platform changes needed |
| RM DOCS account | Not required |
| Process fidelity to Assist | Medium — RM approval preserved but off-system |
| Risk | Specialist workload increases; inconsistent practice across specialists; RM email thread not in DOCS record |
| Go-live feasibility (June 30) | High — deployable with Track A go-live |

---

### Option C — DOCS Multi-Step Approval Workflow (Platform Capability)

**Description:** DOCS platform adds the RM as a formal approver step within the native workflow engine. The RM must be a DOCS user (or have an approver role) and would receive an in-app task to approve before the specialist verification step is triggered.

**Flow:**
```
Employee submits form
        ↓
DOCS assigns approval task to RM (in-app)
        ↓
RM logs into DOCS → approves request
        ↓
Specialist receives request in queue → Verifies
        ↓
Specialist sends document → Employee downloads
```

| Dimension | Assessment |
|---|---|
| Audit trail | Full — all steps in DOCS workflow history |
| Dev effort | Low-medium IF DOCS natively supports multi-step approval; needs platform capability confirmation (Olga Chaban) |
| RM DOCS account | Required — RM must have DOCS access |
| Process fidelity to Assist | High — closest to Assist native flow |
| Risk | Not all RMs may have DOCS accounts; platform capability unconfirmed |
| Go-live feasibility (June 30) | Unknown — depends on platform capability check |

---

## 5. Comparison Summary

| Criterion | Option A (Email gate) | Option B (Off-system) | Option C (DOCS workflow) |
|---|---|---|---|
| Audit trail in DOCS | ✅ Full | ⚠️ Partial | ✅ Full |
| Dev effort | Medium-high | None | Low (if supported) |
| RM account required | No | No | Yes |
| Go-live by June 30 | At risk | ✅ Feasible | Unknown |
| Process fidelity | High | Medium | High |
| Long-term scalability | Good | Low | Best |

---

## 6. Internal Team Recommendation

**Proposed approach: two-stage.**

1. **June 30 go-live:** Deploy **Option B** (off-system confirmation) as a transitional solution for LOR. Track B goes live on June 30 alongside Track A. Specialists handle RM confirmation off-system; India HR confirms this is operationally acceptable for the interim period.

2. **Post go-live (Phase 1 iteration):** Investigate **Option C** feasibility with Olga Chaban. If DOCS supports multi-step approval natively and RM DOCS access is solvable, migrate to Option C without employee-facing change. If Option C is not feasible, revisit Option A with DOCS dev team.

**Rationale:** Option B requires no development and preserves the June 30 deadline. Options A and C both require platform investigation and likely development work — building them under the June 30 constraint risks both Track B and Track A go-live. Satish's agreement on an interim off-system process is the critical input needed.

> **This recommendation is a starting point for discussion — Satish Malla and the DOCS platform team must agree on the approach.**

---

## 7. Open Items Required to Close OQ-15

| # | Item | Owner | Required for |
|---|---|---|---|
| 1 | Confirm whether Option B (off-system) is operationally acceptable to India HR as an interim solution | Satish Malla | Decision |
| 2 | Confirm whether DOCS natively supports multi-step approval routing (Option C feasibility) | Olga Chaban / DOCS Platform | Decision |
| 3 | Confirm RM DOCS account coverage (if Option C pursued) | HR Operations / DOCS Platform | Option C feasibility |
| 4 | Confirm preferred auto-close interval for Track B letters (Satish indicated longer than 2 days — exact value TBD) | Satish Malla | BRD / flow update |
| 5 | Confirm updated contact email for India letters (Satish mentioned Rewards team email; WFAHumanResourceIndia@epam.com may change) | Satish Malla | 01, 06 update |

---

## 8. Impact on Existing Documents

Once OQ-15 is resolved and a solution is selected, the following Phase 1 documents require updating:

| Document | Update required |
|---|---|
| `01_Process_Flow_Reference_Letters.md` | Update Step 3b to reflect the agreed RM approval step |
| `02_BRD_Reference_Letters.md` | Update FR for LOR; note RM approval mechanism |
| `05_India_SME_Validation.md` | Add Track B validation checklist items for agreed solution |
| `07_India_SME_Presentation.html` | Update Slide 6 (Track B behavior) if flow changes |

---

## 9. Sign-off

| Role | Name | Decision | Date |
|---|---|---|---|
| India HR (decision authority) | Satish Malla | ☐ Option A / ☐ Option B / ☐ Option C / ☐ Other | |
| DOCS Platform | Olga Chaban | ☐ Option C feasible / ☐ Option C not feasible | |
| BA team | Dzmitry Fedarovich | | |
| BA team | Darya Taranda | | |
