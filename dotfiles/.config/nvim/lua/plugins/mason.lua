
return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ensure_installed = {
        "shfmt",
        "shellcheck",
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "intelephense",
        "tailwindcss",
        "emmet_ls",
        "cssls",
        "html",
        "ts_ls",
        "lua_ls",
        "bashls",
        "jsonls",
        "marksman",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
      },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })
  end,
}
