# Problem and Requirements

## Original prompt

Design a distributed web crawler that starts from seed URLs, fetches pages, extracts text and outbound links, deduplicates work, and stores clean text for downstream LLM use. It must crawl billions of pages within a bounded time while respecting website politeness rules.

- Source: [Hack2Hire — Design Distributed Web Crawler](https://www.hack2hire.com/question-bank/companies/openai/system-design/69dc41c3e4441834b3f736bb)
- Difficulty: Medium
- Captured: 2026-09-12

## Clarified scope

- Crawl the open web starting from supplied seeds.
- Process URLs breadth-first; exact ordering across the whole fleet is not required.
- Store extracted text and discovered links; the downstream LLM pipeline is out of scope.
- Respect `robots.txt` and enforce a global per-domain request rate.

## Functional requirements

- Accept seed URLs and continuously discover outbound URLs.
- Fetch pages and extract normalized text.
- Deduplicate both URLs and substantially identical content.
- Retry recoverable failures and recover work after worker crashes.
- Enforce crawl policy and per-domain politeness.

## Non-functional requirements

- Crawl roughly 10 billion pages in 5 days, about 23K pages/second on average.
- Maximize I/O concurrency while preventing a hot domain from monopolizing workers.
- Sustain worker and coordinator failures without losing the frontier.
- Limit each domain to at most one request per second unless policy says otherwise.
- Keep crawl results durable and make progress observable.

## Out of scope

- Search ranking, indexing, LLM training, and rendering every JavaScript-heavy page.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Pages | 10B | Source requirement |
| Completion window | 5 days | Source requirement |
| Average fetch rate | ~23K pages/s | `10B / 432,000s` |
| Per-domain rate | <= 1 request/s | Source politeness constraint |

