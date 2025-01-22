local conform = require("conform")

local format_on_save = true

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "isort", "ruff_format" }
			end
		end,
		javascript = { { "prettierd", "prettier" } },
		json = { "jq" },
		jsonl = { "jq" },
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
