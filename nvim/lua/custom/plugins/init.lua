-- custom/plugins/init.lua
-- we're basically returning a table!

local overrides = require "custom.plugins.overrides"

return {
    -- Install plugin
    ["p00f/cphelper.nvim"] = {},
    ["ThePrimeagen/vim-be-good"] = {},

    -- Remove plugin
    ["NvChad/nvterm"] = false,
    ["folke/which-key.nvim"] = false,

    -- change config
    ["neovim/nvim-lspconfig"] = {
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end,
    },

    ["kyazdani42/nvim-tree.lua"] = {
        override_options = overrides.nvimtree
    },

    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = overrides.treesitter
    },

    ["williamboman/mason.nvim"] = {
        override_options = overrides.mason
    },

    ["NvChad/ui"] = {
        override_options = {
            statusline = {
                separator_style = "round",
                overriden_modules = function()
                    return require "custom.plugins.statusline_overrides"
                end,
            },
            tabufline = {
                lazyload = false,
                overriden_modules = function()
                    return require "custom.plugins.tabufline_overrides"
                end,
            },
        },
    },

}
