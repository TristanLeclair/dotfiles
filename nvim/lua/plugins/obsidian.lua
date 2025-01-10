-- List of workspaces on current setup
local workspaces = {
  { name = "personal", path = "~/ObsidianVaults/PersonalVault" },
  { name = "dnd", path = "~/ObsidianVaults/DndVault" },
}

local M = {
  "epwalsh/obsidian.nvim",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp", "nvim-telescope/telescope.nvim" },
  ft = "markdown",
  opts = {
    workspaces = workspaces,
  },
}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local dropdown = require("telescope.themes").get_dropdown({})

--- Obsidian workspace picker, uses the workspaces table
---@param opts any picker opts
---@param cb fun(selection)
local function workspace_picker(opts, cb)
  local names = {}
  for _, workspace in ipairs(workspaces) do
    table.insert(names, workspace.name)
  end

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "Workspace picker",
      finder = finders.new_table({
        results = names,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, _)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if selection then
            for _, item in ipairs(workspaces) do
              if item.name == selection.value then
                cb(item.path)
                break
              end
            end
          end
        end)
        return true
      end,
    })
    :find()
end

Set_keymap("n", "<leader>ov", function()
  workspace_picker(dropdown, function(selection)
    require("oil").open(selection)
  end)
end, "Open vault")

Set_keymap("n", "<leader>fn", function()
  workspace_picker(dropdown, function(selection)
    require("telescope.builtin").find_files({ cwd = selection })
  end)
end, "Find vault files")

return M
