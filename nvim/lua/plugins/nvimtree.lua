local M = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
function M.config()
  require("nvim-tree").setup({
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    git = {
      ignore = false,
    },
  })
  Set_keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", "Toggle file explorer")
  Set_keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", "Toggle file explorer on current file")
end

return M
