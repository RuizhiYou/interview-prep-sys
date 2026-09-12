# Problem and Requirements

## Original prompt

> Detailed, non-verbatim reconstruction of candidate-reported prompts.
> Hack2Hire remains the source of record; exact wording, examples, and bounds
> should be confirmed with the interviewer before implementation.

| Field | Value |
| --- | --- |
| Company | OpenAI |
| Interview stage | Onsite |
| Reported difficulty | Hard |
| Collected | 2026-09-12 |

## Reported problem family and variants

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/6a57ce6c665efda9311f94c3/practice?questionId=6a57ce72665efda9311f94c4)

Given a scored `N × M` grid and a top-row starting column, maximize the score on
a path to the bottom. Normal moves go one row down vertically or diagonally; a
special move skips one row vertically and can be used at most `K` times. The
skipped cell contributes no score.

Variants:

1. **Maximum score:** compute the best achievable path score.
2. **Path reconstruction:** return one coordinate sequence attaining that score.
3. **Count optimal paths:** count distinct coordinate sequences attaining the
   maximum while tracking score and count together in each DP state.
4. **Sequence bonuses:** add `X` for qualifying equal adjacent values and `Y` for
   qualifying strictly increasing length-three windows, including adjacency
   across a special jump. The DP must retain enough recent path state to score
   future transitions.

Focus: dynamic programming over `(row, column, jumpsUsed)`, correct transitions,
negative scores, boundary handling, and rolling-array space optimization.


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
