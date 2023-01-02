-- Editing highlight should be done here
-- https://github.com/LunarVim/LunarVim/issues/1062#issuecomment-978325404

local function highlight(highlights)
  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

---Default Sonokai palette
local sonokai = {
  red = "#f85e84",
  orange = "#ef9062",
  yellow = "#e5c463",
  green = "#9ecd6f",
  blue = "#7accd7",
  purple = "#ab9df2",
  fg = "#e3e1e4",
  bg0 = "#2d2a2e",
  bg1 = "#37343a",
  bg2 = "#3b383e",
  bg3 = "#423f46",
  bg4 = "#49464e",
  grey = "#848089",
}

if vim.g.colors_name == "sonokai" then
  highlight {
    -- GUI
    CursorLine = { bg = sonokai.bg2 },
    DiffChange = { bg = "#5d433b" },
    IndentBlanklineChar = { fg = sonokai.bg3 }, -- indentation guide
    LineNr = { fg = "#727072" },
    ScrollView = { bg = "#727072" }, -- scroll bar
    Visual = { bg = "#455a60" },

    -- Code: General
    CurrentWord = { bg = sonokai.bg4 }, -- highlight current word / LspReferenceText
    MatchParen = { bg = sonokai.bg4, bold = true },
    javaScriptNull = { fg = sonokai.purple },

    -- Code: Treesitter
    ["@constant"] = { fg = sonokai.purple },
    ["@constructor"] = { fg = sonokai.blue },
    ["@parameter"] = { fg = sonokai.orange },
    ["@property"] = { fg = sonokai.fg },
    ["@text"] = { fg = sonokai.fg }, -- HTML tag inner text
    ["@tag.delimiter"] = { fg = sonokai.grey }, -- HTML tag symbol ("<" & ">")
    ["@tag"] = { fg = sonokai.red }, -- HTML tag name
    ["@tag.attribute"] = { fg = sonokai.blue, italic = true }, -- HTML tag attribute

    -- Diagnostics
    DiagnosticVirtualTextError = { fg = sonokai.red, bg = "#422f36" },
    DiagnosticVirtualTextWarn = { fg = sonokai.yellow, bg = "#403a33" },
    DiagnosticVirtualTextInfo = { fg = sonokai.blue, bg = "#353a3e" },
    DiagnosticVirtualTextHint = { fg = sonokai.green, bg = "#393a34" },

    -- Git
    GitSignsChange = { fg = sonokai.orange },
    GitSignsChangeNr = { fg = sonokai.orange },
    DiffviewDiffDelete = { fg = sonokai.bg4 }, -- Diff char in diffview

    -- nvim-navic (LSP breadcrumb)
    NavicIconsFile = { fg = sonokai.green },
    NavicIconsModule = { fg = sonokai.blue },
    NavicIconsNamespace = { fg = sonokai.red },
    NavicIconsPackage = { fg = sonokai.red },
    NavicIconsClass = { fg = sonokai.blue },
    NavicIconsMethod = { fg = sonokai.green },
    NavicIconsProperty = { fg = sonokai.orange },
    NavicIconsField = { fg = sonokai.green },
    NavicIconsConstructor = { fg = sonokai.green },
    NavicIconsEnum = { fg = sonokai.blue },
    NavicIconsInterface = { fg = sonokai.blue },
    NavicIconsFunction = { fg = sonokai.green },
    NavicIconsVariable = { fg = sonokai.orange },
    NavicIconsConstant = { fg = sonokai.orange },
    NavicIconsString = { fg = sonokai.yellow },
    NavicIconsNumber = { fg = sonokai.yellow },
    NavicIconsBoolean = { fg = sonokai.yellow },
    NavicIconsArray = { fg = sonokai.yellow },
    NavicIconsObject = { fg = sonokai.yellow },
    NavicIconsKey = { fg = sonokai.red },
    NavicIconsNull = { fg = sonokai.yellow },
    NavicIconsEnumMember = { fg = sonokai.purple },
    NavicIconsStruct = { fg = sonokai.blue },
    NavicIconsEvent = { fg = sonokai.red },
    NavicIconsOperator = { fg = sonokai.red },
    NavicIconsTypeParameter = { fg = sonokai.blue },
    NavicText = { fg = sonokai.fg },
    NavicSeparator = { fg = sonokai.grey },

    -- nvim-tree (File explorer)
    NvimTreeFolderIcon = { fg = sonokai.yellow },
    NvimTreeFolderName = { fg = "#c1c0c0" },
    NvimTreeEmptyFolderName = { fg = "#c1c0c0" },
    NvimTreeOpenedFolderName = { fg = "#c1c0c0" },
  }
end

if vim.g.colors_name == "lunar" then
  highlight {
    -- GUI
    CursorLineNr = { fg = "#8f94b0" },
    LineNr = { fg = "#484f6e" },

    -- Code: General
    Comment = { fg = "#7d8296" },
    ["@comment"] = { fg = "#7d8296" },
  }
end
