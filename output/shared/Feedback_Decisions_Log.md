# Feedback & Decisions Log
## Reference Letters Migration — Assist → EPAM Docs

**Project:** Phase 1 — Reference Letters  
**Maintained by:** BA team  
**Last updated:** May 2026

---

## How to Use

- **Decisions** — confirmed design choices; locked, reflected in BRD and Process Flow
- **Open Questions** — unresolved items blocking or affecting design
- **Feedback** — input from stakeholders requiring action or acknowledgement

Update status after every review session. Link to updated document versions where relevant.

---

## Decisions Log

| ID | Decision | Made by | Date | Reflected in |
|---|---|---|---|---|
| D-01 | Go-live and Assist decommission date: June 30, 2026 | Discovery page (official) | 2026-04-16 | All docs |
| D-02 | LOR for ex-employees: out of scope Phase 1 — addressed in Separation Letters | Internal | — | 01, 02, 05 |
| D-03 | Relocation Letter: no manual review — system auto-approves on effective date | Discovery page | 2026-04-16 | Phase 4+ planning (superseded by D-16 for Phase 1) |
| D-04 | Relocation Letter: past-date requests are allowed, auto-approved immediately | Discovery page | 2026-04-16 | Phase 4+ planning (superseded by D-16 for Phase 1) |
| D-05 | Relocation Letter: initiated by RM / India Team specialist, not employee | Stakeholder input | — | Phase 4+ planning (superseded by D-16 for Phase 1) |
| D-06 | Auto-close: 2 days after all forms reach final status | India stakeholder (confirmed) | — | 01, 02 |
| D-07 | Rejection flow: EPAM specialist rejects with required comment → system notifies employee → employee edits and resubmits same form → specialist re-verifies. No limit on resubmissions. *(Corrected 2026-05-12 — previous version incorrectly stated new request required.)* | India stakeholder correction (2026-05-12) | 2026-05-12 | 01, 02, 06 |
| D-08 | Terminology: "India Team specialists" not "HRBP" in India/management-facing docs | Internal (Daria/Hanna alignment) | — | 04, 05, 06, KB2, KB3 |
| D-09 | Visa Processing Letter: Comments field, max 300 chars, single line (not "Country") | India stakeholder (confirmed) | — | 01, 02 |
| D-10 | Cancel request: nice to have, NOT in Phase 1 MVP | Discovery page | 2026-04-16 | 02 |
| D-11 | Historical data migration: out of scope | Discovery page | 2026-04-16 | 02 |
| D-12 | Visa Processing Letter: RM approval removed from DOCS flow. DOCS target flow: DV/EDV (India Team specialist) verifies document → manually sends to employee via "Send Document". Comments field required (max 300 chars, one line). *(Superseded by D-24 for routing — Visa Processing Letter moved from Track B to Track A (18.05.2026, verbal Satish Malla confirmation via Hanna Vasilenka, pending email). D-12 routing (DV/EDV verifies → Send Document) replaced by Track A auto-verification + notification checkbox per D-24. Comments field spec (D-09, D-18) is unaffected.)* | Darya Taranda (Reference Letters KB page) | 2026-05-06 | 01, 02 |
| D-13 | LOR (active employees): RM approval removed from DOCS flow. Same DV/EDV verification → manual "Send Document" flow. Alternative accepted scenario: employee receives invitation, can download before/after verification. Notes/Responsibilities field: max ~1000 chars, multi-line. *(Under review — Satish Malla confirmed at India SME meeting 14.05.2026 that RM approval IS required for LOR. Same situation as D-12. See OQ-15.)* | Darya Taranda (Reference Letters KB page) | 2026-05-06 | 01, 02 |
| D-14 | Relocation Letter in DOCS: initiated by India Team specialist (HR) only. RM cannot directly create Relocation Letter requests in DOCS (DOCS cannot give RM role per-process to all RMs — would expose all requests). If RM needs a letter for subordinate, they go via ServiceNow → India Team specialist creates in DOCS. | DOCS internal team (Olga Chaban, 05/06/2026) | 2026-05-06 | Phase 4+ planning (superseded by D-16 for Phase 1) |
| D-15 | All Phase 1 letters use DOCS flows with RM verification removed. Form 60, Address Proof, Service Letter are auto-verified. Visa Processing routing was later superseded by D-24 and is now Track A with notification checkbox. LOR remains DV/EDV verification + "Send Document" pending OQ-15 RM approval solution. *(Note: decision made when scope was 6 letters; scope updated to 5 letters by D-16 — Relocation Letter removed from Phase 1.)* | Darya Taranda decision (05/05/2026), confirmed in DOCS internal review | 2026-05-05 | 01, 02 |
| D-16 | Relocation Letter removed from Phase 1 scope. Moved to Phase 4+ for separate investigation. Reasons: (1) purpose of letter unclear — not confirmed why/when it is needed; (2) in DOCS, RM cannot initiate a request for an employee, making the current Assist flow unrepresentable; (3) trigger mechanism unclear — may warrant auto-trigger from People system. Phase 1 now covers 5 letter types. | Dzmitry Fedarovich / Hanna Vasilenka / Darya Taranda (meeting 07/05/2026) | 2026-05-07 | 01, 02, 04, 05 |
| D-17 | Self-Declaration popup/checkbox (present in Assist before "Continue" button activates) will NOT be implemented in DOCS for any Phase 1 form. Instead, add a static disclaimer/notice text at the top of the relevant forms. No functional gate — informational text only. *(Superseded by D-21 — DOCS does implement a Self-Declaration Accept checkbox at the bottom of each form; static disclaimer text approach is replaced by the checkbox.)* | Dzmitry Fedarovich / Darya Taranda / Hanna Vasilenka (meeting 07/05/2026) | 2026-05-07 | 01, 02, 05 |
| D-18 | Comments field (Visa Processing Letter) and Notes & Responsibilities field (LOR) are both **required** — employee cannot submit the form without filling them in. Visa Processing: max 300 chars, one line, no paragraphs. LOR: max ~1000 chars, multi-line, paragraphs supported. | DOCS platform team confirmation (input 12.05.2026) | 2026-05-12 | 01, 02, 05 |
| D-19 | Approval flow comments: comment input is **only available/required when specialist rejects** a document. When the specialist approves (verifies) the document, no comment is needed — the comment field is not available on approval. | DOCS platform team confirmation (input 12.05.2026) | 2026-05-12 | 01, 02 |
| D-20 | Address Proof Letter: the address field is **read-only (locked)**. Employees cannot edit the address on the DOCS form. If the address is incorrect or missing, the form displays a note directing the employee to update their profile in the People system. *(Resolves OQ-14. Confirmed from Assist reference letters data, 2026-05-12.)* | Assist reference letters data (2026-05-12) | 2026-05-12 | 01, 02, 03, 05, 07 |
| D-21 | **Self-Declaration checkbox confirmed in DOCS.** Updates D-17: the DOCS platform implements a Self-Declaration section with an **"Accept" checkbox at the bottom of each request form**. Employee must tick the checkbox before clicking Submit. Full text: *"I hereby declare that the information provided by me is true and correct. The company doesn't confirm any factual correctness of information provided by you. This Letter is being issued on your request solely for the purpose mentioned in the application. Any declaration made by you well knowing it to be false or discovered at any point of time to be false, the company can't be held accountable for issuance of such letter. You shall be held for an appropriate disciplinary action for any such discovery."* D-17 is superseded — DOCS does have a consent mechanism; it is a checkbox at the bottom, not static text. Note: appears to be standard DOCS platform behavior. Configuration checklist item should read: "Confirm Self-Declaration checkbox is enabled for all 5 India letter types." | DOCS platform screenshots (2026-05-13) | 2026-05-13 | 01, 02, 03, 05, 07 |
| D-22 | **Form 60 employee-entered fields — updated from DOCS screenshots.** (1) **Salutation** field (dropdown, e.g. Mrs./Mr.) — present in DOCS form, not previously documented; add to Form 60 field list. (2) Field label **"Current address"** (2-line text) — replaces "Address" in all docs. (3) Field label **"Worksite city"** (dropdown) — replaces "City" (text) in all docs; likely pre-populated or dropdown-constrained, not free text. | DOCS platform screenshots (2026-05-13) | 2026-05-13 | 01, 02, 03, 05, 07 |
| D-23 | **Track A letters (Form 60, Address Proof Letter, Service Letter) — India SME validation approved.** Satish Malla confirmed at the India SME validation meeting (14.05.2026) that the proposed design for all three Track A letters is correct. Fields, routing (auto-verified), and common behaviors validated with no change requests. These 3 letters are approved to proceed to development. *(OQ-15 partially resolved: D-24 moves Visa Processing Letter to Track A (18.05.2026, verbal, pending written confirmation). D-12 superseded for routing. LOR (D-13) Track B status still pending OQ-15 resolution.)* | Satish Malla (India SME meeting, 14.05.2026) | 2026-05-14 | 07 |
| D-24 | **Visa Processing Letter: routing updated from Track B to Track A. No approval required.** Satish Malla confirmed (18.05.2026) that no RM or specialist approval is needed for the Visa Processing Letter. Employee ticks a notification checkbox confirming they have informed the relevant person (same UX pattern as leave/vacation requests). This supersedes D-12 for routing: no DV/EDV verification or "Send Document" step. Comments field spec (D-09, D-18) and Self-Declaration Accept checkbox (D-21) still apply. *(Verbal confirmation from Satish Malla to Hanna Vasilenka, 18.05.2026. Written confirmation from Satish requested by Hanna — awaited. Partially resolves OQ-15: OQ-15 now covers LOR only.)* | Satish Malla (verbal, via Hanna Vasilenka Teams message, 18.05.2026) | 2026-05-18 | 01, 02 |

