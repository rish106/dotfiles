local map = vim.keymap.set

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map("n", "<ESC>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Center view after moving up/down half a page
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Comment toggle
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end, { desc = "Toggle comment" })
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })

-- Execute code in vsplit
map("n", "<leader>fw", "@g", { silent = true })

-- Competitive programming
map("n", "<leader>fo", "<cmd> CphReceive <CR>", { silent = true, desc = "recieve testcases" })
map("n", "<leader>fj", "<cmd> CphTest <CR>", { silent = true, desc = "run on testcases" })

-- Nvim tree
map("n", "<leader>t", "<cmd> NvimTreeToggle <CR>", { silent = true })
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { silent = true })

-- Go to next/prev buffer
map("n", "J", "<cmd> BufferLineCyclePrev <CR>", { silent = true, noremap = true })
map("n", "K", "<cmd> BufferLineCycleNext <CR>", { silent = true, noremap = true })

-- Copy everything in buffer
map("n", "YY", "<cmd> %y+ <CR>", { silent = true, noremap = true })

-- Trouble
map("n", "<leader>v", "<cmd> TroubleToggle <CR>", { silent = true })

vim.api.nvim_create_augroup("execute_code", {
  clear = true,
})

local function execute_code(extension, command)
  vim.api.nvim_create_autocmd("BufEnter", {
    group = "execute_code",
    pattern = "*." .. extension,
    command = "let @g=':40vsp | term " .. command .. "\n i'",
  })
end

execute_code("c", "gcc \"%\" && ./a.out")
execute_code("cpp", "g++-13 -std=c++17 -O2 \"%\" && ./a.out")
execute_code("py", "python3 \"%\"")
execute_code("go", "go run \"%\"")
execute_code("sml", "sml <\"%\"")
execute_code("html", "npx parcel \"%\"")
vim.api.nvim_create_autocmd("BufEnter", {
  group = "execute_code",
  pattern = "*.tex",
  command = "let @g=':TexlabBuild\n'",
})


-- vim.cmd[[
--   augroup run_file
--   autocmd BufEnter *.cpp let @g=":w\<CR> :40vsp | term g++-13 -std=c++17 -O2 \"%\" && ./a.out\<CR>i"
--   autocmd BufEnter *.c let @g=":w\<CR> :40vsp | term gcc \"%\" && ./a.out\<CR>i"
--   autocmd BufEnter *.py let @g=":w\<CR>:40vsp | term python3 \"%\"\<CR>i"
--   autocmd BufEnter *.go let @g=":w\<CR>:40vsp | term go run \"%\"\<CR>i"
--   autocmd BufEnter *.sml let @g=":w\<CR>:40vsp | term sml <\"%\"\<CR>i"
--   autocmd BufEnter *.html let @g=":w\<CR>:40vsp | term npx parcel \"%\"\<CR>i"
--   autocmd BufEnter *.tex let @g=":TexlabBuild\<CR>"
--   augroup end
-- ]]
