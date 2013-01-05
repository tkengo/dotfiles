#!/bin/bash

# macでなければなにもしない
[ `uname` != 'Darwin' ] && exit 0

# homebrewのインストール
if [ ! -x $(/usr/bin/which brew) ]; then
    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/aereal/master/Library/Contributions/install_homebrew.rb)"
fi

# homebrew最新化
brew install git
brew update

# 使うライブラリのインストール
brew install tig tmux
brew install reattach-to-user-namespace
