local M = {
  "folke/zen-mode.nvim",
  opts = {
    plugins = {
      options = {
        laststatus = 0,
      },
    },
  },
}

Set_keymap("n", "<leader>zz", "<cmd>ZenMode<cr>", "Toggle Zen mode")

return M
