require("bufferline").setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    indicator = {
      style = "icon",
    },
    separator_style = "thick",
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = {
      {
        filetype = "NvimTree",
        separator = true,
      },
    },
  },
}
