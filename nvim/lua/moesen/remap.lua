vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/lua/moesen/packer.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<C-p>", "<C-i>")

vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")

vim.keymap.set("n", "<leader>j", "gT")
vim.keymap.set("n", "<leader>k", "gt")

-- Tapping around
vim.keymap.set("n", "<C-Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-Tab>", "<C-\\><C-N>:tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-Tab>", "<C-C>:tabnext<CR>", { noremap = true, silent = true })
-- Other way
vim.keymap.set("n", "<C-Tab>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-Tab>", "<C-\\><C-N>:tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-Tab>", "<C-C>:tabprevious<CR>", { noremap = true, silent = true })
