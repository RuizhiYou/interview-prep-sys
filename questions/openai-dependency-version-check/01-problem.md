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

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/6913fa95fa8a311e42671e68/practice?questionId=6913fb43fa8a311e42671e69)

Given chronologically sorted semantic-version-like strings and an external API
whose feature-support response is monotonic, find the first supporting version
while minimizing API calls.

Variants:

1. **Globally monotonic support:** once one version is supported, every later
   version is supported; use lower-bound binary search.
2. **Hierarchical monotonicity:** support is not monotonic for individual
   versions, but once a `MAJOR` group contains a supporting version, every later
   major group eventually contains at least one. Exploit the structured
   `MAJOR.MINOR.PATCH` hierarchy to find the earliest supported version while
   minimizing `isSupported()` calls.

Focus: lower-bound binary search, monotonic predicates, version-list indexing,
empty/all-false/all-true cases, API-call complexity, and caching repeated checks.


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
