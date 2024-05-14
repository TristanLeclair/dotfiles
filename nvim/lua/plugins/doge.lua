--[[
-- DOcumentation GEnerator
--
--
]]
--

vim.g.doge_enable_mappings = 0

local M = {
  "kkoomen/vim-doge",
  event = "BufRead",
  -- enabled = false,
  build = ":call doge#install()",
}

function M.config()
  Set_keymap("n", "<leader>ld", "<Plug>(doge-generate)", "Generate documentation")
end

return M
