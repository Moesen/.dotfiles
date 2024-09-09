require("todo-comments").setup({})
require("trouble").setup({})

-- Keymaps
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end)
vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end)
