local builtin = require("telescope.builtin")
require("telescope").setup({
	pickers = {
		find_files = {},
		spell_suggest = {
			theme = "cursor",
		},
	},
})

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pc", builtin.spell_suggest, {})
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
vim.keymap.set("n", "<C-g>", builtin.git_files, {})

require("telescope").load_extension("harpoon")
