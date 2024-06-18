local M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = { "LazyGit" },
}

function M.config() end
Set_keymap("n", "<leader>lg", "<cmd>LazyGit<cr>")

return M
