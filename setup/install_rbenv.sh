#!/bin/bash

# rbenvのインストール
if [ ! -d ~/.rbenv ]; then
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
fi

# ruby-buildのインストール
if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi
