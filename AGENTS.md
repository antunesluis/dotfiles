# Repository Guidelines

## Project Structure & Module Organization

This is a GNU Stow-based dotfiles repository. Each top-level package mirrors the target home directory layout. For example, `nvim/.config/nvim` links to `~/.config/nvim`, `zsh/.zshrc` links to `~/.zshrc`, and `git/.gitconfig` links to `~/.gitconfig`.

Primary development packages are `nvim`, `zsh`, `tmux`, `ghostty`, `git`, `claude`, `codex`, `opencode`, `herdr`, and `agents`. Desktop packages such as `hypr`, `waybar`, `rofi`, `alacritty`, `swaync`, `swaylock`, `wlogout`, `wofi`, and `yazi` are still part of the repo but may be inactive on the current machine. Helper commands are in `scripts/`. Static media is under `assets/screenshots/` and `wallpapers/.config/wallpapers/`.

Agent memory is split by scope:

- `agents/AGENTS.md` stows to `~/AGENTS.md` for general agent tools.
- `codex/.codex/AGENTS.md` stows to `~/.codex/AGENTS.md` for Codex global memory.
- `claude/.claude/CLAUDE.md` stows to `~/.claude/CLAUDE.md` and imports `~/AGENTS.md`.
- This root `AGENTS.md` is repository-specific guidance for agents working inside this dotfiles repo.

## Build, Test, and Development Commands

- `stow -nv */`: performs a dry run and reports symlink operations without modifying files.
- `stow -v */`: applies symlinks for all top-level packages.
- `stow -nv <package>`: dry-runs one package, useful for new agent packages.
- `bash -n scripts/*`: checks shell scripts for parse errors.
- `shellcheck scripts/*`: runs stronger shell linting when ShellCheck is installed.
- `jq empty <file.json>`: validates JSON configs.
- `python3 -c 'import tomllib; tomllib.load(open("<file.toml>", "rb"))'`: validates TOML configs.

There is no project build step or automated application test suite.

## Coding Style & Naming Conventions

Keep file paths compatible with Stow: package directories should contain home-relative paths, usually `.config/<tool>/...`. Use lowercase package names matching the tool name, such as `waybar` or `ghostty`.

Shell scripts should use `#!/bin/bash`, quote variable expansions, and prefer clear guard clauses for missing dependencies or files. Lua configuration should follow the existing Neovim layout under `nvim/.config/nvim/lua/`. Keep TOML, JSON, CSS, and Hyprland config formatting consistent with nearby files.

## Testing Guidelines

Before committing, run focused validation for the packages changed. Use `stow -nv <package>` to catch Stow conflicts and `bash -n scripts/*` for script syntax. For UI-related changes, reload the relevant component manually and update screenshots only when they document a visible change.

## Commit & Pull Request Guidelines

Git history uses short conventional-style subjects, including `feat:`, `chore:`, `style:`, `refactor(scope):`, and occasional `sync` commits. Prefer concise, imperative subjects, for example `feat: add ghostty config`.

Pull requests should describe the affected package, list manual validation commands, and include screenshots for visual desktop changes. Note any machine-specific assumptions, such as NVIDIA settings, local paths, or required external tools.

## Security & Configuration Tips

Do not commit secrets, host-specific tokens, private SSH material, generated caches, auth files, history files, local SQLite state, or logs. Keep local lock files and plugin downloads out of version control unless they are intentionally tracked.
