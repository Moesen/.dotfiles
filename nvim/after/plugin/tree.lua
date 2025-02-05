-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle <cr>", { silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile <cr>", { silent = true })
