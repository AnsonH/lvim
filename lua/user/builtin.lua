-- vim:foldmethod=marker

-- Cmp {{{
local cmp = lvim.builtin.cmp

-- Command autocomplete
cmp.cmdline.enable = true

-- Tailwind CSS colors
cmp.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter,
}
-- }}}

-- Gitsigns {{{
local gitsigns = lvim.builtin.gitsigns
gitsigns.opts.current_line_blame = true
gitsigns.opts.current_line_blame_opts.delay = 500
-- }}}

-- Lualine {{{
local lualine = lvim.builtin.lualine
local lualine_components = require("lvim.core.lualine.components")
lualine.sections.lualine_a = {
  {
    function()
      local mode = require("lualine.utils.mode").get_mode()
      local map = {
        ["NORMAL"] = lvim.icons.ui.Target,
        ["INSERT"] = lvim.icons.ui.Pencil,
        ["REPLACE"] = "累",
        ["V-REPLACE"] = "累",
        ["VISUAL"] = "",
        ["V-LINE"] = "L",
        ["V-BLOCK"] = "B",
        ["SELECT"] = "S",
        ["S-LINE"] = "SL",
        ["COMMAND"] = ":",
        ["EX"] = "EX",
        ["MORE"] = lvim.icons.ui.Ellipsis,
        ["CONFIRM"] = lvim.icons.diagnostics.BoldQuestion,
        ["O-PENDING"] = "OP",
        ["SHELL"] = "ﲵ",
        ["TERMINAL"] = "",
      }
      return map[mode]
    end,
  },
}
lualine.sections.lualine_c = {
  lualine_components.python_env,
}
-- }}}

-- NvimTree {{{
local nvimtree = lvim.builtin.nvimtree

table.insert(nvimtree.setup.filters.custom, ".git")
nvimtree.setup.view.side = "left"
nvimtree.setup.renderer.icons.show.git = true
nvimtree.setup.renderer.group_empty = true
-- }}}

-- Telescope {{{
local telescope = lvim.builtin.telescope
local _, actions = pcall(require, "telescope.actions")
telescope.defaults.mappings = {
  -- input mode
  i = {
    ["<Esc>"] = actions.close,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<Down>"] = actions.cycle_history_next,
    ["<Up>"] = actions.cycle_history_prev,
  },
  -- normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}
-- }}}

-- Treesitter {{{
local treesitter = lvim.builtin.treesitter
treesitter.rainbow.enable = true
treesitter.rainbow.extended_mode = false
treesitter.ensure_installed = {
  "bash",
  "c",
  "comment", -- Highlights for TODO, NOTE, ...
  "cpp",
  "css",
  "dart",
  "dockerfile",
  "graphql",
  "html",
  "http",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "jsonc",
  "kotlin",
  "lua",
  "markdown",
  "markdown_inline",
  "php",
  "python",
  "regex",
  "rust",
  "scss",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}
-- }}}

-- WhichKey {{{
-- NOTE: whichkey keybindings are found in 'keymaps.lua'
local which_key = lvim.builtin.which_key
which_key.setup.icons.group = ""
which_key.mappings.b.name = "﬘ Buffers"
which_key.mappings.d.name = " Debug"
which_key.mappings.g.name = " Git"
which_key.mappings.l.name = " LSP"
which_key.mappings.L.name = " LunarVim"
which_key.mappings.p.name = "󰏗 Plugins"
which_key.mappings.s.name = " Search"
which_key.mappings.T.name = " Treesitter"
-- }}}
