---
name: build-overview
description: Assembles Project_Overview.html from component templates and data files in docs/src/. Run after editing any data file or component.
---

Regenerate `Project_Overview.html` from the modular component architecture in `docs/src/`.

---

## How the build works

You are the build tool. Follow these steps exactly:

### Step 1 — Read all data files

Read these YAML files in full before touching any HTML:

| File | Purpose |
|---|---|
| `docs/src/data/meta.yaml` | Page title, hero content, nav items, stats, footer, knowledge stats |
| `docs/src/data/phases.yaml` | Phase roadmap cards + signoff stages, blocking OQs, resources |
| `docs/src/data/outputs.yaml` | Document catalog table rows + audience note |
| `docs/src/data/validation.yaml` | Skill command, check list, result cards |

### Step 2 — Read all CSS files

Read these four files and concatenate them into a single CSS block (in this order):
1. `docs/src/styles/tokens.css`
2. `docs/src/styles/base.css`
3. `docs/src/styles/components.css`
4. `docs/src/styles/responsive.css`

Remove the multi-line file header comments (`/* ═══... */`) from each file before concatenating — they're for developers, not the output HTML.

### Step 3 — Read all component HTML files

Read these component files:
- `docs/src/components/hero.html`
- `docs/src/components/nav.html`
- `docs/src/components/context.html`
- `docs/src/components/workflow.html`
- `docs/src/components/inputs.html`
- `docs/src/components/knowledge.html`
- `docs/src/components/outputs-table.html`
- `docs/src/components/capabilities.html`
- `docs/src/components/validation.html`
- `docs/src/components/roadmap.html`
- `docs/src/components/stats.html`
- `docs/src/components/howto.html`
- `docs/src/components/footer.html`

### Step 4 — Resolve all SLOT markers

In each component template, replace every `<!-- SLOT: path.to.value -->` marker with the corresponding value from the YAML data files. Follow this mapping:

**Slot resolution rules:**
- `hero.tag` → `meta.yaml` → `hero.tag`
- `hero.title` → `meta.yaml` → `hero.title`
- `hero.title_em` → `meta.yaml` → `hero.title_em`
- `hero.subtitle` → `meta.yaml` → `hero.subtitle`
- `meta.stats` → `meta.yaml` → `stats[]` (loop: render one `.stat` div per entry)
- `meta.nav` → `meta.yaml` → `nav[]` (loop: render one `.nav-pill` per entry)
- `page.title` → `meta.yaml` → `page.title`
- `phases` → `phases.yaml` → `phases[]` (loop: render one `.rph` div per phase)
- `signoff_stages.*` → `phases.yaml` → `signoff_stages.*`
- `blocking_oqs.*` → `phases.yaml` → `blocking_oqs.*`
- `resources.*` → `phases.yaml` → `resources.*`
- `documents` → `outputs.yaml` → `documents[]` (loop: render one `<tr>` per document)
- `audience_note` → `outputs.yaml` → `audience_note`
- `skill.*` → `validation.yaml` → `skill.*`
- `checks` → `validation.yaml` → `checks[]` (loop: one `.skill-check` per entry)
- `result_cards` → `validation.yaml` → `result_cards[]` (loop: one `.card` per entry)

**LOOP directive:** When you see `<!-- LOOP: list → var --> ... <!-- /LOOP -->`, render the block once for each item in the list, substituting `var.*` slots with the item's fields.

### Step 5 — Assemble the full page

Build the complete HTML document:
1. Use `docs/src/page-template.html` as the structure
2. Replace `<!-- INCLUDE: styles/* -->` with the concatenated CSS (Step 2)
3. Replace each `<!-- INCLUDE: components/*.html -->` with the rendered component (Step 3 + 4)

### Step 6 — Write output

Write the assembled HTML to `Project_Overview.html` (project root).

**Quality checks before writing:**
- Verify there are no unresolved `<!-- SLOT: -->` markers in the output
- Verify there are no unresolved `<!-- INCLUDE: -->` markers in the output
- Verify there are no unresolved `<!-- LOOP -->` / `<!-- /LOOP -->` markers
- Verify the stat count in the hero matches the actual number of decisions in Feedback_Decisions_Log.md (sanity check)
- Verify the validation section shows the current number of checks

---

## When to run

Run `/build-overview` after:
- Editing any file in `docs/src/data/` (stats changed, new phase status, new document added)
- Editing any file in `docs/src/components/` (component HTML updated)
- Editing any file in `docs/src/styles/` (design token or CSS changed)
- A new validator check is added (update `docs/src/data/validation.yaml` first)
- A phase status changes (active → done, next → active)

Do NOT manually edit `Project_Overview.html` — edits will be overwritten on the next build.
Instead, edit the appropriate source file and rebuild.

---

## Adding a new section

1. Create `docs/src/components/<name>.html` following the component template pattern
2. Create `docs/src/data/<name>.yaml` if the section has variable data
3. Add `<!-- INCLUDE: components/<name>.html -->` to `docs/src/page-template.html`
4. Add a corresponding nav entry to `docs/src/data/meta.yaml` → `nav[]`
5. Run `/build-overview`

---

## Adding a new phase

1. Open `docs/src/data/phases.yaml`
2. Add a new entry under `phases:` with `status: next` (or appropriate status)
3. Run `/build-overview`
4. The roadmap section regenerates automatically from the data

---

## Updating validator check count

1. Open `docs/src/data/validation.yaml`
2. Add the new check text to `checks:`
3. Update the stat in `docs/src/data/meta.yaml` → `stats:` (the "Validator Checks" entry)
4. Run `/build-overview`
