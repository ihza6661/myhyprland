-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Global transparency settings for all themes and sidebars
vim.api.nvim_create_autocmd({ "ColorScheme", "UIEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    local groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "MsgArea",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePromptNormal",
      "TelescopePromptBorder",
      "TelescopeResultsNormal",
      "TelescopeResultsBorder",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",
      "LazyNormal",
      "MasonNormal",
      "WhichKeyNormal",
      "NoicePopup",
      "Pmenu",
      "PmenuSel",
      "PmenuKind",
      "PmenuKindSel",
      "PmenuExtra",
      "PmenuExtraSel",
      "NormalSB", -- Sidebar windows
      "BufferLineFill",
      "BufferLineBackground",
    }

    for _, group in ipairs(groups) do
      pcall(vim.cmd, "highlight " .. group .. " guibg=NONE ctermbg=NONE")
    end
  end,
})

-- vim.filetype.add({
--   pattern = {
--     [".*%.module%.css"] = "css",
--     [".*%.custom%-style"] = "css",
--   },
-- })
