return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "github/copilot.vim" }, -- or "CopilotC-Nvim/Copilot.vim"
    { "nvim-telescope/telescope.nvim", optional = true },
  },
  opts = {},
  config = function(_, opts)
    require("copilotchat").setup(opts)
  end,
}
