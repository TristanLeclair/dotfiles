local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    auto_close = true, -- automatically close the list when you have no diagnostics
  },
}

function M.config()
  local trouble = require("trouble")

  Set_keymap("n", "<leader>tt", function()
    trouble.toggle("workspace_diagnostics")
  end, "Trouble")
  Set_keymap("n", "<leader>tj", function()
    trouble.next({ skip_groups = true, jump = true })
  end, "Next diagnostic")
  Set_keymap("n", "<leader>tk", function()
    trouble.previous({ skip_groups = true, jump = true })
  end, "Previous diagnostic")
  Set_keymap("n", "<leader>tx", function()
    trouble.toggle("quickfix")
  end, "Close")
end

return M
