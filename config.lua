--[[ See https://www.lunarvim.org/docs/configuration ]]

reload("user.plugins") -- IMPORTANT: Always load plugins at first line
reload("user.autocommands")
reload("user.builtin")
reload("user.keymaps")
reload("user.lsp")

-- general
vim.opt.fillchars = vim.opt.fillchars + "diff:╱" -- diff markers in diff view
vim.opt.iskeyword:append("-") -- treat dash separated words as a word text object
vim.opt.relativenumber = true
vim.opt.timeoutlen = 600 -- time in ms for a mapped sequence to complete

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = {
  "*.lua",
  "*.{ts,tsx}",
}

-- colorscheme
lvim.colorscheme = "monokai-pro"
-- lvim.colorscheme = "lunar"

-- Neovide GUI (on Windows)
vim.opt.guifont = "JetBrainsMono NF:h10"
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_refresh_rate = 75
