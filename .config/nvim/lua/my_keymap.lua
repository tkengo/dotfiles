function keymap(mode, key, action, option)
  vim.api.nvim_set_keymap(mode, key, action, option)
end

vim.cmd[[
cnoremap <C-A> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Right><C-h>
]]

keymap('n', 'S', ':w<CR>', { noremap = true, silent = true })
keymap('n', 'Q', ':qa<CR>', { noremap = true, silent = true })
keymap('n', 'j', 'gj', { noremap = true, silent = true })
keymap('n', 'k', 'gk', { noremap = true, silent = true })
keymap('n', '<C-k><C-k>', ':nohlsearch<CR><Esc>', { noremap = true, silent = true })
keymap('n', '<Leader>cp', 'gg"*yG', { noremap = true, silent = true })
keymap('n', '<C-h>', 'g^', { noremap = true, silent = true })
keymap('n', '<C-l>', 'g$', { noremap = true, silent = true })
keymap('n', '<Leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
keymap('n', 'm', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
keymap('n', 'U', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
keymap('n', '<Leader><C-r>', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })
keymap('n', '<Leader><C-d>', ':bd<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>d', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
keymap('n', 'ciy', 'ciw<C-r>0<ESC>:let @/=@"<CR>:noh<CR>', { noremap = true, silent = true })
keymap('n', '<Leader>s', ':HopChar2<CR>', { noremap = true, silent = true })
keymap('n', '<C-n>', ':HopLine<CR>', { noremap = true, silent = true })

keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
keymap('i', '<C-f>', '<Right>', { noremap = true, silent = true })
keymap('i', '<C-b>', '<Left>', { noremap = true, silent = true })
keymap('i', '<C-d>', '<Right><C-h>', { noremap = true, silent = true })

keymap('v', '<Leader>cp', '"*y', { noremap = true, silent = true })
keymap('v', '<C-j>', '<Plug>(textmanip-move-down)', { noremap = false, silent = true })
keymap('v', '<C-k>', '<Plug>(textmanip-move-up)', { noremap = false, silent = true })
keymap('v', '<C-h>', '<Plug>(textmanip-move-left)', { noremap = false, silent = true })
keymap('v', '<C-l>', '<Plug>(textmanip-move-right)', { noremap = false, silent = true })
