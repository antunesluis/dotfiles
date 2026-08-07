# Dotfiles

Personal GNU Stow dotfiles for my development environment and desktop tooling.

Each top-level directory is a Stow package that mirrors the target path from `$HOME`. For example, `nvim/.config/nvim` maps to `~/.config/nvim`, `zsh/.zshrc` maps to `~/.zshrc`, and `git/.gitconfig` maps to `~/.gitconfig`.

## Main Setup

- **Ghostty** - primary terminal
- **Tmux** - terminal multiplexer
- **Neovim** - Lua-based editor configuration
- **Zsh** - shell with Oh My Zsh, Starship, FZF, Zoxide, Bat, and Eza
- **Git** - global Git defaults
- **Claude Code and Codex** - agent settings and shared memory

Desktop packages such as Hyprland, Waybar, Rofi, Wlogout, Wofi, Yazi, Alacritty, and related assets are still tracked, but some may be inactive depending on the current machine.

## Packages

- `agents` - global `~/AGENTS.md` memory for coding agents
- `claude` - `~/.claude` settings and Claude memory
- `codex` - `~/.codex` config and Codex global `AGENTS.md`
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
