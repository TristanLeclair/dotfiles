local M = {
  "ziontee113/icon-picker.nvim",
  cmd = { "IconPickerNormal" },
}
function M.config()
  require("icon-picker").setup({ disable_legacy_commands = true })

  -- Set_keymap("n", "<leader><leader>y", "<cmd>IconPickerYank<cr>", opts, "Yank icon") --> Yank the selected icon into register
  -- Set_keymap("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
end

Set_keymap("n", "<leader>fi", "<cmd>IconPickerNormal<cr>", "Pick icon")

return M
