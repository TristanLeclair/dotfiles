local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("lspconfig not working/installed")
	return
end

require("mason")
require("user.lsp.handlers").setup()
require("null-ls")
