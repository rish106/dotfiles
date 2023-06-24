---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>fw"] = "",
    ["<leader>fo"] = "",
    ["<leader>t"] = "",
    ["<leader>tk"] = "",
    ["<leader>th"] = "",
    ["<leader>tt"] = "",
    ["<leader>td"] = "",
    ["<C-n>"] = "",
    ["<C-c>"] = "",
    ["<C-e>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["K"] = "",
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
    ["<leader>y"] = "",
  },
  i = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
  },
}

M.general = {
  i = {
    -- save file in insert mode
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },
    ["<TAB>"] = { "\t" },
  },
  n = {
    -- Copy all
    ["YY"] = { "<cmd> %y* <CR>", "copy whole file" },
    ["<leader>fw"] = {"@g"},
    ["<C-d>"] = {"<C-d>zz"}, -- center after moving half page down
    ["<C-u>"] = {"<C-u>zz"}, -- center after moving half page up
  },
  x = {
    -- copy selected lines to clipboard
    ["<leader>y"] = { "\"*y" },
    ["<C-d>"] = {"<C-d>zz"}, -- center after moving half page down
    ["<C-u>"] = {"<C-u>zz"}, -- center after moving half page up
  },
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["K"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["J"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

M.gitsigns ={
  n = {
    ["<leader>dt"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  }
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gK"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>t"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>kk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    ["<leader>jd"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    -- theme switcher
    ["<leader>hh"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.cphelper = {
  n = {
    ["<leader>fo"] = { "<cmd> CphReceive <CR>", "receive test cases of problem" },
    ["<leader>fj"] = { "<cmd> CphTest <CR>", "run test cases" }
  }
}

M.luasnip = {
  i = {
    ["<C-d>"] = { "<cmd> lua require'luasnip'.jump(1) <CR>", "go to next node in snippet" },
    ["<C-u>"] = { "<cmd> lua require'luasnip'.jump(-1) <CR>", "go to previous node in snippet" }
  },
  s = {
    ["<C-d>"] = { "<cmd> lua require'luasnip'.jump(1) <CR>", "go to next node in snippet" },
    ["<C-u>"] = { "<cmd> lua require'luasnip'.jump(-1) <CR>", "go to previous node in snippet" }
  }
}

M.trouble = {
  n = {
    ["<leader>hx"] = { "<cmd> TroubleToggle <CR>", "toggle trouble" },
    ["<leader>hw"] = { "<cmd> TroubleToggle workspace_diagnostics <CR>", "toggle trouble" },
    ["<leader>hd"] = { "<cmd> TroubleToggle document_diagnostics <CR>", "toggle trouble" },
    ["<leader>hq"] = { "<cmd> TroubleToggle quickfix <CR>", "toggle trouble" },
    ["<leader>hl"] = { "<cmd> TroubleToggle loclist <CR>", "toggle trouble" },
    ["gR"] = { "<cmd> TroubleToggle lsp_references <CR>", "toggle trouble" },
  }
}

vim.cmd[[
  augroup run_file
  autocmd BufEnter *.cpp let @g=":w\<CR> :40vsp | term g++-13 -std=c++17 -O2 \"%\" && ./a.out\<CR>i"
  autocmd BufEnter *.c let @g=":w\<CR> :40vsp | term gcc \"%\" && ./a.out\<CR>i"
  autocmd BufEnter *.py let @g=":w\<CR>:40vsp | term python3 \"%\"\<CR>i"
  autocmd BufEnter *.go let @g=":w\<CR>:40vsp | term go run \"%\"\<CR>i"
  autocmd BufEnter *.sml let @g=":w\<CR>:40vsp | term sml <\"%\"\<CR>i"
  autocmd BufEnter *.html let @g=":w\<CR>:40vsp | term npx parcel \"%\"\<CR>i"
  autocmd BufEnter *.tex let @g=":TexlabBuild\<CR>"
  augroup end
]]

-- more keybinds!

return M
