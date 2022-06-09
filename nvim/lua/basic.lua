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

-- Setting tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- QuickRun Config
require('jaq-nvim').setup{
	-- Commands used with 'Jaq'
	cmds = {
		-- Default UI used (see `Usage` for options)
		default = "float",

		-- Uses external commands such as 'g++' and 'cargo'
		external = {
			typescript = "deno run %",
			javascript = "node %",
			markdown = "glow %",
			python = "python3 %",
			rust = "rustc % && ./$fileBase && rm $fileBase",
			cpp = "g++ % -o $fileBase && ./$fileBase",
			go = "go run %",
			sh = "sh %",
		},

		-- Uses internal commands such as 'source' and 'luafile'
		internal = {
			lua = "luafile %",
			vim = "source %"
		}
	},

	-- UI settings
	ui = {
		-- Start in insert mode
		startinsert = false,

		-- Switch back to current file
		-- after using Jaq
		wincmd      = false,

		-- Floating Window / FTerm settings
		float = {
			-- Floating window border (see ':h nvim_open_win')
			border    = "none",

			-- Num from `0 - 1` for measurements
			height    = 0.8,
			width     = 0.8,
			x         = 0.5,
			y         = 0.5,

			-- Highlight group for floating window/border (see ':h winhl')
			border_hl = "FloatBorder",
			float_hl  = "Normal",

			-- Floating Window Transparency (see ':h winblend')
			blend     = 0
		},

		terminal = {
			-- Position of terminal
			position = "bot",

			-- Open the terminal without line numbers
			line_no = false,

			-- Size of terminal
			size     = 10
		},

		toggleterm = {
			-- Position of terminal, one of "vertical" | "horizontal" | "window" | "float"
			position = "horizontal",

			-- Size of terminal
			size     = 10
		},

		quickfix = {
			-- Position of quickfix window
			position = "bot",

			-- Size of quickfix window
			size     = 10
		}
	}
}
