local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	local trouble = require("trouble").setup({
		auto_close = true, -- automatically close the list when you have no diagnostics
	})

	Set_keymap("n", "<leader>lt", function()
		trouble.toggle("workspace_diagnostics")
	end, { noremap = true, silent = true }, "Trouble")
	Set_keymap("n", "<leader>lj", function()
		trouble.next({ skip_groups = true, jump = true })
	end, { noremap = true, silent = true }, "Next diagnostic")
	Set_keymap("n", "<leader>lk", function()
		trouble.previous({ skip_groups = true, jump = true })
	end, { noremap = true, silent = true }, "Previous diagnostic")
	Set_keymap("n", "<leader>lx", function()
		trouble.toggle("quickfix")
	end, { noremap = true, silent = true }, "Close")
end

return M
