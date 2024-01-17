local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  }
}

function M.config()
  local servers = {
    "lua_ls",
  }

  require("mason").setup()
  require("mason-lspconfig").setup({ ensure_installed = servers })
  vim.keymap.set("n", "<leader>pm", ":Mason<cr>")
end

return M

