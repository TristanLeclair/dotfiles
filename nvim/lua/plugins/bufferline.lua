local M = {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim", "tiagovla/scope.nvim" },
}

function M.config()
  require("bufferline").setup({
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
  })
  require("scope").setup()
end

return M
