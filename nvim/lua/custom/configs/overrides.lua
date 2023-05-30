local M = {}

local my_root_folder_label = function(path)
    return "./" .. vim.fn.fnamemodify(path, ":t") .. "/"
end

M.treesitter = {
  ensure_installed = {
    -- web dev
    "css",
    "html",
    "javascript",
    "tsx",
    "typescript",

    -- c/cpp/python
    "c",
    "cpp",
    "python",

    -- lua/go/bash
    "lua",
    "go",
    "bash",

    -- md/json
    "markdown",
    "json",

    -- misc
    "gitignore",
    "gitattributes",
    "gitcommit",
    "git_rebase",
    "make",
    "vim",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",

    -- web dev stuff
    "typescript-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    hide_root_folder = false,
  },

  renderer = {
    root_folder_label = my_root_folder_label,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "!",
          untracked = "",
        }
      }
    },
  },
}

M.statusline = {
  fileInfo = function()
    return ""
  end,

  cwd = function()
    return ""
  end,

  cursor_position = function()
    return ""
  end,
}

M.tabufline = {
  buttons = function()
    return ""
  end,
}

return M
