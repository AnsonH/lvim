--[[
  Overwrites default keymapping (view defaults with <leader>Lk:
  - https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/keymappings.lua
  - https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/which-key.lua
--]]

local which_key = lvim.builtin.which_key

lvim.leader = "space"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")

--------------------------------------------------------
------------------------ NORMAL ------------------------
--------------------------------------------------------

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
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-Left>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<S-Right>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["Q"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-q>"] = "<C-w>q"

-- LSP
-- TODO: Better whichkey message (Note: Editing lvim.lsp.buffer_mappings.normal_mode will cause error)
lvim.keys.normal_mode["<F2>"] = { ":lua vim.lsp.buf.rename()<CR>" }
lvim.keys.normal_mode["gh"] = { ":lua vim.lsp.buf.hover()<CR>" }
which_key.mappings["l"]["c"] = { ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", "Copilot Toggle Inline" }

-- Leader
which_key.mappings["f"] = { ":lua require'telescope.builtin'.live_grep(telescope_expanded_dropdown())<CR>", "Live Grep" }

-- Misc
lvim.keys.normal_mode["<Esc>"] = ":noh<CR>"
lvim.keys.normal_mode["x"] = '"_x'  -- Without yank

-- Remove default whichkey bindings
which_key.mappings["c"] = {}     -- Close buffer
which_key.mappings["h"] = {}     -- :noh
which_key.mappings["w"] = {}     -- Save
which_key.mappings["/"] = {}     -- Toggle line comment
which_key.mappings["l"]["r"] = nil    -- Rename symbol
which_key.mappings["s"]["f"] = nil    -- Find file
which_key.mappings["s"]["t"] = nil    -- Live grep

--------------------------------------------------------
------------------------ INSERT ------------------------
--------------------------------------------------------

-- VS Code Editor Actions
lvim.keys.insert_mode["<C-s>"] = "<Esc>:w<CR>a"
lvim.keys.insert_mode["<C-z>"] = "<Esc>:u<CR>a"
lvim.keys.insert_mode["<C-BS>"] = "<C-w>"          -- Ctrl+Backspace to delete word

--------------------------------------------------------
------------------------ VISUAL ------------------------
--------------------------------------------------------

-- VS Code Editor Actions
lvim.keys.visual_mode["<C-_>"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
lvim.keys.visual_mode["<C-/>"] = ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"

-- Paste without yanking
lvim.keys.visual_mode["p"] = '"_dP'


