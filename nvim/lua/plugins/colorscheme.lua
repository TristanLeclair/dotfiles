local M = {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    -- event = "VeryLazy",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- event = "VeryLazy",
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
  },
}

return M
