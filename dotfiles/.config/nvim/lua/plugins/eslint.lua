return {
  "mfussenegger/nvim-lint",
  event = "BufEnter",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "npx eslint_d" },
      typescript = { "npx eslint_d" },
      javascriptreact = { "npx eslint_d" },
      typescriptreact = { "npx eslint_d" },
      svelte = { "npx eslint_d" },
      vue = { "npx eslint_d" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
