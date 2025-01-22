local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":ter python3 %<CR>", { noremap = true, silent = true })
	end,
})
