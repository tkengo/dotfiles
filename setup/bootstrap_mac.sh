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
zsh
"
for FORMULA in $FORMULAS; do
    [ ! -L /usr/local/bin/$FORMULA ] && brew install $FORMULA
done
