# System Design Interview Prep

This repository is a shared workspace for practicing system design questions with
humans and AI agents. Each question lives in its own folder so the original
problem, working discussion, final solution, and follow-up questions do not get
mixed together.

## Start a question

```bash
./scripts/new-question.sh <question-slug> "Question title"
```

Example:

```bash
./scripts/new-question.sh design-url-shortener "Design a URL Shortener"
```

This creates `questions/design-url-shortener/` from the standard template and
adds it to the [question index](questions/README.md).

## Question layout

```text
questions/<question-slug>/
├── README.md          # Status, ownership, and navigation
├── 01-problem.md      # Prompt, scope, requirements, and estimates
├── 02-discussion.md   # Human/AI comments and decision log
├── 03-solution.md     # Clear, interview-ready solution
├── 04-follow-ups.md   # Follow-up questions and answers
└── assets/            # Diagrams, screenshots, and other supporting files
```

The numbered files mirror a useful interview flow: clarify the problem, reason
together, converge on a solution, and test it with follow-ups.

## Working conventions

- Keep one system design question per folder.
- Preserve the original prompt in `01-problem.md`; add clarifications instead of
  rewriting history.
- Add attributed, dated notes to `02-discussion.md`. Human comments should not be
  silently rewritten or deleted by an AI agent.
- Keep alternatives and unresolved debate in the discussion file. Promote only
  agreed or well-supported decisions into `03-solution.md`.
- Record new interviewer prompts in `04-follow-ups.md`, along with their status
  and concise answers when resolved.
- Prefer Mermaid diagrams in Markdown. Put binary or externally created visuals
  in the question's `assets/` directory.

See [AGENTS.md](AGENTS.md) for the instructions future AI agents should follow.
