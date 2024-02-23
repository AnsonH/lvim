-- vim:foldmethod=marker

local M = {}

-- List of Mason packages to ensure installation
--- @see https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
M.mason_ensured_installed = {
  -- LSP
  -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
  "html",
  "jsonls",
  "lua_ls",
  "tailwindcss",
  "tsserver",
  "vimls",
  "yamlls",

  -- Linters
  "eslint_d",
  "shellcheck",

  -- Formatters
  "prettier",
  "shfmt",
  "stylua",
}

-- Formatters & Linters {{{

-- https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "prettier" },
  {
    name = "shfmt",
    filetypes = { "sh" },
  },
  {
    name = "stylua",
    filetypes = { "lua" },
  },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "eslint_d" },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
})
-- }}}

---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

---you can set a custom on_attach function that will be used for all the language servers
---See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

return M
