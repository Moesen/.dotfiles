return {
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{ "christoomey/vim-tmux-navigator" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		keys = {
			{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>pg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>pd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
			{ "<leader>pc", "<cmd>Telescope spell_suggest<cr>", desc = "Spell Suggest" },
		},
		opts = {
			pickers = {
				find_files = {},
				spell_suggest = {
					theme = "cursor",
				},
				diagnostics = {
					cwd_only = true,
				},
			},
		},
	},

	{
		"echasnovski/mini.align",
		opts = {},
		keys = {
			{ "ga", mode = { "n", "v" } },
			{ "gA", mode = { "n", "v" } },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			triggers = {},
		},
	},
	{ "ahmedkhalf/project.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<c-n>", "<cmd>NvimTreeToggle<cr>" },
		},
		config = function()
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
			})
		end,
	},
}
