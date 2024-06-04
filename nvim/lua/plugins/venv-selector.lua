local M = {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  branch = "regexp",
}

function M.config()
  require("venv-selector").setup()
  Set_keymap("n", "<leader>lvc", "<cmd>VenvSelectCached<cr>", "Select cached venv")
  Set_keymap("n", "<leader>lvs", "<cmd>VenvSelect<cr>", "Select venv")
end

return M
