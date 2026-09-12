# Problem and Requirements

## Original prompt

Design a Slack-like chat system with direct messages, channels, membership, text/image messages, real-time delivery to online devices, history, and soft deletion.

- Source: [Hack2Hire — Design Slack-like Chat System](https://www.hack2hire.com/question-bank/companies/openai/system-design/69c9fe5dff3ebde766ced6f4)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- Channels range from two-person conversations to communities with 100K members.
- A message is persisted before the sender receives acknowledgement.
- Ordering is required within a channel, not globally.
- Multi-device delivery and reconnect/catch-up are required.

## Functional requirements

- Create direct conversations and group channels; manage membership.
- Send text and image messages and fetch paginated history.
- Deliver new messages to online members in real time.
- Synchronize unread/cursor state across devices.
- Soft-delete messages while preserving required audit metadata.

## Non-functional requirements

- Send acknowledgement <200 ms for DMs/small channels and <500 ms for large channels.
- Send-path availability target: 99.9%.
- Support 50M DAU and 1B messages/day, with channels from 2 to 100K members.
- Preserve durable per-channel order and tolerate duplicate fanout delivery.
- Protect tenant/channel membership, uploaded media, and abuse-sensitive APIs.

## Out of scope

- Voice/video, full-text search, bots, enterprise compliance exports, and recommendations.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Daily active users | 50M | Source requirement |
| Messages/day | 1B | Source requirement |
| Channel size | 2–100K members | Source requirement |

