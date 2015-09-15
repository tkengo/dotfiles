#!/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
SYMLINK_LIST="
.vim
.vimrc
.ideavimrc
.zshrc
.gitconfig
.tmux.conf
.muttrc
.lscolorrc
.tmux-powerlinerc
.gemrc
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
    sudo rpm -ivh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
    sudo rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    sudo yum install -y vim tig tmux zsh direnv global --enablerepo=rpmforge
fi

# Vundle更新
git submodule init
git submodule update

echo Complete setup.sh
