return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Optional: customize keymaps
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
    }
  end,
}
