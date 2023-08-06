-- vim:foldmethod=marker
--- Plugins: https://www.lunarvim.org/docs/plugins

lvim.plugins = {
  -- Syntax highlighting {{{
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false, -- Load during startup
    priority = 1000, -- Load before all other start plugins
    config = require("user.highlights").monokai_pro_config,
  },
  {
    "NvChad/nvim-colorizer.lua", -- Highlight color codes
    config = function()
      require("colorizer").setup({
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
      })
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2", -- Rainbow parentheses
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          query = {
            "rainbow-parens",
          },
        },
      })
    end,
  },
  --}}}

  -- Auto-completes {{{
  { "hrsh7th/cmp-cmdline" }, -- cmd-line autocompletes
  {
    "roobert/tailwindcss-colorizer-cmp.nvim", -- Tailwind CSS color autocompletes
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
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
        symbol_in_winbar = {
          enable = false, -- Avoid conflict with "nvim-navic"
        },
        rename = {
          quit = "<Esc>",
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- }}}

  -- GitHub Copilot {{{
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          suggestion = {
            auto_trigger = true,
            keymap = {
              accept = "<Tab>",
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            markdown = true,
          },
        })
        require("copilot_cmp").setup()
      end, 100)
    end,
  },
  -- }}}

  -- Aesthetics {{{
  {
    "dstein64/nvim-scrollview", -- scroll bar
    config = function()
      require("scrollview").setup({
        hide_on_intersect = false,
      })
    end,
  },
  -- }}}

  -- Misc {{{
  {
    "nvim-treesitter/playground", -- Treesitter playground
    event = "BufRead",
  },
  { "wakatime/vim-wakatime" }, -- Wakatime
  -- }}}
}
