local M = {
  "rcarriga/nvim-dap-ui",
  -- TODO: switch back once fixed
  commit = "5934302",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
}

function M.config()
  local dapui = require("dapui")
  dapui.setup()
  local dap = require("dap")
  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
  -- dap.adapters.gdb = {
  --   type = "executable",
  --   command = "gdb",
  --   args = { "-i", "dap" },
  -- }
  -- dap.configurations.c = {
  --   {
  --     name = "Launch",
  --     type = "gdb",
  --     request = "launch",
  --     linux = {
  --       MIMode = "gdb",
  --       miDebuggerPath = "/usr/local/bin/gdb",
  --     },
  --     program = function()
  --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --     end,
  --     cwd = "${workspaceFolder}",
  --   },
  -- }
end

return M
