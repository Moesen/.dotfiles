require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"csv",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"helm",
		"javascript",
		"json",
		"lua",
		"make",
		"proto",
		"python",
		"rust",
		"toml",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
	},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = { enable = true },

	rainbow = {
		enable = true,
		extented_mode = true,
		max_file_lines = nil,
	},
})

require("treesitter-context").setup({
	enable = true,
	max_lines = 0,
	line_numbers = true,
	multiline_threshold = 1,
	seperator = "-",
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
