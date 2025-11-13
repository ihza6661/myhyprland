return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "live",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    { "github/copilot.vim" },
    { "nvim-telescope/telescope.nvim", optional = true },
  },
  build = "make tiktoken",
  opts = {},
  config = function(_, opts)
    require("CopilotChat").setup(opts)
  end,
}
