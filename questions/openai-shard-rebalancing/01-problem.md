# Problem and Requirements

## Original prompt

> Detailed, non-verbatim reconstruction of candidate-reported prompts.
> Hack2Hire remains the source of record; exact wording, examples, and bounds
> should be confirmed with the interviewer before implementation.

| Field | Value |
| --- | --- |
| Company | OpenAI |
| Interview stage | Screening |
| Reported difficulty | Medium |
| Collected | 2026-09-12 |

## Reported problem family and variants

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69a3c4396e73e4abccc9c14c/practice?questionId=69a3c6546e73e4abccc9c150)

Given inclusive integer ranges representing key-space shards, enforce a maximum
number of overlapping shards at any key while also filling gaps across the
overall covered range. Boundaries may be shifted and fully eclipsed shards may
be removed, with the goal of minimizing movement.

Focus: interval sorting, sweep-line reasoning, active-range priority queues,
greedy boundary adjustment, inclusive endpoints, deterministic tie-breaking,
and validation of continuous coverage.


## Clarifying questions

| Question | Answer | Source |
| --- | --- | --- |
| Which reported variant should be implemented first? | TBD with interviewer | Interview clarification |
| What are the exact input bounds and error semantics? | TBD with interviewer | Interview clarification |
| Is production-ready parsing/concurrency/persistence required? | Only when stated by the selected variant | Reported prompt summary |

## Functional requirements

- Implement the base problem described above.
- Treat each numbered variant as a reported follow-up, not as an implicit requirement of the base version.
- Preserve the stated API behavior, boundary semantics, and output format.

## Non-functional requirements

- Correctness: handle the listed edge cases and invariants.
- Complexity: state time and space complexity and meet any bound called out in the selected variant.
- Code quality: use testable components and make assumptions explicit.

## Out of scope

- Unreported product behavior or infrastructure requirements unless introduced by the interviewer.
- A final implementation or solution; those belong in `03-solution.md`.

## Scale assumptions

This is a coding-question family rather than a service-capacity exercise. Record
array sizes, graph sizes, timestamp ranges, or storage limits here once the
interviewer confirms them.

## Back-of-the-envelope estimates

Not applicable until concrete input bounds are selected for a variant.
