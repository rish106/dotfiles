local opt = vim.opt
local g = vim.g

g.luasnippets_path = "~/.config/nvim/lua/custom/snippets"

opt.relativenumber = true
opt.scrolloff = 6
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

vim.cmd[[
    autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave * call system("tmux rename-window " . shellescape(tmuxtitle))
]]
