-- vim:foldmethod=marker
--- Plugins: https://www.lunarvim.org/docs/plugins

lvim.plugins = {
  -- Syntax highlighting {{{
  {
    "sainnhe/sonokai",
    lazy = false,    -- Load during startup
    priority = 1000, -- Load before all other start plugins
  },
  {
    "NvChad/nvim-colorizer.lua", -- Highlight color codes
    config = function()
      require("colorizer").setup {
        filetypes = {
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
          "css",
          "html",
          "astro",
          "lua",
        },
        user_default_options = {
          names = false,
          tailwind = "both",
        },
      }
    end,
  },
  { "p00f/nvim-ts-rainbow" }, -- Rainbow parentheses
  --}}}

  -- Auto-completes {{{
  { "hrsh7th/cmp-cmdline" },                  -- cmd-line autocompletes
  {
    "roobert/tailwindcss-colorizer-cmp.nvim", -- Tailwind CSS color autocompletes
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  -- }}}

  -- Productivity {{{
  {
    "kylechui/nvim-surround",
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
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
      })
    end,
  },
  {
    "glepnir/lspsaga.nvim", -- LSP UI
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        -- TODO: Extract to a separate file
        rename = {
          quit = "<Esc>"
        }
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
    }
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
  { "wakatime/vim-wakatime" } -- Wakatime
  -- }}}
}
