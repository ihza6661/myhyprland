return {
  {
    "LazyVim/LazyVim",
    init = function()
      vim.api.nvim_create_autocmd("BufReadPre", {
        callback = function()
          vim.cmd("syntax enable")
        end,
      })
    end,
  },
}
