local M = {
  "christoomey/vim-tmux-navigator",
  enabled = (os.getenv("TERM_PROGRAM") ~= "WezTerm"),
}

function M.config()
  vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end

return M
