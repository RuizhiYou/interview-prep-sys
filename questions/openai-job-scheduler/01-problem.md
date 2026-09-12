# Problem and Requirements

## Original prompt

Design a distributed job scheduler for immediate, one-time, and recurring jobs. It must durably create each scheduled run, dispatch it to workers, recover expired claims, and retain execution history.

- Source: [Hack2Hire — Design Job Scheduler](https://www.hack2hire.com/question-bank/companies/openai/system-design/69ce7e9a4f38b199f9e49099)
- Difficulty: Medium
- Captured: 2026-09-12

## Clarified scope

- Each logical schedule slot has one durable run record.
- Delivery is at least once; handlers are expected to use idempotency keys.
- Workers claim runs with renewable leases and timed-out attempts are reclaimable.
- Recurring schedules define a bounded backfill/misfire policy.

## Functional requirements

- Create, update, pause, resume, and cancel schedules.
- Materialize immediate, one-time, and recurring run slots.
- Dispatch due runs and track claims, attempts, heartbeats, outcomes, and timeouts.
- Reclaim abandoned work and retry using configured policy.
- Inspect current state and historical executions.

## Non-functional requirements

- Start due jobs within 2 seconds under normal load.
- Preserve one logical slot and at most one committed success for that slot.
- Support 10K starts/s with 5–10× bursts.
- Scale schedulers independently from workers and remain highly available.
- Expose lag, retries, lease expiry, queue depth, and per-tenant fairness.

## Out of scope

- Arbitrary workflow DAGs, job business logic, and a general container orchestration platform.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Starts/second | 10K steady | Source requirement |
| Burst | 5–10× | Source requirement |
| Start delay | <=2 s normal load | Source requirement |

