local opt = vim.opt
local g = vim.g

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = " "
g.maplocalleader = " "

-- Relative numbers
opt.relativenumber = true

-- Scroll off when 6 lines present below/above cursor
opt.scrolloff = 6

-- Set 4 tab spaces default
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

-- Spaces > Tabs
opt.expandtab = true

opt.colorcolumn = "100"

-- Show current line number as absolute, others as relative
opt.number = true

-- Highlight current line number
opt.cursorline = true
opt.cursorlineopt = "number"

opt.splitright = true
opt.splitbelow = false

-- Don't show things like "insert" mode in the cmdline area
opt.showmode = false

g["cph#cpp#compile_command"] = "g++ -ld_classic solution.cpp -o cpp.out"

-- Custom snippets
g.vscode_snippets_path = "~/.config/nvim/snippets"

-- Always show statusline
opt.laststatus = 3

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help "clipboard"`
opt.clipboard = "unnamedplus"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menu,menuone,noselect"

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Expand folds in Cphelper output
vim.cmd[[
  autocmd FileType Results setlocal foldlevel=5
]]

-- Disable Lsp logs
vim.lsp.set_log_level(vim.log.levels.OFF)
