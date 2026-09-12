# OpenAI Coding Questions — Hack2Hire Summary

Source: [Hack2Hire OpenAI Coding Questions](https://www.hack2hire.com/question-bank/companies/openai/coding-questions)  
Collected through the user's Chrome session on 2026-09-12.

## Scope and access notes

The page listed 17 question groups, based on 100+ candidate reports. It describes
OpenAI coding interviews as generally optimization-heavy, with explicit
complexity requirements and a focus on code quality.

- 17 main question groups: 12 screening and 5 onsite.
- Difficulty mix: 10 hard and 7 medium.
- After login, all 39 individual problems across the 17 groups were accessible
  and reviewed. The summaries below cover every listed variant.
- Relative “last reported” values are copied as displayed on 2026-09-12 and will
  become stale.

## Overview

| # | Question group | Stage | Difficulty | Problems | Last reported |
| ---: | --- | --- | --- | ---: | --- |
| 1 | [Design IP Range Iterator](#1-design-ip-range-iterator) | Screening | Medium | 4/4 | 3 weeks ago |
| 2 | [Toy Language Grammar](#2-toy-language-grammar) | Onsite | Hard | 2/2 | 2 weeks ago |
| 3 | [Maximum Grid Jumping Path](#3-maximum-grid-jumping-path) | Onsite | Hard | 4/4 | Not shown |
| 4 | [Chat Message Events Aggregation](#4-chat-message-events-aggregation) | Onsite | Hard | 3/3 | 2 weeks ago |
| 5 | [Data Labeling Task Scheduler](#5-data-labeling-task-scheduler) | Onsite | Hard | 2/2 | 3 weeks ago |
| 6 | [Design a Spreadsheet with Formula Evaluation](#6-design-a-spreadsheet-with-formula-evaluation) | Screening | Medium | 2/2 | 2 months ago |
| 7 | [Cellular Infection Spreading](#7-cellular-infection-spreading) | Screening | Medium | 5/5 | 1 week ago |
| 8 | [Snapshot Social Graph](#8-snapshot-social-graph) | Screening | Hard | 3/3 | 1 month ago |
| 9 | [Shard Rebalancing](#9-shard-rebalancing) | Screening | Medium | 1/1 | 1 week ago |
| 10 | [Monster Team Battle](#10-monster-team-battle) | Screening | Medium | 3/3 | 1 week ago |
| 11 | [Design In-Memory SQL](#11-design-in-memory-sql) | Screening | Medium | 1/1 | 1 month ago |
| 12 | [Design ChatBot System](#12-design-chatbot-system) | Screening | Hard | 2/2 | 4 days ago |
| 13 | [Design Cluster Message Aggregation](#13-design-cluster-message-aggregation) | Screening | Hard | 1/1 | 2 weeks ago |
| 14 | [Design Persistent Key-Value Store](#14-design-persistent-key-value-store) | Onsite | Hard | 2/2 | 1 week ago |
| 15 | [Dependency Version Check](#15-dependency-version-check) | Screening | Hard | 2/2 | 11 hours ago |
| 16 | [GPU Credits II](#16-gpu-credits-ii) | Screening | Hard | 1/1 | 1 week ago |
| 17 | [GPU Credits](#17-gpu-credits) | Screening | Medium | 1/1 | 6 days ago |

## Question summaries

### 1. Design IP Range Iterator

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

### 2. Toy Language Grammar

[Open question group](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69166e4e10632c00111ca0ea/practice?questionId=69166e5710632c00111ca0eb)

Model a small recursive type system containing primitives, generics, tuples, and
function signatures.

Variants:

1. **Type serialization:** recursively render nested nodes and complete function
   signatures in an exact textual format, including empty parameters and deeply
   nested tuples.
2. **Type inference:** structurally match concrete argument types against a
   generic function signature, bind each generic consistently, reject conflicts,
   and substitute the bindings into the return type.

Focus: recursive trees, string serialization, structural matching, unification,
generic-binding maps, and precise edge-case handling.

### 3. Maximum Grid Jumping Path

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

### 4. Chat Message Events Aggregation

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

### 5. Data Labeling Task Scheduler

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69fc0e7f574d87bc49005a3c/practice?questionId=69fc0ee4574d87bc49005a3d)

Construct assignments of the form `(task, model, human)` for a labeling platform.
Each human must receive at least `k` distinct tasks without repeating a task;
return any valid schedule or an empty result when the constraints are infeasible.

Variants:

1. **Feasible assignment:** ensure every human receives at least `k` distinct
   tasks without repeating a task for that human.
2. **Prefix-balanced schedule:** every prefix of the output must keep per-task
   model usage and per-human model usage within a maximum-minus-minimum difference
   of one, while every human receives exactly `k` unique tasks.

Focus: feasibility proofs, constructive/greedy assignment, cyclic indexing,
modular arithmetic, uniqueness constraints, and deterministic output.

### 6. Design a Spreadsheet with Formula Evaluation

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69f789f030f41dfd539fc6bb/practice?questionId=69f78c6830f41dfd539fc6dc)

Implement a simplified `A1`–`Z100` spreadsheet whose cells contain numbers or
formulas referencing cells/literals. Evaluate formulas dynamically on every read
without persisting intermediate evaluation state.

Variants:

1. **Formula evaluation:** store numbers or simple two-term formulas, resolve
   references recursively, and calculate each read from current cell state.
2. **Cycle-safe updates:** before accepting a formula, detect whether its new
   dependencies would create a cycle; reject and roll back the proposed update
   so the dependency graph always remains a DAG.

Focus: formula parsing, dependency traversal, recursion, per-call memoization,
cycle/error policy, default values, and fresh evaluation after updates. The site
relates it to LeetCode 3484, Design Spreadsheet.

### 7. Cellular Infection Spreading

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69d4147079bf03c0074bcec0/practice?questionId=69d414a179bf03c0074bcec1)

Simulate a disease spreading on an `m × n` binary grid. On each day, a healthy
cell becomes infected when at least a given threshold of its eight neighbors is
currently infected. Updates occur simultaneously and infection is permanent;
compute when the process stabilizes, including the required early-return cases.

Variants:

1. **Threshold spreading:** infection is permanent; return days until no new
   cells become infected.
2. **Immune cells:** introduce cells that can never be infected and do not count
   as infected neighbors.
3. **Recovery:** infected cells remain contagious for exactly `recoveryDays`,
   then become permanently immune; finish only when no future infection or
   recovery transition remains.
4. **Fatal infection:** classify a newly infected cell as fatal when its infected
   neighbor count, measured from the prior day's state, reaches
   `deathThreshold`. It still spreads until its infectious period ends, then
   dies rather than becoming immune. Return `[daysUntilEnd, finalDeadCount]`.
5. **One-time firebreak:** before day one, burn nothing, one complete row, or one
   complete column. Burned cells leave the simulation and do not count as deaths;
   choose the option minimizing the eventual death count.

Focus: synchronous simulation, batch updates, 8-direction traversal, efficient
neighbor accounting, termination, and distinction from ordinary four-neighbor
multi-source BFS. The site relates it to LeetCode 994, Rotting Oranges.

### 8. Snapshot Social Graph

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

### 9. Shard Rebalancing

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69a3c4396e73e4abccc9c14c/practice?questionId=69a3c6546e73e4abccc9c150)

Given inclusive integer ranges representing key-space shards, enforce a maximum
number of overlapping shards at any key while also filling gaps across the
overall covered range. Boundaries may be shifted and fully eclipsed shards may
be removed, with the goal of minimizing movement.

Focus: interval sorting, sweep-line reasoning, active-range priority queues,
greedy boundary adjustment, inclusive endpoints, deterministic tie-breaking,
and validation of continuous coverage.

### 10. Monster Team Battle

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

### 11. Design In-Memory SQL

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/691cfb44ba2fba0a9e173e8b/practice?questionId=691cfb5cba2fba0a9e173e8c)

Implement an in-memory relational-style manager supporting table creation,
auto-incrementing row IDs, insertion with type inference, multi-condition `AND`
filtering, and stable multi-column ascending sorting.

Focus: schema and row representation, hash maps, numeric-string parsing,
mixed-type comparison rules, condition evaluation, sort comparators, and API
error semantics. The site relates it to LeetCode 2408, Design SQL.

### 12. Design ChatBot System

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

### 13. Design Cluster Message Aggregation

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/6916140a3f8671d8f7a56641/practice?questionId=691614103f8671d8f7a56642)

Implement an asynchronous protocol over a rooted n-ary tree of machines where
nodes communicate only with their immediate parent and children. Requests begin
at the root and must support counting all nodes and reconstructing cluster
topology through fan-out/fan-in message aggregation.

Focus: distributed tree traversal, request/correlation IDs, per-request pending
child state, aggregation after all replies, duplicate/late message handling,
concurrent operations, and protocol termination.

### 14. Design Persistent Key-Value Store

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/691523c93f8671d8f7a56570/practice?questionId=691523d03f8671d8f7a56571)

Build a string-to-string in-memory key-value store that can serialize its entire
state into one binary blob through a provided `Medium`, restore from that blob,
and enforce lifecycle rules across `put`, `get`, `shutdown`, and restore.

Variants:

1. **Single binary blob:** design a custom, non-JSON serialization format that
   exactly round-trips empty and Unicode strings through the provided `Medium`.
2. **Size-limited multipart storage:** split serialized bytes across ordered
   segments of at most `sizeLimit` bytes, persist them through a modified medium,
   and reassemble them exactly during restoration.

Focus: unambiguous length-prefixed binary encoding, UTF-8 byte lengths, manual
serialization/deserialization, truncation or corruption checks, deterministic
format choices, and post-shutdown immutability.

### 15. Dependency Version Check

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

### 16. GPU Credits II

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/6913b4290ac116974ccedd12/practice?questionId=6913b4310ac116974ccedd13)

Manage uniquely identified GPU-credit grants, each valid over a time interval,
when grant and consumption events may arrive out of timestamp order. Support
point-in-time balance queries and consumption at a specified time, drawing from
eligible grants in earliest-expiration order.

Focus: event-time replay, overlapping validity intervals, priority queues,
earliest-expiry-first allocation, out-of-order insertion, deterministic ordering,
insufficient-credit behavior, and the cost of recomputation versus indexing.

### 17. GPU Credits

[Open question](https://www.hack2hire.com/question-bank/companies/openai/coding-questions/69117144869dd6a56c434053/practice?questionId=69117148869dd6a56c434054)

Manage overlapping, uniquely identified GPU-credit grants with validity windows.
Events may be processed out of timestamp order; support historical balance
queries and point-in-time revocation/deduction, returning `-1` when the requested
amount exceeds available credits.

Focus: interval and event modeling, difference maps/prefix sums, separating event
time from processing time, historical recomputation, grant lookup, and precise
boundary semantics.

## Preparation themes

The list clusters around a few recurring skills:

1. **Stateful component design:** iterators, spreadsheets, databases, chat bots,
   snapshots, persistent stores, and credit ledgers require explicit invariants
   and lifecycle/state-transition reasoning.
2. **Time and history:** sliding windows, snapshots, and GPU-credit questions test
   event time, historical queries, out-of-order events, and efficient cleanup or
   replay.
3. **Exact semantics:** many problems are less about discovering an algorithm and
   more about defining inclusivity, ordering, overflow, invalid operations,
   deterministic output, and failure behavior.
4. **Complexity follow-ups:** expect pressure to improve memory, reduce external
   API calls, avoid full snapshots/replays, or compress histories.
5. **Implementation quality:** define small APIs, isolate mutable state, make
   invariants testable, and explain edge cases before coding.

## Suggested study order

1. Dependency Version Check; Design IP Range Iterator
2. Chat Message Events Aggregation; Cellular Infection Spreading
3. Maximum Grid Jumping Path; Data Labeling Task Scheduler
4. Spreadsheet; In-Memory SQL; Persistent Key-Value Store
5. Snapshot Social Graph; Shard Rebalancing
6. Toy Language Grammar; ChatBot System; Monster Team Battle
7. Cluster Message Aggregation; GPU Credits; GPU Credits II
