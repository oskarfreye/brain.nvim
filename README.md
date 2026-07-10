# 🧠 brain.nvim

Daily LeetCode coding challenges inside Neovim. Fight AI-induced brain atrophy — solve data structure and algorithm problems without Copilot, without autocomplete, just you and the code.

![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-green?logo=neovim)
![License](https://img.shields.io/badge/license-MIT-blue)

## Why?

The more you delegate to AI, the more your problem-solving muscles atrophy. brain.nvim gives you one real LeetCode daily challenge per day — a split view with a TypeScript stub on the left, a chat panel on the right, and auto-running tests on save. No AI assistance unless you explicitly ask for a hint (which costs you points).

## Features

- **LeetCode daily provider** — pulls the public daily coding challenge from LeetCode's GraphQL endpoint
- **Built-in offline fallback** — local TypeScript challenges still work when LeetCode or the network is unavailable
- **Split-view UI** — code on the left, chat/feedback on the right
- **Auto-test on save** — vitest runs generated public-example tests every time you save your challenge file
- **Scoring** — ✅ 3pts (clean solve), 🟡 2pts (with hints), 🔴 1pt (partial), ⏭️ 0pts (skip)
- **Training log** — Markdown table tracking your scores over time
- **Copilot/completion auto-disabled** in challenge buffers
- **Optional AI hints** — via any OpenAI-compatible API (OpenClaw, LM Studio, etc.)
- **Chat panel** — discuss the problem with an AI tutor (Socratic style, no freebies)

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'execute008/brain.nvim',
  cmd = { 'BrainStart', 'BrainTest', 'BrainHint', 'BrainSubmit', 'BrainSkip' },
  opts = {
    -- Where challenge files are created (one folder per day)
    challenges_dir = vim.fn.expand('~/.local/share/brain.nvim/challenges'),

    -- Markdown log of your scores
    log_file = vim.fn.expand('~/.local/share/brain.nvim/training.md'),

    -- Test runner (must support --reporter=json)
    test_cmd = { 'npx', 'vitest', 'run', '--reporter=json' },

    -- Challenge provider: "leetcode" or "builtin"
    challenge_provider = 'leetcode',

    -- LeetCode daily challenge settings
    leetcode = {
      endpoint = 'https://leetcode.com/graphql',
      timeout = 8,
      fallback_to_builtin = true,
    },

    -- Disable Copilot/completion in challenge buffers
    disable_copilot = true,

    -- AI hints: "openclaw" or "none"
    hint_provider = 'none',

    -- OpenAI-compatible API for hints/chat (any local or remote endpoint)
    openclaw = {
      port = 18789,
      token = '',
    },

    -- Callback fired on submit (for custom integrations)
    -- on_submit = function(result) ... end,
  },
}
```

### First-time setup

The challenges use TypeScript + vitest. After installing, run once:

```bash
cd ~/.local/share/brain.nvim/challenges
npm install
```

(brain.nvim creates a `package.json` automatically if one doesn't exist.)

### LeetCode provider

By default `:BrainStart` fetches LeetCode's active daily coding challenge, writes a TypeScript scaffold, and creates local Vitest tests from the public examples in the problem statement. LeetCode does not expose its hidden judge tests through this public GraphQL response, so the local tests are a fast sanity check, not a replacement for submitting on LeetCode.

Set `challenge_provider = 'builtin'` to use only the local challenge database.

## Commands

| Command | Description |
|---------|-------------|
| `:BrainStart` | Start today's challenge (opens split view) |
| `:BrainTest` | Run tests (also runs automatically on save) |
| `:BrainHint` | Get an AI hint (costs 1 point, needs `hint_provider`) |
| `:BrainSubmit` | Submit your solution for final scoring |
| `:BrainSkip` | Give up — see the solution explained |

## Scoring

| Emoji | Points | Meaning |
|-------|--------|---------|
| ✅ | 3 | All tests pass, no hints used |
| 🟡 | 2 | All tests pass, hints used |
| 🔴 | 1 | Not all tests pass |
| ⏭️ | 0 | Skipped |

Results are logged to your `log_file` in a Markdown table:

```
| Date | Challenge | Score | Tests | Hints |
|------|-----------|-------|-------|-------|
| 2026-02-18 | Trie (Prefix Tree) | ✅ 3/3 | 11/11 | 0 |
| 2026-02-19 | LRU Cache | 🟡 2/3 | 9/9 | 1 |
```

## AI Integration (Optional)

brain.nvim can connect to any OpenAI-compatible chat endpoint for:
- **Hints** (`:BrainHint`) — brief nudges without spoiling the answer
- **Chat** — Socratic coaching in the side panel
- **Skip explanations** (`:BrainSkip`) — full solution walkthrough

Works with [OpenClaw](https://openclaw.ai), [LM Studio](https://lmstudio.ai), [Ollama](https://ollama.com), or any `/v1/chat/completions` endpoint.

```lua
opts = {
  hint_provider = 'openclaw',
  openclaw = {
    port = 11434,  -- or whatever your endpoint uses
    token = 'your-token',
  },
}
```

## Custom Submit Hook

Want to send results to Telegram, Discord, or your own tracking system?

```lua
opts = {
  on_submit = function(result)
    -- result = { date, challenge, score, emoji, hints, passed, total }
    vim.notify(result.emoji .. ' ' .. result.challenge .. ': ' .. result.score .. '/3')
  end,
}
```

## Built-in Fallback Challenges

Edit `lua/brain/challenges_db.lua` or submit a PR! Each challenge needs:
- `name` — display name
- `difficulty` — "easy", "medium", or "hard"
- `stub` — TypeScript template with `// YOUR CODE HERE` markers
- `tests` — vitest test suite

## Philosophy

> The goal is to keep your brain sharp while AI handles the routine stuff. One real problem a day, no shortcuts, real thinking.

## License

MIT
