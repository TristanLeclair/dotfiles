local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	print("obsidian not working/installed)")
	return
end

local obsidian_dir = ""
if vim.fn.has("wsl") == 1 then
	obsidian_dir = "/mnt/c/Users/trist/ObsidianVaults/"
else
  obsidian_dir = "~/ObsidianVaults/"
end

obsidian.setup({
	-- Options
	workspaces = { {
		name = "dnd",
		path = obsidian_dir .. "DndVault",
	} },

	-- templates
	templates = {
		subdir = "z_Templates",
	},

	completion = {
		nvim_cmp = true,
	},

	mappings = {
		-- ["gf"] = {
		-- 	action = function()
		-- 		return require("obsidian").util.gf_passthrough()
		-- 	end,
		-- 	opts = { noremap = false, expr = true, buffer = true },
		-- },
	},
})

local status_ok_whichkey, wk = pcall(require, "which-key")
if not status_ok_whichkey then
	print("which key not working/installed")
	return
end

wk.register({
	["<leader>o"] = {
		name = "Obsidian",
		n = { "<cmd>ObsidianNew<CR>", "New Note" },
		f = { "<cmd>ObsidianSearch<CR>", "Find Note" },
		t = { "<cmd>ObsidianTemplate<CR>", "Templates" },
		l = { "<cmd>ObsidianLink<CR>", "Link" },
	},
})

vim.keymap.set("n", "gd", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gd"
	end
end, { noremap = false, expr = true })

vim.keymap.set("n", "gr", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianBacklinks<CR>"
	else
		return "gr"
	end
end, { noremap = false, expr = true })
