#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# disable zsh's autocorrect
unsetopt correct

source ~/dotfiles/zsh/zpreztorc

source ~/dotfiles/zsh/aliases

source ~/dotfiles/scripts/helper_functions.sh
