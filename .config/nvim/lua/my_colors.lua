-- キャプチャに対するハイライトのマッピングはここ
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/highlight.lua

vim.cmd[[
hi TSKeyword guifg=#5a8de0
hi TSKeywordReturn guifg=#5a8de0
hi TSConditional guifg=#5a8de0
hi TSSymbol guifg=#b27af5 gui=bold
hi TSPropertyKey guifg=#a687c9
hi TSBoolean guifg=#f04357 gui=bold
hi link TSTagAttribute BlueItalic
hi TSInclude guifg=#c7eb44
hi TSString guifg=#ba7956
hi TSComment guifg=#3e9c5b
hi TSVariableBuiltin guifg=#f39660 gui=bold
]]
