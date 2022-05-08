vim.cmd [[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]]

-- Set colorscheme defaults (order is important)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
-- Note, this does not set the background, it merely tells git
-- whether the background is light/dark
vim.o.background = 'dark'
vim.cmd [[colorscheme gruvbox]]

-- Set status bar settings
vim.g.lightline = {
  colorscheme = 'gruvbox',
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
