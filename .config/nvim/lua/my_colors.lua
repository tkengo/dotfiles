-- キャプチャに対するハイライトのマッピングはここ
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/highlight.lua
-- 2022年10月頃にBreaking Changesが入った。上にリンクのハイライトマッピングは消えました。
-- https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f#commitcomment-87014462
-- Breaking Changesについて
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2293#issuecomment-1279974776

vim.cmd[[
hi Keyword guifg=#5a8de0
hi KeywordReturn guifg=#5a8de0
hi Conditional guifg=#5a8de0
hi Symbol guifg=#b27af5 gui=bold
hi MyNormal guifg=#cccccc
hi PropertyKey guifg=#a687c9
hi Boolean guifg=#f04357 gui=bold
hi FunctionCallNoArgs guifg=#cccccc
hi KeywordConst guifg=#ffc13b
hi KeywordRSpec guifg=#9898d9
hi link TagAttribute BlueItalic
hi Include guifg=#c7eb44
hi String guifg=#ba7956
hi Comment guifg=#3e9c5b
hi VariableBuiltin guifg=#f39660 gui=bold
]]

vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.return", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@conditional", { link = "Conditional" })
vim.api.nvim_set_hl(0, "@operator", { link = "MyNormal" })
vim.api.nvim_set_hl(0, "@symbol", { link = "Symbol" })
vim.api.nvim_set_hl(0, "@property", { link = "MyNormal" })
vim.api.nvim_set_hl(0, "@property.key", { link = "PropertyKey" })
vim.api.nvim_set_hl(0, "@keyword.const", { link = "KeywordConst" })
vim.api.nvim_set_hl(0, "@keyword.rspec", { link = "KeywordRSpec" })
vim.api.nvim_set_hl(0, "@boolean", { link = "Boolean" })
vim.api.nvim_set_hl(0, "@function.call.noargs", { link = "FunctionCallNoArgs" })
vim.api.nvim_set_hl(0, "@string", { link = "String" })
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "VariableBuiltin" })
vim.api.nvim_set_hl(0, "@include", { link = "Include" })
