return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters = opts.formatters or {}

    --------------------------------------------------------------------------
    -- Disable ESLint formatting (keep diagnostics only)
    --------------------------------------------------------------------------
    opts.formatters.eslint = { disabled = true }

    --------------------------------------------------------------------------
    -- Prettierd settings
    --------------------------------------------------------------------------
    opts.formatters.prettierd = {
      require_cwd = false, -- allow formatting without project config
    }

    --------------------------------------------------------------------------
    -- Prevent Prettier from touching Blade files
    --------------------------------------------------------------------------
    opts.formatters.prettier = {
      disabled_filetypes = { "blade" },
    }

    --------------------------------------------------------------------------
    -- Filetype → formatter mappings (with fallback)
    --------------------------------------------------------------------------
    opts.formatters_by_ft.typescript = { "prettierd", "prettier" }
    opts.formatters_by_ft.typescriptreact = { "prettierd", "prettier" }
    opts.formatters_by_ft.javascript = { "prettierd", "prettier" }
    opts.formatters_by_ft.javascriptreact = { "prettierd", "prettier" }
    opts.formatters_by_ft.html = { "prettier" }
    opts.formatters_by_ft.css = { "prettier" }
    opts.formatters_by_ft.blade = { "blade-formatter" }

    --------------------------------------------------------------------------
    -- Enable fallback instead of stopping after the first formatter
    --------------------------------------------------------------------------
    opts.stop_after_first = false

    return opts
  end,
}
