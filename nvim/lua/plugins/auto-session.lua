local M = {
  "rmagatti/auto-session",
}

function M.config()
  require("auto-session").setup()

  Set_keymap(
    "n",
    "<leader>fm",
    require("auto-session.session-lens").search_session,
    { silent = true },
    "Find session"
  )
end

return M
