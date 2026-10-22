# ~/.profile: ambiente de login comum a todos os shells e à sessão gráfica.
#
# O GNOME inicia a sessão pelo login shell do usuário. No zsh isso lê o
# ~/.zprofile, que carrega este arquivo; o bash o lê direto. Por isso PATH e
# variáveis de ferramentas ficam aqui, e não no .zshrc: apps gráficos, o T3
# Code e os agentes herdam o mesmo ambiente dos terminais.
#
# Sintaxe POSIX sh: o zsh carrega este arquivo com `emulate sh`.

export DOTFILES_PROFILE_LOADED=1

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="ghostty"

# Adicionam ao PATH só diretórios que existem e ainda não estão nele.
path_prepend() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}
path_append() {
    [ -d "$1" ] || return 0
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}

# Android SDK. Fica no fim do PATH, depois do /usr/bin/adb do sistema.
export ANDROID_HOME="$HOME/Android/Sdk"
path_append "$ANDROID_HOME/cmdline-tools/latest/bin"
path_append "$ANDROID_HOME/platform-tools"

# Flutter e OpenCode
path_prepend "$HOME/flutter/bin"
path_prepend "$HOME/.opencode/bin"

# Node: versão mais recente instalada pelo nvm, sem carregar o nvm.sh (que
# custa ~0,35 s por shell). Equivale ao alias default `lts/*` enquanto só houver
# versões LTS instaladas. O .zshrc carrega o nvm com --no-use, então `nvm use`
# e .nvmrc continuam funcionando no terminal.
export NVM_DIR="$HOME/.config/nvm"
if [ -d "$NVM_DIR/versions/node" ]; then
    path_prepend "$(printf '%s\n' "$NVM_DIR"/versions/node/v* | sort -V | tail -n 1)/bin"
fi

# SDKMAN é a única fonte do Java. `sdk default java <versão>` troca o padrão, e
# com sdkman_auto_env=true o .sdkmanrc de cada projeto troca ao entrar na pasta.
export SDKMAN_DIR="$HOME/.sdkman"
if [ -d "$SDKMAN_DIR/candidates/java/current" ]; then
    export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
fi
for candidate in "$SDKMAN_DIR"/candidates/*/current; do
    path_prepend "$candidate/bin"
done
unset candidate

# Scripts deste repositório e binários do usuário (gh, glab, uv, claude, codex...)
path_prepend "$HOME/dotfiles/scripts"
path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"

export PATH
unset -f path_prepend path_append

# O bash de login não lê o .bashrc sozinho. Só em login: quando é o .bashrc
# que carrega este arquivo, carregá-lo de volta repetiria o .bashrc inteiro.
if [ -n "$BASH_VERSION" ] && shopt -q login_shell && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
