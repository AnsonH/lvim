-- vim:foldmethod=marker
--- Plugins: https://www.lunarvim.org/docs/plugins

lvim.plugins = {
  -- Syntax highlighting {{{
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false, -- Load during startup
    priority = 1000, -- Load before all other start plugins
    config = function()
      require("monokai-pro").setup({
        styles = {
          keyword = { italic = false },
        },
        override = function()
          return {
            -- GUI
            Search = { fg = "#2d2a2e", bg = "#a9dc76" },
            Todo = { bg = "#ffd866" },
            Visual = { bg = "#455a60" },

            -- Code
            Comment = { fg = "#939293" },
            ["@keyword"] = { fg = "#ff6188" },

            -- Plugins
            DiffviewDiffDelete = { fg = "#5b595c" }, -- Diff char in diffview
            NavicText = { fg = "#c1c0c0" },
            NavicSeparator = { fg = "#939293" },
            NvimTreeGitNew = { fg = "#c1c0c0" },
          }
        end,
      })
    end,
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
  { "HiPhish/nvim-ts-rainbow2" }, -- Rainbow parentheses
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
              accept = "<M-l>", -- Alt+l to accept suggestion
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
