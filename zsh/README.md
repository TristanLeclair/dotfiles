# My ZSH configuration files for WSL2

## Installation

- clone this repo into `$XDG_CONFIG_HOME/zsh`

- setup a .zprofile in `$XDG_CONFIG_HOME/` (I have one at https://gist.github.com/TristanLeclair/1928dc2dd64e935b8bd39a1641c60c6e)

#### Prerequisites for other commands

- unzip
- curl
- wget
- git
- make
- [ rg ](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
- [ fd ](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)
- tldr

##### Post-install

- link fd-find `ln -s $(which fdfind) ~/.local/bin/fd`

### command_not_found

- `apt install command-not-found`

### eza

- [install](https://github.com/eza-community/eza/blob/main/INSTALL.md#manual-linux)

### zoxide

- [install](https://github.com/ajeetdsouza/zoxide)

### fzf

- `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf`

### lazygit

- follow [install guide](https://github.com/jesseduffield/lazygit#installation)

### neovim

- Install from releases
  - [release](https://github.com/neovim/neovim/releases/tag/v0.9.4)
  - `wget`
  - `tar -xzf nvim-linux64.tar.gz`
  - `mv nvim-linux64 /opt/nvim`
  - `ln -s /opt/nvim/bin/nvim ~/.local/bin/nvim`

## Next steps for setup

- gh
