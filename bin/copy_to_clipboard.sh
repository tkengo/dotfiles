# クリップボードに引数で指定されたファイルの中身をコピーする

# ファイルが存在しなければなにもしない
[ ! -f $1 ] && exit 0

if [ `uname` = 'Darwin' ]; then
    cat $1 | reattach-to-user-namespace pbcopy
else
    xsel -i -b < $1
fi
