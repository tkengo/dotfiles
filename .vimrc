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
Bundle 'Shougo/vimproc'
Bundle 'surround.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 't9md/vim-textmanip'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'JavaScript-syntax'
Bundle 'tpope/vim-rails'
Bundle 'tomtom/tcomment_vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'ruby-matchit'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'h1mesuke/vim-alignta'
Bundle 'basyura/unite-rails'
Bundle 'scrooloose/syntastic'
Bundle 'csexton/trailertrash.vim'
Bundle 'slim-template/vim-slim'
Bundle 'monochromegane/unite-yaml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/gtags.vim'
Bundle 'rcmdnk/vim-markdown'

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
set hlsearch
set cursorline
set hidden
set noswapfile
set nobackup
set writebackup
set incsearch
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent
set nowrap
set vb t_vb=
set fileencodings=utf-8,euc-jp,cp932,sjis

au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rake set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.cap set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.coffee  set nowrap tabstop=2 shiftwidth=2

" IBus control by Python
let IM_CtrlIBusPython = 1

"-----------------------------
" Plugin configuration
"-----------------------------

au FileType vimfiler nnoremap <buffer> / /^\s*\(\|-\\|\|+\\|+\\|-\)* \zs

au FileType unite nnoremap <silent><buffer><expr> e unite#do_action("open")

let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

let g:neocomplcache_enable_at_startup=1

let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="-"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

let g:syntastic_delayed_redraws=0

let g:vim_markdown_folding_disabled=1

"-----------------------------
" key binding
"-----------------------------
nnoremap <silent> <C-k><C-k> :nohlsearch<CR><Esc>
nnoremap <silent> ,<C-d> :bd<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let @/=@"<CR>:noh<CR>
nnoremap <silent> m :e .<CR>
nnoremap ,<C-r> :source ~/.vimrc<CR>
nnoremap <silent> S :w<CR>
nnoremap <C-j> J
nnoremap Q :qa<CR>
nnoremap Y y$
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap Y y$
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
nnoremap g<C-l> :Gtags -f %<CR>
nnoremap g<C-j> :GtagsCursor<CR>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" unite
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
nmap K -k
nmap J -j
nmap W -w
nmap B -b
vmap K -k
vmap J -j
vmap W -w
vmap B -b

" textmanip
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)

" neocomplcache
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" unite-yaml
let g:unite_yaml_prefix = "Settings."
nnoremap <silent> ,y  :<C-u>Unite yaml-list<CR>
nnoremap <silent> ,Y  :<C-u>UniteResume yaml-buffer<CR>

"-----------------------------
" Local configuration
"-----------------------------
" Read local vimrc if it exists.
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
