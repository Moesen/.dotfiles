return {
	-- {
	-- 	"mellow-theme/mellow.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme mellow]])
	-- 	end,
	-- },
	-- {
	-- 	"ribru17/bamboo.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme bamboo]])
	-- 	end,
	-- },
	-- {
	-- 	"gambhirsharma/vesper.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	name = "vesper",
	-- 	config = function()
	-- 		vim.cmd([[colorscheme vesper]])
	-- 	end,
	-- },
	-- {
	-- 	"t1mxg0d/vim-lucario",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme lucario]])
	-- 	end,
	-- },

	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		name = "kanagawa",
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
}
