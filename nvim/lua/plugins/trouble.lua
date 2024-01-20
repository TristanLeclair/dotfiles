local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  local trouble = require("trouble")

  Set_keymap("n", "<leader>lt", function()
    trouble.toggle()
  end, { noremap = true, silent = true }, "Trouble")
  Set_keymap("n", "<leader>lj", function()
    trouble.next({ skip_groups = true, jump = true })
  end, { noremap = true, silent = true }, "Next")
  Set_keymap("n", "<leader>lk", function()
    trouble.previous({ skip_groups = true, jump = true })
  end, { noremap = true, silent = true }, "Previous")
end

return M
