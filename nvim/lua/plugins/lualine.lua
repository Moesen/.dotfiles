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

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_a = { { "mode", icons_enabled = true } },
			lualine_b = {
				{
					"branch",
					fmt = function(str)
						local route_match = str:match("^(%w+)/(^-)+")
						if route_match then
							return str:match("^(%w+)/([^-]+)")
						end

						local number_match = str:match("(%d+)")
						if number_match then
							return "#" .. number_match
						end
						return str
					end,
				},
				"diff",
				"diagnostics",
			},
			lualine_c = { { "filename", file_status = true, path = 4 } },
			lualine_x = { "encoding", { "filetype", icon = { align = "right" } } },
			lualine_y = { "progress" },
			lualine_z = { get_indent_level, "selectioncount", "location" },
		},
	},
}
