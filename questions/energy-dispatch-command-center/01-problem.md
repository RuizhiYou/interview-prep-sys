# Problem and Requirements

## Original prompt

**Source:** [一亩三分地面经帖](https://www.1point3acres.com/home/thread/1186687)

**Author:** Human

> System Design 是电力调度中心：中心向不同地区或设备发送降低用电量等指令；设备可能收不到、拒绝或接受指令；系统要根据设备返回的 telemetry metrics 统计执行情况并调整后续指令。部分 telemetry 会延迟到达，因此可能需要 reconciliation。楼主最初误解为先聚合用电量、发现超标后再下发指令，而面试官强调重点是指令下发及执行反馈。评论中另一位候选人确认随后也遇到了同一题。

## Expanded prompt

**Source:** [PracHub — Design Command Dispatch and Telemetry Reconciliation for
Unreliable Devices](https://prachub.com/interview-questions/design-command-dispatch-and-telemetry-reconciliation-for-unreliable-devices)

Design a control system that dispatches commands to large fleets of devices with
intermittent connectivity. For example, request that all air conditioners in a
region reduce power usage by 20%. A target device may miss, reject, accept, or
execute the command, with telemetry arriving later. Measure campaign progress,
reconcile late or missing reports, and use the result to plan later commands.

The design should cover targeting, dispatch, per-device state, bounded retries,
idempotency, telemetry ingestion and aggregation, late events, reconciliation,
safety, and observability.

### Stated constraints

- A command campaign is immutable, uniquely identified, and uses a snapshot of
  its target device set.
- Delivery acknowledgement, acceptance, execution, and telemetry-measured effect
  are distinct states.
- Device identity is authenticated, but devices and networks cannot be assumed
  to respond on time.
- A delayed older command must never overwrite a newer command already applied
  by a device.

The 一亩三分地 source is an interview recollection. The PracHub page supplies a
more detailed formulation, but interview-time scale and policy assumptions must
still be confirmed rather than invented.

## Clarifying questions

| Question | Answer | Source |
| --- | --- | --- |
| Is the command sent to individual devices, regions, or both? | Commands target a snapshot of a device set; selection can be regional. Exact selectors are TBD. | PracHub prompt |
| Who or what initiates a dispatch command? | TBD; do not assume automatic threshold detection. | Human prompt/interviewer clarification |
| What does successful execution mean and how is it measured? | Explicit execution status and observed power change are distinct; which defines compliance is TBD. | PracHub prompt |
| How late can telemetry arrive, and when is a result considered final? | TBD; ask for campaign deadlines, watermark/finalization policy, and correction window. | PracHub prompt |
| Can a device partially comply with a requested reduction? | TBD | — |
| Must follow-up commands avoid devices that rejected or failed earlier commands? | TBD | — |
| What are the campaign deadline and retry limits? | TBD | PracHub prompt |
| Can each device report the command ID and a monotonic sequence/configuration version? | TBD; this capability affects safe correlation and fencing. | PracHub prompt |
| What safety constraints limit automatic follow-up commands? | TBD | PracHub prompt |

## Functional requirements

- Create and target a power-reduction dispatch command by region and/or device.
  *(Confirmed at a high level.)*
- Deliver commands and track whether each target did not receive, rejected, or
  accepted the command. *(Confirmed at a high level.)*
- Ingest telemetry metrics associated with target devices and time windows.
  *(Confirmed at a high level.)*
- Aggregate execution progress and achieved reduction for a dispatch command.
  *(Inferred from the requested execution statistics.)*
- Adjust or issue subsequent commands using acknowledgements and telemetry.
  *(Confirmed at a high level; policy is TBD.)*
- Reconcile previously computed results when delayed telemetry arrives.
  *(Confirmed at a high level.)*
- Snapshot the targeted device population for each immutable, uniquely identified
  campaign. *(Confirmed by the expanded prompt.)*
- Maintain distinct per-device states for attempted delivery, acknowledgement,
  rejection/acceptance, execution, and measured effect. *(Confirmed.)*
- Retry delivery within campaign deadlines without causing duplicate execution.
  *(Confirmed.)*
- Prevent stale commands from superseding newer device configuration or command
  versions. *(Confirmed.)*
- Expose auditable progress, safety controls, and operational telemetry for the
  complete dispatch-to-measured-effect funnel. *(Confirmed.)*

## Non-functional requirements

- Availability: command delivery and telemetry ingestion should tolerate partial
  device, network, and regional failures; target SLO is TBD.
- Latency: command-delivery and progress-reporting targets are TBD.
- Consistency: live progress may be eventually consistent; finalization and
  reconciliation semantics are TBD.
- Durability: commands, delivery attempts, acknowledgements, and telemetry used
  for audit/reconciliation should not be lost; retention is TBD.
- Security and privacy: device authentication, command authorization, integrity,
  and replay protection are required. Authenticated device identity is a stated
  constraint; the exact trust and authorization model is TBD.

## Out of scope

- Detecting aggregate consumption thresholds and autonomously deciding that a
  dispatch is needed. The interviewer explicitly redirected the discussion away
  from this interpretation.
- Power-grid optimization and the business policy that chooses the ideal load
  reduction, unless the interviewer expands the scope.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Registered/online devices | TBD | — |
| Targets per dispatch command | TBD | — |
| Concurrent dispatches | TBD | — |
| Command delivery attempts/second | TBD | — |
| Telemetry events/second and event size | TBD | — |
| Maximum telemetry delay | TBD | — |
| Data retention | TBD | — |

## Back-of-the-envelope estimates

Document inputs, formulas, units, and conclusions. Keep assumptions easy to
change during the interview.
