--[[
  Overwrites default keymapping (view defaults with <leader>Lk:
  - https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/keymappings.lua
  - https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/which-key.lua
--]]

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
lvim.keys.normal_mode["Q"] = ":Bdelete<CR>"
lvim.keys.normal_mode["<C-q>"] = "<C-w>q"

-- LSP
-- TODO: Better whichkey message (Note: Editing lvim.lsp.buffer_mappings.normal_mode will cause error)
lvim.keys.normal_mode["gh"] = { ":lua vim.lsp.buf.hover()<CR>" }

-- Actions without yanking
lvim.keys.normal_mode["x"] = '"_x'

-- Misc
lvim.keys.normal_mode["<Esc>"] = ":noh<CR>"

-- Remove default whichkey bindings
lvim.builtin.which_key.mappings["f"] = {}     -- Find file
lvim.builtin.which_key.mappings["h"] = {}     -- :noh
lvim.builtin.which_key.mappings["w"] = {}     -- Save
lvim.builtin.which_key.mappings["/"] = {}     -- Toggle line comment

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


