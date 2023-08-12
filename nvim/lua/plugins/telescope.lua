require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  picker = {
    find_files = {
      theme = "dropdown",
    },
  },
}
