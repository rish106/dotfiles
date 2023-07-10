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

  {
    "hrsh7th/nvim-cmp",
    commit = "950d0e3a93ba61c13b031c086d11eacf4bd48d24",
    opts = require "custom.configs.cmp"
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

  -- Install a plugin
  {
    "p00f/cphelper.nvim",
    event = "VeryLazy",
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "jsx", "typescriptreact", "tsx" },
    opts = {},
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
    config = function (_, opts)
      require("nvim-surround").setup(opts)
    end
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  }

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
