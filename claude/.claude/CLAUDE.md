# Global Claude Code Instructions

## Development Defaults

- Prefer concise Portuguese summaries for user-facing responses.
- Use `rg` for searching text and files before slower alternatives.
- Keep changes scoped to the requested package or tool.
- Do not commit secrets, tokens, auth files, history, caches, logs, or generated local state.
- Preserve user changes in the worktree; do not revert unrelated edits.

## Validation

- Run focused syntax or smoke checks after changing dotfiles.
- For shell files, prefer `bash -n` or `zsh -n` as applicable.
- For JSON files, validate with `jq empty`.
- For TOML files, validate with a TOML parser before finishing.

## Git

- Use short conventional-style commit subjects when asked to commit.
- Before committing, check `git status --short` and include only intentional changes.
