"===========================================================================
" Vundle設定
"===========================================================================
set nocompatible
filetype off

set rtp+=~/.dotfiles/vundle/
call vundle#rc()

" プラグイン一覧
Bundle 'unite.vim'
Bundle 'violetyk/cake.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'surround.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 't9md/vim-textmanip'
Bundle 'ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'JavaScript-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tomtom/tcomment_vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'ruby-matchit'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'h1mesuke/vim-alignta'

" Vundleコマンドキーマップ
nnoremap ,bi :BundleInstall<CR>
nnoremap ,bu :BundleInstall!<CR>
nnoremap ,bc :BundleClean<CR>

filetype plugin indent on

"===========================================================================
" 基本設定
"===========================================================================
" カラースキーマ
syntax on
set t_Co=256
colorscheme my
" 行番号を表示
set number
" メニューバーとツールバーを非表示
set guioptions-=m
set guioptions-=T
" ステータスラインを2行表示
set laststatus=2
" 検索語をハイライトするよう
set hlsearch
" カレント行のハイライト
set cursorline

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
" Rubyの場合はタブ幅2つ
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
" タブをスペースに展開しない
set noexpandtab
" オートインデント
set autoindent
set smartindent
" 折り返さない
set nowrap
" 高速化
set ttyfast
set lazyredraw

" 文字コード自動認識
set fileencodings=utf-8,euc-jp,cp932,sjis

"=========================
" キーバインド
"=========================
" 検索語のハイライトを解除
nnoremap <C-k><C-k> :nohlsearch<CR><Esc>
" 前後のバッファへ移動
nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
" バッファ削除
nnoremap ,<C-d> :bd<CR>
" 日本語入力固定モード切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1
imap <C-c> <C-[>
" ヤンクした文字列で単語を置換
nnoremap <silent> ciy ciw<C-r>0<ESC>:let @/=@"<CR>:noh<CR>
" シェルと同じようにC-fとC-bで前後に移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Right><C-h>

"=========================
" プラグイン設定
"=========================
"-------------------------
" cake.vimの設定
"-------------------------
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
" バッファ一覧
nnoremap <silent> ,fb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,fr :<C-u>Unite file_mru<CR>
" /でインクリメンタルサーチ
autocmd FileType vimfiler nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\) \zs
"-------------------------
" VimFilerの設定
"-------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
"-------------------------
" neocomplcacheの設定
"-------------------------
" 起動時にneocomplcacheを有効化
let g:neocomplcache_enable_at_startup=1
" 自作スニペットディレクトリ
let g:NeoComplCache_SnippetsDir = $HOME . '/.vim/snippets'
" Tabキーでスニペット展開するように
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"-------------------------
" easymotionの設定
"-------------------------
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" <Leader>を;にキーにマップ
let g:EasyMotion_leader_key="K"
" 1ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
"-------------------------
" vim-textmanipの設定
"-------------------------
" 選択したテキストの移動
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)

"===========================================================================
" マシン固有の設定
"===========================================================================
" マシン固有の設定は.vimrc.localに用意して読み込む
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
