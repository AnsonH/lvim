--[[
- lvim is the global options object.
- Linters should be filled in as strings with either a global executable or a path to an executable
]]

reload "user.plugins"   -- IMPORTANT: Always load plugins at first line
reload "user.autocommands"
reload "user.builtin"
reload "user.keymaps"
reload "user.lsp"

-- general
vim.opt.relativenumber = true
vim.opt.timeoutlen = 600        -- time in ms for a mapped sequence to complete
vim.opt.fillchars = vim.opt.fillchars + "diff: "  -- remove diff markers in diff view
lvim.log.level = "warn"
lvim.format_on_save.enabled = false

-- colorscheme (See ./after/plugin/highlights.lua for custom highlights)
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "sonokai"
vim.g.sonokai_style = "shusia"
vim.g.sonokai_disable_italic_comment = 1

-- Neovide GUI
vim.opt.guifont = "FiraCode NF:h11"
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_refresh_rate = 75
