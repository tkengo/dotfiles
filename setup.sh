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
"

# セットアップスクリプトがあるパスの取得
DOTFILES_PATH=$(cd $(dirname $0);pwd)

# binディレクトリのファイルに実行権限付与
BIN_PATH=$DOTFILES_PATH/bin
BIN_LIST=`ls $BIN_PATH`
for FILE in $BIN_LIST; do
    chmod +x $BIN_PATH/$FILE
done

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in $SYMLINK_LIST; do
	rm -fr ~/$FILE
	ln -s $DOTFILES_PATH/$FILE ~/$FILE
done

# Vundle更新
cd $DOTFILES_PATH
git submodule init
git submodule update

# セットアップシェルの実行
SHELL_LIST=`ls setup`
for FILE in $SHELL_LIST; do
    chmod +x setup/$FILE
    sh setup/$FILE
done

echo Complete setup.sh
