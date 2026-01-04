-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.g.lazyvim_nerd_font = true
    end,
  },
}
-- vim.filetype.add({
--   extension = {
--     css = "css",
--   },
-- })
