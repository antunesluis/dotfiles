# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source /home/antunesluis/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/antunesluis/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ "$TERM" == "xterm" ]] && export TERM=allacritty

#eval "$(starship init zsh)"
	
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive complemtion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# User configuration

# You may need to manually set your language environment
export LANG=pt_BR.UTF-8
export EDITOR="nvim"

export PATH="$PATH:/home/antunesluis/.local/bin/"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$JAVA_HOME

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:~/go/bin

fpath+=${ZDOTDIR:-~}/.zsh_functions

# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | wl-copy -n
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip


# Global settings
alias dotfiles='cd $HOME/dotfiles'
alias projects='cd $HOME/Projects/GitHub'
alias obsidian='cd $HOME/Projects/GitHub/vault_obsidian'
alias ll='eza --long --header --group-directories-first --git --group --all'
alias ls="eza --icons=always --group-directories-first"
alias tree='tree -C'

# Python
alias pyclean='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rvf'
alias pip-purge='pip list --format freeze | xargs pip uninstall -y'
alias pip-install-reqs='ls requirements*.txt | xargs -n 1 pip install -r'
alias activate='source venv/bin/activate'


eval "$(oh-my-posh init zsh --config $HOME/dotfiles/.config/ohmyposh/conf.toml)"


[ -f "/home/antunesluis/.ghcup/env" ] && . "/home/antunesluis/.ghcup/env" # ghcup-env
