return {
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = {
          "css",
          "scss",
          "html",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "lua",
        },
        user_default_options = {
          names = true,  -- Highlight color names like 'red'
          rgb_fn = true, -- rgb(...) support
          hsl_fn = true, -- hsl(...) support
          -- mode = "background", -- Or 'virtualtext'
          mode = "virtualtext",
          tailwind = true, -- Tailwind color class support
        },
      })
    end,
  },
}
