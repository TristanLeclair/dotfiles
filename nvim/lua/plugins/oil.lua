local M = {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}

Set_keymap("n", "<leader>eo", "<cmd>Oil<cr>", "Oil")

return M
