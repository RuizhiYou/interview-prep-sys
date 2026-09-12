# Problem and Requirements

## Original prompt

Design a multi-tenant GPU scheduling platform that queues containerized jobs, places them on compatible GPU nodes, tracks execution, and supports priorities, fairness, failures, and preemption.

- Source: [Hack2Hire — Design GPU Scheduling Platform](https://www.hack2hire.com/question-bank/companies/openai/system-design/69d71cbfc4c1bc791ee22b22)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- Jobs declare GPU count/type, CPU/memory, image, tenant, and priority.
- Scheduler owns placement; node agents own container lifecycle under renewable leases.
- High-priority jobs may preempt lower-priority work under explicit rules.
- Applications, not the scheduler, own checkpoint semantics.

## Functional requirements

- Submit and cancel jobs with resource and priority requirements.
- Queue and place jobs using compatibility, fit, priority, and tenant fairness.
- Launch isolated containers and expose status, logs, and artifacts.
- Detect node/job failure, reclaim leases, and retry according to policy.
- Preempt eligible jobs and support optional gang scheduling requirements.

## Non-functional requirements

- Only one scheduler decision may own a resource lease at a time.
- Start high-priority work within 5 seconds and normal work within 2 minutes when capacity exists.
- Support ~1,000 nodes, 10K queued jobs, and 100K running containers/jobs.
- Detect failed nodes within 30 seconds and recover without double-running committed work.
- Target >80% GPU utilization while preserving tenant isolation and fairness.

## Out of scope

- ML framework internals, model training logic, artifact-store implementation, and data labeling.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| GPU nodes | ~1,000 | Source requirement |
| Queued jobs | ~10K | Source requirement |
| Running work | up to ~100K | Source requirement |
| Failure detection | <=30 s | Source requirement |

