vim.cmd [[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]]

-- Set colorscheme defaults (order is important)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
-- Note, this does not set the background, it merely tells git
-- whether the background is light/dark
vim.o.background = 'dark'
require('github-theme').setup({
	theme_style = "dimmed",
	function_style = "italic",
	sidebars = {"qf", "vista_kind", "terminal", "packer"},

	-- Change the hint color to the oragne color and make the error color bright red
	colors = {hint = "orange", error="#ff0000"},

	-- Overwrite the highlights groups
	overrides = function(c)
		return {
			htmltag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
			diagnostichint = {link = "lspdiagnosticsdefaulthint"},
			-- this will remove the highlight groups
			tsfield = {},
		}
	end	
})

-- Set status bar settings
vim.g.lightline = {
  colorscheme = 'github-theme',
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
