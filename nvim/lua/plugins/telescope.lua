local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "jvgrootveld/telescope-zoxide",
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  local t = require("telescope")
  t.setup({
    defaults = {
      path_display = { "smart" },
    },
    pickers = {
      commands = {
        theme = "dropdown",
      },
      colorscheme = {
        theme = "dropdown",
      },
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    },
    extensions = {
      fzf = {},
    },
  })

  t.load_extension("fzf")
  t.load_extension("zoxide")
  local builtin = require("telescope.builtin")

  local multigrep = require("plugins.telescope.multigrep")
  multigrep.setup()

  Set_keymap("n", "<leader>fem", builtin.man_pages, "Man pages")
  Set_keymap("n", "<leader>feg", builtin.git_files, "Git files")
  Set_keymap("n", "<leader>fec", builtin.colorscheme, "Find colorschemes")
  Set_keymap("n", "<leader>fh", builtin.help_tags, "Help Tags")
  Set_keymap("n", "<leader>fecm", builtin.commands, "Find commands")
  Set_keymap("n", "<leader>fd", builtin.find_files, "Find files")
  Set_keymap("n", "<leader>fb", builtin.buffers, "Find buffers")
  Set_keymap("n", "<leader>fw", builtin.grep_string, "Find string")
  Set_keymap("n", "<leader>fo", builtin.oldfiles, "Find old files")
  Set_keymap("n", "<leader>fs", builtin.current_buffer_fuzzy_find, "Fuzzy find buffer")
  Set_keymap("n", "<leader>fk", builtin.keymaps, "Find keymaps")
  Set_keymap("n", "<leader><c-r>", builtin.command_history, "Command history")
  Set_keymap("n", "<leader>cd", t.extensions.zoxide.list, "Zoxide list")
  Set_keymap("n", "<leader>fc", function()
    builtin.find_files({
      cwd = vim.fn.stdpath("config"),
    })
  end, "Find package")
  Set_keymap("n", "<leader>fpf", function()
    builtin.find_files({
      ---@diagnostic disable-next-line: param-type-mismatch
      cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
    })
  end, "Find package")
  Set_keymap("n", "<leader>fpg", function()
    multigrep.live_multigrep({
      ---@diagnostic disable-next-line: param-type-mismatch
      cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
    })
  end, "Grep packages")
end

return M
