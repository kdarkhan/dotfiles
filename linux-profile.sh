#!/bin/sh
# put this in /etc/profile.d

export VISUAL=vim
export EDITOR=$VISUAL

export NODE_OS_HOME=${HOME}/node-linux-home
export PATH=${NODE_OS_HOME}/bin:$PATH
export GOPATH=$HOME/gopath
export PATH=$GOPATH/bin:$PATH
export HISTFILE=$HOME/.config/zshhist-linux

