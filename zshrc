
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

bindkey -v
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^R' history-incremental-search-backward

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  # echo "You are running Linux"
  HISTFILE=$HOME/.config/zshhist-linux
  if [[ -s "$HOME/.customrc" ]]; then
    source "$HOME/.customrc"
  fi

elif [[ "$unamestr" == 'Darwin' ]]; then
  # echo "You are running OSX"

  alias sftp='/usr/local/bin/sftp'
  # export NODE_OS_HOME=${HOME}/node-osx-home
  # export GOPATH=$HOME/osxgopath
  export PATH=$GOPATH/bin:$PATH
  export PATH=${HOME}/bin:$PATH
  alias emacs='HOME=~/.config/osx-spacemacs-home /Applications/Emacs.app/Contents/MacOS/Emacs'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  HISTFILE=$HOME/.config/zshhist-osx
else
  echo "Could not detect your OS"
fi

HISTSIZE=5000
SAVEHIST=5000
