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

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69b070d6a4e93c007df3fc35/practice?questionId=69b191c3a4e93c007df4004d)

Support follow/unfollow mutations, create incrementing snapshots, and answer
whether a directed follow edge existed at an earlier snapshot without copying
the entire graph for every snapshot.

Variants:

1. **Historical edge query:** determine whether `followerId` followed
   `followeeId` at a given snapshot.
2. **Historical neighborhoods:** return all followers or followees of a user at a
   snapshot without scanning every user; combine candidate sets with versioned
   edge lookup.
3. **Historical recommendations:** rank valid friends-of-friends at a snapshot by
   mutual-follow count, exclude self and existing followees, and return top `k`.

Focus: per-edge version histories, append-only changes, snapshot IDs, binary
search for the latest update at or before a version, no-op compression, and
temporal-query semantics.


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
