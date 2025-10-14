local map = vim.keymap.set

-- Laravel
map("n", "<leader>la", "<cmd>Artisan<cr>", { desc = "Run Artisan command" })
map("n", "<leader>lr", "<cmd>Telescope laravel routes<cr>", { desc = "Search routes" })
map("n", "<leader>lv", "<cmd>Telescope laravel views<cr>", { desc = "Search views" })
map("n", "<leader>lc", "<cmd>Telescope laravel commands<cr>", { desc = "Search commands" })
map("n", "<leader>le", "<cmd>Telescope laravel events<cr>", { desc = "Search events" })
