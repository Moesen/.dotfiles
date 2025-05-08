return {
	-- {
	-- 	"mellow-theme/mellow.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme mellow]])
	-- 	end,
	-- },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme bamboo]])
		end,
	},
	{ "nvim-tree/nvim-web-devicons", lazy = true },
}
