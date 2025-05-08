return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "tabs",
			diagnostics = "nvim_lsp",
			show_close_icon = false,
			always_show_bufferline = false,
			auto_toggle_bufferline = true,
		},
	},
}
