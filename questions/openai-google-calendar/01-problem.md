# Problem and Requirements

## Original prompt

Design a Google Calendar-like system with multiple calendars, sharing, recurring events, invitations, reminders, time zones, and cross-device synchronization.

- Source: [Hack2Hire — Design Google Calendar](https://www.hack2hire.com/question-bank/companies/openai/system-design/69d0903c17b72775cc49bcf0)
- Difficulty: Medium
- Captured: 2026-09-12

## Clarified scope

- Users can own and subscribe to multiple calendars with ACLs.
- Recurrence supports exceptions without materializing an unbounded future.
- Organizer edits propagate to invitees; RSVP state remains attendee-specific.
- Reminders must avoid duplicate delivery despite retries.

## Functional requirements

- Create/update/delete calendars and events with correct time-zone behavior.
- Define recurring series and single-instance exceptions.
- Invite attendees, record RSVP state, and propagate organizer changes.
- Share calendars with read/write permissions.
- Schedule reminders and synchronize incremental changes across devices.

## Non-functional requirements

- Availability target: 99.95%.
- Event writes <200 ms p95; calendar-window reads <500 ms p95.
- Cross-device freshness within seconds; reminders near target time, roughly within one minute.
- Persist events durably and prevent duplicate reminders.
- Bound recurrence expansion and isolate access by ACL.

## Out of scope

- Email delivery implementation, video conferencing, room-resource optimization, and task management.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Read window | Bounded date range | Required for recurrence |
| Sync freshness | Seconds | Source requirement |
| Reminder precision | ~1 minute | Source requirement |

