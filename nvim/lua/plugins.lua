-- PLUGINS
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Easier way of manipulating text objects
-- https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

-- More commands for handling brackets or other stuff surrounding txt
-- https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

-- Implements repeat (.) for non-native calls
Plug 'tpope/vim-repeat'

-- Distraction-free writing in Vim
-- https://github.com/junegunn/goyo.vim
Plug('junegunn/goyo.vim', {['for'] = 'markdown'})

-- Example of the do function in lua
Plug('VonHeikemen/rubber-themes.vim', {
  ['do'] = function()
    vim.opt.termguicolors = true
    vim.cmd('colorscheme rubber')
  end
})

-- Plugin for live preview of markdown
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://github.com/iamcco/markdown-preview.nvim
-- Plug('iamcco/markdown-preview.nvim', {['do'] = function { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}")

vim.call('plug#end')
