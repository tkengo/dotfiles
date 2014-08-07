#!/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
SYMLINK_LIST="
.vim
.vimrc
.zshrc
.gitconfig
.tmux.conf
.muttrc
.lscolorrc
.tmux-powerlinerc
"

# セットアップスクリプトがあるパスの取得
BASE_DIR=$(cd $(dirname $0);pwd)

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in $SYMLINK_LIST; do
	rm -fr ~/$FILE
	ln -s $BASE_DIR/$FILE ~/$FILE
done

# Vundle更新
cd $BASE_DIR
git submodule init
git submodule update


echo Complete setup.sh
