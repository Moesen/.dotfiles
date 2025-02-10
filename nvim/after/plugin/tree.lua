-- empty setup using defaults
require("nvim-tree").setup({
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle <cr>", { silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile! <cr>", { silent = true })
