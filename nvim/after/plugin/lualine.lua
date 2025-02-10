local function get_indent_level()
	local current_line = vim.api.nvim_get_current_line()
	local indent_str = current_line:match("^%s+") or ""
	local indent_count = 0
	local expandtab = vim.bo.expandtab
	if expandtab then
		indent_count = math.floor(#indent_str / vim.bo.shiftwidth)
	else
		indent_count = select(2, string.gsub(indent_str, "\t", ""))
	end
	return "󱁐 " .. indent_count
end

require("lualine").setup({
	sections = {
		lualine_a = { { "mode", icons_enabled = true } },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", file_status = true, path = 4 } },
		lualine_x = { "encoding", { "filetype", icon = { align = "right" } } },
		lualine_y = { "progress" },
		lualine_z = { get_indent_level, "selectioncount", "location" },
	},
})
