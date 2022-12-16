-- Editing highlight should be done here
-- https://github.com/LunarVim/LunarVim/issues/1062#issuecomment-978325404

local function add_highlights(highlights)
  for _, v in pairs(highlights) do
    vim.cmd("highlight " .. v)
  end
end

if vim.g.colors_name == "lunar" then
  add_highlights {
    -- GUI
    "CursorLineNr guifg=#8f94b0",
    "LineNr guifg=#484f6e",

    -- Code: General
    "Comment guifg=#7d8296",
    "@comment guifg=#7d8296",
  }
end

if vim.g.colors_name == "sonokai" then
  add_highlights {
    -- GUI
    "CursorLine guibg=#3b383e",
    "DiffChange guibg=#5d433b",
    "IndentBlanklineChar guifg=#423f46",  -- indentation guide
    "LineNr guifg=#727072",
    "ScrollView guibg=#67676D",           -- Scroll bar
    "Visual guibg=#455a60",

    -- Code: General
    "CurrentWord guibg=#454549",          -- Highlight current word / LspReferenceText
    "MatchParen guibg=#454549 gui=bold",

    -- Code: Language Specific
    "javaScriptNull guifg=#ab9df2",

    -- Code: Treesitter
    "@constant guifg=#ab9df2",
    "@constructor guifg=#7accd7",
    "@parameter guifg=#ef9062",
    "@text guifg=#e3e1e4",                -- HTML tag inner text
    "@tag.delimiter guifg=#727072",       -- HTML tag symbol ("<" & ">")
    "@tag guifg=#f85e84",                 -- HTML tag name
    "@tag.attribute guifg=#7accd7",       -- HTML tag attribute

    -- Diagnostics
    "DiagnosticVirtualTextError guifg=#f85e84 guibg=#422f36",
    "DiagnosticVirtualTextWarn guifg=#e5c463 guibg=#403a33",
    "DiagnosticVirtualTextInfo guifg=#7accd7 guibg=#353a3e",
    "DiagnosticVirtualTextHint guifg=#9ecd6f guibg=#393a34",

    -- Git
    "GitSignsChange guifg=#ef9062",
    "GitSignsChangeNr guifg=#ef9062",

    -- nvim-tree (File explorer)
    "NvimTreeFolderIcon guifg=#e5c463",
    "NvimTreeFolderName guifg=#c1c0c0",
    "NvimTreeEmptyFolderName guifg=#c1c0c0",
    "NvimTreeIndentMarker guifg=#5b595c",
    "NvimTreeOpenedFolderName guifg=#c1c0c0",
  }
end

