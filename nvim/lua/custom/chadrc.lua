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

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"


return M
