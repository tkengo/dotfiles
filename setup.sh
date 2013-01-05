#/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
SYMLINK_LIST="
.vim
.vimrc
.zshrc
.gitconfig
.tmux.conf
"

# セットアップスクリプトがあるパスの取得
DOTFILES_PATH=$(cd $(dirname $0);pwd)
BIN_PATH=$DOTFILES_PATH/bin

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in $SYMLINK_LIST;
do
	rm -fr ~/$FILE
	ln -s $DOTFILES_PATH/$FILE ~/$FILE
done

# Vundle更新
cd $DOTFILES_PATH
git submodule init
git submodule update
