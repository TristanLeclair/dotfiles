local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "Mason" },
}

function M.config()
  local servers = {
    "lua_ls",
    "pyright",
    "clangd",
    "yamlls",
    "taplo",
    "dockerls",
    "docker_compose_language_service",
  }

  require("mason").setup()
  require("mason-lspconfig").setup({ ensure_installed = servers })
end
Set_keymap("n", "<leader>pm", "<cmd>Mason<cr>")

return M
