local M = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
function M.config()
  require("nvim-tree").setup({})

  Set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true }, "Open tree view")
end

return M
