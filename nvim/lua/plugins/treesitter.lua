require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "css", "html", "javascript", "tsx", "typescript", "c", "cpp", "python", "lua", "go", "bash",
    "latex", "markdown", "json", "toml", "yaml", "gitignore", "gitattributes", "gitcommit",
    "git_rebase", "git_config", "make", "vim", "vimdoc", "java", "sql", "gomod", "gosum", "ocaml",
    "ocaml_interface", "ocamllex", "markdown_inline", "todotxt", "csv", "cuda", "diff"
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}
