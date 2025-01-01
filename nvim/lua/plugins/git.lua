local M = {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gs = require("gitsigns")

      gs.setup()

      Set_keymap("n", "<leader>gh[", gs.next_hunk, "Next hunk")
      Set_keymap("n", "<leader>gh]", gs.prev_hunk, "Previous hunk")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}

return M
