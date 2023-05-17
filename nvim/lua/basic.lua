-------------------------
--     TRULY BASIC     --
-------------------------
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

-- Misc
-- Coc specific options added here for more clarity
-- Time before generally before updated
-- Especially nice for coc updates
vim.opt.updatetime = 200

-- Don't pass messages to |ins-completion-menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn = 'number'

-- COC-packages
vim.g.coc_global_extensions = { 'coc-json', 'coc-pyright', 'coc-css', 'coc-lua', "coc-pydocstring", "coc-snippets",
    "coc-rust-analyzer" }

-- Vim Terminal
-- vim.g.open_in_insert_mode = 0

-------------------------
--      TPIPELINE      --
-------------------------
-- Use tpipeline outside of tmux as well
-- vim.api.nvim_set_option("stl", "%!tpipeline#stl#line()")
-- Update every cursor movement
-- vim.g.tpipeline_cursormoved = 1
-- vim.g.tpipeline_fillcentre = 1

-- Rust-Analyser
require("obsidian").setup({
    dir = "~/Git/SDR/obsidian",
    notes_subdir = "notes",
})
