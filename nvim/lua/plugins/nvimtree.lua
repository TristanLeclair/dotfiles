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
  local opts = { noremap = true, silent = true }

  Set_keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", opts, "Toggle file explorer")
  Set_keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", opts, "Toggle file explorer on current file")
end

return M
