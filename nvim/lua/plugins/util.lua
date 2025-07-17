return {
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"swaits/zellij-nav.nvim",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{ "<c-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left or tab" } },
			{ "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
			{ "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
			{ "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right or tab" } },
		},
		opts = {},
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
	{
		"ahmedkhalf/project.nvim",
		cmd = { "ProjectRoot" },
		config = function()
			require("project_nvim").setup({
				manual_mode = true,
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		keys = {
			{ "<c-n>", "<cmd>NvimTreeToggle<cr>" },
		},
		opts = {
			sync_root_with_cwd = false,
			respect_buf_cwd = false,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
		},
	},
	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	version = "*",
	-- 	opts = {
	-- 		size = function(term)
	-- 			if term.direction == "vertical" then
	-- 				return vim.o.columns * 0.4
	-- 			elseif term.direction == "horizontal" then
	-- 				return 20
	-- 			end
	-- 		end,
	-- 		open_mapping = [[<c-t>]],
	-- 		shade_terminals = false,
	-- 		direction = "horizontal",
	-- 		autochdir = true,
	-- 		start_in_insert = true,
	-- 		persist_mode = false,
	-- 	},
	-- },
	{ "mbbill/undotree", keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>" } } },
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*",
	-- 	lazy = true,
	-- 	event = {
	-- 		"BufReadPre " .. vim.fn.expand("~") .. "/Vaults/vault-alvenir/*.md",
	-- 		"BufReadPre " .. vim.fn.expand("~") .. "/EDU/vault/*.md",
	-- 	},
	-- 	dependencies = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	opts = {
	-- 		workspaces = {
	-- 			{
	-- 				name = "edu",
	-- 				path = "~/EDU/vault",
	-- 			},
	-- 			{
	-- 				name = "work",
	-- 				path = "~/Vaults/vault-alvenir/",
	-- 			},
	-- 		},
	-- 	},
	-- },
	{ "bullets-vim/bullets.vim" },
}
