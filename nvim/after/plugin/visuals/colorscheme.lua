local colorscheme = "catppuccin"

local status_ok, catppuccin = pcall(require, colorscheme)
if not status_ok then
  print("Could not find colorscheme " .. colorscheme)
  return
end

vim.g.catppuccin_flavour = "mocha"
catppuccin.setup()
vim.api.nvim_command "colorscheme catppuccin"

vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
