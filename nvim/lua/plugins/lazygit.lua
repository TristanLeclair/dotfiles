local M = {
  "kdheepak/lazygit.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  Set_keymap("n", "<leader>lg", "<cmd>LazyGit<cr>", { noremap = true, silent = true })
end

return M
