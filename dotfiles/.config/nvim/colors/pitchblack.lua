-- Pitch Black Colorscheme (Transparent)
-- save as: ~/.config/nvim/colors/pitchblack.lua
local hl = vim.api.nvim_set_hl
-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "pitchblack"
-- Base UI
hl(0, "Normal", { bg = "NONE", fg = "#d0d0d0" })
hl(0, "NormalFloat", { bg = "NONE", fg = "#d0d0d0" })
hl(0, "SignColumn", { bg = "NONE" })
hl(0, "LineNr", { fg = "#444444", bg = "NONE" })
hl(0, "CursorLine", { bg = "#111111" }) -- keep subtle highlight
hl(0, "CursorLineNr", { fg = "#ffffff", bg = "#111111", bold = true })
hl(0, "Visual", { fg = "#dcdcdc", bg = "#264f78" })
hl(0, "Pmenu", { bg = "#0b0b0b", fg = "#d0d0d0" })
hl(0, "StatusLine", { bg = "NONE", fg = "#d0d0d0" })
hl(0, "StatusLineNC", { bg = "NONE", fg = "#5c5c5c" })
-- Syntax
hl(0, "Comment", { fg = "#5c6370", italic = true })
hl(0, "Keyword", { fg = "#61afef", bold = true })
hl(0, "String", { fg = "#98c379" })
hl(0, "Function", { fg = "#c678dd" })
hl(0, "Type", { fg = "#e5c07b" })
hl(0, "Constant", { fg = "#56b6c2" })
hl(0, "Number", { fg = "#d19a66" })
hl(0, "Boolean", { fg = "#e06c75", bold = true })
-- Diagnostics
hl(0, "DiagnosticError", { fg = "#e06c75" })
hl(0, "DiagnosticWarn", { fg = "#d19a66" })
hl(0, "DiagnosticInfo", { fg = "#61afef" })
hl(0, "DiagnosticHint", { fg = "#98c379" })
-- Git signs
hl(0, "GitSignsAdd", { fg = "#98c379" })
hl(0, "GitSignsChange", { fg = "#61afef" })
hl(0, "GitSignsDelete", { fg = "#e06c75" })
hl(0, "Type", { fg = "#e5c07b" })
hl(0, "Constant", { fg = "#56b6c2" })
hl(0, "Number", { fg = "#d19a66" })
hl(0, "Boolean", { fg = "#e06c75", bold = true })
-- Diagnostics
hl(0, "DiagnosticError", { fg = "#e06c75" })
hl(0, "DiagnosticWarn", { fg = "#d19a66" })
hl(0, "DiagnosticInfo", { fg = "#61afef" })
hl(0, "DiagnosticHint", { fg = "#98c379" })
-- Git signs
hl(0, "GitSignsAdd", { fg = "#98c379" })
hl(0, "GitSignsChange", { fg = "#61afef" })
hl(0, "GitSignsDelete", { fg = "#e06c75" })
hl(0, "DiagnosticHint", { fg = "#98c379" })

-- Git signs
hl(0, "GitSignsAdd", { fg = "#98c379" })
hl(0, "GitSignsChange", { fg = "#61afef" })
hl(0, "GitSignsDelete", { fg = "#e06c75" })
