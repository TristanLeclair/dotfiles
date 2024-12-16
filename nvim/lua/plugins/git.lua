local M = {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gs = require("gitsigns")

      gs.setup()

      Set_keymap("n", "<leader>gh[", function()
        gs.nav_hunk("next")
      end, "Next hunk")
      Set_keymap("n", "<leader>gh]", function()
        gs.nav_hunk("prev")
      end, "Previous hunk")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}

return M
