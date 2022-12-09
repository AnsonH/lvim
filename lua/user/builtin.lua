-- vim:foldmethod=marker

-- {{{ Cmp
local cmp = lvim.builtin.cmp

-- Command autocomplete
cmp.cmdline.enable = true
cmp.cmdline.options[1].sources = {
  { name = "path" },
  {
    name = "cmdline",
    option = {
      ignore_cmds = { 'Man', '!' }
    }
  }
}
-- }}}

-- NvimTree {{{
local nvimtree = lvim.builtin.nvimtree
nvimtree.setup.view.side = "left"
nvimtree.setup.view.mappings.list = {
  -- Press "?" for help
  { key = "?", action = "toggle_help" },
}
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

-- {{{ Treesitter
local treesitter = lvim.builtin.treesitter
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
  "php",
  "python",
  "regex",
  "scss",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}
-- }}}
