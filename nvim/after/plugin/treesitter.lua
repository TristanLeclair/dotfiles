local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("nvim-treesitter.configs not working/installed")
	return
end

configs.setup({
	ensure_installed = {
		"help",
		"javascript",
		"c",
		"lua",
		"typescript",
		"python",
	},
	highlight = {
		enable = true,
		disable = {},
	},
})
