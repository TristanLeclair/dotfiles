# My neovim configuration

Uses [Neovim 0.9.4](https://github.com/neovim/neovim/releases/tag/v0.9.4)

## Requirements

```
- git
- cc or gcc
- ripgrep
- fd
```

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

## Configuration

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim)

```
.
├── formatters
│  ├── sql_formatter.json
│  └── taplo.toml
├── ftplugin
│  └── java.lua
├── init.lua
├── lazy-lock.json
├── lua
│  ├── plugins
│  │  ├── alpha.lua
│  │  ├── auto-session.lua
│  │  ├── bufferline.lua
│  │  ├── catppuccin.lua
│  │  ├── cmp.lua
│  │  ├── colorizer.lua
│  │  ├── comment.lua
│  │  ├── conform.lua
│  │  ├── copilot.lua
│  │  ├── dadbod.lua
│  │  ├── dap.lua
│  │  ├── doge.lua
│  │  ├── dressing.lua
│  │  ├── fidget.lua
│  │  ├── gitsigns.lua
│  │  ├── handlers
│  │  │  ├── clangd.lua
│  │  │  ├── lua_ls.lua
│  │  │  └── pyright.lua
│  │  ├── icon-picker.lua
│  │  ├── init.lua
│  │  ├── jdtls.lua
│  │  ├── lazygit.lua
│  │  ├── leetcode.lua
│  │  ├── lsp.lua
│  │  ├── lualine.lua
│  │  ├── mason.lua
│  │  ├── mini.lua
│  │  ├── noice.lua
│  │  ├── none-ls.lua
│  │  ├── nvimtree.lua
│  │  ├── obsidian.lua
│  │  ├── telescope.lua
│  │  ├── todo-comments.lua
│  │  ├── transparent.lua
│  │  ├── treesitter-context.lua
│  │  ├── treesitter.lua
│  │  ├── trouble.lua
│  │  ├── venv-selector.lua
│  │  ├── vim-illuminate.lua
│  │  ├── vim-tmux-nav.lua
│  │  └── which-key.lua
│  └── tlecla
│     ├── autocommand.lua
│     ├── icons.lua
│     ├── keymaps.lua
│     └── options.lua
├── README.md
├── scripts
│  └── copy_from_db_cache.sh
└── snippets
   ├── all.lua
   ├── java.lua
   └── python.lua
```

### Keymaps

To be able to find them all, I use `Set_keymap()` defined in `lua/tlecla/keymaps.lua`

### Add plugins

Add plugins to `lua/plugins/<name-for-plugin>.lua`
