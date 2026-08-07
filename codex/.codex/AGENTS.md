# Global Agent Instructions

## Profile

- User: Luis Antunes.
- Preferred language for summaries and explanations: Portuguese.
- Preferred style: concise, direct, pragmatic, and technically precise.
- Default shell: `zsh`.
- Main editor: `nvim`.
- Main terminal: `ghostty`.
- Dotfiles are managed with GNU Stow.

## Non-Negotiable Preferences

- Never use the em dash character. Use a plain hyphen instead.
- When writing commit messages, never auto-add your agent name as co-author.
- Never manually modify `CHANGELOG.md` files or files marked as auto-generated.
- Before using dynamic workflows, ultracode, or any harness feature that immediately spawns a large swarm of subagents, explain the tradeoffs and ask for explicit approval.

## Engineering Standards

- When making technical decisions, give more weight to quality, simplicity, robustness, scalability, and long term maintainability than short term development cost.
- For one-off or infrequent operational work, start with the simplest direct end-to-end path.
- Do not build wrappers, control planes, policy layers, custom verifiers, or automation unless the direct path exposes a concrete blocker or repeated need.
- Read the existing project structure before changing files.
- Prefer the repository's current patterns over introducing new abstractions.
- Keep edits scoped to the user's request.
- Preserve user changes in dirty worktrees. Do not revert unrelated edits.
- Use `rg` for searching text and files before slower alternatives.
- Use structured parsers for JSON, TOML, YAML, and Lua when practical.

## Debugging And Quality

- When doing bug fixes, start by reproducing the bug in an end-to-end setting as close to the user experience as practical.
- When end-to-end testing a product, be picky about the UI and visual polish.
- Treat lint failures, test failures, and flaky tests as real issues, even if they were not caused by the current change.

## Safety

- Do not commit secrets, tokens, credentials, auth files, shell history, caches, logs, SQLite state, or generated local state.
- Do not run destructive commands such as `rm -rf`, `git reset --hard`, or `git checkout --` unless the user explicitly asks for that exact operation.
- Ask before broad permission changes, dependency installs, network-heavy actions, or machine-wide changes.
- Treat host-specific paths, GPU settings, display-manager settings, and desktop-environment settings as machine-specific.

## Validation

- After shell changes, run `bash -n` or `zsh -n` as applicable.
- After JSON changes, run `jq empty`.
- After TOML changes, validate with Python `tomllib` or another TOML parser.
- After Neovim changes, run a headless startup smoke test when possible.
- After terminal/tmux changes, validate with the tool's native config check or startup command when available.

## Git

- Use short conventional-style commit subjects when asked to commit.
- Before committing, run `git status --short`.
- Include only intentional changes in commits.
- Mention validation performed when summarizing a change.
