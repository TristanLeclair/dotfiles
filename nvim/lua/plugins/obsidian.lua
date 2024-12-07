local M = {
  "epwalsh/obsidian.nvim",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp", "nvim-telescope/telescope.nvim" },
  ft = "markdown",
  opts = {
    workspaces = {
      { name = "personal", path = "~/vaults/PersonalVault" },
      { name = "dnd", path = "~/vaults/DndVault" },
    },
  },
}

return M
