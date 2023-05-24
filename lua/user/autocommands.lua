--[[ Autocommands (https://www.lunarvim.org/docs/configuration/autocommands) ]]--

local highlights = require("user.highlights")

lvim.autocommands = {
  -- Smart relative lines
  { "InsertEnter", { command = "set norelativenumber" } },
  { "InsertLeave", { command = "set relativenumber" } },

  -- General
  {
    "BufEnter",
    {
      desc = "Disable auto comments on new line",
      command = "set fo-=c fo-=r fo-=o",
    }
  },
  {
    "Colorscheme",
    {
      callback = function()
        highlights.apply_custom_highlights()
      end
    }
  }
}

