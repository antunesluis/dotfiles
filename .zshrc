# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugins
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

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Environment variables
export LANG=pt_BR.UTF-8
export EDITOR="nvim"
export PATH="$PATH:/home/antunesluis/.local/bin:/usr/local/go/bin:$JAVA_HOME:~/go/bin"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Custom functions directory
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Terminal type
[[ "$TERM" == "xterm" ]] && export TERM=alacritty

# Vim-like yank to clipboard
function vi-yank-xclip {
    zle vi-yank
    echo "$CUTBUFFER" | wl-copy -n
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview-window=right:60% --marker='✓' --pointer='▶' --multi"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Load custom aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# GHCup
[ -f "/home/antunesluis/.ghcup/env" ] && . "/home/antunesluis/.ghcup/env"

# Java
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$PATH:$JAVA_HOME/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completi

export PATH="$HOME/dotfiles/scripts:$PATH"

# Load syntax highlighting and autosuggestions last
source /home/antunesluis/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/antunesluis/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
