vim.cmd [[packadd packer.nvim]]

vim.opt.termguicolors = true

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'kylechui/nvim-surround'
  use 't9md/vim-textmanip'
  use 'numToStr/Comment.nvim'
  -- use 'tpope/vim-rails'
  -- use 'neoclide/vim-jsx-improve'
  use 'maxmellon/vim-jsx-pretty'
  use 'lewis6991/gitsigns.nvim'
  use 'phaazon/hop.nvim'
  use 'kevinhwang91/nvim-fFHighlight'
  use 'folke/which-key.nvim'
  use 'chrisbra/csv.vim'
  use 'bronson/vim-trailing-whitespace'

  -- Tree-sitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'sainnhe/sonokai'
  use 'EdenEast/nightfox.nvim'
  use 'glepnir/zephyr-nvim'
  -- use 'p00f/nvim-ts-rainbow'
  use 'andymass/vim-matchup'
  use 'nvim-treesitter/playground'

  -- Filer
  use 'kyazdani42/nvim-tree.lua'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'

  -- Fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'
end)

require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })
local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

require('telescope').load_extension('fzf')
require('telescope').setup {
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true
    }
  }
}
require("nvim-tree").setup {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'm', action = '' },
        { key = 'l', action = 'edit' },
        { key = 'h', action = 'close_node' },
        { key = '<CR>', action = 'cd' },
        { key = '<C-e>', action = '' },
        { key = '.', action = 'toggle_dotfiles' },
        { key = 'H', action = '' },
        { key = 'L', action = '' },
      },
    },
    float = {
      enable = true,
      open_win_config = {
        height = 200,
      }
    }
  },
  renderer = {
    icons = {
      show = {
        git = false,
      },
    }
  }
}
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    -- disable = { 'ruby', 'javascript' }
    disable = true
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'ruby',
    'query',
    'json',
    'markdown',
    'lua',
    'hcl'
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = nil,
  -- },
  matchup = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
-- require('nvim-treesitter.highlight').set_custom_captures {
--   ['property.key'] = 'TSPropertyKey',
--   ['function.call.noargs'] = 'TSFunctionCallNoArgs',
--   ['keyword.const'] = 'TSKeywordConst',
--   ['keyword.rspec'] = 'TSKeywordRSpec',
-- }
require('lualine').setup {
  sections = {
    lualine_b = {'diff'},
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
  }
}
require('nvim-surround').setup()
require('Comment').setup()
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 300,
    ignore_whitespace = false,
  },
}
require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
require('fFHighlight').setup()
require('which-key').setup()
require('colorizer').setup()

vim.cmd[[
colorscheme sonokai

hi fFHintChar guifg=yellow gui=bold
hi fFHintNumber guifg=yellow gui=bold
hi fFHintWords cterm=underline gui=underline
hi link fFHintCurrentWord fFHintWords
hi fFPromptSign guifg=yellow gui=bold

set updatetime=300
hi LspReferenceText  gui=NONE guifg=white guibg=#444444
hi LspReferenceRead  gui=NONE guifg=white guibg=#444444
hi LspReferenceWrite gui=NONE guifg=white guibg=#444444
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI ruby.javascript.typescript lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI ruby.javascript.typescript lua vim.lsp.buf.clear_references()
augroup END
]]

vim.g.mapleader = ','
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'

require('my_colors')
require('my_keymap')
