return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "html",
      "css",
      "json",
      "bash",
      "python",
      "markdown",
      "markdown_inline",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}

