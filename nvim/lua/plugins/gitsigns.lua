local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local gs = require("gitsigns")

  gs.setup()

  Set_keymap("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle line blame")
  Set_keymap("n", "<leader>gh[", gs.next_hunk, "Next hunk")
  Set_keymap("n", "<leader>gh]", gs.prev_hunk, "Previous hunk")
end

return M
