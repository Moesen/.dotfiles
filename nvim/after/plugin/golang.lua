require("go").setup()
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.keymap.set("n", "<leader>ru", ":GoRun<CR>", { buffer = true, silent = true })
    end,
})
