local M = {
  "ziontee113/icon-picker.nvim",
}
function M.config()
  require("icon-picker").setup({ disable_legacy_commands = true })

  local opts = { noremap = true, silent = true }

  Set_keymap("n", "<leader>fi", "<cmd>IconPickerNormal<cr>", opts, "Pick icon")
  -- Set_keymap("n", "<leader><leader>y", "<cmd>IconPickerYank<cr>", opts, "Yank icon") --> Yank the selected icon into register
  -- Set_keymap("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
end


return M
