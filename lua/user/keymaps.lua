-- vim:foldmethod=marker

--[[
  Overwrites default keymapping (view defaults with <leader>Lk:
  - https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/keymappings.lua
  - https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/which-key.lua

  To unmap a WhichKey binding:
  `lvim.builtin.which_key.mappings["c"] = nil`
--]]

local which_key = lvim.builtin.which_key

lvim.leader = "space"

-- {{{ NORMAL

-- VS Code Editor Actions
lvim.keys.normal_mode["<C-a>"] = "ggVG"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-p>"] = ":lua require('lvim.core.telescope.custom-finders').find_project_files()<CR>"
lvim.keys.normal_mode["<C-_>"] = ":lua require('Comment.api').toggle.linewise.current()<CR>"
lvim.keys.normal_mode["<C-/>"] = ":lua require('Comment.api').toggle.linewise.current()<CR>"
lvim.keys.normal_mode["<A-z>"] = ":set wrap!<CR>"

-- Indentation
lvim.keys.normal_mode["<"] = "<<"
lvim.keys.normal_mode[">"] = ">>"

-- Buffers & Windows
lvim.keys.normal_mode["<C-h>"] = ":TmuxNavigateLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = ":TmuxNavigateDown<CR>"
lvim.keys.normal_mode["<C-k>"] = ":TmuxNavigateUp<CR>"
lvim.keys.normal_mode["<C-l>"] = ":TmuxNavigateRight<CR>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-Left>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<S-Right>"] = ":BufferLineMoveNext<CR>"

lvim.keys.normal_mode["Q"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-q>"] = "<C-w>q" -- Close split
lvim.keys.normal_mode["|"] = "<C-w>v" -- Mimic tmux vertical split
lvim.keys.normal_mode["_"] = "<C-w>s"

-- Folds
lvim.builtin.which_key.setup.plugins.presets.z = true

-- Git
which_key.mappings["g"]["d"] = { ":DiffviewOpen<CR>", "Open Git Diff" }
which_key.mappings["g"]["D"] = { ":DiffviewClose<CR>", "Close Git Diff" }
which_key.mappings["g"]["g"] = nil -- ✕ Lazygit
which_key.mappings["g"]["o"] = nil -- ✕ Diff view of all files w/ Telescope

-- LSP
lvim.keys.normal_mode["<F2>"] = { ":Lspsaga rename<CR>" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { ":Lspsaga goto_definition<CR>" }
lvim.lsp.buffer_mappings.normal_mode["gh"] = { vim.lsp.buf.hover, "Show documentation" }
lvim.lsp.buffer_mappings.normal_mode["gq"] = {
  ":Lspsaga code_action<CR>",
  "Code action",
}
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":Lspsaga lsp_finder<CR>",
  "Go to references",
}
lvim.lsp.buffer_mappings.normal_mode["gpd"] = {
  ":Lspsaga peek_definition<CR>",
  "Peek definition",
}
which_key.mappings["l"]["c"] =
  { ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", "Copilot Toggle Inline" }
which_key.mappings["l"]["a"] = nil -- ✕ Code actions
which_key.mappings["l"]["r"] = nil -- ✕ Rename symbol

-- Leader
which_key.mappings["f"] =
  { ":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy())<CR>", "Live Grep" }
which_key.mappings["x"] = { ":!chmod +x %<CR>", "Make file executable" }
which_key.mappings["c"] = {} -- ✕ Close buffer
which_key.mappings["h"] = {} -- ✕ :noh
which_key.mappings["w"] = {} -- ✕ Save
which_key.mappings["/"] = {} -- ✕ Toggle line comment

-- Telescope
which_key.mappings["s"]["f"] = nil -- ✕ Find file
which_key.mappings["s"]["t"] = nil -- ✕ Live grep

-- Treesitter
which_key.mappings["T"]["i"] = { ":TSHighlightCapturesUnderCursor<CR>", "Info" }

-- Misc
lvim.keys.normal_mode["<Esc>"] = ":noh<CR>"
lvim.keys.normal_mode["x"] = '"_x' -- Without yank
lvim.keys.normal_mode["zO"] = "zR" -- Open all folds
lvim.keys.normal_mode["zC"] = "zM" -- Close all folds
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz" -- Center after scroll
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- }}}

-- {{{ INSERT

-- VS Code Editor Actions
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<CR>a"
lvim.keys.insert_mode["<C-z>"] = "<Esc>:u<CR>a"
lvim.keys.insert_mode["<C-BS>"] = "<C-w>" -- Ctrl+Backspace to delete word

-- }}}

-- {{{ VISUAL

-- VS Code Editor Actions
lvim.keys.visual_mode["<C-_>"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
lvim.keys.visual_mode["<C-/>"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"

-- Paste without yanking
lvim.keys.visual_mode["p"] = '"_dP'

-- }}}
