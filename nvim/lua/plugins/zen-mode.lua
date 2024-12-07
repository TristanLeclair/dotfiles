local M = {
  "folke/zen-mode.nvim",
  opts = {
    plugins = {
      options = {
        laststatus = 0,
      },
    },
    -- on_open = function()
    --   require("lualine").hide()
    -- end,
    -- on_close = function()
    --   require("lualine").hide({ unhide = true })
    -- end,
  },
}

Set_keymap("n", "<leader>zz", "<cmd>ZenMode<cr>", "Toggle Zen mode")

return M
