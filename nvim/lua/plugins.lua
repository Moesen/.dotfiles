-- PLUGINS
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Easier way of manipulating text objects
-- https://github.com/wellle/targets.vim
--Plug 'wellle/targets.vim'

-- More commands for handling brackets or other stuff surrounding txt
-- https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

-- Implements repeat (.) for non-native calls
Plug 'tpope/vim-repeat'

-- THEMES AND COLORS
-- Example of the do function in lua
-- Plug('VonHeikemen/rubber-themes.vim', {
--   ['do'] = function()
--     vim.opt.termguicolors = true
--     vim.cmd('colorscheme rubber')
--   end
-- })

-- Another colorscheme
--Plug 'drewtempelmeyer/palenight.vim'
--Plug 'itchyny/lightline.vim'	
--Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'

-- LaTeX suite for everything
Plug 'lervag/vimtex'

-- Indentation marker for each indentation
Plug 'Yggdroot/indentLine'

-- Syntax check
--Plug 'w0rp/ale'

-- CSS-color hihglight
-- Only works for css
-- Plug "ap/vim-css-color"

-- Colorizer
Plug 'chrisbra/colorizer'

-- Coc - Language Server
Plug('neoclide/coc.nvim', {branch = 'release'})
-- Coc specific options added here for more clarity
-- Time before generally before updated
-- Especially nice for coc updates
vim.opt.updatetime=300
-- Don't pass messages to |ins-completion-menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn='number'


vim.call('plug#end')
