# Follow-up Questions

Track interviewer prompts, review questions, and deeper explorations here.

| Status | Question | Short answer | Details |
| --- | --- | --- | --- |
| `open` | How do we distinguish a device that rejected a command from one that never received it? | — | Requires explicit acknowledgement/state-machine semantics |
| `open` | What happens when an older command arrives after a newer command was applied? | — | Requires monotonic version fencing and device-side enforcement |
| `open` | How should progress be reported when many devices are offline? | — | Requires explicit denominator, unknown state, and confidence semantics |

Valid status values: `open`, `answered`, `needs-review`.

## Detailed answers

### Rejection versus no delivery

**Answer:** TBD

### Delayed older command

**Answer:** TBD

### Progress with a large offline population

**Answer:** TBD

**Impact on the design:** Note whether this changes the current solution or only
clarifies it. If it changes the design, also update `03-solution.md` and record
the decision in `02-discussion.md`.

## Useful interviewer probes

- What breaks first at 10× traffic?
- Which consistency guarantees are essential, and which can be relaxed?
- How does the system behave during a dependency or regional outage?
- How are hot partitions, abusive clients, and retry storms handled?
- What would you simplify for an initial launch?
