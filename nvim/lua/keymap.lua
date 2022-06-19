-- Changing mapleader to ';'
vim.g.mapleader = ";"

-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Y yank until the end of the line
map('v', 'Y', '"+y')
map('n', 'Y', '0v$"+y')
map('v', "D", '"+ygvd')

-- Go into focus writing mode using goyo
map('n', "<leader>go", ":Goyo<cr>")

-- Intuitive increment and decrement
map('n', '+', '<c-a>', silentnoremap)
map('n', '-', '<c-x>', silentnoremap)

-- Show colors
map('n', "<leader>ct", ":ColorToggle<cr>", {silent = true})
