vim.cmd('set nocompatible')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')
vim.cmd('set relativenumber')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- setup custom github theme
require('github-theme').setup({
  options = {
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
  },
  specs = {
	github_dark_high_contrast = {
		syntax = {
			field = "white"
		},
	},
  },
  palettes = {
	github_dark_high_contrast = {
		canvas = {
			default = '#0d1117',
			overlay = '#161b22',
			inset = '#010409',
			subtle = '#161b22',
		},
		border = {
			default = '#30363d',
			muted = '#21262d',
			subtle = '#f0f6fc',
		},
	},
},
})

-- setup must be called before loading
vim.cmd('colorscheme github_dark_high_contrast')

require('lualine').get_config()
require('lualine').setup()

-- system clipboard copy
vim.api.nvim_set_keymap('n', '*y', 'y', { noremap = true })

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "vim", "vimdoc", "go", "typescript", "python", "tsx"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
}

-- rebinds
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })


-- Find files using Telescope command-line sugar.
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

-- keybinds
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>,', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>.', '<Cmd>BufferNext<CR>', { silent = true })

-- Map <CR> to clear search highlighting and trigger newline
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true })

-- Mappings for Coc.nvim
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- show coc docs
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- write commands
vim.api.nvim_set_keymap('n', '<Leader>w', '<Esc>:w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>q', '<Esc>:wq<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>qq', '<Esc>:wqa<CR>', { noremap = true })

-- buffer move
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
