local M = {
	"folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	local todo_comments = require("todo-comments")

  todo_comments.setup()

  local opts = { noremap = true, silent = true }

	Set_keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts, "Find todos")

  Set_keymap("n", "<leader>ntj", function() todo_comments.jump_next() end, opts, "Next todo")
  Set_keymap("n", "<leader>ntk", function() todo_comments.jump_prev() end, opts, "Prev todo")
end

return M
