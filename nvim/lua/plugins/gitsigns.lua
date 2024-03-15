local M = {
  "lewis6991/gitsigns.nvim",
}

function M.config()
  require("gitsigns").setup()

  Set_keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", { silent = true }, "Toggle line blame")
end

return M
