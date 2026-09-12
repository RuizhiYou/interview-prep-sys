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

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/6a579fda665efda9311f9374/practice?questionId=6a579fe2665efda9311f9375)

Build a long-running, per-user message-event counter. Events for each user arrive
in increasing timestamp order; a query asks for the number of events in the
inclusive trailing `m`-second window. Expired data must be discarded so memory
does not grow with runtime.

Variants:

1. **Trailing event count:** timestamps for a user are strictly increasing;
   count all events in inclusive window `[timestamp - m + 1, timestamp]` and
   discard permanently expired history.
2. **Active chats:** add `INTERACT` and `END_CHAT` events and count distinct chats
   whose latest relevant event makes them active inside the trailing window.
3. **Bounded out-of-order arrival:** accept unique event timestamps out of order,
   reject events older than `maxSeen - m + 1`, apply accepted events in event-time
   order, and retain only the bounded correction horizon.

Focus: sliding windows, per-key queues or compressed timestamp buckets, inclusive
time boundaries, amortized complexity, and lazy versus eager cleanup. The site
relates it to LeetCode 362, Design Hit Counter.


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
