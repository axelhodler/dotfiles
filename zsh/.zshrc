# Executes commands at the start of an interactive session

export EDITOR=emacs
export ANDROID_HOME=/opt/android-sdk

# disable zsh's autocorrect
unsetopt correct

source ~/dotfiles/zsh/mavenstuff

source ~/dotfiles/zsh/aliases

[ -s "/home/xorrr/.scm_breeze/scm_breeze.sh" ] && source "/home/xorrr/.scm_breeze/scm_breeze.sh"
