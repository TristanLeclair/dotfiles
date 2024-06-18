local M = {
  "RRethy/vim-illuminate",
  event = { "BufNewFile", "BufReadPre" },
}

function M.config()
  require("illuminate").configure()
end

return M
