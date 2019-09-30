#!/bin/bash

# List of symlinks.
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
.hammerspoon
.config
"

# Get the path of this script, and move there.
BASE_DIR=$(cd $(dirname $0);pwd)
cd $BASE_DIR

# Symlinks.
for FILE in $SYMLINK_LIST; do
    rm -fr ~/$FILE
    ln -s $BASE_DIR/$FILE ~/$FILE
done

if [ "$1" != '--skip-package-install' ]; then
    if [ `uname` == 'Darwin' ]; then
        # Do Nothing
        echo Darwing Setup
    elif [[ -f /etc/debian_version ]]; then
        # For Debian destribution.
        sudo apt-get install -y vim tig tmux zsh global ctags
    else
        # Any other Linux destribution.
        sudo rpm -ivh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
        sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
        sudo yum install -y vim tig tmux zsh direnv global ctags
    fi
fi

git submodule init
git submodule update

vim +:BundleInstall +:qa
cd ~/.vim/bundle/vimproc && make

echo Complete setup.sh
