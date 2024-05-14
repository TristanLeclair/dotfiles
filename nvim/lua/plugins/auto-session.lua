local M = {
  "rmagatti/auto-session",
}

function M.config()
  local auto_session = require("auto-session")

  auto_session.setup({
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/", "~/projects/" },
  })

  Set_keymap("n", "<leader>fm", require("auto-session.session-lens").search_session, "Find session")

  Set_keymap("n", "<leader>wr", "<cmd>SessionRestore<CR>")
end

return M
