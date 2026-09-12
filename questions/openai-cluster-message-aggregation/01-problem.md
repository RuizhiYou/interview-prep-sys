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

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/6916140a3f8671d8f7a56641/practice?questionId=691614103f8671d8f7a56642)

Implement an asynchronous protocol over a rooted n-ary tree of machines where
nodes communicate only with their immediate parent and children. Requests begin
at the root and must support counting all nodes and reconstructing cluster
topology through fan-out/fan-in message aggregation.

Focus: distributed tree traversal, request/correlation IDs, per-request pending
child state, aggregation after all replies, duplicate/late message handling,
concurrent operations, and protocol termination.


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
