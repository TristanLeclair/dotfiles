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
end

function M.config()
  print("Configuring dadbod")
end

Set_keymap("n", "<leader>dt", "<cmd>DBUIToggle<cr>", "Toggle DBUI in current buffer")
Set_keymap("n", "<leader>db", "<cmd>tabnew|DBUI<cr>", "Start DBUI in new tab")

return M
