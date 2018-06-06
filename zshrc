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

zstyle :compinstall filename '/home/monstar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd notify
bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '^R' history-incremental-search-backward


alias open=xdg-open
export EDITOR=nvim

export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$HOME/go/bin:$PATH
prompt skwp

# export GDK_DPI_SCALE=1.0

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	# XKB_DEFAULT_LAYOUT=us,ru XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle exec sway
	# awesome
	# startx
	startx -- -dpi 287 -keeptty -nolisten tcp &>! $HOME/.xorg.log
fi
