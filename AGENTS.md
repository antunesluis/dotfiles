# Repository Guidelines

## Project Structure & Module Organization

This is a GNU Stow-based dotfiles repository for an Arch Linux/Hyprland workstation. Each top-level package mirrors the target home directory layout. For example, `nvim/.config/nvim` links to `~/.config/nvim`, `zsh/.zshrc` links to `~/.zshrc`, and `git/.gitconfig` links to `~/.gitconfig`.

Configuration packages live in directories such as `hypr`, `waybar`, `rofi`, `tmux`, `alacritty`, `ghostty`, `swaync`, `swaylock`, `wlogout`, `wofi`, `yazi`, and `nvim`. Helper commands are in `scripts/`. Static media is under `assets/screenshots/` and `wallpapers/.config/wallpapers/`.

## Build, Test, and Development Commands

- `./install.sh`: clones the repository to `~/dotfiles` if missing, then stows packages. Review changes before running on a new machine.
- `stow -nv */`: performs a dry run and reports symlink operations without modifying files.
- `stow -v */`: applies symlinks for all top-level packages.
- `bash -n install.sh scripts/*`: checks shell scripts for parse errors.
- `shellcheck install.sh scripts/*`: runs stronger shell linting when ShellCheck is installed.

There is no project build step or automated application test suite.

## Coding Style & Naming Conventions

Keep file paths compatible with Stow: package directories should contain home-relative paths, usually `.config/<tool>/...`. Use lowercase package names matching the tool name, such as `waybar` or `ghostty`.

Shell scripts should use `#!/bin/bash`, quote variable expansions, and prefer clear guard clauses for missing dependencies or files. Lua configuration should follow the existing Neovim layout under `nvim/.config/nvim/lua/`. Keep TOML, JSON, CSS, and Hyprland config formatting consistent with nearby files.

## Testing Guidelines

Before committing, run `stow -nv */` to catch conflicts and `bash -n install.sh scripts/*` for script syntax. For UI-related changes, reload the relevant component manually, such as Hyprland, Waybar, Rofi, or Wlogout, and update screenshots only when they document a visible change.

## Commit & Pull Request Guidelines

Git history uses short conventional-style subjects, including `feat:`, `chore:`, `style:`, `refactor(scope):`, and occasional `sync` commits. Prefer concise, imperative subjects, for example `feat: add ghostty config`.

Pull requests should describe the affected package, list manual validation commands, and include screenshots for visual desktop changes. Note any machine-specific assumptions, such as NVIDIA settings, local paths, or required external tools.

## Security & Configuration Tips

Do not commit secrets, host-specific tokens, private SSH material, or generated caches. Keep local lock files and plugin downloads out of version control unless they are intentionally tracked.
