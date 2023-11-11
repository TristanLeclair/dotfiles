local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	print("obsidian not working/installed)")
	return
end

obsidian.setup({
	-- Options
	workspaces = {
		name = "dnd",
		path = "~/ObsidianVaults/DndVault/",
	},

	-- templates
	templates = {
		subdir = "z_Templates",
	},
})
