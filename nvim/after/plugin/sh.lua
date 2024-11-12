vim.api.nvim_create_autocmd("FileType", {
  pattern = "sh",
  callback = function()
    vim.keymap.set("n", "<leader>r", function()
      local file = vim.fn.expand("%")
      vim.cmd("!" .. "bash " .. file)
    end, { buffer = true, desc = "Run bash script" })

    vim.keymap.set("n", "<leader>R", function()
      local file = vim.fn.expand("%")
      local args = vim.fn.input("Arguments: ")
      vim.cmd("!" .. "bash " .. file .. args)
    end, { buffer = true, desc = "Run bash script with arguments" })

    vim.keymap.set("n", "<leader>pR", function()
      local file = vim.fn.expand("%")
      local pre_args = vim.fn.input("Pre args: ")
      local post_args = vim.fn.input("Post args: ")
      vim.cmd("!" .. pre_args .. " bash " .. file .. " " .. post_args)
    end, { buffer = true, desc = "Run bash script with pre and post args" })
  end
})
