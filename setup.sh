#/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
GITLIST="
.vim
.vimrc
.zshrc
.tmux.conf
.bin
"

# セットアップスクリプトがあるパスの取得
DOTFILES_PATH=$(cd $(dirname $0);pwd)

# binディレクトリのファイルに実行権限を与える
chmod +x ${DOTFILES_PATH}/.bin/*

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in ${GITLIST};
do
	rm -fr ~/${FILE}
	ln -s ${DOTFILES_PATH}/${FILE} ~/${FILE}
done

# Vundle更新
cd ${DOTFILES_PATH}
git submodule init
git submodule update
