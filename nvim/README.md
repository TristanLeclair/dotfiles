# My neovim configuration

<!--toc:start-->
- [My neovim configuration](#my-neovim-configuration)
  - [Get healthy](#get-healthy)
  - [Configuration](#configuration)
    - [Keymaps](#keymaps)
    - [Add plugin](#add-plugin)
<!--toc:end-->

Uses [Neovim 0.9.4](https://github.com/neovim/neovim/releases/tag/v0.9.4)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

## Configuration

```

```

### Keymaps

Update whichkey configuration in `after/plugin/keymap/whichkey.lua`

### Add plugin

Add plugins to `lua/user/plugins.lua`, try to add specific commit for future proofing

Plugin configuration goes in `after/plugin/<plugin_name>.lua`

Open neovim and run `:PackerSync` to download and install plugin
