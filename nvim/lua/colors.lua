----------------------
--     TRULY BASIC     --
-------------------------
-- Screen specifics to make colors work
-- vim.cmd [[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]]
-- vim.g.t_Co=256
vim.o.term = 'xterm-256color'


-- Set colorscheme defaults (order is important)
vim.cmd 'set background=dark'
vim.cmd 'colorscheme gruvbox'
vim.cmd 'let g:deus_termcolors=256'

-- Something with python
vim.g.python_highlight_all = 1

-- Statusbar, kind of a colorthing
-- require('feline')

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
