# Problem and Requirements

## Original prompt

Design the backend for ChatGPT: users hold durable conversations with an LLM, the service assembles context within the model token limit, schedules GPU inference, applies safety checks, and streams generated tokens to clients.

- Source: [Hack2Hire — Design ChatGPT](https://www.hack2hire.com/question-bank/companies/openai/system-design/69d6f527c4c1bc791ee229e3)
- Difficulty: Hard
- Captured: 2026-09-12

## Clarified scope

- Persist conversations and turns so users can list and resume them.
- Stream output over SSE and define behavior for client disconnects.
- Enforce product-tier quotas and prioritize capacity during overload.
- Handle context overflow through truncation or summarization policy.

## Functional requirements

- Create, list, and resume conversations.
- Submit a text turn and stream generated tokens.
- Assemble system instructions and conversation history under a token budget.
- Run input and output safety checks.
- Enforce rate limits and usage limits by user tier.

## Non-functional requirements

- Time to first token: <=500 ms p50 and <=2 s p95.
- Sustained generation speed: approximately 30–60 tokens/second.
- Availability target: 99.9%.
- Persist acknowledged turns durably and avoid duplicate generation charges.
- Scale to 100M registered users, 10M DAU, and 50K concurrent generations.
- Protect scarce GPU capacity with admission control, fairness, and cost controls.

## Out of scope

- Model training, multimodal generation, plugins/tools, and model internals.

## Scale assumptions

| Dimension | Assumption | Derivation/source |
| --- | ---: | --- |
| Registered users | 100M | Source requirement |
| Daily active users | 10M | Source requirement |
| Concurrent generations | 50K | Source requirement |
| Stream rate | 30–60 tokens/s | Source requirement |

