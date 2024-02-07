require("nordic").setup({
	on_palette = function(palette)
		return palette
	end,
	bold_keywords = true,
	italic_comments = true,
	transparent_bg = true,
	bright_border = false,
	reduced_blue = true,
	cursorline = {
		bold = true,
		bold_number = true,
		theme = "dark",
		blend = 0.9,
	},
	noice = {
		style = "flat",
	},
	telescope = {
		style = "flat",
	},
})

function ColorMyPencils(color)
	color = color or "nordic"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
