vim.cmd([[
  augroup _general_settings
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

local group = vim.api.nvim_create_augroup("AutoRepoUpdate", { clear = true })
local script_path = vim.fn.stdpath("config") .. "/scripts/copy_from_db_cache.sh"
local db_ui_path = os.getenv("HOME") .. "/.local/share/db_ui/"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = db_ui_path .. "*/*",
  command = "!" .. script_path,
  group = group,
})
