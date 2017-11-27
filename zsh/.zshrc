# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/dotfiles/zsh_custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="axelhodler"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

source ~/dotfiles/zsh/aliases_files/git
source ~/dotfiles/zsh/aliases
source ~/dotfiles/scripts/helper_functions.sh
source ~/dotfiles/scripts/ethereum_helper_functions.sh

# switch between versions
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# export JAVA_HOME=`/usr/libexec/java_home -v 9`
export JAVA_HOME=$(/usr/libexec/java_home)

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# add ~/bin folder
export PATH="/Users/axel/bin:$PATH"

# haskell stuff
export PATH="/Users/axel/.local/bin:$PATH"

export GOPATH="$HOME/go"

# rust
export PATH="/Users/axel/.multirust/toolchains/stable/cargo/bin:$PATH"

export NVM_DIR="/Users/axel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR='vim'
