#/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
GITLIST="
.vim
.vimrc
.zshrc
.tmux.conf
"

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in ${GITLIST};
do
	rm -fr ~/${FILE}
	ln -s ~/.dotfiles/${FILE} ~/${FILE}
done

# Vundle更新
cd ~/.dotfiles
git submodule init
git submodule update
