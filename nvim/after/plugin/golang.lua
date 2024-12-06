require("go").setup()
-- Add this to your init.lua or create an ftplugin/go.lua

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		-- Create command GoRun
		vim.api.nvim_create_user_command("GoRun", function()
			-- Get current buffer content
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

			-- Check if file is main package
			local is_main = false
			for _, line in ipairs(lines) do
				if line:match("^package%s+main") then
					is_main = true
					break
				end
			end

			if not is_main then
				vim.notify("Not a main package", vim.log.levels.WARN)
				return
			end

			-- Get current file path
			local file_path = vim.fn.expand("%:p")

			-- Create a new terminal buffer
			vim.cmd("split")
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_win_set_buf(0, buf)

			-- Run the file
			vim.fn.termopen("go run " .. file_path)
		end, {})

		-- Optional: Create a keymapping
		vim.keymap.set("n", "<leader>r", ":GoRun<CR>", { buffer = true, silent = true })
	end,
})
