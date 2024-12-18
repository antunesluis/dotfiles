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

# Oh My Posh
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/.config/ohmyposh/conf.toml)"

# Zoxide
eval "$(zoxide init zsh)"

# FZF
source <(fzf --zsh)

# Load custom aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# GHCup
[ -f "/home/antunesluis/.ghcup/env" ] && . "/home/antunesluis/.ghcup/env"

# Load syntax highlighting and autosuggestions last
source /home/antunesluis/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/antunesluis/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
