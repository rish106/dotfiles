local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local servers = { }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascriptreact", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern( 'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts' ),
}

lspconfig.tsserver.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
}
