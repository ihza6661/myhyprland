return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main", -- Ensure this is still "main"
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    { "github/copilot.vim" }, -- Keep this dependency
    { "nvim-telescope/telescope.nvim", optional = true },
  },
  build = "make tiktoken",
  opts = {
    -- See Configuration section for options
    model = 'gpt-4.1',           -- AI model to use
    temperature = 0.1,           -- Lower = focused, higher = creative
    window = {
      layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
      width = 0.5,              -- 50% of screen width
    },
    auto_insert_mode = true,     -- Enter insert mode when opening
  },
  config = function(_, opts)
    require("CopilotChat").setup(opts)
    local map = vim.keymap.set
    map("n", "<leader>zc", ":CopilotChat<CR>", { desc = "Chat with Copilot" })
    map("v", "<leader>ze", ":CopilotChatExplain<CR>", { desc = "Explain Code" })
    map("v", "<leader>zr", ":CopilotChatReview<CR>", { desc = "Review Code" })
    map("v", "<leader>zf", ":CopilotChatFix<CR>", { desc = "Fix Code Issues" })
    map("v", "<leader>zo", ":CopilotChatOptimize<CR>", { desc = "Optimize Code" })
    map("v", "<leader>zd", ":CopilotChatDocs<CR>", { desc = "Generate Docs" })
    map("v", "<leader>zt", ":CopilotChatTests<CR>", { desc = "Generate Tests" })
    map("n", "<leader>zm", ":CopilotChatCommit<CR>", { desc = "Generate Commit Message" })
    map("v", "<leader>zs", ":CopilotChatCommit<CR>", { desc = "Generate Commit for Selection" })
    map("n", "<leader>zn", ":CopilotChatNext<CR>", { desc = "CopilotChat Next Message" })
    map("n", "<leader>zp", ":CopilotChatPrev<CR>", { desc = "CopilotChat Previous Message" })
    map("n", "<leader>zh", ":CopilotChatHelp<CR>", { desc = "CopilotChat Help" })
  end,
}
