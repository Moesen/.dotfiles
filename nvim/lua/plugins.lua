-- PLUGINS
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Easier way of manipulating text objects
-- https://github.com/wellle/targets.vim
--Plug 'wellle/targets.vim'

-- Comment and uncomment stuff
Plug 'tpope/vim-commentary'

-- Creating characters around surrounding text
Plug 'tpope/vim-surround'

-- Implements repeat (.) for non-native calls
Plug 'tpope/vim-repeat'

-- Wal colorscheme
-- Plug 'dylanaraps/wal.vim'

-- Neonight Colorscheme
Plug('folke/tokyonight.nvim', { branch = 'main' })

-- Vimposter - Tmux integration
Plug 'vimpostor/vim-tpipeline'

-- LaTeX suite for everything
Plug 'lervag/vimtex'

-- Switching between windows. Can distinguish between vim
-- and tmux if tmux conf keystrokes are added as well
-- checkout repo for more information
-- https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

-- Showing colors for hex and color valuse
-- Use ToggleColor to turn on and off
-- Keybinding is ';ct'
Plug 'chrisbra/colorizer'

-- Coc - Language Server
Plug('neoclide/coc.nvim', {branch = 'release'})

-- Packages
vim.g.coc_global_extensions = {'coc-json','coc-pyright','coc-css','coc-lua',"coc-pydocstring","coc-snippets"}

-- Coc specific options added here for more clarity
-- Time before generally before updated
-- Especially nice for coc updates
vim.opt.updatetime=200

-- Don't pass messages to |ins-completion-menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn='number'

Plug('psf/black', {branch='stable'})

-- Indented lines
Plug 'lukas-reineke/indent-blankline.nvim'

-- Tree file explorer
Plug 'preservim/nerdtree'

-- Terminal for nvim
Plug 'caenrique/nvim-toggle-terminal'
vim.g.open_in_insert_mode = 0

-- For markdown writing and rendering
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
-- tabular plugin is used to format tables
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

-- Extended syntax highlighting for python 
Plug "vim-python/python-syntax"

-- Better syntax for lua specifically in nvim scripting
Plug "euclidianAce/BetterLua.vim"
Plug "svermeulen/vimpeccable"

-- Vim diff tool
Plug "tpope/vim-fugitive"

vim.call('plug#end')

