local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

function M.config()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "vimdoc" },
    auto_install = false,
    ignore_install = {},
    modules = {},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
