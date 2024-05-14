local M = {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local todo_comments = require("todo-comments")

  todo_comments.setup()

  Set_keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", "Find todos")
  Set_keymap("n", "<leader>ntj", function()
    todo_comments.jump_next()
  end, "Next todo")
  Set_keymap("n", "<leader>ntk", function()
    todo_comments.jump_prev()
  end, "Prev todo")
end

return M
