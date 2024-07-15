local M = {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "html",
      "javascript",
      "json",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "sql",
      "tsx",
      "typescript",
      "vimdoc",
      "yaml",
    },
    auto_install = true,
    ignore_install = {},
    modules = {},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  })
end

return M
