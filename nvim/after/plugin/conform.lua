local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		javascript = { { "prettierd", "prettier" } },
		json = { "jq" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
	format_after_save = {
		lsp_fallback = true,
	},
	formatters = {
		black = {
			args = {
				"--stdin-filename",
				"$FILENAME",
				"--quiet",
				"--line-length",
				"100",
				"-",
			},
		},
	},
})

vim.keymap.set("n", "<leader>f", conform.format, {})
