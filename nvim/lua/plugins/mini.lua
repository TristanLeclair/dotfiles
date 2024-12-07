local M = { "echasnovski/mini.nvim", version = false }

function M.config()
  require("mini.pairs").setup()
  -- require("mini.trailspace").setup()
  require("mini.surround").setup()
end

local f = function(args)
  vim.b[args.buf].minitrailspace_disable = true
end
vim.api.nvim_create_autocmd("Filetype", { pattern = "snacks_dashboard", callback = f })
vim.api.nvim_create_autocmd("Filetype", { pattern = "lua", callback = f })

return M
