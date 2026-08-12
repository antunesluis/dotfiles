# Dotfiles

Personal GNU Stow dotfiles for my development environment and desktop tooling.

Each top-level directory is a Stow package that mirrors the target path from `$HOME`. For example, `nvim/.config/nvim` maps to `~/.config/nvim`, `zsh/.zshrc` maps to `~/.zshrc`, and `git/.gitconfig` maps to `~/.gitconfig`.

## Main Setup

- **Ghostty** - primary terminal
- **Tmux** - terminal multiplexer
- **Neovim** - Lua-based editor configuration
- **Zsh** - shell with Oh My Zsh, Starship, FZF, Zoxide, Bat, and Eza
- **Git** - global Git defaults
- **Claude Code, Codex, OpenCode, and Herdr** - agent settings, shared memory, and agent multiplexing

Desktop packages such as Hyprland, Waybar, Rofi, Wlogout, Wofi, Yazi, Alacritty, and related assets are still tracked, but some may be inactive depending on the current machine.

## Packages

- `agents` - global `~/AGENTS.md` memory for coding agents
- `claude` - `~/.claude` settings, memory, rules, and skills (stow with `--no-folding`)
- `codex` - `~/.codex` config and Codex global `AGENTS.md`
- `opencode` - OpenCode plugins and integration files
- `herdr` - `~/.config/herdr` config for the terminal agent multiplexer
- `ghostty` - Ghostty terminal config
- `git` - Git config
- `nvim` - Neovim config
- `tmux` - tmux config and plugin setup
- `zsh` - shell config, aliases, and functions
- `scripts` - helper commands

## Usage

Dry-run one package:

```bash
stow -nv <package>
```

Apply one package:

```bash
stow -v <package>
```

Apply all packages:

```bash
stow -v */
```

### The `claude` package needs `--no-folding`

```bash
stow -v --no-folding claude
```

`~/.claude` is not a config directory the way `~/.config/nvim` is: Claude Code
keeps its runtime state there (`sessions/`, `projects/`, `telemetry/`, …) next to
`~/.claude/.credentials.json`, which holds an auth token.

Without `--no-folding`, Stow replaces a missing `~/.claude` with a symlink to
this repo, and Claude Code then writes that state — credentials included —
straight into git. Folding is fine for every other package, where the whole
directory really is config.

With `--no-folding`, Stow links the five tracked files individually
(`CLAUDE.md`, `settings.json`, `hooks/`, `rules/`, `skills/`) and leaves the
runtime state as real files outside the repo.

Because `stow -v */` above does *not* pass the flag, run the `claude` package
separately on a new machine.
