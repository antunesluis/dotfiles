# ~/.zprofile: login shell do zsh, inclusive o que inicia a sessão GNOME.
# O ambiente comum (PATH, Java, Node...) fica no ~/.profile, compartilhado
# com o bash.
emulate sh -c '. "$HOME/.profile"'
