-- vim:foldmethod=marker
--- Plugins: https://www.lunarvim.org/docs/plugins

lvim.plugins = {
  -- Syntax highlighting {{{
  { "sainnhe/sonokai" },
  {
    "norcalli/nvim-colorizer.lua", -- Highlight color codes
    config = function()
      require("colorizer").setup({ "*" }, { names = false })
    end,
  },
  { "p00f/nvim-ts-rainbow" }, -- Rainbow parentheses
  --}}}

  -- Productivity {{{
  { "hrsh7th/cmp-cmdline" }, -- cmd-line autocompletes
  {
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag", -- Autoclose and autorename HTML tags
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "sindrets/diffview.nvim", -- VS Code like diff view
    requires = "nvim-lua/plenary.nvim",
  },
  -- }}}

  -- GitHub Copilot {{{
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      require("copilot").setup {
        plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<M-l>", -- Alt+l to accept suggestion
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end
  },
  -- }}}

  -- Aesthetics {{{
  {
    "dstein64/nvim-scrollview", -- scroll bar
    config = function()
      require("scrollview").setup({
        hide_on_intersect = false
      })
    end
  },
  -- }}}

  -- Misc {{{
  {
    "nvim-treesitter/playground", -- Treesitter playground
    event = "BufRead",
  },
  { "wakatime/vim-wakatime" }  -- Wakatime
  -- }}}
}
