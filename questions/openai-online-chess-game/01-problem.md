# Problem and Requirements

## Original prompt

Design an online chess system that matches queued players, validates moves on an authoritative game server, maintains trusted clocks, pushes updates in real time, and recovers clients after disconnects.

- Source: [Hack2Hire — Design Online Chess Game](https://www.hack2hire.com/question-bank/companies/openai/system-design/69cb09edff3ebde766cedb20)
- Difficulty: Medium
- Captured: 2026-09-12

## Clarified scope

- Matchmaking considers rating and selected time control.
- The server, not either client, validates moves and clocks.
- A reconnecting client receives an authoritative snapshot plus subsequent events.
- Each ply accepts at most one legal move transition.

## Functional requirements

- Enter/leave matchmaking queues and create paired games.
- Submit moves and validate turn, legality, and current game version.
- Maintain clocks, increments, resignations, draws, and timeout results.
- Push game changes to both players and permitted spectators.
- Reconnect and recover current state; durably record final results.

## Non-functional requirements

- Availability target: 99.95%.
- Match operations <250 ms, move acknowledgement <150 ms, opponent update <1 s.
- Support 3M DAU, 150K concurrent games, 5K queue operations/s, and 20K moves/s.
- Preserve per-game order and prevent double moves for a ply.
- Authenticate players and use server time for authoritative clocks.

## Out of scope

- Anti-cheat model design, tournaments, chat moderation, and chess-engine analysis.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Daily active users | 3M | Source requirement |
| Concurrent games | 150K | Source requirement |
| Queue operations | 5K/s | Source requirement |
| Moves | 20K/s | Source requirement |

