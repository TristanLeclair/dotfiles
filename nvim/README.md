# My neovim configuration

<!--toc:start-->
- [My neovim configuration](#my-neovim-configuration)
  - [Get healthy](#get-healthy)
  - [Configuration](#configuration)
    - [Keymaps](#keymaps)
    - [Add plugin](#add-plugin)
<!--toc:end-->

Uses [Neovim 0.8.1](https://github.com/neovim/neovim/releases/tag/v0.8.1)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

## Configuration

```
.
├── README.md
├── after -- loads after lua/user
│   └── plugin -- plugin configuration goes in here
│       ├── general_plugin_config.lua
│       ├── keymap
│       │   ├── init.lua
│       │   └── whichkey.lua -- keymap configuration
│       ├── lsp
│       │   ├── init.lua
│       │   ├── mason.lua -- lsp configuration
│       │   └── null-ls.lua
│       └── visuals
│           ├── colorscheme.lua
│           └── other_visual_plugin.lua
├── init.lua -- start of config
├── lua
│   └── user
│       ├── keymap.lua -- keymap helper
│       ├── lsp
│       │   ├── handlers.lua
│       │   └── settings -- language specific settings
│       │       ├── jsonls.lua
│       │       ├── pyright.lua
│       │       └── sumneko_lua.lua
│       ├── options.lua -- general vim options
│       ├── plugins.lua -- add plugins here
│       └── wsl.lua -- extra configuration for windows (powershell)
├── plugin
│   └── packer_compiled.lua

```

### Keymaps

Update whichkey configuration in `after/plugin/keymap/whichkey.lua`

### Add plugin

Add plugins to `lua/user/plugins.lua`, try to add specific commit for future proofing

Plugin configuration goes in `after/plugin/<plugin_name>.lua`

Open neovim and run `:PackerSync` to download and install plugin
