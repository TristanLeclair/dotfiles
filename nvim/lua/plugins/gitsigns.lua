local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local gs = require("gitsigns")

  gs.setup()

  Set_keymap("n", "<leader>gb", gs.toggle_current_line_blame, { silent = true }, "Toggle line blame")
end

return M
