local M = { "echasnovski/mini.nvim", version = false }

function M.config()
  require("mini.pairs").setup()
  require("mini.trailspace").setup()
end

return M
