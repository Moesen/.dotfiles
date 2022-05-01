-- vim.wo.colorcolumn = '80'
-- vim.bo.filetype = 'lua'

-- with vim.opt we can set global, window and buffersettings
-- works like :set in .vim

-- buffer-scoped
vim.opt.autoindent = true
-- window-scoped vim.opt.cursorline = true

-- global scope
vim.opt.autowrite = true

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Set highlight on search, will remove highlight after search
vim.o.hlsearch = false

-- Make relative line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable mouse mode
-- vim.o.mouse = 'a'

-- Enable break indent
-- The thing that makes level indents when making newline inside parenthesis
vim.o.breakindent = true

-- Case insensitive searching unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme defaults (order is important)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
-- Note, this does not set the background, it merely tells git
-- whether the background is light/dark
vim.o.background = 'dark'
vim.cmd [[colorscheme default]]

-- Set status bar settings, throws errors if moonfly not installed
vim.g.lightline = {
  colorscheme = 'moonfly',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Highlight on yank. Do nice highlight blink
vim.api.nvim_exec(
	[[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	]],
	false
)

-- Y yank until the end of the line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

