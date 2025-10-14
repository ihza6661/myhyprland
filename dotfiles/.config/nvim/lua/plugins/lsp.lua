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
        eslint = {
          cmd = { "vscode-eslint-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
          root_dir = require("lspconfig.util").root_pattern(
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.json",
            ".eslintrc.yml",
            "package.json",
            "node_modules"
          ),
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },
}
