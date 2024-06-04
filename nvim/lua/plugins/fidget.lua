local M = {
  "j-hui/fidget.nvim",
  lazy = false,
  priority = 100,
}

function M.config()
  require("fidget").setup({
    notification = {
      override_vim_notify = true,
    },
  })
end

return M
