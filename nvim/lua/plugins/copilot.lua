local M = {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  }
}
function M.config()
  require("copilot").setup({})
  require("copilot_cmp").setup({})
end

return M
