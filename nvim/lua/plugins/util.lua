return {
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
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
		keys = {
			{ "<c-n>", "<cmd>NvimTreeToggle<cr>" },
		},
		opts = {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = function(term)
				if term.directoin == "vertical" then
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
		},
	},
	{ "mbbill/undotree", keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>" } } },
}
