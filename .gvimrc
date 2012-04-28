"===========================================================================
" Vundle設定
"===========================================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" プラグイン一覧
Bundle 'gmarik/vundle'
Bundle 'unite.vim'

" Vundleコマンドキーマップ
nnoremap ,bi :BundleInstall<CR>
nnoremap ,bu :BundleInstall!<CR>
nnoremap ,bc :BundleClean<CR>

filetype plugin indent on

"===========================================================================
" 基本設定
"===========================================================================
" カラースキーマ
colorscheme my
" 行番号を表示
set number
" メニューバーとツールバーを非表示
set guioptions-=m
set guioptions-=T
" ステータスラインを2行表示
set laststatus=2

" バッファを保存しなくても別のバッファを開ける
set hidden
" スワップファイルを作らない
set noswapfile
" バックアップを作らない
set nobackup
" ファイル保存直前にはバックアップを作って保存に成功したらバックアップを消す
set writebackup
" インクリメンタルサーチ
set incsearch
" タブ幅はスペース4つ分
set tabstop=4
set shiftwidth=4
" タブをスペースに展開しない
set noexpandtab
" オートインデント
set autoindent
set smartindent

"----------------------------------------------------------------------------
" GUI settings
" 通常時は箱型、挿入時は棒型
set guicursor=n-v-c:blinkwait500-blinkoff300-blinkon500-ver100,i:ver10
" フォントの設定
set guifont=VL\ Gothic\ 10
" 最大化で起動する
set columns=1024
set lines=900
"=========================
" キーマップ
"=========================
nnoremap <C-k><C-k> :nohlsearch<CR><Esc>

"=========================
" プラグイン設定
"=========================
"-------------------------
" cake.vimの設定
"-------------------------
let g:cakephp_enable_fix_mode=1
let g:cakephp_app="~/collective/app/"
nnoremap <Space>cc :<C-u>Ccontroller 
nnoremap <Space>cm :<C-u>Cmodel 
nnoremap <Space>cv :<C-u>Cview 
nnoremap <Space>cl :<C-u>Clog 
nnoremap <Space>ccv :<C-u>Ccontrollerview 
nnoremap <Space>ccm :<C-u>Ccomponent 
nnoremap <Space>ccf :<C-u>Cconfig 
nnoremap <Space>cb :<C-u>Cbehavior 
nnoremap <Space>ch :<C-u>Chelper 
nnoremap <Space>ct :<C-u>Ctest 
nnoremap <Space>cf :<C-u>Cfixture 
nnoremap <Space>cs :<C-u>Cshell 
"-------------------------
" unite.vimの設定
"-------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,fb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,fr :<C-u>Unite file_mru<CR>
