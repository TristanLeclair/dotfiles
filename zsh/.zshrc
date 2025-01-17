# See `man zshoptions` for details
setopt histignorealldups sharehistory autocd menucomplete

# I'd rather kms than hear a beep
unsetopt BEEP

bindkey -e
# bindkey '^R' history-incremental-pattern-search-backward
export KEYTIMEOUT=1

export EDITOR='nvim'

export PATH=$HOME/.local/bin:$PATH
source $ZDOTDIR/.zshenv

# =========================================
# Basic zsh config
# =========================================
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Colors
autoload -Uz colors && colors

# ===========================================
# Load aliases
# ===========================================
[ -f "$ZDOTDIR/.aliases" ] && source "$ZDOTDIR/.aliases"
for file in "$ZDOTDIR"/aliases/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done


# ===========================================
# Setup apps
# ===========================================
# zoxide
eval "$(zoxide init zsh)"

# oh my posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"

# kcat
if command -v kafkacat >/dev/null 2>&1; then
  export KAFKACAT_CONFIG="$HOME/.config/kcat/kcat.conf"
fi

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_R_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'exa --color=always {} | head -200'"
export FZF_TMUX_OPTS="-p"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
fi

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'exa --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# ===========================================
# Plugins, must be installed via git in the $ZDOTDIR/plugins directory
# ===========================================
[ ! -d "$ZDOTDIR/plugins" ] && mkdir -p "$ZDOTDIR/plugins/"

# Auto Suggestions
[ ! -d "$ZDOTDIR/plugins/zsh-autosuggestions" ] && mkdir -p "$ZDOTDIR/plugins/zsh-autosuggestions"
[ ! -f "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZDOTDIR/plugins/zsh-autosuggestions/"
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^n' autosuggest-accept

#Theme for syntax highlighting
[ ! -d "$ZDOTDIR/plugins/catppuccin" ] && mkdir -p "$ZDOTDIR/plugins/catppuccin"
[ ! -d "$ZDOTDIR/plugins/zsh-syntax-highlighting" ] && mkdir -p "$ZDOTDIR/plugins/zsh-syntax-highlighting"
[ ! -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZDOTDIR/plugins/zsh-syntax-highlighting/"
if [ ! -f "$ZDOTDIR/plugins/catppuccin/catppuccin_mocha-zsh-syntax-highlighting.zsh" ]; then
  git clone https://github.com/catppuccin/zsh-syntax-highlighting.git "$HOME/tmp/catppuccin/"
  cp -v "$HOME/tmp/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" "$ZDOTDIR/plugins/catppuccin/catppuccin_mocha-zsh-syntax-highlighting.zsh"
  rm -rf "$HOME/tmp/catppuccin"
fi
source $ZDOTDIR/plugins/catppuccin/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Gitignore plugin
[ ! -d "$ZDOTDIR/plugins/gitignore" ] && mkdir -p "$ZDOTDIR/plugins/gitignore"
[ ! -f "$ZDOTDIR/plugins/gitignore/gitignore.plugin.zsh" ] && wget -P "$ZDOTDIR/plugins/gitignore/" https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/gitignore/gitignore.plugin.zsh
source $ZDOTDIR/plugins/gitignore/gitignore.plugin.zsh

# ===========================================
# Other plugins
# ===========================================

# Apt plugins suggestions
# apt install command-not-found
source /etc/zsh_command_not_found

# neovim switcher
alias nvim-lazy="NVIM_APPNAME=Lazyvim nvim"
alias nvim-kickstart="NVIM_APPNAME=kickstart nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="?  Neovim Config ? " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^b "nvims\n"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tlecla/miniconda/3.11.4/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tlecla/miniconda/3.11.4/etc/profile.d/conda.sh" ]; then
        . "/home/tlecla/miniconda/3.11.4/etc/profile.d/conda.sh"
    else
        export PATH="/home/tlecla/miniconda/3.11.4/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
