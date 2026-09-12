# Problem and Requirements

## Original prompt

Design a TinyURL service that creates durable short aliases and redirects them to long URLs with very low latency under a read-heavy workload.

- Source: [Hack2Hire — Design TinyURL](https://www.hack2hire.com/question-bank/companies/openai/system-design/69cc73c2ff3ebde766cee30b)
- Difficulty: Easy
- Captured: 2026-09-12

## Clarified scope

- The same long URL may optionally return a stable existing alias.
- Custom aliases are optional but must be globally unique.
- Unknown or expired aliases return a clear `404`/`410` result.
- During a storage outage, stale cached redirects may be served within policy.

## Functional requirements

- Create a unique short URL for a supplied long URL.
- Redirect an alias to its destination.
- Make create requests idempotent when a client retries.
- Optionally support custom aliases, expiration, and abuse reporting.

## Non-functional requirements

- Redirect latency <50 ms p95; create latency <200 ms p95.
- Support 500M redirects/day and 10M creates/day, roughly a 100:1 read/write ratio.
- Keep redirects highly available and created mappings durable.
- Absorb viral hot keys through layered caching.
- Prevent malicious destinations and enumeration abuse.

## Out of scope

- Rich analytics, advertising, and a general-purpose link management suite.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Redirects/day | 500M | Source requirement |
| Creates/day | 10M | Source requirement |
| Read/write ratio | ~100:1 peak | Source requirement |
| Redirect latency | <50 ms p95 | Source requirement |

