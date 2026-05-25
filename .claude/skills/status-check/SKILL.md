---
name: status-check
description: Go-Live Readiness Report — days to cutover, stage sign-off status, open blockers, recent decisions, next actions. Run at the start of any session or before a stakeholder call.
---

## Model Routing

**Delegate to Sonnet — do not execute inline in the main session.** This skill reads project state files and generates a formatted report — no cross-document reasoning required.

```
Agent(
  subagent_type="general-purpose",
  model="sonnet",
  description="status-check: Go-Live Readiness Report",
  prompt="""Context: EPAM Assist Decommission project — BA documentation workspace (no application code).
India HR workflows migrating from assist.epam.com → docs.epam.com (go-live June 30, 2026).
Today's date: <CURRENT_DATE>.
Task: Read the file `.claude/skills/status-check/SKILL.md` starting from the `## Usage`
heading and execute all steps described there. Generate both the Markdown report and the HTML file."""
)
```

Replace `<CURRENT_DATE>` with today's date from system context.
Relay the subagent's Markdown report and saved file path verbatim.

---

## Usage

`/status-check`

No arguments. Generates a current Go-Live Readiness Report, outputs it to the conversation, and saves a self-contained HTML copy to `output/status_reports/`.

---

## Step 1 — Read Source Files

Read these files in order:

1. `memory/context/project_state.md` — current phase, deliverable status, next actions
2. `output/shared/Feedback_Decisions_Log.md` — decisions, open questions, stage sign-off table, feedback items
3. `docs/data/open-questions.yaml` — structured OQ data: status, owner, blocking stage, raised date

Do NOT read RTM.md, memory files beyond project_state.md, or any output document.

---

## Step 2 — Derive Key Facts

From the files above, derive:

| Fact | How to derive |
|---|---|
| Go-live date | FDL decision D-01 |
| Days to go-live | Today's date (`currentDate` in system context) vs. go-live date |
| Phase progress matrix (4 phases × 8 stages) | project_state.md — "Cross-Phase Progress Matrix" section |
| Active phases | All 4 phases run in parallel |
| Open blocking OQs | open-questions.yaml — filter `status: Open` + has a `blocking_stage` value |
| All open OQs | open-questions.yaml — filter `status: Open`, include owner + raised date |
| Decisions locked since last report | FDL decisions section — last 5–10 by date |
| Output documents with known gaps | project_state.md deliverables table — anything not "Complete" or flagged |

Compute OQ age: days since `raised` date (use today's date from system context).

---

## Step 3 — Generate the Markdown Report (to conversation)

Output a Markdown report with these sections, in order:

---

### Section 1 — Go-Live Countdown

```
## 🗓️ Go-Live: [date] — [N] days remaining
```

Color-code urgency in text:
- >30 days: normal
- 15–30 days: note as "approaching"
- <15 days: note as "critical window"

---

### Section 2 — Phase Progress Matrix

Read the "Cross-Phase Progress Matrix" table from `project_state.md`. Output a 4×8 matrix:

| Phase | Research | Solution | Int.✓ Darya | India✓ Satish | BA Work | Dev | Process Docs | UAT |
|---|---|---|---|---|---|---|---|---|
| P1 — Reference Letters | ✅ | ✅ | ⬜ | 🔶 | ⬜ | ⬜ | ⬜ | ⬜ |
| P2 — Compensation Letters | ✅ | 🔶 | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| P3 — Separation Letters | ✅ | 🔶 | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |
| P4 — Relocation/Nominee | 🔶 | ⬜ | ⬜ | ⬜ | ⬜ | — | ⬜ | ⬜ |

After the matrix, list notes for any 🔶 cell (from "Notes on Partial Stages" in project_state.md):
`🔶 P1 · India✓: Track A approved (D-23); Track B blocked OQ-15`

---

### Section 3 — Open Blockers

List only OQs that are **blocking a stage** (have a `blocking_stage` value in open-questions.yaml, or are marked as BLOCKING in the FDL). Format:

```
### 🚫 Blocking OQs (N)

| ID | Question | Owner | Age | Blocking |
|---|---|---|---|---|
| OQ-15 | Track B RM approval mechanism | DOCS Platform + Satish Malla | 3 days | Stage 3 / Dev |
...
```

If no blocking OQs: write "No blocking OQs — all stages can proceed."

---

### Section 4 — All Open Questions

Full list of open OQs, grouped by phase. Format per OQ:
`- **OQ-XX** — [question summary] · Owner: [name] · Age: [N days]`

Omit Resolved, Deferred, and Closed OQs from this section.

---

### Section 5 — Recent Decisions

The 5 most recent locked decisions by date (from FDL), formatted as:
`- **D-XX** ([date]) — [decision summary]`

If fewer than 5 locked decisions exist in the FDL, list all of them.

---

### Section 6 — Document Status

List output documents that are NOT in "Complete" status, or where project_state.md flags a known issue or pending update. Format:
`- [filename] — [status / what is pending]`

If all documents are complete, write: "All output documents complete."

---

### Section 7 — Next 3 Actions

Derive the 3 highest-priority actions the BA should take, based on:
- Blocking OQs (resolving OQ-15 or equivalent always ranks first if open)
- Stage gates that are unmet
- Documents with known gaps
- Pending sign-offs

Format:
```
### ⚡ Next 3 Actions

1. [Action] — [owner] — [why urgent]
2. [Action] — [owner] — [why urgent]
3. [Action] — [owner] — [why urgent]
```

Do not invent actions. Derive them only from what the source files say is open or pending.

---

## Step 4 — Save HTML Report

After writing the Markdown report to the conversation, build a self-contained HTML file and save it to `output/status_reports/`.

### File naming

Use `currentDate` from system context. Always include the time (HH-MM in 24h format, using the current time from the system context or a reasonable inference):

```
YYYY-MM-DD_HH-MM_Status_Report.html
```

Examples: `2026-05-15_09-30_Status_Report.html`, `2026-05-15_14-45_Status_Report.html`

### HTML template

Build the file using the template below. Replace all `{{PLACEHOLDER}}` tokens with values derived in Step 2. The HTML must be self-contained — no external CSS or JS dependencies. All styles are inline in the `<style>` block.

**Urgency class for countdown badge:**
- >30 days → class `cnt-normal` (green badge)
- 15–30 days → class `cnt-warn` (amber badge)
- <15 days → class `cnt-critical` (red badge)

**Stage status cell classes:**
- ✅ Done → class `st-done`
- 🔶 Partial → class `st-partial`
- ⬜ Pending → class `st-pending`

**Blocker section:** render only if there are blocking OQs; render each row as a `<tr>` in the blockers table.

**OQ age color:** age > 14 days → span with class `age-old` (red); age 7–14 days → `age-warn` (amber); < 7 days → no class.

---

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Go-Live Readiness Report — {{REPORT_DATE}}</title>
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
body{font-family:-apple-system,'Segoe UI',Roboto,Arial,sans-serif;background:#f0f4f8;color:#1a1a2e;font-size:14px;padding:24px 16px;-webkit-font-smoothing:antialiased}
a{color:#3b82f6;text-decoration:none}

/* PAGE WRAPPER */
.wrap{max-width:960px;margin:0 auto;display:flex;flex-direction:column;gap:16px}

/* HEADER */
.hdr{background:#1a1a2e;border-radius:12px;padding:24px 28px;display:flex;justify-content:space-between;align-items:flex-start;flex-wrap:wrap;gap:12px}
.hdr-title{color:#fff;font-size:20px;font-weight:700;line-height:1.2}
.hdr-sub{color:#94a3b8;font-size:11px;text-transform:uppercase;letter-spacing:1px;margin-top:4px}
.hdr-meta{text-align:right}
.hdr-date{color:#94a3b8;font-size:11px;margin-top:4px}

/* COUNTDOWN BADGE */
.cnt-badge{display:inline-block;padding:6px 14px;border-radius:20px;font-weight:700;font-size:13px;line-height:1.3;white-space:nowrap}
.cnt-normal{background:#dcfce7;color:#166534}
.cnt-warn{background:#fef9c3;color:#854d0e}
.cnt-critical{background:#fee2e2;color:#991b1b}

/* CARD */
.card{background:#fff;border-radius:10px;padding:20px 24px;box-shadow:0 1px 3px rgba(0,0,0,.07)}
.card-title{font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.8px;color:#64748b;margin-bottom:14px}
.card-h2{font-size:16px;font-weight:700;color:#1a1a2e;margin-bottom:12px}

/* PHASE MATRIX */
.phase-matrix{width:100%;border-collapse:collapse;font-size:12px;min-width:580px}
.phase-matrix th{text-align:center;padding:7px 6px;background:#f8fafc;border-bottom:2px solid #e2e8f0;color:#475569;font-size:10px;text-transform:uppercase;letter-spacing:.5px;line-height:1.3}
.phase-matrix th.pm-phase{text-align:left;min-width:165px}
.pm-sub{font-size:9px;color:#94a3b8;text-transform:none;letter-spacing:0;display:block;margin-top:1px}
.phase-matrix td{text-align:center;padding:8px 6px;border-bottom:1px solid #f1f5f9;font-size:14px}
.phase-matrix td.pm-name{text-align:left;font-weight:600;color:#334155;font-size:12px;padding-left:2px}
.phase-matrix td.pm-na{color:#94a3b8;font-size:11px}
.phase-matrix tr:last-child td{border-bottom:none}
.pm-notes{margin-top:10px;display:flex;flex-direction:column;gap:3px}
.pm-note{font-size:11px;color:#64748b;padding:3px 0;border-top:1px solid #f1f5f9}
.pm-note:first-child{border-top:none}
.pm-legend{font-size:10px;color:#94a3b8;margin-top:8px;font-style:italic}
.st-done{font-weight:600;color:#166534}
.st-partial{font-weight:600;color:#92400e}
.st-pending{color:#94a3b8}

/* BLOCKER BOX */
.blocker-box{background:#fff7ed;border:1px solid #fed7aa;border-radius:8px;padding:16px 20px}
.blocker-title{font-size:13px;font-weight:700;color:#9a3412;margin-bottom:12px;display:flex;align-items:center;gap:6px}
.blocker-table{width:100%;border-collapse:collapse;font-size:12px}
.blocker-table th{text-align:left;padding:6px 8px;color:#78350f;font-size:11px;text-transform:uppercase;letter-spacing:.5px;border-bottom:1px solid #fed7aa}
.blocker-table td{padding:7px 8px;border-bottom:1px solid #ffedd5;vertical-align:top}
.blocker-table tr:last-child td{border-bottom:none}
.no-blockers{color:#166534;font-size:13px;font-weight:600;padding:8px 0}

/* OQ LIST */
.oq-group-title{font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:.6px;color:#64748b;margin:12px 0 6px}
.oq-item{display:flex;gap:8px;align-items:baseline;padding:5px 0;border-bottom:1px solid #f1f5f9;font-size:13px}
.oq-item:last-child{border-bottom:none}
.oq-id{font-weight:700;color:#f97316;white-space:nowrap;min-width:52px}
.oq-text{flex:1;color:#334155}
.oq-meta{font-size:11px;color:#94a3b8;white-space:nowrap}
.age-warn{color:#b45309;font-weight:600}
.age-old{color:#dc2626;font-weight:600}

/* DECISIONS LIST */
.dec-item{padding:6px 0;border-bottom:1px solid #f1f5f9;font-size:13px;display:flex;gap:8px;align-items:baseline}
.dec-item:last-child{border-bottom:none}
.dec-id{font-weight:700;color:#3b82f6;white-space:nowrap;min-width:52px}
.dec-date{color:#94a3b8;font-size:11px;white-space:nowrap}
.dec-text{flex:1;color:#334155}

/* DOC STATUS */
.doc-item{padding:5px 0;border-bottom:1px solid #f1f5f9;font-size:13px;display:flex;gap:8px}
.doc-item:last-child{border-bottom:none}
.doc-name{font-weight:600;color:#334155;min-width:280px}
.doc-status{color:#64748b}
.all-complete{color:#166534;font-weight:600;font-size:13px}

/* ACTIONS */
.actions-list{list-style:none;display:flex;flex-direction:column;gap:10px}
.action-item{display:flex;gap:12px;align-items:flex-start}
.action-num{background:#f97316;color:#fff;font-weight:800;font-size:12px;width:22px;height:22px;border-radius:50%;display:flex;align-items:center;justify-content:center;flex-shrink:0;margin-top:1px}
.action-body{flex:1}
.action-text{font-size:13px;font-weight:600;color:#1a1a2e}
.action-owner{font-size:11px;color:#64748b;margin-top:2px}
.action-why{font-size:11px;color:#9a3412;margin-top:2px}

/* TWO-COL GRID */
.grid-2{display:grid;grid-template-columns:1fr 1fr;gap:16px}
@media(max-width:640px){.grid-2{grid-template-columns:1fr}}

/* FOOTER */
.footer{text-align:center;font-size:11px;color:#94a3b8;padding:8px 0 4px}
</style>
</head>
<body>
<div class="wrap">

  <!-- HEADER -->
  <div class="hdr">
    <div>
      <div class="hdr-title">Go-Live Readiness Report</div>
      <div class="hdr-sub">Assist → EPAM Docs · India HR Document Workflows</div>
    </div>
    <div class="hdr-meta">
      <span class="cnt-badge {{URGENCY_CLASS}}">🗓️ Go-Live: {{GO_LIVE_DATE}} — {{DAYS_REMAINING}} days</span>
      <div class="hdr-date">Report generated: {{REPORT_DATE}} {{REPORT_TIME}}</div>
    </div>
  </div>

  <!-- PHASE PROGRESS -->
  <div class="card">
    <div class="card-title">Phase Progress — All Phases (4 phases × 8 stages)</div>
    <div style="overflow-x:auto">
    <table class="phase-matrix">
      <thead>
        <tr>
          <th class="pm-phase">Phase</th>
          <th>Research</th>
          <th>Solution</th>
          <th>Int.✓<br><span class="pm-sub">Darya</span></th>
          <th>India✓<br><span class="pm-sub">Satish</span></th>
          <th>BA Work</th>
          <th>Dev*</th>
          <th>Process<br>Docs</th>
          <th>UAT</th>
        </tr>
      </thead>
      <tbody>
        {{PHASE_MATRIX_ROWS}}
      </tbody>
    </table>
    </div>
    {{PHASE_MATRIX_NOTES}}
    <div class="pm-legend">* Development stage is optional — not required for all phases</div>
  </div>

  <!-- BLOCKERS -->
  <div class="card">
    <div class="card-title">Open Blockers</div>
    {{BLOCKER_SECTION}}
  </div>

  <!-- OQs + DECISIONS (2-col) -->
  <div class="grid-2">

    <!-- ALL OPEN OQs -->
    <div class="card">
      <div class="card-title">All Open Questions</div>
      {{OQ_SECTION}}
    </div>

    <!-- RECENT DECISIONS -->
    <div class="card">
      <div class="card-title">Recent Decisions (last 5)</div>
      {{DECISIONS_SECTION}}
    </div>

  </div>

  <!-- DOC STATUS + NEXT ACTIONS (2-col) -->
  <div class="grid-2">

    <!-- DOCUMENT STATUS -->
    <div class="card">
      <div class="card-title">Document Status</div>
      {{DOC_STATUS_SECTION}}
    </div>

    <!-- NEXT ACTIONS -->
    <div class="card">
      <div class="card-title">⚡ Next 3 Actions</div>
      <ol class="actions-list">
        {{ACTION_ITEMS}}
      </ol>
    </div>

  </div>

  <div class="footer">Assist Decommission Project · BA Documentation · Generated by Claude Code</div>

</div>
</body>
</html>
```

### HTML element templates

Use these snippets when building the placeholder sections:

**`{{PHASE_MATRIX_ROWS}}` — one `<tr>` per phase (4 rows):**
```html
<tr>
  <td class="pm-name">Phase 1 — Reference Letters</td>
  <td class="st-done">✅</td>
  <td class="st-done">✅</td>
  <td class="st-pending">⬜</td>
  <td class="st-partial">🔶</td>
  <td class="st-pending">⬜</td>
  <td class="st-pending">⬜</td>
  <td class="st-pending">⬜</td>
  <td class="st-pending">⬜</td>
</tr>
```
Use `st-done` / `st-partial` / `st-pending` for ✅/🔶/⬜ cells. Use `pm-na` for `—` (N/A) cells.

**`{{PHASE_MATRIX_NOTES}}` — if any 🔶 cells exist:**
```html
<div class="pm-notes">
  <div class="pm-note"><strong>P1 · India✓:</strong> Track A approved (D-23, 14.05.2026); Track B blocked by OQ-15</div>
  <div class="pm-note"><strong>P2 · Solution:</strong> KB Onepager complete; BRD/Process Flow not yet started</div>
</div>
```

**`{{PHASE_MATRIX_NOTES}}` — if no partial cells:**
(omit the div entirely)

**`{{BLOCKER_SECTION}}` — if blockers exist:**
```html
<div class="blocker-box">
  <div class="blocker-title">🚫 Blocking OQs (N)</div>
  <table class="blocker-table">
    <thead><tr><th>ID</th><th>Question</th><th>Owner</th><th>Age</th><th>Blocking</th></tr></thead>
    <tbody>
      <tr>
        <td><strong>OQ-XX</strong></td>
        <td>Question summary</td>
        <td>Owner</td>
        <td><span class="age-old">N days</span></td>
        <td>Stage N</td>
      </tr>
    </tbody>
  </table>
</div>
```

**`{{BLOCKER_SECTION}}` — if no blockers:**
```html
<p class="no-blockers">✅ No blocking OQs — all stages can proceed.</p>
```

**`{{OQ_SECTION}}` — grouped by phase:**
```html
<div class="oq-group-title">Phase 1 — Reference Letters</div>
<div class="oq-item">
  <span class="oq-id">OQ-XX</span>
  <span class="oq-text">Question summary · <em>Owner name</em></span>
  <span class="oq-meta [age class]">N days</span>
</div>
```

**`{{DECISIONS_SECTION}}`:**
```html
<div class="dec-item">
  <span class="dec-id">D-XX</span>
  <span class="dec-date">(YYYY-MM-DD)</span>
  <span class="dec-text">Decision summary</span>
</div>
```

**`{{DOC_STATUS_SECTION}}` — if gaps exist:**
```html
<div class="doc-item">
  <span class="doc-name">filename.md</span>
  <span class="doc-status">Status / what is pending</span>
</div>
```

**`{{DOC_STATUS_SECTION}}` — if all complete:**
```html
<p class="all-complete">✅ All output documents complete.</p>
```

**`{{ACTION_ITEMS}}` — one `<li>` per action:**
```html
<li class="action-item">
  <span class="action-num">1</span>
  <div class="action-body">
    <div class="action-text">Action description</div>
    <div class="action-owner">Owner: Name</div>
    <div class="action-why">Why urgent: reason</div>
  </div>
</li>
```

---

## Step 5 — Confirm Save

After writing the HTML file, output one line to the conversation:

```
📄 Report saved: output/status_reports/YYYY-MM-DD_HH-MM_Status_Report.html
```

---

## Output Rules

- Write the Markdown report to the conversation first (Step 3). Do NOT skip this.
- Keep the Markdown report under 60 lines — be concise.
- Always save the HTML file (Step 4) after the Markdown report — never skip this step.
- The HTML file must be self-contained: no `<link>` to external stylesheets, no external JS.
- All facts in both outputs must be derived from the source files. Never invent a stage status, OQ owner, or decision date.
- If any source file is missing or unreadable, note which file is missing in both outputs and continue with available data.
- If `output/status_reports/` directory does not exist, create it before writing.
