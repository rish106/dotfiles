-- custom abc.lua, must return a table

local M = {}

M.nvimtree = {
    filter = {
        dotfiles = true,
    },
    view = {
        hide_root_folder = false,
    },
}

M.treesitter = {
    ensure_installed = {
        "bash",
        "cpp",
        "css",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
    },
}

M.mason = {
    ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
    },
}

return M
