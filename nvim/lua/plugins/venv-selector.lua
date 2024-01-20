local M = {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
}

function M.config()
  require("venv-selector").setup()
	Set_keymap("n", "<leader>lvc", "<cmd>VenvSelectCached<cr>", { silent = true, noremap = true }, "Select cached venv")
	Set_keymap("n", "<leader>lvs", "<cmd>VenvSelect<cr>", { silent = true, noremap = true }, "Select venv")
end

return M
