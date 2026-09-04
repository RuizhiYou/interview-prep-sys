# AI Agent Working Agreement

This repository is a collaborative system design study notebook. Optimize for
clear reasoning, traceable decisions, and material that can be reviewed quickly
before an interview.

## Repository contract

- Every design question belongs in `questions/<kebab-case-slug>/`.
- Use `templates/system-design-question/` as the canonical folder structure.
- Run `scripts/new-question.sh` when creating a question; do not invent a new
  layout unless the user explicitly asks for one.
- Keep `questions/README.md` current when adding, renaming, or removing a
  question.
- Keep question-specific assets inside that question's `assets/` directory.

## Content ownership and provenance

- Treat text labeled `Human` as user-owned source material. Do not delete,
  rewrite, or relabel it unless explicitly asked.
- Label new discussion entries with the date and author (`Human`, `AI`, or a
  supplied name). AI-authored claims are proposals until accepted or supported.
- When cleaning up rough notes, preserve the original note in the discussion log
  and put the polished conclusion in the solution.
- If comments conflict, document the disagreement and trade-off. Do not make a
  silent choice.
- Mark unknown or uncertain facts explicitly. Never fabricate traffic numbers,
  requirements, benchmarks, or interviewer feedback.

## Per-question workflow

1. Capture the prompt and clarify scope in `01-problem.md`.
2. Record exploration, alternatives, comments, and decisions in
   `02-discussion.md`.
3. Maintain the current coherent design in `03-solution.md`.
4. Add interviewer probes and deeper analysis to `04-follow-ups.md`.
5. Update the status and `Last updated` field in the question's `README.md`.

## Solution quality bar

A mature `03-solution.md` should make the following easy to find:

- goals and non-goals;
- scale assumptions and rough capacity estimates;
- high-level architecture and core request/data flows;
- API and data model choices where relevant;
- scaling, consistency, reliability, security, and observability considerations;
- alternatives, bottlenecks, failure modes, and explicit trade-offs.

Use concise prose and diagrams that can be explained aloud. Prefer concrete
assumptions over generic lists of technologies. Do not mark a solution `ready`
while important requirements or major design decisions remain unresolved.

## Safe editing behavior

- Read all files in a question folder before substantially changing its solution.
- Prefer small edits that retain history and attribution.
- Do not modify unrelated question folders.
- Do not commit, push, or publish changes unless the user asks.
