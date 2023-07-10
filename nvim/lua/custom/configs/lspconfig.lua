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
  filetypes = { "html", "javascript.jsx", "javascriptreact", "typescript.jsx", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern( "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts" ),
}

lspconfig.vtsls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- root_dir = lspconfig.util.root_pattern( "package.json", "tsconfig.json", "jsconfig.json" )
}

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    texlab = {
      build = {
        args = { "-pdf", "-shell-escape", "-interaction=nonstopmode", "-synctex=1", "-auxdir=./aux", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = false,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false,
      },
    }
  }
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false,
        },
      },
    },
  },
}
