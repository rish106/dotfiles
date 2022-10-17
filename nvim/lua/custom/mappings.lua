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
		["<C-h>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",
		["<C-l>"] = "",
		["K"] = "",
		["<TAB>"] = "",
		["<S-Tab>"] = "",
		["<leader>y"] = "",
	},
}

M.general = {
    i = {
        -- save file in insert mode
        ["<C-s>"] = { "<cmd> w <CR>", "save file" },
    },
	n = {
		-- Copy all
		["YY"] = { "<cmd> %y* <CR>", "copy whole file" },
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
" for detecting OS
if !exists("g:os")
	if has("win64") || has("win32") || has("win16")
		let g:os = "Windows"
	else
		let g:os = substitute(system('uname'), '\n', '', '')
	endif
endif

" important option that should already be set!
set hidden

" available options:
" * g:split_term_style
" * g:split_term_resize_cmd
function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	exec buffercmd
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
	autocmd BufEnter <buffer> startinsert
endfunction

command! -nargs=0 CompileAndRunCpp call TermWrapper(printf('g++ -std=c++17 %s && ./a.out', expand('%')))
autocmd FileType cpp nnoremap <leader>fw :CompileAndRunCpp<CR>

command! -nargs=0 RunPy call TermWrapper(printf('python3 %s', expand('%')))
autocmd FileType python nnoremap <leader>fw :RunPy<CR>

autocmd FileType html nnoremap <leader>fw :term npx parcel %<CR>

command! -nargs=0 RunGo call TermWrapper(printf('go run %s', expand('%')))
autocmd FileType go nnoremap <leader>fw :RunGo<CR>

" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'
" set splitbelow

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
" let g:split_term_resize_cmd = 'resize 6'
" for horizontal term_style
let g:split_term_resize_cmd = 'vertical resize 40'
" (or let g:split_term_resize_cmd = 'vertical resize 40')
]]

return M
