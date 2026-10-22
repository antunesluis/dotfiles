# Dotfiles

Personal GNU Stow dotfiles for my development environment.

Each top-level directory is a Stow package that mirrors the target path from `$HOME`. For example, `nvim/.config/nvim` maps to `~/.config/nvim`, `zsh/.zshrc` maps to `~/.zshrc`, and `git/.gitconfig` maps to `~/.gitconfig`.

## Main Setup

- **Ghostty** - primary terminal
- **Tmux** - terminal multiplexer
- **Neovim** - Lua-based editor configuration
- **Zsh** - shell with Oh My Zsh, Starship, FZF, Zoxide, Bat, and Eza
- **Git** - global Git defaults
- **Claude Code, Codex, OpenCode, and Herdr** - agent settings, shared memory, and agent multiplexing

Configs from the old Arch + Hyprland setup (Hyprland, Waybar, Rofi, Wofi, Wlogout, SwayNC, Swaylock, Dunst, Yazi, wallpapers) live in `archive/` and are not stowed.

## Packages

- `agents` - global `~/AGENTS.md` memory for coding agents
- `alacritty` - Alacritty terminal config
- `bash` - `~/.profile` (login environment shared by every shell and the desktop session) and `~/.bashrc`
- `claude` - `~/.claude` settings, memory, rules, and skills (stow with `--no-folding`)
- `codex` - Codex global `AGENTS.md` and hooks
- `opencode` - OpenCode plugins and integration files
- `herdr` - `~/.config/herdr` config for the terminal agent multiplexer
- `ghostty` - Ghostty terminal config
- `git` - Git config shared by every machine
- `nvim` - Neovim config
- `tmux` - tmux config and plugin setup
- `zsh` - shell config, aliases, and functions

`scripts/` is not a package: `~/.profile` puts it on `PATH` directly.

## Usage

Dry-run one package:

```bash
stow -nv <package>
```

Apply one package:

```bash
stow -v <package>
```

Apply everything on a new machine:

```bash
stow -v agents alacritty bash codex ghostty git herdr nvim opencode tmux zsh
stow -v --no-folding claude
```

Don't use `stow -v */`: the glob also picks up `scripts/` and `archive/`, which are not packages.

### Where shell settings go

- `bash/.profile` - `PATH` and tool variables (Java, Node, Android, Flutter). It is POSIX `sh`. `~/.zprofile` loads it for zsh login shells, which includes the GNOME session, so graphical apps and coding agents see the same environment as the terminal.
- `zsh/.zshrc` - interactive-only settings: plugins, prompt, completion, aliases.

Java comes only from SDKMAN (`sdk default java <version>`). With `sdkman_auto_env=true` in `~/.sdkman/etc/config`, a project's `.sdkmanrc` switches the version when you `cd` into it.

### Per-machine Git settings

`git/.gitconfig` holds only shared defaults and includes `~/.gitconfig.local`, which is not tracked. Put identity and credential helpers there:

```ini
[user]
	name = Luis Antunes
	email = you@example.com
[credential "https://github.com"]
	helper =
	helper = !gh auth git-credential
```

Because `~/.gitconfig` is a link into this repo, `git config --global` writes here. Use `git config --file ~/.gitconfig.local` for anything machine-specific.

### The `claude` package needs `--no-folding`

```bash
stow -v --no-folding claude
```

`~/.claude` is not a config directory the way `~/.config/nvim` is: Claude Code
keeps its runtime state there (`sessions/`, `projects/`, `telemetry/`, …) next to
`~/.claude/.credentials.json`, which holds an auth token.

Without `--no-folding`, Stow replaces a missing `~/.claude` with a symlink to
this repo, and Claude Code then writes that state, credentials included,
straight into git. Folding is fine for every other package, where the whole
directory really is config.

With `--no-folding`, Stow links the tracked files individually
(`CLAUDE.md`, `settings.json`, `statusline.sh`, `hooks/`, `rules/`, `skills/`)
and leaves the runtime state as real files outside the repo.
