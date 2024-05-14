local M = {
  "zbirenbaum/copilot.lua",
  enabled = false,
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
}
function M.config()
  require("copilot").setup({})
  require("copilot_cmp").setup({})

  Set_keymap("n", "<leader>ct", "<cmd>silent Copilot toggle<cr>", "Toggle Copilot")
end

return M
