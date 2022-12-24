-- custom/plugins/init.lua
-- we're basically returning a table!
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

}
