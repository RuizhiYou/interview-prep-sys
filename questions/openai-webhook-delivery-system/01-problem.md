# Problem and Requirements

## Original prompt

Design a multi-tenant webhook delivery system that durably accepts events, asynchronously POSTs signed payloads to registered callbacks, retries failures, and isolates slow or broken tenants.

- Source: [Hack2Hire — Design Webhook Delivery System](https://www.hack2hire.com/question-bank/companies/openai/system-design/69cb3b1aff3ebde766cedc63)
- Difficulty: Medium
- Captured: 2026-09-12

## Clarified scope

- One active callback may be registered per tenant/event type in the base design.
- Event acceptance is durable and decoupled from HTTP delivery.
- Delivery is at least once; receivers deduplicate by event ID.
- Retries are bounded and exhausted events enter a DLQ/replay workflow.

## Functional requirements

- Register and rotate callback URLs and signing secrets.
- Accept a self-contained event payload durably and return quickly.
- Deliver signed HTTP requests asynchronously.
- Retry transient failures with backoff, jitter, and `Retry-After` awareness.
- Inspect attempts, DLQ entries, and manually replay deliveries.

## Non-functional requirements

- Event acceptance availability 99.99%; delivery success target 99.9% within policy.
- Acceptance latency <100 ms; first attempt begins within seconds.
- Support 1B events/day and peaks above 100K events/s.
- Prevent SSRF and secret leakage; isolate tenant concurrency and retry budgets.
- Never lose an accepted event and avoid synchronized retry storms.

## Out of scope

- Exactly-once receiver effects and implementation of customer endpoints.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Events/day | 1B | Source requirement |
| Peak ingest | 100K+ events/s | Source requirement |
| Accept latency | <100 ms | Source requirement |

