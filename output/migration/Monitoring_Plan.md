# Observability & Monitoring Plan
## Phase 1: Post-Go-Live — Reference Letters

**Document type:** Migration Operational  
**Audience:** BA team, India Team lead, DOCS platform team  
**Status:** DRAFT  
**Last updated:** May 2026

---

## 1. Purpose

This plan defines what to monitor, for how long, and what actions to take after Phase 1 goes live on June 30, 2026. The goal is to confirm stable operation and catch issues early before they affect India employees at scale.

---

## 2. Monitoring Window

| Period | Frequency | Focus |
|---|---|---|
| **T+1 through T+7** (July 1–7) | Daily | Stability confirmation; early issue detection |
| **T+8 through T+30** (July 8–30) | Weekly | Volume trends; Track B processing health |
| **T+31 onwards** | Monthly | Steady-state review; Phase 2 readiness |

Active monitoring ends at T+30. After that, monitoring is integrated into normal India Team operations.

---

## 3. Metrics to Track

### 3.1 Volume metrics (daily, T+1 through T+7)

| Metric | Source | Expected value | Alert if |
|---|---|---|---|
| Letter requests submitted — total | DOCS platform report | > 0 from Day 1 | Zero requests for 2+ consecutive days (possible redirect or access issue) |
| Requests by letter type (Form 60, Address Proof, Service Letter, Visa Processing, LOR) | DOCS platform report | Distributed across types | Any type shows zero for 3+ days (may indicate configuration issue) |
| Track A auto-generation success rate | DOCS platform report | ~100% | Any Track A request not auto-generated within 1 hour |
| Track B queue depth | India Team check | < 10 pending at end of each day | Queue > 20 unprocessed requests at end of day |
| Track B average processing time | India Team check | Within India Team's normal SLA | Any Track B request unprocessed for > 48 hours |
| Rejection rate | DOCS platform report | Low (< 10%) | Rejection rate > 25% — may indicate config or UX issue |
| Download success rate | DOCS platform report | ~100% | Any employee report of failed download |
| Auto-close events | DOCS platform report | Low (rare in first week) | Confirm 2-day rule is active (D-06); zero auto-closes for 7+ days is expected |

### 3.2 Issue indicators

| Signal | What to check | Action |
|---|---|---|
| Employee support tickets about letter requests | India Team inbox / helpdesk | Log as F-XX in FDL; triage by severity (Runbook §7) |
| India Team specialist unable to access DV/EDV queue | DOCS platform | Severity 1 if blocking Track B entirely; Severity 2 if partial |
| Field pre-population missing (employee reports blank fields) | DOCS + People Portal integration | Log as F-XX; DOCS platform team to investigate |
| Wrong routing (Track A letter entering queue, or Track B auto-generating) | DOCS platform | Severity 1/2 per Runbook §7; log as F-XX |

---

## 4. Review Cadence & Actions

### Daily review (T+1 through T+7)

**Owner:** BA lead + India Team specialist lead (Satish Malla)  
**Duration:** ~15 minutes  
**Actions:**

1. Check metrics from Section 3.1 against alert thresholds
2. Check India Team inbox for employee complaints or support requests
3. Log any issues as F-XX entries in FDL with severity rating
4. If Severity 1 condition detected: escalate immediately per Runbook §7

### Weekly review (T+8 through T+30)

**Owner:** BA lead  
**Duration:** ~30 minutes  
**Actions:**

1. Produce weekly Reconciliation Report (use template `output/migration/Reconciliation_Report_Template.md`)
2. Review volume trends — check for unexpected drops or spikes
3. Review open F-XX items from previous week: resolved / still open
4. Confirm Track B SLAs are being met by India Team

### Monthly review (T+31 onwards)

**Owner:** BA lead  
**Duration:** ~1 hour  
**Actions:**

1. Produce monthly Reconciliation Report
2. Review all open OQ-XX items from Phase 1 that were accepted (not resolved) at go-live: are any resolvable now?
3. Update project_state.md with Phase 1 steady-state status
4. Begin Phase 2 monitoring planning

---

## 5. Alert Thresholds & Escalation

| Threshold breached | Severity | Escalation |
|---|---|---|
| DOCS platform unavailable | 1 — Critical | Follow Runbook §7 Severity 1: rollback decision within 2h |
| Track A letter not auto-generating | 1 — Critical | DOCS platform team immediate; if not resolved in 1h, assess rollback |
| Track B queue not accessible by India Team | 1 — Critical | DOCS platform team immediate |
| Track B queue depth > 20 requests | 2 — High | India Team lead to staff up; DOCS platform team to investigate bottleneck |
| Rejection rate > 25% | 2 — High | Investigate cause: configuration error, UX confusion, or data issue |
| Zero new requests for 2+ days | 2 — High | Check Assist redirect; check DOCS accessibility; employee comms may be needed |
| Individual download failure reported | 3 — Medium | Log F-XX; DOCS platform team to investigate |
| Minor field pre-population error | 3 — Medium | Log F-XX; triage for next DOCS release |

---

## 6. Data Access

| Data needed | Source | Access owner |
|---|---|---|
| Request volume and status by letter type | DOCS platform reporting | DOCS platform team |
| Track B queue metrics | DOCS platform reporting | DOCS platform team |
| Employee support tickets | India Team helpdesk | India Team lead |
| Auto-close and auto-generate event logs | DOCS platform logs | DOCS platform team |

> **Action required (pre-go-live):** Confirm with DOCS platform team that required reports/dashboards are accessible to the BA team from July 1. If not, establish a daily email report from the DOCS team. Owner: BA lead. Deadline: T-7 (June 23, 2026).

---

## 7. Post-Monitoring Handoff

At T+30 (July 30, 2026):

- Produce final Reconciliation Report covering the full first month
- Update FDL: close any F-XX items resolved during monitoring period
- Hand off ongoing monitoring to India Team lead as business-as-usual
- Update project_state.md: Phase 1 status → operational
- Begin Phase 2 monitoring plan preparation
