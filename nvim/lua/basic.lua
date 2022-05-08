-- vim.wo.colorcolumn = '80'
-- vim.bo.filetype = 'lua'

-- with vim.opt we can set global, window and buffersettings
-- works like :set in .vim

-- buffer-scoped
vim.opt.autoindent = true
-- window-scoped vim.opt.cursorline = true

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

-- Enable mouse mode
-- vim.o.mouse = 'a'

-- Command height
-- vim.opt.cmdheight=2

-- Enable break indent
-- The thing that makes level indents when making newline inside parenthesis
vim.o.breakindent = true

-- Case insensitive searching unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

