require("moesen.set")
require("moesen.remap")
require("moesen.packer")
local helm = require("moesen.helm")

local augroup = vim.api.nvim_create_augroup
local MoesenGroup = augroup("Moesen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40
		})
	end,
})

autocmd({"BufWritePre"}, {
	group = MoesenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Overwrite filetypes for yaml and helm
vim.filetype.add({
  extensions = {
    yaml = helm.yaml_filetype,
    yml = helm.yaml_filetype,
    tmpl = helm.tmpl_filetype,
    tpl = helm.tpl_filetype
  },
  filename = {
    ["Chart.yaml"] = "yaml",
    ["Chart.lock"] = "yaml",
  }
})
