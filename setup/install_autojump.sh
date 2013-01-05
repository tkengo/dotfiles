#!/bin/bash

# 既にインストール済みであれば何もしない
[ -d ~/.autojump ] && echo autojump already has installed. && exit 0

# autojumpインストール
cd `dirname $0`
git clone git://github.com/joelthelion/autojump.git
cd autojump && chmod +x install.sh && ./install.sh && cd .. && rm -fr autojump
