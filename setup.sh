#/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
GITLIST="
.vim
.vimrc
.zshrc
.gitconfig
.tmux.conf
"

# セットアップスクリプトがあるパスの取得
DOTFILES_PATH=$(cd $(dirname $0);pwd)
BIN_PATH=$DOTFILES_PATH/bin

# binディレクトリ生成
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
# binファイルコピー
BIN_FILES=`ls $BIN_PATH`
for FILE in $BIN_FILES;
do
    if [ -f ~/bin/$FILE ]; then
        echo $FILE is already exist.
    else
        cp $BIN_PATH/$FILE ~/bin/
    fi
done

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in $GITLIST;
do
	rm -fr ~/$FILE
	ln -s $DOTFILES_PATH/$FILE ~/$FILE
done

# Vundle更新
cd $DOTFILES_PATH
git submodule init
git submodule update
