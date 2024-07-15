local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require("which-key")
  wk.add({
    { "<leader>c", group = "Copilot" },
    { "<leader>d", group = "DB" },
    { "<leader>e", group = "Tree" },
    { "<leader>f", group = "Find" },
    { "<leader>fb", group = "Extras" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "Lsp" },
    { "<leader>p", group = "Plugins" },
    { "<leader>s", group = "Split" },
  })
end

return M
