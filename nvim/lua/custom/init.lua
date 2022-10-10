local opt = vim.opt
local g = vim.g

g.luasnippets_path = "~/.config/nvim/lua/custom/snippets"

vim.cmd "set binary"
vim.cmd "set noeol"
opt.relativenumber = true
opt.scrolloff = 6
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
