local M = {
  "kristijanhusak/vim-dadbod-ui",
  lazy = true,
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", lazy = true } },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
}

function M.init()
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_disable_progress_bar = 1
  vim.g.db_ui_use_nvim_notify = 1
end

function M.config()
  Set_keymap("n", "<leader>dr", "w?SELECT<CR>v/;<CR><Plug>(DBUI_ExecuteQuery)<cmd>noh<cr>", "Run Select under cursor")
end

Set_keymap("n", "<leader>dt", "<cmd>DBUIToggle<cr>", "Toggle DBUI in current buffer")
Set_keymap("n", "<leader>db", "<cmd>tabnew|DBUI<cr>", "Start DBUI in new tab")

return M
