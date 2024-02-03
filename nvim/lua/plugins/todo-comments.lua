local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	require("todo-comments").setup()

	Set_keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
end

return M
