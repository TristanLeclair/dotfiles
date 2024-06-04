vim.cmd([[
  augroup _general_settings
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
