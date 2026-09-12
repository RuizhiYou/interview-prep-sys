# Problem and Requirements

## Original prompt

Design a nearby point-of-interest service that returns the closest matching places for a location/radius query, supports place details, and accepts authoritative owner/admin updates.

- Source: [Hack2Hire — Design A Nearby POI Service](https://www.hack2hire.com/question-bank/companies/openai/system-design/69f9729772a3d3fe39f8d21b)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- Search supports radius and/or nearest-`k`, category filters, and pagination.
- Owners/admins write to a durable source of truth.
- The geospatial search index may lag source writes by 30–60 seconds.
- Search may serve stale results during index degradation.

## Functional requirements

- Find nearby POIs by coordinates, radius/limit, and filters.
- Fetch complete details for one POI.
- Create and update POIs through authorized owner/admin APIs.
- Page through stable-enough search results.

## Non-functional requirements

- Availability target: 99.95%.
- Search <200 ms p95, detail <100 ms p95, write <300 ms p95.
- Support 200M POIs, 50K searches/s, and 500 writes/s with ~100:1 geographic skew.
- Keep authoritative data durable; tolerate bounded index staleness.
- Handle dense urban hot cells and sparse-region searches.

## Out of scope

- Reviews, turn-by-turn navigation, ads, and personalized ranking.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| POIs | 200M | Source requirement |
| Search traffic | 50K requests/s | Source requirement |
| Write traffic | 500 requests/s | Source requirement |
| Index freshness | 30–60 s | Source requirement |

