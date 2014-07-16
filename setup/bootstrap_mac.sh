#!/bin/bash

# macでなければなにもしない
[ `uname` != 'Darwin' ] && exit 0

# homebrewのインストール
which brew > /dev/null 2>&1
if [ $? -eq 1 ]; then
    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/aereal/master/Library/Contributions/install_homebrew.rb)"
fi

# zshをログインシェルに変更
ZSH_PATH=/usr/local/bin/zsh
SHELLS_PATH=/etc/shells
if [ -z "`cat $SHELLS_PATH | grep $ZSH_PATH`" ]; then
    echo To add zsh to $SHELLS_PATH as standard shell please enter $USERNAME password.
    sudo sh -c "echo $ZSH_PATH >> $SHELLS_PATH"
fi
if [ $SHELL != $ZSH_PATH ]; then
    echo To change $USERNAME login shell to zsh please enter $USERNAME password.
    chsh -s $ZSH_PATH
    echo Complete changing login shell. Please relogin.
fi
