-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

-- Override <leader>fg to use live_grep instead of git_files
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })

map("n", "<leader>th", function()
  if vim.g.colors_name == "pitchblack" then
    vim.cmd("colorscheme default")
  else
    vim.cmd("colorscheme pitchblack")
  end
end, { desc = "Toggle Colorscheme" })
