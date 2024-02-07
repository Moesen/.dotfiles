local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		json = { "jq" },
	},
})

vim.keymap.set("n", "<leader>f", conform.format, {})
