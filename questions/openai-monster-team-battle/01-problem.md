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

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69a3a99d6e73e4abccc9c106/practice?questionId=69a3aa7d6e73e4abccc9c109)

Simulate a deterministic turn-based fight between two ordered monster teams and
produce a complete chronological event log. Attacks, counterattacks, death
checks, and advancement to the next living monster must occur in exact order.

Variants:

1. **Base battle:** each monster has one attack value; execute attacks and
   counterattacks in strict order and produce the complete event log.
2. **Types and weaknesses:** add elemental types and weakness-based double/half
   damage multipliers while retaining deterministic combat sequencing.
3. **Multiple attacks:** each monster owns several typed attacks and must choose
   the one producing maximum final damage against the current opponent before
   every attack or counterattack.

Focus: explicit state machines, index tracking, immediate terminal checks,
mutation ordering, deterministic text/event output, and separation of simulation
logic from rendering.


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
