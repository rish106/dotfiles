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
    nvimtree = true,
    treesitter = true,
    telescope = {
      enabled = true,
    },
    mason = true,
    indent_blankline = {
      enable = true,
    },
    native_lsp = {
      enabled = true,
    },
    lsp_trouble = true,
    which_key = true,
  },
  custom_highlights = function(colors)
    return {
      CurSearch = { bg = colors.yellow },
      CursorLineNr = { fg = colors.white },
    }
  end,
}

vim.cmd.colorscheme "catppuccin"

local colors = require("catppuccin.palettes").get_palette "mocha"
vim.api.nvim_set_hl(0, "CmpBorder", { fg = colors.white, bg = colors.black })
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.black, bg = colors.white })
vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#bac2de", bg = "#1e1e2e" })
