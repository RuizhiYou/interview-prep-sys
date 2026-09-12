# Problem and Requirements

## Original prompt

Design a payment system that places real-time authorization holds, captures charges against those holds, and settles accumulated transactions with external processors in nightly batches.

- Source: [Hack2Hire — Design Payment System](https://www.hack2hire.com/question-bank/companies/openai/system-design/69c9f9a3ff3ebde766ced6b4)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- Authorization and capture are separate operations.
- A successful charge must be durable before acknowledgement.
- Processors may partially acknowledge batches or return late/duplicate responses.
- Holds expire after a defined TTL if they are never captured.

## Functional requirements

- Create a real-time hold authorization.
- Capture a full or permitted partial amount against a valid hold.
- Expire/release uncaptured holds.
- Build and send nightly settlement batches per processor.
- Reconcile internal ledger entries with processor results and repair discrepancies.

## Non-functional requirements

- Authorization latency <500 ms p95.
- Never lose an acknowledged charge; use idempotency for every money-moving operation.
- Complete nightly settlement within 2 hours.
- Support about 10M payment operations/day.
- Maintain an auditable immutable ledger and explicit reconciliation state.

## Out of scope

- Card network internals, bank account funding, currency exchange, and fraud-model design.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Operations/day | 10M | Source requirement |
| Authorization latency | <500 ms p95 | Source requirement |
| Settlement window | <2 hours nightly | Source requirement |

