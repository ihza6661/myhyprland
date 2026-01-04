-- graphite/neovim.lua

-- This is a self-contained color scheme for Neovim.
-- It doesn't require any external plugins.

local M = {}

M.colors = {
  black = "#000000",
  dark_grey = "#303030",
  grey = "#5c5c5c",
  light_grey = "#d1d1d1",
  white = "#ffffff",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.g.colors_name = "graphite"

  local c = M.colors
  local function hi(group, fg, bg, style)
    local cmd = "highlight " .. group
    if fg then cmd = cmd .. " guifg=" .. fg end
    if bg then cmd = cmd .. " guibg=" .. bg end
    if style then cmd = cmd .. " gui=" .. style end
    vim.cmd(cmd)
  end

  -- Editor UI
  hi("Normal", c.light_grey, c.dark_grey)
  hi("LineNr", c.grey, c.dark_grey)
  hi("CursorLineNr", c.white, c.dark_grey)
  hi("CursorLine", nil, c.black)
  hi("ColorColumn", nil, c.black)
  hi("SignColumn", c.grey, c.dark_grey)
  hi("VertSplit", c.black, c.black)
  hi("StatusLine", c.light_grey, c.black)
  hi("StatusLineNC", c.grey, c.black)
  hi("TabLine", c.grey, c.black)
  hi("TabLineSel", c.white, c.dark_grey)
  hi("TabLineFill", c.grey, c.black)
  hi("Pmenu", c.light_grey, c.black)
  hi("PmenuSel", c.white, c.grey)
  hi("PmenuSbar", nil, c.black)
  hi("PmenuThumb", nil, c.grey)
  hi("Visual", nil, c.grey)
  hi("Search", nil, c.grey)

  -- Syntax
  hi("Comment", c.grey, nil, "italic")
  hi("Constant", c.white, nil)
  hi("String", c.light_grey, nil)
  hi("Character", c.light_grey, nil)
  hi("Number", c.light_grey, nil)
  hi("Boolean", c.white, nil)
  hi("Float", c.light_grey, nil)
  hi("Identifier", c.light_grey, nil)
  hi("Function", c.white, nil)
  hi("Statement", c.white, nil)
  hi("Conditional", c.white, nil)
  hi("Repeat", c.white, nil)
  hi("Label", c.white, nil)
  hi("Operator", c.white, nil)
  hi("Keyword", c.white, nil)
  hi("Exception", c.white, nil)
  hi("Type", c.white, nil)
  hi("StorageClass", c.white, nil)
  hi("Structure", c.white, nil)
  hi("Typedef", c.white, nil)
  hi("PreProc", c.white, nil)
  hi("Include", c.white, nil)
  hi("Define", c.white, nil)
  hi("Macro", c.white, nil)
  hi("PreCondit", c.white, nil)
  hi("Title", c.white, nil, "bold")
  hi("Special", c.white, nil)
  hi("Delimiter", c.light_grey, nil)
  hi("Underlined", c.white, nil, "underline")
  hi("Ignore", c.grey, nil)
  hi("Error", c.white, c.grey)
  hi("Todo", c.black, c.light_grey)

  -- Diffs
  hi("DiffAdd", c.light_grey, c.grey)
  hi("DiffChange", c.light_grey, c.grey)
  hi("DiffDelete", c.light_grey, c.grey)
  hi("DiffText", c.white, c.black)
end

-- Apply the theme and return the LazyVim config
M.setup()


