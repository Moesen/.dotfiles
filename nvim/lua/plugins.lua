-- PLUGINS
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Easier way of manipulating text objects
-- https://github.com/wellle/targets.vim
--Plug 'wellle/targets.vim'

-- Comment and uncomment stuff
-- tpope/vim-commentary
Plug 'tpope/vim-commentary'
-- https://github.com/tpope/vim-surround
-- Creating characters around surrounding text
-- Check :help surround for more info
Plug 'tpope/vim-surround'

-- Implements repeat (.) for non-native calls
Plug 'tpope/vim-repeat'

-- Everforest colortheme
Plug 'sainnhe/everforest'

-- Vimposter - Tmux integration
Plug 'vimpostor/vim-tpipeline'

-- Lightline plugin
-- Plug 'itchyny/lightline.vim'

-- LaTeX suite for everything
Plug 'lervag/vimtex'

-- Indentation marker for each indentation
Plug 'Yggdroot/indentLine'
-- ### This plugin introduces some weird behavior in md files###
-- ### Line below fixes this ###
vim.g.indentLine_fileTypeExclude = {"markdown"}


-- Switching between windows. Can distinguish between vim
-- and tmux if tmux conf keystrokes are added as well
-- checkout repo for more information
-- https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

-- Plugin for integrating vim into tmux

-- Showing colors for hex and color valuse
-- Use ToggleColor to turn on and off
Plug 'chrisbra/colorizer'

-- Debugger for vim
-- Plug 'puremourning/vimspector'

-- Coc - Language Server
Plug('neoclide/coc.nvim', {branch = 'release'})
-- Coc specific options added here for more clarity
-- Time before generally before updated
-- Especially nice for coc updates
vim.opt.updatetime=300

-- Don't pass messages to |ins-completion-menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn='number'

Plug('psf/black', {branch='stable'})

-- Indented lines
Plug 'lukas-reineke/indent-blankline.nvim'

-- Tree file explorer
Plug 'preservim/nerdtree'

-- Python executor nvim
Plug 'is0n/jaq-nvim'

vim.call('plug#end')
