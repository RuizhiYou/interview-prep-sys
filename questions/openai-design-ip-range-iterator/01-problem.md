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

[Open question group](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69a5f7bb3d95612a1782be6a/practice?questionId=69a5fdb73d95612a1782be7b)

Implement constant-space, constant-time-per-step iterators over numeric network
address ranges while correctly parsing, formatting, carrying, and enforcing
boundaries.

Variants:

1. **Forward IPv4 iterator:** start at a dotted-decimal IPv4 address and emit
   every successive address through `255.255.255.255` via `hasNext()`/`next()`.
2. **Reverse IPv4 iterator:** start at an ending address and move backward by a
   fixed step toward `0.0.0.0`, handling octet borrow and termination.
3. **CIDR iterator:** parse a CIDR block, derive its numeric boundaries, and emit
   addresses from the aligned network address at a fixed interval.
4. **Simplified IPv6 iterator:** treat eight four-digit hexadecimal segments as
   one 128-bit value, advance by a fixed step, propagate carries, and stop after
   the maximum address.

Focus: iterator state, base-256/base-16 arithmetic, bit manipulation, parsing,
formatting, overflow, and boundary conditions.


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
