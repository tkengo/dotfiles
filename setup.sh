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
cd $BASE_DIR

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in $SYMLINK_LIST; do
	rm -fr ~/$FILE
	ln -s $BASE_DIR/$FILE ~/$FILE
done

if [ `uname` == 'Darwin' ]; then
    # homebrewのインストール
    which brew > /dev/null 2>&1
    if [ $? -eq 1 ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    fi

    # Brewfileをもとに全部インストール
    brew bundle
else
    sudo yum install git tig tmux zsh direnv global
fi

# zshをログインシェルに変更
ZSH_PATH=$(which zsh)
SHELLS_PATH=/etc/shells
if [ -z "`cat $SHELLS_PATH | grep $ZSH_PATH`" ]; then
    sudo sh -c "echo $ZSH_PATH >> $SHELLS_PATH"
fi
if [ $SHELL != $ZSH_PATH ]; then
    chsh -s $ZSH_PATH
fi

# rbenvのインストール
if [ ! -d ~/.rbenv ]; then
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
fi

# ruby-buildのインストール
if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# Vundle更新
git submodule init
git submodule update

echo Complete setup.sh
