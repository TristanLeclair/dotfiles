local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  local opts = { noremap = true, silent = true }
  Set_keymap("n", "<leader>fd", "<cmd>Telescope find_files<cr>", opts, "Find files")
  Set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts, "Live grep")
  Set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts, "Find buffers")
  Set_keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", opts, "Find string")
end

return M
