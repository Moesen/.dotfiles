-- Function and keymap that toggles the copilot mode on and off.
function ToggleCopilot()
  if vim.g.copilot_enabled == 0 then
    vim.g.copilot_enabled = 1
    print("Copilot is enabled")
  else
    vim.g.copilot_enabled = 0
    print("Copilot is disabled")
  end
end
vim.keymap.set("n", "<leader>ct", "<cmd>lua ToggleCopilot()<cr>", { silent = true })

-- Keymap for showing copilot panel <leader>cp
vim.keymap.set("n", "<leader>cp", "<cmd>Copilot panel<cr>", { silent = true })

vim.g.copilot_enabled = 0
