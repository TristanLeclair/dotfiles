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

  local opts = { noremap = true, silent = true }
  local builtin = require("telescope.builtin")
  Set_keymap("n", "<leader>fem", builtin.man_pages, opts, "Man pages")
  Set_keymap("n", "<leader>fc", builtin.commands, opts, "Find commands")
  Set_keymap("n", "<leader>fd", builtin.find_files, opts, "Find files")
  Set_keymap("n", "<leader>fg", builtin.live_grep, opts, "Live grep")
  Set_keymap("n", "<leader>fb", builtin.buffers, opts, "Find buffers")
  Set_keymap("n", "<leader>fw", builtin.grep_string, opts, "Find string")
  Set_keymap("n", "<leader>fo", builtin.oldfiles, opts, "Find old files")
  Set_keymap("n", "<leader>fs", builtin.current_buffer_fuzzy_find, opts, "Fuzzy find buffer")
  Set_keymap("n", "<leader>fk", builtin.keymaps, opts, "Find keymaps")
  Set_keymap("n", "<leader><c-r>", builtin.command_history, opts, "Command history")
end

return M
