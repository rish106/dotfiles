local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({})
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = "~/.config/nvim/lua/custom/snippets",
      })
    end,
  },

  -- Install a plugin
  {
    "editorconfig/editorconfig-vim",
    lazy = false,
  },

  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    opts = {},
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvterm",
    enabled = false
  },

  {
    "folke/which-key.nvim",
    enabled = false
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
