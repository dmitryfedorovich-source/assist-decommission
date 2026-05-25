# Assist → EPAM Docs: India HR Document Migration

BA documentation workspace for migrating India HR document workflows from **assist.epam.com** (decommissioned June 30, 2026) to **docs.epam.com**. Covers four phases: Reference Letters (Phase 1), Compensation Letters (Phase 2), Separation Letters (Phase 3), and Relocation Letter (Phase 4+).

---

## Prerequisites

| Tool | Notes |
|---|---|
| **Claude Code** (or **codemie-claude**) | The Claude CLI. Use `codemie-claude` on EPAM-managed machines; use `claude` with a direct Anthropic account. |
| **Confluence MCP** | Must be configured in your Claude Code MCP settings to reach **kb.epam.com** (EPMEOADOCS space). The server name must be `confluence`. Contact your team admin for the MCP server config details. |

---

## Setup

```bash
# 1. Clone the repo
git clone https://github.com/dmitryfedorovich-source/assist-decommission.git
cd assist-decommission

# 2. Configure Confluence MCP (one-time)
#    Add the kb.epam.com Confluence server to your Claude Code MCP settings.
#    Server name must be: confluence
#    Ask your team admin for the exact server URL and credentials.

# 3. Start Claude Code from the project root
codemie-claude        # on EPAM machines
# — or —
claude                # with direct Anthropic account
```

> **Windows shortcut:** double-click `codemie-claude_start.bat` — it opens the CLI in the correct directory.

---

## Session Start Protocol

At the start of every session, read these files **before doing any work**:

1. `memory/context/project_state.md` — current phase status, open questions, next actions
2. `memory/context/domain_rules.md` — terminology rules, tone per document type
3. From `project_state.md`, identify the active phase → read `memory/phase[N]/state.md`

Do **not** load all memory files at once. Follow the tiered loading guidance in `CLAUDE.md`.

---

## Skills

Run these slash commands in the Claude Code session:

| Skill | Command | When to run |
|---|---|---|
| Go-Live Readiness Report | `/status-check` | Start of any session; before stakeholder calls |
| Validate all output docs | `/validate-docs` | After any change to the `output/` folder |
| Quick validate one doc | `/validate-quick` | After routine edits to a single output file |
| Validate YAML schemas | `/validate-schema` | After editing any file in `docs/data/` |
| Rebuild Project Overview | `/build-overview` | After editing any file in `docs/src/` |

Skills delegate to subagents automatically — see `CLAUDE.md → Skill Model Routing` for the model used by each skill.

---

## Key Files

| File / Folder | Purpose |
|---|---|
| `CLAUDE.md` | Full project instructions for Claude — read this first for any workflow question |
| `output/shared/Feedback_Decisions_Log.md` | **Source of truth** for all decisions, open questions, and feedback |
| `output/shared/RTM.md` | Requirements Traceability Matrix |
| `memory/context/project_state.md` | Current phase status, deliverables, next actions |
| `docs/data/` | Canonical structured data (YAML) for decisions, OQs, phases, documents, workflows |
| `docs/schema/` | JSON Schema files — validated by `/validate-schema` |
| `Project_Overview.html` | Generated management overview — **do not edit directly**, use `/build-overview` |
| `.claude/skills/` | Skill definitions (SKILL.md per skill) |

---

## Local Settings

`.claude/settings.json` (committed) contains shared permissions and the image-read hook used by all contributors.

`.claude/settings.local.json` is **gitignored** — use it for personal or machine-specific overrides. It will not affect other users.

---

## Image Memory Hook

When you read an image from `input/screenshots/`, a hook automatically checks whether extracted knowledge already exists in `memory/img_<name>.md`. If it does, the read is blocked and you are redirected to the memory file. If it does not, you are reminded to save the extracted knowledge after reading.

This keeps image knowledge in the repo so colleagues do not need to re-read the same screenshots.
