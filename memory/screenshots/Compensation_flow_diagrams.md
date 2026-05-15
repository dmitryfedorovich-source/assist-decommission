---
name: Compensation Letter Flow Diagrams (Phase 2)
description: Compensation letter flow, process settings, and document examples from 3 India DOCs flow diagram screenshots (07.05.2026)
type: project
status: active
source: input/screenshots/India DOCs flow diagrams - India. Compensation letter 07.05.2026 (1-3).jpg
---

## Compensation Letter Process

**Goal**: "Notify employee about compensation changes"

**Process settings (visible in diagram)**:
- Process name: IND Compensation Letter
- Process group: GDO
- Process class: Employee Notifications
- Process with Self-service request: No
- Collect feedback on request: No
- Show documents from process in File Cabinet: Yes
- Display consent document in request: No
- Integration with other system: No
- Type of request: plan to be in scope of process — for Employee
- Auto-close period: Completed request — 10 days; Inactive request — 3 days
- Request recipient: Employee
- Request settings Fields: Employee / Responsible person email (optional)

## Swim Lane Flow

Actors:
1. **Compensation Team specialist** (not "India HR team") — initiates mass request
2. **DOCS platform** — sends notification, auto-verifies
3. **Employee** — receives notification, opens request, accepts, fills form, downloads

Flow steps:
1. Compensation Team specialist: Create mass request
2. DOCS platform: Send notification → Employee receives notification
3. Employee: Open DOCS request → Accept Consent → Fill in form (Accept Letter) → Download Letter
4. DOCS platform: Form auto-verification
5. Close request? YES → Closes request manually | NO → The request will be closed automatically after XX days

**Key difference from Phase 1**: Initiated by Compensation Team specialist (push model), not by employee (self-service pull model)
**Accept Consent step**: employee must explicitly consent before filling the form
**Auto-close**: 10 days completed, 3 days inactive (Phase 1 is 2 days)

## BA/Team Notes visible in diagram
- Note: "To sign in DOCS the employee no need additional password. The link in the letter redirects employee to request page with the Compensation Letter that available to download."
- Alternative solution mentioned: Compensation letter based on Word with possibility download as PDF with disclaimer and checkbox
- "Each type of Compensation letter should be sent with separate mass request"
- Number of compensation letters form may increase up to 16-17

## Notification Settings (from diagram)
- Invitation email template: IND Compensation letter (standard)
- Invitation email: Permanent recipients for email TO: yes
- Invitation email: Permanent recipients for email CC: yes
- Reminder Notifications (request status - Open): configured (Reminder email 2 days after number)
- Reminder Notifications (request status - In progress): configured (5-6 days after reminder 1)
- eSignature Notifications: yes (for every signed document)
- Service Notifications: yes

## Artifacts
- Form: Compensation letter (could be one or more, depend on approach)
- Document format: PDF with disclaimer and checkbox (based on screenshots)
