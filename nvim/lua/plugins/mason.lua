local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local servers = {
    "lua_ls",
    "pyright",
    "clangd",
    "yamlls",
    "taplo",
  }

  require("mason").setup()
  require("mason-lspconfig").setup({ ensure_installed = servers })
  Set_keymap("n", "<leader>pm", "<cmd>Mason<cr>")
end

return M
