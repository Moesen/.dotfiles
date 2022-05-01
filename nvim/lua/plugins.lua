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

vim.call('plug#end')
