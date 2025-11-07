return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          filetypes = { "php" },
        },
        emmet_ls = {
          filetypes = { "blade" },
        },
      },
    },
  },
}
