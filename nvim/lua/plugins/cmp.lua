local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
}

function M.config()
  local lspkind = require("lspkind")
  lspkind.init({})

  local cmp = require("cmp")
  local luasnip = require("luasnip")
  -- local kind_icons = require("tlecla.icons").kind

  local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
  end

  require("luasnip.loaders.from_vscode").lazy_load({
    exclude = { "java", "sql" },
  })
  require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

  Set_keymap("i", "<c-j>", function()
    if luasnip.choice_active() then
      require("luasnip.extras.select_choice")()
    end
  end, "Select choice in snippet")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    ---@diagnostic disable-next-line: missing-fields
    formatting = {
      fields = { "abbr", "kind", "menu" },
      -- format = function(entry, vim_item)
      --   -- Kind icons
      --   -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      --   vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      --   vim_item.menu = ({
      --     nvim_lsp = "[LSP]",
      --     luasnip = "[Snippet]",
      --     buffer = "[Buffer]",
      --     path = "[Path]",
      --   })[entry.source.name]
      --   return vim_item
      -- end,
      format = lspkind.cmp_format({}),
    },
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        -- if luasnip.choice_active() then
        --   require("luasnip.extras.select_choice")()
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        -- require("neotab").tabout()
        else
          fallback()
          -- require("neotab").tabout()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    }),
  })

  cmp.setup.filetype({ "sql" }, {
    sources = {
      { name = "vim-dadbod-completion" },
      { name = "buffer" },
    },
    -- formatting = {
    --   fields = { "abbr", "kind", "menu" },
    --   format = function(entry, vim_item)
    --     -- Kind icons
    --     -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
    --     vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
    --     vim_item.menu = ({
    --       vim_dadbod_completion = "[DB]",
    --       buffer = "[Buffer]",
    --     })[entry.source.name]
    --     return vim_item
    --   end,
    -- },
  })

  -- `/` cmdline setup.
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
  })
end

return M
