return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- PHP
        intelephense = {
          filetypes = { "php" },
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
            },
          },
        },

        -- Emmet
        emmet_ls = {
          filetypes = { "html", "css", "blade" },
        },

        -- TypeScript / JavaScript
        ts_ls = {
          on_attach = function(client, bufnr)
            -- Disable formatting (use eslint / prettier)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },

        -- ESLint
        eslint = {
          on_attach = function(client, bufnr)
            -- Auto fix ESLint errors on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
      },
    },
  },
}
