# Problem and Requirements

## Original prompt

Design a multi-tenant CI/CD system that receives GitHub push webhooks, resolves configuration at the pushed commit, creates an auditable run, executes ordered steps on isolated Kubernetes runners, and streams status to users.

- Source: [Hack2Hire — Design CICD System](https://www.hack2hire.com/question-bank/companies/openai/system-design/69c9ff24ff3ebde766ced6fa)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- A run and all of its steps are persisted before a runner starts.
- Steps execute sequentially in the base design; DAG workflows are out of scope.
- Each runner is isolated per job/tenant and uses short-lived credentials.
- UI clients can reconnect and recover the authoritative run timeline.

## Functional requirements

- Validate and acknowledge GitHub push webhooks.
- Resolve repository, tenant, commit, and pipeline configuration.
- Create a durable run with ordered step records.
- Allocate isolated Kubernetes runners and execute each step.
- Stream logs/status, support cancellation, and retain an audit trail.

## Non-functional requirements

- Acknowledge webhooks within 2 seconds; update UI within 2 seconds.
- Start a next step within 10 seconds when capacity is available.
- Availability target: 99.9% with an authoritative, replayable timeline.
- Support 50K repositories, 2K pushes/minute, and 200K runs/day.
- Retain history for 90 days; enforce tenant isolation, fairness, and cost quotas.

## Out of scope

- Source hosting, arbitrary DAGs, deployment environment management, and build-tool internals.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Repositories | 50K | Source requirement |
| Pushes | 2K/minute | Source requirement |
| Runs/day | 200K | Source requirement |
| Retention | 90 days | Source requirement |