---

## Open Questions

| ID | Question | Owner | Raised | Target resolution | Status |
|---|---|---|---|---|---|
| OQ-01 | Visa Processing Letter: is India Team specialist approval still required, or auto-verified? | Darya Taranda / India Team | 2026-04-16 | Stage 1/2 review | **Resolved** — Track A auto-verified with notification checkbox (D-24; supersedes D-12 routing) |
| OQ-02 | LOR: is India Team specialist approval still required, or auto-verified? | Darya Taranda / India Team | 2026-04-16 | Stage 1/2 review | **Resolved** — RM approval removed (D-13) |
| OQ-03 | LOR: can RM initiate a request on behalf of an employee? | India Team | 2026-04-16 | Stage 2 review | **Resolved** — No; employee self-service in DOCS; ex-employee LOR via India Team specialist (Separation module) |
| OQ-04 | Relocation Letter: city list for "New Work Location" dropdown | India HR | — | Phase 4+ scoping | **Deferred** — Relocation Letter moved to Phase 4+ (D-16) |
| OQ-05 | Service Letter: Purpose dropdown values | India HR | — | Stage 2 review | **Open** |
| OQ-06 | Visa Processing Letter: Purpose dropdown values | India HR | — | Stage 2 review | **Open** |
| OQ-07 | LOR: Purpose dropdown values | India HR | — | Stage 2 review | **Open** |
| OQ-08 | Bank/SIM/LPG sub-types: handled via Purpose dropdown on same base template? | India Team (Sasanka) | — | Stage 2 review | **Open** |
| OQ-09 | Nomination Form: is this in scope for DOCS migration? 04/05/26 meeting discussed enabling employee nominee updates via DOCS self-service + bulk data migration from Assist. **18.05.2026 update (Satish Malla email):** Confirmed field list — Emp UID (auto-People), Emp Name (auto-People), Name of Nominee, Relation, DOB, Gender (M/F), Address, Contact Number, GPA, FSG, GTLI, Gratuity, PF. Employee can add multiple dependents and split % allocation among them. Form confirmed same as current Assist portal. Scope and phase assignment still TBD (Darya Taranda / Hanna Vasilenka). | Darya Taranda / Hanna Vasilenka | 2026-05-04 | Phase scoping | **Open — field list confirmed; scope/phase TBD** |
| OQ-10 | Relocation Letter DOCS flow: moved to Phase 4+ per D-16. No longer relevant for Phase 1. | Darya Taranda / India Team | 2026-05-07 | — | **Closed — deferred with D-16** |
| OQ-11 | DOCS development required for text input fields: (1) Comments field for Visa Processing Letter (max 300 chars, alphanumeric) — current text marker only supports numbers; (2) LOR Notes / Responsibilities plain text field (multi-line, no rich text). Both require new field component development. Size/timeline TBD pending assessment by DOCS dev lead (Michael). | Olga Chaban / DOCS Platform Team | 2026-05-05 | Dev planning | **Open** |
| OQ-12 | Compensation letter acknowledgment tracking: Satish originally asked for radio button Accept + date-timestamp. Internal team (07/05/2026) agreed preferred approach is activity log extension — track both "view" and "download" events — lower dev cost than 2-sprint custom Accept button (Michael's estimate). Disclaimer/notice text to be added as paragraph within letter (not popup). Pending: (a) DOCS dev cost estimate for activity log extension; (b) Satish alignment — confirm activity log satisfies audit trail need. | Dzmitry Fedarovich / DOCS Platform Team (Michael) / Satish Malla | 2026-05-07 | Phase 2 dev planning | **Open — direction updated** |
| OQ-13 | Relocation Letter (Phase 4+): moved to Phase 4 section below. | Hanna Vasilenka / India Team | 2026-05-07 | Phase 4 scoping | **→ See Phase 4 section** |
| OQ-14 | Address Proof Letter: should employees be able to manually edit their address in the DOCS form (pulled from People Portal), or should the field be locked (force update in People Portal first)? | India Team (Satish / Sasanka) | 2026-05-07 | Stage 2 India SME review | **Resolved — D-20: field is locked (read-only); update via People system** |
| OQ-15 | **LOR — RM approval solution required.** *(Visa Processing Letter resolved by D-24, 18.05.2026 — moved to Track A.)* Satish Malla confirmed at India SME meeting (14.05.2026) that RM approval is a mandatory step in the current Assist process for LOR (contradicting D-13). The DOCS platform does not currently support routing a document to an RM for approval. Development of Track B for LOR is blocked until a technical solution is identified and agreed. Options to investigate: (1) Employee enters RM name/email on the DOCS form; system sends verification email to RM; specialist verifies only after RM responds; (2) Specialist manually contacts RM outside DOCS and proceeds with verification after off-system RM confirmation; (3) Other DOCS platform capabilities (e.g., multi-step approval workflow). Investigation required with DOCS platform team (Olga Chaban) and India Team (Satish). | Dzmitry Fedarovich / Olga Chaban / Satish Malla | 2026-05-14 | DOCS platform investigation / Stage 3 | **Open — blocking LOR (Track B) development** |
| OQ-16 | **Track A letter forms — pre-population of employee-filled fields.** Satish Malla (18.05.2026) expressed concern that certain fields currently listed as employee-entered on Track A letter forms (Form 60, Address Proof Letter, Service Letter) should instead be pre-populated from the People system or DOCS platform where the data is already available. Satish to provide the specific list of fields and their preferred data sources via email. Resolution required before Track A form design is finalized for development. | Satish Malla / Dzmitry Fedarovich / Hanna Vasilenka | 2026-05-18 | Track A development finalization | **Open — awaiting Satish's email with specific field list** |

---

## Feedback Log

| ID | Source | Stage | Feedback | Action taken | Status |
|---|---|---|---|---|---|
| F-01 | Confluence discovery page | Pre-work | Decommission date is June 30 (not July 1) | Updated all output docs; July 1 references corrected in 03 (Slide 12) and 06 (Slide 9) | ✅ Done |
| F-02 | Confluence discovery page | Pre-work | Relocation Letter: no HRBP approval, date-triggered auto | Reclassified in 01, 02, 03, 04, 05 | ✅ Done |
| F-03 | Confluence discovery page | Pre-work | RM approvals for Visa/LOR under clarification | Added "under clarification" flags to 01, 02, 03 | ✅ Done |
| F-04 | Internal (Daria/Hanna rule) | Stage 1 | No "HRBP" in India/management-facing documents | Replaced with "India Team specialists" in 04, 05, 06 | ✅ Done |
| F-05 | Satish Malla (call 2026-05-04) | Phase 2 scoping | Confirmed: actual compensation letter scope is 4 types only; flex-to-fixed letters removed after GDO merge (effective April 1, 2026). Employee acceptance required (one-click, date-stamped). PAN-password protection required for audit. Indian currency format required. Auto-close ~1 week acceptable. | Added Phase 2 decisions D-P2-01–D-P2-05; updated Phase 2 KB Onepager | ✅ Done |
| F-06 | Internal BA team (calls 2026-04-29, 2026-04-30) | Phase 2/3 scoping | Identified open questions: text block completeness for compensation letters, PAN protection feasibility, ex-employee data retention window, separation letter auto-trigger from People system | Added Phase 2/3 Open Questions OQ-P2-01–OQ-P3-02 | ✅ Done |
| F-07 | KB page review (2026-05-07) | Knowledge update | Review of all 7 EPMEOADOCS child pages confirmed: RM approvals removed for Visa/LOR (Darya Taranda); compensation letters use single template + conditional blocks; ex-employee data available min 2 years; Nomination Form scope to be decided; Relocation Letter DOCS flow discrepancy identified | Closed OQ-01–03, OQ-P2-01, OQ-P2-03, OQ-P3-01; added D-12, D-13, D-P2-06, D-P3-01; added OQ-09, OQ-10 | ✅ Done |
| F-08 | Transcription review (2026-04-29 to 2026-05-06) | Internal review | 5 meeting transcriptions processed: (1) Compensation Accept confirmed as radio button + timestamp (Satish, 04/05); (2) DOCS platform technical gaps identified in 05/05–06/05 internal review — text fields, Accept button, auto-verify timing, one-request-per-process limitation; (3) Relocation Letter confirmed non-self-service; (4) People platform already has personal data confirmation feature for exiting employees (Darya, 04/05); (5) Nominee details discussion: Assist data not legally binding, DOCS self-service + migration proposed (Satish, 04/05) | Added D-14, D-15, OQ-11, OQ-12, D-P3-02, OQ-P3-03; updated memory with DOCS technical limits and nominee details | ✅ Done |
| F-09 | Meeting transcript 07/05/2026 (Dzmitry, Darya, Hanna, Olga, Lela) | Internal review | Key outcomes: (1) Relocation Letter removed from Phase 1 — purpose unclear, DOCS flow incompatible (D-16); (2) Self-Declaration popup/checkbox skipped for all forms — static disclaimer text instead (D-17); (3) WFH toggle confirmed removed from all Phase 1 forms; (4) Download-before-fill accepted as DOCS limitation — mitigate with user instructions; (5) Custom Purpose text field: always-visible in DOCS (can't do conditional display), same 100-char limit; (6) Compensation disclaimer = text paragraph added to letter itself (not popup); (7) Acceptance tracking shifted from custom Accept button (2 sprints) to activity log view+download — needs Satish alignment; (8) India SME meeting planned for ~May 13-14 with Miro visual demo (5 letter types) | Added D-16, D-17, D-P2-07; updated OQ-12 direction; added OQ-13, OQ-14; updated phase1/state.md, phase2/state.md, project_state.md | ✅ Done |
| F-10 | DOCS platform screenshots analysis (2026-05-13) — 10 self-service screenshots (IN Form 60 auto-verified flow) + 3 compensation flow diagrams | Platform review | Key findings: (1) D-17 superseded — DOCS DOES have a Self-Declaration "Accept" checkbox at the bottom of each form (D-21); (2) Form 60 actual fields differ: Salutation (dropdown) is present, "Address" → "Current address" (2-line), "City" (text) → "Worksite city" (dropdown) (D-22); (3) Request creation requires TWO UI actions: select type → click "Create request" button; (4) My Requests page has "Active Requests" / "Past Requests" sub-tabs; (5) Status after submit (including auto-verified): "Waiting for verification" (not "Completed") until nightly batch runs — letter downloadable immediately regardless; (6) Contact point for India letters: WFA Human Resource India / WFAHumanResourceIndia@epam.com; (7) "Save as draft" option present on all forms; (8) "Additional Documents" upload section on all requests (up to 60 files, max 199 MB); (9) "System File" form — pre-populated People data visible to specialist, contains First name, Last name, Start date in EPAM India, UID, Email; (10) Phase 2: initiating role is "Compensation Team specialist"; auto-close confirmed 10 days completed / 3 days inactive (D-P2-05 updated) | Added D-21, D-22; updated D-P2-05; updated 01, 02, 03, 05, 06, phase2/01 | ✅ Done |
| F-11 | India SME validation meeting (14.05.2026). Participants: Satish Malla (India HR), Dzmitry Fedarovich (BA), Olga Chaban (DOCS platform), Hanna Vasilenka (BA). | Stage 2 SME validation | Key outcomes: (1) **Track A approved (D-23)** — Form 60, Address Proof, Service Letter validated; Satish confirmed design is correct; proceed to development; (2) **Track B blocked (OQ-15)** — Satish confirmed RM approval IS a required step for Visa Processing Letter and LOR; current DOCS architecture does not support RM approval routing; development of Track B blocked pending solution; (3) Address Proof read-only field confirmed verbally by Satish (consistent with D-20); (4) Self-Declaration Accept checkbox concept confirmed; (5) OQ-05, OQ-06, OQ-07, OQ-08 still open — Satish to review Miro board and provide Purpose dropdown values via chat; (6) Auto-close concept accepted — Satish wants longer interval for Track B; exact value TBD as part of OQ-15 solution scope; (7) Contact email update pending — Satish mentioned Rewards team email should replace WFAHumanResourceIndia@epam.com; Satish to share correct email. | Added D-23, OQ-15; updated D-12, D-13 with under-review notes; updated Stage 2 sign-off status; updated 07_India_SME_Presentation.html as processed document | ✅ Done |
| F-12 | (1) Hanna Vasilenka Teams chat (18.05.2026) — Hanna reporting back from verbal discussion with Satish Malla. (2) Satish Malla email forwarded by Hanna Vasilenka (18.05.2026, 15:48) — Subject: "Self Service Nominee Form from Assist". CC: Chinmoy Ghosh, Darya Taranda. (3) Satish Malla email screenshot `input/corrections/nominee.jpg` — visual confirmation of same email. | Post-SME follow-up | Key outcomes: (1) **Visa Processing Letter → Track A confirmed** (verbal, Satish via Hanna) — no RM approval, no specialist verification; employee ticks notification checkbox only; same UX as leave request. Resolves OQ-15 for Visa Processing. Written confirmation from Satish awaited. → Added D-24; updated D-12 (superseded for routing), D-23 note; OQ-15 narrowed to LOR. (2) **Track A fields pre-population concern** (Satish) — some employee-filled fields on Track A forms could be pre-populated from People/DOCS; Satish to detail in email. → Added OQ-16. (3) **Nominee Form field list confirmed** (Satish email) — fields: Emp UID + Emp Name (auto-People); Name of Nominee, Relation, DOB, Gender (M/F), Address, Contact Number, GPA, FSG, GTLI, Gratuity, PF; employee splits % among dependents; same form as Assist. → Updated OQ-09, OQ-P3-03; added img_nominee.md memory. | Added D-24, OQ-16; updated D-12, D-23, OQ-15 (scope narrowed), OQ-09, OQ-P3-03; created img_nominee.md | ✅ Done |

---

## Stage Sign-offs

| Stage | Description | Participants | Date | Status |
|---|---|---|---|---|
| Stage 1 | Internal alignment — process flow, BRD, approach | Daria, Hanna | — | ⬜ Pending |
| Stage 2 | India SME validation — process design, field specs, open questions | Satish Malla, Satya Danam, Sasanka Yedlapati | 2026-05-14 (partial) | 🔶 Partial — Track A approved (D-23, 14.05.2026); Track B blocked pending OQ-15 (RM approval solution required) |
| Stage 3 | Post-feedback iteration — BRD and flow updated | Internal | — | ⬜ Pending |
| Stage 4 | Final India stakeholder sign-off + UAT | India stakeholders | — | ⬜ Pending |
| Stage 5 | Epics/tickets handed to dev and business process teams | Dev team, BA | — | ⬜ Pending |

---

## Phase 2 — Compensation Letters

### Phase 2 Decisions Log

| ID | Decision | Made by | Date | Reflected in |
|---|---|---|---|---|
| D-P2-01 | Scope confirmed: 4 compensation letter types actively in use — Salary Revision, Promotion, Increment, Variable Pay. Flex-to-fixed letter types removed after GDO merge effective April 1, 2026. | Satish Malla (India HR) | 2026-05-04 | phase2/01 |
| D-P2-02 | Employee acceptance required: one-click Accept button with date-timestamp recorded. No reject option — employee either accepts or leaves unaccepted. Salary is processed regardless of acceptance status. This is company policy, not a legal requirement. | Satish Malla (India HR) | 2026-05-04 | phase2/01 |
| D-P2-03 | Compensation letters must be password-protected using the employee's PAN number (for audit compliance). If Docs platform cannot implement PAN-password natively, the minimum acceptable alternative is a disclaimer/caution note shown before the employee can open the letter. | Satish Malla (India HR) | 2026-05-04 | phase2/01 |
| D-P2-04 | Indian currency format (INR) required for all monetary amounts in compensation letters. | Satish Malla (India HR) | 2026-05-04 | phase2/01 |
| D-P2-05 | Docs request auto-closes after letter reaches "Generated" status. Auto-close timing of approximately 1 week is acceptable to India team. India team only needs to track "Generated" status per employee — not whether employee opened or accepted. **Updated 2026-05-13 from compensation flow diagrams:** confirmed auto-close periods are **10 days** for completed requests and **3 days** for inactive requests. | Satish Malla (India HR) / Compensation flow diagrams (2026-05-13) | 2026-05-04 | phase2/01 |
| D-P2-06 | All compensation letter types use a single base template with conditional text blocks. Text blocks for Salary Hike, Promotion, OTB, Retention Bonus, Deferred Bonus, One-Time Bonus, and LTI are included or excluded based on Yes/No flags in the XLS upload file. 4 type variants: (1) Salary Hike only; (2) Promotion + Salary Hike; (3) Promotion + Salary Hike + OTB; (4) Promotion + OTB + Retention/Deferred/One-Time Bonus + LTI. All text block combinations are covered in India team letter examples. | KB Open Questions page + Satish Malla | 2026-05-07 | phase2/01 |
| D-P2-07 | Compensation letter disclaimer/confidentiality notice: add as a text paragraph within the compensation letter itself (e.g., "This letter is confidential — do not share with third parties"). Word-based template supports this. No separate popup, no separate form. Checkbox cannot be added to Word-based template (PDF-based template would require one template per letter variant). Internal team agreed on inline paragraph approach. | Darya Taranda / Hanna Vasilenka / Dzmitry Fedarovich (meeting 07/05/2026) | 2026-05-07 | phase2/01 |

### Phase 2 Open Questions

| ID | Question | Owner | Raised | Target resolution | Status |
|---|---|---|---|---|---|
| OQ-P2-01 | Compensation letter text blocks — are the 4 text block variants provided (salary, bonus/LTI inclusion/exclusion combinations) the complete set, or are there additional block types? India team to confirm all possible combinations with actual letter examples. | Lalitha Pavani Madiraju / Satish Malla | 2026-04-29 | Phase 2 planning | **Resolved** — KB confirms all possible blocks are covered in India team examples (D-P2-06) |
| OQ-P2-02 | Can Docs platform implement PAN-number PDF password protection on compensation letters? If not, is a disclaimer/caution note sufficient for audit compliance? | Docs Platform Team | 2026-05-04 | Phase 2 scoping | **Open** |
| OQ-P2-03 | Do all 4 compensation letter types use one base template with different text blocks inserted, or are they fully separate templates? India team to provide all letter examples for confirmation. | Olga Chaban / Lalitha Pavani Madiraju | 2026-04-29 | Phase 2 planning | **Resolved** — Single template with conditional text blocks confirmed (D-P2-06) |

---

## Phase 3 — Separation Letters

### Phase 3 Decisions Log

| ID | Decision | Made by | Date | Reflected in |
|---|---|---|---|---|
| D-P3-01 | Ex-employee data on People platform is available for a minimum of 2 years after the last working day, or until the ex-employee requests PII obfuscation. Data is removed manually on request only. This is sufficient for Experience Letter generation (typically 10–15 days post-exit). | People team (Dzmitry Fedarovich) | 2026-05-04 | phase3/01 |
| D-P3-02 | People platform already has an automated notification feature that asks employees to confirm/update their personal contact details (personal email, phone) before their last working day. This covers the personal email collection requirement for sending the Experience Letter to personal email post-exit. Feature implemented by People platform (Nastya Kishkina's team). | Darya Taranda (confirmed 04/05/2026) | 2026-05-04 | phase3/01 |

### Phase 3 Open Questions

| ID | Question | Owner | Raised | Target resolution | Status |
|---|---|---|---|---|---|
| OQ-P3-01 | Ex-employee data retention: how long after exit date is employee profile data accessible in People system? Required to determine feasibility window for ex-employee document generation (Experience Letter is typically requested 7–14 days post-exit). | Darya Taranda / People team | 2026-04-30 | Phase 3 planning | **Resolved** — min 2 years (D-P3-01) |
| OQ-P3-02 | Separation letter auto-trigger: can People system publish an event to Docs on employee's last working day to auto-create Experience Letter and Relieving Letter requests? | Dzmitry Fedarovich / Docs Platform Team | 2026-04-30 | Phase 3 planning | **Open** |
| OQ-P3-03 | Nominee Details (Nomination Form) scope: should DOCS include a self-service process for employees to update nominee details (replacing Assist portal), plus bulk migration of Assist nominee data to DOCS? Satish confirmed approach is feasible on 04/05/2026; formal scope, phase assignment, and statutory form update process (Form F, Form 2) to be decided. **18.05.2026 update (Satish Malla email):** Confirmed nominee form field list — Emp UID (auto-People), Emp Name (auto-People), Name of Nominee, Relation, DOB, Gender (M/F), Address, Contact Number, GPA, FSG, GTLI, Gratuity, PF. Employee can add multiple dependents and split % allocation. Form is same as Assist. | Darya Taranda / Hanna Vasilenka | 2026-05-04 | Phase scoping | **Open — field list confirmed; scope/phase TBD** |
| OQ-P3-04 | Ex-employee DOCS access via personal email: is the "applicant" flow (used for onboarding) technically feasible for ex-employees to log in to DOCS with personal email and download separation letters? Required if DOCS cannot send email attachments directly to external email. | Olga Chaban / DOCS Platform Team | 2026-04-30 | Phase 3 planning | **Open** |

---

## Phase 4 — Relocation Letter (Investigation)

### Status

Scoping not started. Relocation Letter removed from Phase 1 scope (D-16, 2026-05-07). Phase 4 scope document to be created once investigation questions below are answered.

### Phase 4 Open Questions

| ID | Question | Owner | Raised | Target resolution | Status |
|---|---|---|---|---|---|
| OQ-13 | Relocation Letter — investigate before scoping: (1) What is the purpose of the letter and when is it needed? (2) Who initiates — RM, employee, or India Team specialist? (3) Is auto-trigger from People system feasible on relocation effective date? (4) Is eligibility selective or for all relocations? (5) Can the RM role limitation in DOCS be solved (DOCS cannot grant RM role per-process without exposing all requests)? All 5 questions must be answered before Phase 4 scope can be written. | Hanna Vasilenka / India Team | 2026-05-07 | Phase 4 scoping | **Open** |
