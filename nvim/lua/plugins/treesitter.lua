require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "css", "html", "javascript", "tsx", "typescript", "c", "cpp", "python", "lua", "go", "bash", "latex", "markdown", "json", "toml", "yaml", "gitignore", "gitattributes", "gitcommit", "git_rebase", "make", "vim", "vimdoc"
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}
