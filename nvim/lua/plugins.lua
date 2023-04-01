-- PLUGINS
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- Easier way of manipulating text objects
-- https://github.com/wellle/targets.vim
--Plug 'wellle/targets.vim'


-- Obsidian stuff
-- (required)
Plug 'nvim-lua/plenary.nvim'

-- (optional) for completion:
Plug 'hrsh7th/nvim-cmp'

-- (optional) another alternative for the :ObsidianSearch and :ObsidianQuickSwitch commands:
Plug 'ibhagwan/fzf-lua'

-- (optional) for :ObsidianSearch and :ObsidianQuickSwitch commands if you prefer this over fzf.vim:
Plug 'nvim-telescope/telescope.nvim'

-- needed by 'preservim/vim-markdown'
Plug 'godlygeek/tabular'

-- (required)
Plug 'epwalsh/obsidian.nvim'

-- Comment and uncomment stuff
Plug 'tpope/vim-commentary'

-- Rust something
Plug 'rust-lang/rust.vim'

-- Mark shown
Plug 'chentoast/marks.nvim'

-- Creating characters around surrounding text
Plug 'tpope/vim-surround'

-- Implements repeat (.) for non-native calls
Plug 'tpope/vim-repeat'

-- Neonight Colorscheme
Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug 'ajmwagar/vim-deus'

-- R support
-- Plug('jalvesaq/Nvim-R', {branch = 'stable'})

-- Statusline
Plug 'feline-nvim/feline.nvim'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'

-- Gitsigns
Plug 'lewis6991/gitsigns.nvim'

-- LaTeX suite for everything
Plug 'lervag/vimtex'

-- Switching between windows. Can distinguish between vim
-- and tmux if tmux conf keystrokes are added as well
-- checkout repo for more information
-- https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

-- Vimposter - Tmux integration
-- Plug 'vimpostor/vim-tpipeline'

-- Showing colors for hex and color valuse
-- Use ToggleColor to turn on and off
-- Keybinding is ';ct'
Plug 'chrisbra/colorizer'

-- Coc - Language Server
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug 'honza/vim-snippets'


Plug('psf/black', {branch='stable'})

-- Indented lines
Plug 'lukas-reineke/indent-blankline.nvim'

-- Tree file explorer
Plug 'preservim/nerdtree'

-- Terminal for nvim
-- Plug 'caenrique/nvim-toggle-terminal'

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

-- HTML emmet plugin
Plug 'mattn/emmet-vim'

-- Vim diff tool
Plug "tpope/vim-fugitive"

vim.call('plug#end')

