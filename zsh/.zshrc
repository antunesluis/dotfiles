# Só configuração interativa. PATH, Java, Node e demais variáveis ficam no
# ~/.profile (carregado pelo ~/.zprofile no login), para que apps gráficos e
# agentes vejam o mesmo ambiente do terminal. A linha abaixo cobre shells
# abertos por processos que não passaram por um login.
[[ -n "$DOTFILES_PROFILE_LOADED" ]] || emulate sh -c '. "$HOME/.profile"'

export ZSH="$HOME/.oh-my-zsh"

fpath=("$HOME/.zsh/completions" $fpath)

# Sem o plugin ssh-agent: o agente do GNOME (SSH_AUTH_SOCK da sessão) já atende
# terminal e apps gráficos, e um segundo agente separava as chaves dos dois.
plugins=(
    git
    docker
    python
    golang
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# O oh-my-zsh reescreve o título do terminal no precmd e no
# preexec. Desligado para o hook em "Título do terminal" mandar.
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh

# ---- Histórico ----

# O oh-my-zsh define HISTSIZE=50000 e SAVEHIST=10000, o que cortava o arquivo
# em 10000 linhas a cada gravação.
SAVEHIST=$HISTSIZE

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

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# ---- Título do terminal ----

# Mostra o caminho completo (com ~) na barra de título, e só isso.
# O título automático do Ghostty está desligado via
# `shell-integration-features = ...,no-title` no config.ghostty.
_set_window_title() { print -Pn '\e]2;%~\a' }
autoload -Uz add-zsh-hook
add-zsh-hook precmd _set_window_title

# ---- Custom Aliases and Functions ----

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

# Azure CLI completion
autoload -U +X bashcompinit && bashcompinit
[ -f /etc/bash_completion.d/azure-cli ] && source /etc/bash_completion.d/azure-cli

# NVM: o Node padrão já está no PATH pelo ~/.profile. --no-use só carrega o
# comando `nvm`, sem os ~0,35 s de resolver a versão em todo shell novo.
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use

# SDKMAN: comando `sdk` e troca automática pelo .sdkmanrc (sdkman_auto_env).
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# zoxide fica por último, como pede a documentação dele. Instaladores (Codex,
# Azure CLI...) costumam anexar blocos no fim do arquivo: mova-os para cima
# deste bloco, e PATH novo vai para o ~/.profile.
#
# Use `z`/`zi`. Não faça alias de `cd` para `z`: num diretório inexistente o
# `z` pula em silêncio para outro lugar do histórico, e os snapshots de shell
# dos agentes levavam o alias sem o hook, disparando o `zoxide doctor` em todo cd.
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
