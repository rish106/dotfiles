require("catppuccin").setup {
  flavour = "mocha",
  no_bold = true,
  no_italic = true,
  no_underline = true,
  color_overrides = {
    mocha = {
      base = "#11111b",
      mantle = "#11111b",
      crust = "#11111b",
    },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
    },
    lsp_trouble = true,
    mason = true,
    native_lsp = {
      enabled = true,
    },
    telescope = {
      enabled = true,
    },
    treesitter = true,
    which_key = true,
  },
  custom_highlights = function(colors)
    return {
      CurSearch = { bg = colors.yellow },
      CursorLineNr = { fg = colors.subtext0 },
      CmpBorder = { fg = colors.subtext0, bg = colors.base },
      Pmenu = { fg = colors.text, bg = colors.base },
      PmenuSel = { fg = colors.text, bg = colors.surface0 },
      LuaLineDiffAdd = { fg = colors.subtext0 },
      LuaLineDiffChange = { fg = colors.subtext0 },
      LuaLineDiffDelete = { fg = colors.subtext0 },
    }
  end,
}

vim.cmd.colorscheme "catppuccin"
