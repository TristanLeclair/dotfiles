local M = {
  {
    "christoomey/vim-tmux-navigator",
    enabled = (os.getenv("TERM_PROGRAM") ~= "WezTerm"),
    config = function()
      Set_keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
      Set_keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
      Set_keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
      Set_keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    enabled = (os.getenv("TERM_PROGRAM") == "WezTerm"),
    config = function()
      local ss = require("smart-splits")
      -- recommended mappings
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      Set_keymap("n", "<A-h>", ss.resize_left)
      Set_keymap("n", "<A-j>", ss.resize_down)
      Set_keymap("n", "<A-k>", ss.resize_up)
      Set_keymap("n", "<A-l>", ss.resize_right)
      -- moving between splits
      Set_keymap("n", "<C-h>", ss.move_cursor_left)
      Set_keymap("n", "<C-j>", ss.move_cursor_down)
      Set_keymap("n", "<C-k>", ss.move_cursor_up)
      Set_keymap("n", "<C-l>", ss.move_cursor_right)
      Set_keymap("n", "<C-\\>", ss.move_cursor_previous)
      -- swapping buffers between windows
      Set_keymap("n", "<leader><leader>h", ss.swap_buf_left)
      Set_keymap("n", "<leader><leader>j", ss.swap_buf_down)
      Set_keymap("n", "<leader><leader>k", ss.swap_buf_up)
      Set_keymap("n", "<leader><leader>l", ss.swap_buf_right)
    end,
  },
}

return M
