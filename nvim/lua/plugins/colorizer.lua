local M = {
  "NvChad/nvim-colorizer.lua",
  cmd = { "ColorizerToggle" },
}

function M.config()
  require("colorizer").setup()
end

Set_keymap("n", "<leader>cc", "<cmd>ColorizerToggle<cr>")

return M
