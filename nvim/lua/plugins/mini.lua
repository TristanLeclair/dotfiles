local M = { "echasnovski/mini.nvim", version = false }

function M.config()
  require("mini.pairs").setup()
  require("mini.trailspace").setup()
  require("mini.surround").setup()
end

return M
