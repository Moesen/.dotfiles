local Terminal = require("toggleterm.terminal").Terminal

local python_term = nil

-- Helper function to get git repo root
local function get_repo_root()
	local handle = io.popen("git rev-parse --show-toplevel 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result:gsub("%s+$", "") -- Trim whitespace
	end
	return vim.fn.getcwd() -- Fallback to current directory if not in git repo
end

-- Helper function to get relative path from repo root
local function get_relative_path()
	local repo_root = get_repo_root()
	local abs_path = vim.fn.expand("%:p")
	local rel_path = abs_path:sub(#repo_root + 2) -- +2 to account for trailing slash
	return vim.fn.shellescape(rel_path)
end

-- Helper function to get or create terminal
local function get_python_term()
	if not python_term then
		python_term = Terminal:new({
			direction = "horizontal",
			close_on_exit = false,
			dir = get_repo_root(),
		})
	end
	return python_term
end

-- Python module runner (-m flag)
vim.keymap.set("n", "<leader>pm", function()
	local rel_path = get_relative_path():gsub("'", ""):gsub("%.py$", ""):gsub("/", ".")
	local term = get_python_term()
	term:toggle()
	term:send("python -m " .. rel_path)
end)
vim.keymap.set("n", "<leader>pM", function()
	local rel_path = get_relative_path():gsub("'", ""):gsub("%.py$", ""):gsub("/", ".")
	local term = get_python_term()
	term:toggle()
	vim.defer_fn(function()
		-- Instead of using term:send, we'll insert the command text directly
		local cmd = "python -m " .. rel_path
		term:set_mode("i") -- Set terminal to insert mode
		vim.api.nvim_feedkeys(cmd, "n", false)
	end, 10)
end)

-- Run Python file without focusing terminal
vim.keymap.set("n", "<leader>pr", function()
	local rel_path = get_relative_path()
	local term = get_python_term()
	term:toggle()
	term:send("python " .. rel_path)
	vim.defer_fn(function()
		vim.cmd("wincmd p")
	end, 10)
end)

-- Open terminal with Python command but don't execute
vim.keymap.set("n", "<leader>pR", function()
	local rel_path = get_relative_path()
	local term = get_python_term()
	term:toggle()
	vim.defer_fn(function()
		-- Instead of using term:send, we'll insert the command text directly
		local cmd = "python " .. rel_path
		term:set_mode("i") -- Set terminal to insert mode
		vim.api.nvim_feedkeys(cmd, "n", false)
	end, 10)
end)
