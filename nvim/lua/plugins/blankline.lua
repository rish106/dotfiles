require("ibl").setup {
  enabled = true,
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "lazy",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "",
    },
    buftypes = {
      "terminal",
    }
  },
  whitespace = {
    remove_blankline_trail = true,
  },
  scope = {
    enabled = false,
  },
}

local hooks = require "ibl.hooks"
hooks.register(
  hooks.type.WHITESPACE,
  hooks.builtin.hide_first_space_indent_level
)
