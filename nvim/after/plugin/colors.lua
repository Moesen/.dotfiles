vim.cmd("colorscheme darkvoid")
require("darkvoid").setup({
	glow = true,
	plugins = {
		nvim_notify = true,
		nvimtree = true,
		lualine = true,
	},
})
