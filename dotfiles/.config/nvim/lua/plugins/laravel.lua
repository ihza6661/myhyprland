return {
  "adalessa/laravel.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
  },
  cond = function()
    return vim.fn.findfile("artisan", ".;") ~= ""
  end,
  config = function()
    require("laravel").setup()
  end,
}
