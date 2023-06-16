---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local overrides = require "custom.configs.overrides"

M.ui = {
  theme = "catppuccin",
  changed_themes = {
    catppuccin = {
      base_30 = {
        black = "#11111b",
        black2 = "#11111b",
        statusline_bg = "#11111b",
        lightbg = "#11111b",
      },
      base_16 = {
        base00 = "#11111b",
      },
    },
  },
  cmp = {
    selected_item_bg = "simple",
  },
  statusline = {
    theme = "default",
    separator_style = "round",
    overriden_modules = function ()
      return overrides.statusline
    end,
  },
  tabufline = {
    lazyload = false,
    overriden_modules = function ()
      return overrides.tabufline
    end,
  }
}

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = vim.tbl_filter(function(name)
        return name ~= "editorconfig"
      end, require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins),
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
