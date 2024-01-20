local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			p = {
				"Plugins",
			},
			g = {
				"Git",
			},
			l = {
				"Lsp",
			},
			f = {
				"Find",
				b = { "Extras" },
			},
			c = {
				"Copilot",
			},
		},
	})
end

return M
