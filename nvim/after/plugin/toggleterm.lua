require("toggleterm").setup({
	size = function(term)
		if term.direction == "vertical" then
			return vim.o.columns * 0.4
		elseif term.direction == "horizontal" then
			return 20
		end
	end,
	open_mapping = [[<c-t>]],
	shade_terminals = false,
	direction = "horizontal",
	autochdir = true,
	start_in_insert = true,
	persist_mode = false,
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
