vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
}
