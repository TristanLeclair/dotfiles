local M = {
  "nvimtools/none-ls.nvim",
  enabled = false,
}

function M.config()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua.with({
        config = {
          indent_type = "Spaces",
          indent_width = "2",
        },
      }),
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.prettier,
      -- null_ls.builtins.diagnostics.flake8,
    },
  })
end

return M
