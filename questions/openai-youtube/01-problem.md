# Problem and Requirements

## Original prompt

Design a YouTube-like video upload and playback system. Clients upload large prerecorded videos directly to object storage, the system asynchronously packages multiple renditions, and viewers play adaptive-bitrate streams through a CDN.

- Source: [Hack2Hire — Design YouTube](https://www.hack2hire.com/question-bank/companies/openai/system-design/69cd3e3cff3ebde766cee66e)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- Prerecorded upload and playback are in scope; live streaming, recommendations, and search are not.
- Uploads must be resumable and may remain valid for a bounded session window.
- A raw upload is the durable source from which failed processing can restart.
- The lifecycle must explicitly distinguish uploading, processing, ready, and failed.

## Functional requirements

- Create resumable, direct-to-storage upload sessions for large files.
- Durably register the raw video object and trigger asynchronous processing.
- Transcode/package multiple renditions and produce playback manifests.
- Serve adaptive-bitrate playback through signed CDN access.
- Expose upload, processing, playback status, and video metadata.

## Non-functional requirements

- Playback must be highly available and tolerate viral hot objects.
- Create-upload latency <=300 ms p95; playback bootstrap <=200 ms p95 excluding media transfer.
- Support about 1M uploads/day and 100M watches/day, with videos up to tens of GB.
- Keep bulk video bytes off application servers.
- Preserve raw uploads durably and make processing retries idempotent.

## Out of scope

- Live video, comments, subscriptions, discovery, ads, and recommendation ranking.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Uploads/day | 1M | Source requirement |
| Watches/day | 100M | Source requirement |
| Video size | Up to tens of GB | Source requirement |
| Segment duration | 2–10 seconds | Source estimate |

