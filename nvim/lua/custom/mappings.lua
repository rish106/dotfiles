-- n, v, i, t = mode names
local M = {}

M.disabled = {
	n = {
		["<leader>fw"] = "",
		["<leader>t"] = "",
		["<leader>tk"] = "",
		["<leader>th"] = "",
		["<leader>tt"] = "",
		["<C-n>"] = "",
		["<C-c>"] = "",
		["<C-b>"] = "",
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
    }
}

M.general = {
    i = {
        -- save file in insert mode
        ["<C-s>"] = { "<cmd> w <CR>", "save file" },
    },
	n = {
		-- Copy all
		["YY"] = { "<cmd> %y* <CR>", "copy whole file" },
        ["<leader>fw"] = {"@g"},
	},
	x = {
		-- copy selected lines to clipboard
		["<leader>y"] = { "\"*y" },
	},
}

M.tabufline = {
	n = {
		-- cycle through buffers
		["K"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},

		["J"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},
	},
}

M.lspconfig = {
	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {
		["gK"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
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
		-- theme switcher
		["<leader>hh"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
	},
}

M.cphelper = {
	n = {
		["<leader>cr"] = { "<cmd> CphReceive <CR>", "receive test cases of problem" },
		["<leader>ct"] = { "<cmd> CphTest <CR>", "run test cases" }
	}
}

vim.cmd[[
    augroup run_file
        autocmd BufEnter *.cpp let @g=":w\<CR> :!g++ -std=c++17 \"%\"\<CR>:40vsp | term ./a.out\<CR>i"
        autocmd BufEnter *.py let @g=":w\<CR>:40vsp | term python3 \"%\"\<CR>i"
        autocmd BufEnter *.go let @g=":w\<CR>:40vsp | term go run \"%\"\<CR>i"
        autocmd BufEnter *.html let @g=":w\<CR>:40vsp | term npx parcel \"%\"\<CR>i"
    augroup end
]]

return M
