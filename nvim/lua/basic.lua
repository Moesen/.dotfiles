-- buffer-scoped
vim.opt.autoindent = true

-- global scope
vim.opt.autowrite = true

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Set highlight on search, will remove highlight after search
vim.o.hlsearch = false

-- Make relative line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers
vim.o.hidden = true

-- Enable break indent
-- The thing that makes level indents when making newline inside parenthesis
vim.o.breakindent = true

-- Case insensitive searching unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Setting tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-------------------------
--      TPIPELINE      --
-------------------------
-- Use tpipeline outside of tmux as well
vim.api.nvim_set_option("stl", "%!tpipeline#stl#line()")
-- Update every cursor movement
vim.g.tpipeline_cursormoved = 1
-- vim.g.tpipeline_fillcentre = 1
