local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        toml = { "taplo" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        sql = { "sql_formatter" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    conform.formatters.taplo = {
      append_args = { "--config", vim.fn.expand(vim.fn.stdpath("config") .. "/formatters/taplo.toml") },
    }

    conform.formatters.sql_formatter = {
      prepend_args = { "-c", vim.fn.expand(vim.fn.stdpath("config") .. "/formatters/sql_formatter.json") },
    }

    Set_keymap({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, "Format")
  end,
}

return M
