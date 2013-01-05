#!/bin/bash

which reattach-to-user-namespace > /dev/null 2>&1
if [ $? -eq 0 ]; then
    # reattach-to-user-namespaceコマンドがインストールされていればそれを指定して起動する
    CONFIG=$(cat ~/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
    tmux -f <(echo "$CONFIG") $*
else
    # インストールされてなければ普通に起動する
    tmux $*
fi
