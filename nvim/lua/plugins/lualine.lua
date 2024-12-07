local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- enabled = false,
}
function M.config()
  require("lualine").setup({
    options = {
      theme = "auto",
    },
  })
end

return M
