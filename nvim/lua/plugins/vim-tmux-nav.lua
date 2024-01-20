local M = {
  "christoomey/vim-tmux-navigator",
  enabled = (os.getenv("TERM_PROGRAM") ~= "WezTerm"),
}

function M.config()
  Set_keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  Set_keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  Set_keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  Set_keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end

return M
