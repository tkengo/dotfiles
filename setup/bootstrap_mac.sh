#!/bin/bash

# macでなければなにもしない
[ `uname` != 'Darwin' ] && exit 0

# homebrewのインストール
which brew > /dev/null 2>&1
if [ $? -eq 1 ]; then
    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/aereal/master/Library/Contributions/install_homebrew.rb)"
fi

# ライブラリのインストール
FORMULAS="
git
tig
tmux
reattach-to-user-namespace
"
for FORMULA in $FORMULAS; do
    [ -n "`brew list $FORMULA | grep 'Error: No such keg'`" ] && brew install $FORMULA
done

# homebrewを最新に更新
brew update
