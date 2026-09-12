# Problem and Requirements

## Original prompt

Design a web AI chatbot application that authenticates users, forwards text prompts and client-owned conversation history to an external streaming LLM, and relays tokens to the UI in real time.

- Source: [Hack2Hire — Design AI Chatbot App](https://www.hack2hire.com/question-bank/companies/openai/system-design/69cb3259ff3ebde766cedc1f)
- Difficulty: Medium
- Captured: 2026-09-12

## Clarified scope

- Conversation history is entirely client-owned; refreshing the page may reset it.
- The backend is a stateless streaming proxy and stores identity/usage, not messages.
- The client sends full prior context with every prompt.
- One external LLM provider and text chat only.

## Functional requirements

- Authenticate users and issue JWTs.
- Accept a prompt plus conversation context and invoke the upstream LLM.
- Stream tokens via SSE with typing/progress and terminal events.
- Surface partial output and an explicit error if upstream generation fails.
- Enforce per-user prompt and token budgets.

## Non-functional requirements

- Time to first token <500 ms p95.
- Streaming availability target: 99.9%.
- Support 50K concurrent streams with bursty prompt arrivals.
- Stop upstream generation promptly when clients abandon streams.
- Validate authentication at request start; an already-running stream may finish after JWT expiry.

## Out of scope

- Server-side chat persistence, multi-provider routing, tools, images, and model training.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Concurrent streams | 50K | Source requirement |
| Average stream duration | 15–30 s | Source estimate |
| Average response | ~500 tokens | Source estimate |
| Peak token throughput | ~1.5M tokens/min | Source estimate |
| Context limit | ~128K tokens, model-dependent | Source estimate |

