local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  require("telescope").setup({
    defaults = {
      path_display = { "smart" },
    },
    pickers = {
      commands = {
        theme = "dropdown",
      },
    },
  })

  require("telescope").load_extension("fzf")
  local builtin = require("telescope.builtin")
  local utils = require("telescope.utils")

  function _G.project_files()
    local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
    if ret == 0 then
      builtin.git_files()
    else
      builtin.find_files()
    end
  end

  Set_keymap("n", "<leader>fem", builtin.man_pages, "Man pages")
  Set_keymap("n", "<leader>fc", builtin.commands, "Find commands")
  Set_keymap("n", "<leader>fd", project_files, "Find files")
  Set_keymap("n", "<leader>fg", builtin.live_grep, "Live grep")
  Set_keymap("n", "<leader>fb", builtin.buffers, "Find buffers")
  Set_keymap("n", "<leader>fw", builtin.grep_string, "Find string")
  Set_keymap("n", "<leader>fo", builtin.oldfiles, "Find old files")
  Set_keymap("n", "<leader>fs", builtin.current_buffer_fuzzy_find, "Fuzzy find buffer")
  Set_keymap("n", "<leader>fk", builtin.keymaps, "Find keymaps")
  Set_keymap("n", "<leader><c-r>", builtin.command_history, "Command history")
end

return M
