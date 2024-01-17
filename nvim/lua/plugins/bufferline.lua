local M = {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
}

function M.config()
  require("bufferline").setup({
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    }),
  })
end

return M
