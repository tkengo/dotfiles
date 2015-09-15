#!/bin/bash

# zshをログインシェルに変更
ZSH_PATH=$(which zsh)
SHELLS_PATH=/etc/shells
if [ -z "`cat $SHELLS_PATH | grep $ZSH_PATH`" ]; then
    sudo sh -c "echo $ZSH_PATH >> $SHELLS_PATH"
fi
if [ $SHELL != $ZSH_PATH ]; then
    chsh -s $ZSH_PATH
fi
