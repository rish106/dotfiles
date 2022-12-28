-- custom/abc.lua must return a table
local fn = vim.fn
local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style)
  or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]

return {
    fileInfo = function()
        return ""
    end,

    cwd = function()
        return ""
    end,

    cursor_position = function()
        -- local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "
        --
        -- local current_line = fn.line "."
        -- local total_line = fn.line "$"
        -- local text = tostring(current_line) .. "/" .. tostring(total_line)
        --
        -- return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
        return ""
    end,
}
