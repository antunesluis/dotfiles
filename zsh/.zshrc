export ZSH="$HOME/.oh-my-zsh"

fpath=("$HOME/.zsh/completions" $fpath)

plugins=(
    git
    docker
    python
    golang
    zsh-syntax-highlighting
    zsh-autosuggestions
    archlinux
    ssh-agent
)

source $ZSH/oh-my-zsh.sh

# ---- Locale and Editor Settings ----

export LANG=pt_BR.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="ghostty"

[[ "$TERM" == "xterm" ]] && export TERM=xterm-ghostty

# ---- PATH Configurations ----

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"

# Java PATH
export JAVA_HOME=/usr/lib/jvm/default
export PATH="$JAVA_HOME/bin:$PATH"

# Go PATH
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Haskell PATH
export PATH="$HOME/.ghcup/bin:$PATH"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# --- FZF Configuration ----

# Set up fzf key bindings and fuzzy completion
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "

if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

# ---- Tool Initialization ----

# if command -v fzf &> /dev/null; then
#   source /usr/share/fzf/key-bindings.zsh
#   source /usr/share/fzf/completion.zsh
# fi

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions

# ---- Custom Aliases and Functions ----

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# source ~/p4-guide/p4dev-python-venv/bin/activate
# export PATH="~/p4-guide/bin:~/p4-guide/behavioral-model/tools:/usr/local/bin:$PATH"
# export P4_EXTRA_SUDO_OPTS="PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python"
