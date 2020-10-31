#!/bin/sh
# put this in /etc/profile.d

export VISUAL=vim
export EDITOR=$VISUAL

export PATH=${NODE_OS_HOME}/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/npm/bin:$HOME/.local/bin:$PATH
