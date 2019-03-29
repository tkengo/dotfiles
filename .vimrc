"-----------------------------
" Vundle
"-----------------------------
set nocompatible
filetype off

set rtp+=~/.dotfiles/vundle/
call vundle#rc()

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle "Shougo/neosnippet-snippets"
Bundle 'Shougo/vimproc'
Bundle 'surround.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 't9md/vim-textmanip'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'isRuslan/vim-es6'
Bundle 'JavaScript-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tomtom/tcomment_vim'
Bundle 'tmhedberg/matchit'
Bundle 'ruby-matchit'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'h1mesuke/vim-alignta'
Bundle 'basyura/unite-rails'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/emmet-vim'
Bundle 'csexton/trailertrash.vim'
Bundle 'slim-template/vim-slim'
Bundle 'monochromegane/unite-yaml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/gtags.vim'
Bundle 'rcmdnk/vim-markdown'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-perl/vim-perl'
Bundle 'fatih/vim-go'
Bundle 'itchyny/lightline.vim'
Bundle 'chr4/nginx.vim'
Bundle 'autowitch/hive.vim'
Bundle 'othree/yajs.vim'
Bundle 'maxmellon/vim-jsx-pretty'

Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-line'
Bundle 'kana/vim-textobj-underscore'
Bundle 'kana/vim-textobj-datetime'
Bundle 'deris/vim-textobj-enclosedsyntax'
Bundle 'h1mesuke/textobj-wiw'

filetype plugin indent on

"-----------------------------
" basic configuration
"-----------------------------
syntax on
colorscheme my

" http://www15.ocn.ne.jp/~tusr/vim/options_help.html
set t_Co=256
set number
set laststatus=2
set showmode " 現在のモードを表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
set hlsearch
set cursorline
set hidden
set noswapfile
set nobackup
set writebackup
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nowrap
set vb t_vb=
set ambiwidth=double
set fileencodings=utf-8,euc-jp,cp932,sjis
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる

au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rake set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.cap set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.coffee  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.json  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.py  set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.c  set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.cpp set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.h  set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.tt setf tt2html
au BufNewFile,BufRead *.pm  set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.tt  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tt2html  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.hql set filetype=hive expandtab
au BufNewFile,BufRead *.html  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.scss  set nowrap tabstop=2 shiftwidth=2

" IBus control by Python
let IM_CtrlIBusPython = 1

"-----------------------------
" Plugin configuration
"-----------------------------

au FileType vimfiler nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\)* \zs

au FileType unite nnoremap <silent><buffer><expr> e unite#do_action("open")

let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_ignore_pattern='\(^\.\|\~$\|\.pyc$\|\.[oad]$\|__pycache__\|\.retry$\)'

let g:neocomplcache_enable_at_startup=1

let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="-"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

let g:syntastic_delayed_redraws=0
let g:syntastic_python_checkers = ['pylint']

let g:vim_markdown_folding_disabled=1
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of'}
let g:go_version_warning=0

"-----------------------------
" key binding
"-----------------------------
nnoremap <silent> <C-k><C-k> :nohlsearch<CR><Esc>
nnoremap <silent> ,<C-d> :bd<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let @/=@"<CR>:noh<CR>
nnoremap <silent> m :e .<CR>
nnoremap ,<C-r> :source ~/.vimrc<CR>
nnoremap <silent> S :w<CR>
nnoremap Q :qa<CR>
nnoremap Y y$
nnoremap <C-h> g^
nnoremap <C-l> g$
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap j gj
nnoremap k gk
nnoremap $ g$
inoremap <C-e> <Down>
inoremap <C-y> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Right><C-h>
inoremap <C-c> <C-[>
inoremap <C-j> <C-r>=IMState('FixMode')<CR>
cmap <C-a> <Home>
cmap <C-f> <Right>
cmap <C-b> <Left>
cmap <C-d> <Right><C-h>

" gtags.vim
nnoremap <C-g> :Gtags
nnoremap g<C-f> :Gtags -f %<CR>
nnoremap g<C-r> :Gtags -r %<CR>
nnoremap g<C-j> :GtagsCursor<CR>
nnoremap g<C-n> :cn<CR>
nnoremap g<C-p> :cp<CR>

" unite
call unite#custom#source('buffer', 'converters', ['converter_file_directory'])
nnoremap <silent> U :Unite buffer<CR>

" Vundle
nnoremap ,bi :BundleInstall<CR>
nnoremap ,bu :BundleInstall!<CR>
nnoremap ,bc :BundleClean<CR>

" EasyMotion
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
nmap s <Plug>(easymotion-s2)
nmap / <Plug>(easymotion-sn)
nmap zk -k
nmap zj -j
nmap zw -w
nmap zb -b
vmap zk -k
vmap zj -j
vmap zw -w
vmap zb -b

" textmanip
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)

" neocomplcache
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/snippets'

" unite-yaml
let g:unite_yaml_prefix = "Settings."
nnoremap <silent> ,y  :<C-u>Unite yaml-list<CR>
nnoremap <silent> ,Y  :<C-u>UniteResume yaml-buffer<CR>

" vim-indent-guides
nmap ,<C-i> <Leader>ig

"-----------------------------
" Local configuration
"-----------------------------
" Read local vimrc if it exists.
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
