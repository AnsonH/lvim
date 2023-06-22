local M = {}

--- Monokai Pro palette
local monokai_pro = {
  red = "#ff6188",
  orange = "#fc9867",
  yellow = "#ffd866",
  green = "#a9dc76",
  blue = "#78dce8",
  purple = "#ab9df2",
  fg = "#fcfcfa",
  bg0 = "#2d2a2e",
  bg1 = "#403e41",
  bg2 = "#5b595c",
  bg3 = "#727072",
  bg4 = "#939293",
  grey = "#c1c0c0",
}

--- Config for [monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim)
M.monokai_pro_config = function()
  require("monokai-pro").setup({
    styles = {
      keyword = { italic = false },
    },
    override = function()
      return {
        -- GUI
        ScrollView = { bg = monokai_pro.bg3 }, -- scroll bar
        Search = { fg = monokai_pro.bg0, bg = monokai_pro.green },
        Todo = { bg = monokai_pro.yellow },
        Visual = { bg = "#455a60" },

        -- Code
        Comment = { fg = monokai_pro.bg4 },
        ["@keyword"] = { fg = monokai_pro.red },
        ["@tag.delimeter"] = { fg = monokai_pro.bg4 },
        ["@type.builtin"] = { italic = true },

        -- Plugins
        DiffviewDiffDelete = { fg = monokai_pro.bg2 }, -- Diff char in diffview
        NavicText = { fg = monokai_pro.grey },
        NavicSeparator = { fg = monokai_pro.bg4 },
        NvimTreeGitNew = { fg = monokai_pro.grey },
        RenameNormal = { fg = monokai_pro.fg }, -- Lspsaga rename
        SagaBeacon = { bg = monokai_pro.green },
      }
    end,
  })
end

return M
