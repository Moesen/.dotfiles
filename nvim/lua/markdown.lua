-- Don't fold text under each header
vim.g.vim_markdown_folding_disabled = 1

-- No thanks to conceal feature
vim.g.vim_markdown_conceal          = 0

-- Disable math tex conceal feature
vim.g.tex_conceal                   = ""
vim.g.vim_markdown_math             = 1

-- Support different front matters
-- for YAML format
vim.g.vim_markdown_frontmatter      = 1
-- for TOML format
vim.g.vim_markdown_toml_frontmatter = 1
-- for JSON format
vim.g.vim_markdown_json_frontmatter = 1
