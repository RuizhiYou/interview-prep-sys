# Discussion and Decision Log

Use this file for exploration and review comments. Append entries instead of
silently rewriting another person's notes.

## Open topics

- [ ] Define the command lifecycle and terminal states.
- [ ] Separate command acknowledgement from telemetry-proven execution.
- [ ] Choose live aggregation and late-data reconciliation semantics.
- [ ] Define how results influence subsequent dispatch commands.
- [ ] Define version-fencing behavior for delayed commands.
- [ ] Define campaign denominator and confidence semantics when devices are
  offline or telemetry is missing.

## Comments

### 2026-09-11 — Human

**Context:** Interview recollection from the linked 一亩三分地 thread.

**Comment:** The original poster initially understood the task as aggregating
power usage, detecting an overage, and then issuing commands. The interviewer
clarified that the focus is command dispatch and execution feedback. Another
candidate in the comments reported receiving the same question later.

### 2026-09-11 — AI

**Context:** Initial problem decomposition.

**Comment:** Treat acknowledgement state and measured execution as separate
signals. A device can accept a command without achieving the requested reduction,
and telemetry can be late or absent. This is a proposed framing to validate when
developing the solution.

### 2026-09-11 — Human

**Context:** Additional source supplied after the initial question was created.

**Comment:** The PracHub page titled "Design Command Dispatch and Telemetry
Reconciliation for Unreliable Devices" is the fuller version of this system
design question.

### 2026-09-11 — AI

**Context:** Comparison of the PracHub prompt with the interview recollection.

**Comment:** The two sources align on the core problem. The expanded prompt
confirms that acknowledgement and measured execution must be modeled separately
and adds immutable target snapshots, bounded retries, idempotency, monotonic
version fencing, event-time reconciliation, safety, and observability to the
expected design surface.

## Decisions

| Date | Decision | Rationale | Alternatives considered | Owner/source |
| --- | --- | --- | --- | --- |
| 2026-09-11 | Focus the design on command dispatch, execution feedback, and reconciliation. | This is the interviewer's explicit correction of the original interpretation. | Consumption aggregation followed by automatic threshold-triggered dispatch. | Human/interviewer clarification |
| 2026-09-11 | Use the PracHub prompt as the expanded specification while retaining the 一亩三分地 recollection as provenance. | The expanded prompt matches the reported scenario and provides concrete constraints and evaluation areas. | Keep only the shorter interview recollection. | Human-provided source |

## Parking lot

- Ideas that are useful but currently outside the agreed scope.
