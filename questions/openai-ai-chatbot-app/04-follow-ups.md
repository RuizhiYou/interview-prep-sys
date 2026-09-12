# Follow-up Questions

| Status | Question | Source answer |
| --- | --- | --- |
| `answered` | Is conversation history persisted server-side? | No; it is client-owned and a refresh may reset it. |
| `answered` | What is the p95 time-to-first-token target? | Under 500 ms. |
| `answered` | Who assembles multi-turn context? | The client sends full history; the backend is stateless. |
| `answered` | How many concurrent streams must be supported? | About 50K SSE streams. |
| `answered` | What happens if the upstream LLM stalls? | Show partial text, signal an error, and allow manual retry. |
| `answered` | What if JWT expires during an active stream? | Finish that stream; require fresh auth for the next prompt. |

