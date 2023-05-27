--[[ Autocommands (https://www.lunarvim.org/docs/configuration/autocommands) ]]--

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
}

