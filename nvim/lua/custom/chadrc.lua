-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
    theme = "radium",
    changed_themes = {
        radium = {
            base_30 = {
                black2 = "#101317",
                lightbg = "#101317",
                statusline_bg = "#101317",
            }
        }
    }
}

M.plugins = {

    user = require "custom.plugins",

    ["kyazdani42/nvim-tree.lua"] = {
        override_options = {
            filter = {
                dotfiles = true,
            },
            view = {
                hide_root_folder = false,
            },
        },
    },

    ["NvChad/ui"] = {
        override_options = {
            statusline = {
                separator_style = "round",
                overriden_modules = function()
                    return require "custom.statusline_overrides"
                end,
            },
            tabufline = {
                lazyload = false,
                overriden_modules = function()
                    return require "custom.tabufline_overrides"
                end,
            },
        },
    },
}

M.mappings = require "custom.mappings"


return M
