local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("tlecla.options")
require("tlecla.keymaps")
require("tlecla.autocommand")

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  change_detection = {
    notify = false,
  },
})

Set_keymap("n", "<leader>pl", "<cmd>Lazy<cr>", "Lazy")
