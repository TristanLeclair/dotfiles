require("impatient")
require("user.options")
require("user.plugins")
require("user.lsp.handlers")

if vim.fn.has("wsl") == 1 then
  require("user.wsl")
end
