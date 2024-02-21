require("telescope").setup {
  defaults = {},
  extensions = {
    undo = {
      mappings = {
        i = {
          ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-r>"] = require("telescope-undo.actions").restore,
        },
        n = {
          ["y"] = require("telescope-undo.actions").yank_additions,
          ["Y"] = require("telescope-undo.actions").yank_deletions,
          ["u"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
}

require("telescope").load_extension("undo")
require("telescope").load_extension("fzf")
