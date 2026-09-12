# Problem and Requirements

## Original prompt

> Detailed, non-verbatim reconstruction of candidate-reported prompts.
> Hack2Hire remains the source of record; exact wording, examples, and bounds
> should be confirmed with the interviewer before implementation.

| Field | Value |
| --- | --- |
| Company | OpenAI |
| Interview stage | Screening |
| Reported difficulty | Hard |
| Collected | 2026-09-12 |

## Reported problem family and variants

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69190ae16723130c5456345b/practice?questionId=69190b156723130c5456345c)

Design a shared-channel chat application containing users and multiple kinds of
bots. A user message is logged first, then each bot may react and append output.
New bot types must be addable without changing the central message-processing
logic; the problem includes three stateful bot types.

Variants:

1. **Single shared channel:** manage message logging and reactions from three bot
   types while keeping bots decoupled and independently stateful.
2. **Multiple isolated channels:** route the same users and bot types across
   multiple channels while keeping message history, away status, counters, and
   every other bot state isolated per channel.

Focus: object-oriented design, interfaces, Open/Closed Principle, event-driven or
publish-subscribe dispatch, command parsing, bot-local state, reaction ordering,
and avoiding direct coupling between bots.


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
