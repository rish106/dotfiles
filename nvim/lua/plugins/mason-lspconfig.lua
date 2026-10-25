require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd",
    "pylsp",
  },
})
