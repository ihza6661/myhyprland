return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "php", "blade" },
    modules = {},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
