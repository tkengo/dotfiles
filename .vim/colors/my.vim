" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="my"

hi Normal          ctermfg=252
hi Identifier      ctermfg=98	cterm=none
hi Comment         ctermfg=47
hi StorageClass    ctermfg=228
hi String          ctermfg=131
hi Boolean         ctermfg=160
hi Conditional     ctermfg=105
hi Operator        ctermfg=105
hi Delimiter       ctermfg=107
hi Function        ctermfg=105
hi Repeat          ctermfg=27
hi Statement       ctermfg=27
hi Special         ctermfg=254
hi Visual          ctermfg=15  ctermbg=69
hi MatchParen      ctermfg=15  ctermbg=57 cterm=bold
hi CursorLine                  ctermbg=237   cterm=none



hi Character       ctermfg=144
hi Number          ctermfg=135
hi Constant        ctermfg=135               cterm=bold
hi Cursor          ctermfg=16  ctermbg=253
hi Debug           ctermfg=225               cterm=bold
hi Define          ctermfg=81

hi DiffAdd                     ctermbg=24
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=162 ctermbg=53
hi DiffText                    ctermbg=102 cterm=bold

hi Directory       ctermfg=118               cterm=bold
hi Error           ctermfg=219 ctermbg=89
hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
hi Exception       ctermfg=118               cterm=bold
hi Float           ctermfg=135
hi FoldColumn      ctermfg=67  ctermbg=16
hi Folded          ctermfg=67  ctermbg=16
hi Ignore          ctermfg=244 ctermbg=232
hi IncSearch       ctermfg=193 ctermbg=16

hi Keyword         ctermfg=161               cterm=bold
hi Label           ctermfg=229               cterm=none
hi Macro           ctermfg=193
hi SpecialKey      ctermfg=81

hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229

" complete menu
hi Pmenu           ctermfg=81  ctermbg=16
hi PmenuSel                    ctermbg=244
hi PmenuSbar                   ctermbg=232
hi PmenuThumb      ctermfg=81

hi PreCondit       ctermfg=118               cterm=bold
hi PreProc         ctermfg=118
hi Question        ctermfg=81
hi Search          ctermfg=253 ctermbg=66

" marks column
hi SignColumn      ctermfg=118 ctermbg=235
hi SpecialChar     ctermfg=161               cterm=bold
hi SpecialComment  ctermfg=245               cterm=bold

hi StatusLine      ctermfg=238 ctermbg=253
hi StatusLineNC    ctermfg=244 ctermbg=232
hi Structure       ctermfg=81
hi Tag             ctermfg=161
hi Title           ctermfg=166
hi Todo            ctermfg=231 ctermbg=232   cterm=bold

hi Typedef         ctermfg=81
hi Type            ctermfg=81                cterm=none
hi Underlined      ctermfg=244               cterm=underline

hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
hi VisualNOS                   ctermbg=238
hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
hi WildMenu        ctermfg=81  ctermbg=16

hi CursorColumn                ctermbg=234
hi ColorColumn                 ctermbg=234
hi LineNr          ctermfg=250 ctermbg=234
hi NonText         ctermfg=59
hi SpecialKey      ctermfg=59
