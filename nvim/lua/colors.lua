-------------------------
--     TRULY BASIC     --
-------------------------
-- Screen specifics to make colors work
vim.cmd [[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]]
vim.o.termguicolors = true
vim.g.t_Co=256
vim.o.term='screen-256color'


-- Set colorscheme defaults (order is important)
vim.g.tokyonight_style = "storm"
vim.cmd 'colorscheme tokyonight'

-- Something with python
vim.g.python_highlight_all = 1


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
