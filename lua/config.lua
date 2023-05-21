vim.cmd('set nocompatible')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')
vim.cmd('set relativenumber')
vim.cmd('colorscheme embark')
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.cmd [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]

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
vim.opt.termguicolors = true

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
