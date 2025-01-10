local M = {
  "willothy/flatten.nvim",
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
  config = function()
    require("flatten").setup({})
  end,
}

return M
