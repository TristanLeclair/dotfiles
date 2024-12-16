vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("_general_settings", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local config_path = vim.fn.stdpath("config")
local data_path = vim.fn.stdpath("data")
local path_separator = package.config:sub(1, 1)

local scripts_dir = "scripts"
local script_file = "copy_from_db_cache.sh"

local db_ui_dir = "db_ui"

local function create_path(paths)
  return table.concat(paths, path_separator)
end

local group = vim.api.nvim_create_augroup("AutoRepoUpdate", { clear = true })
local script_path = create_path({ config_path, scripts_dir, script_file })

local db_ui_path = create_path({ data_path, db_ui_dir }) .. path_separator

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = db_ui_path .. "*/*",
  command = "!" .. script_path,
  group = group,
})
