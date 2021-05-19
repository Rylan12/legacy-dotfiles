# Set EDITOR to vim
export EDITOR=vim

# Colors for ls
export CLICOLOR=1
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# GPG Key for GitHub
GPG_TTY=$(tty)
export GPG_TTY

# Homebrew
export HOMEBREW_DEVELOPER=1
export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/Brewfile"

# Set less default options (oh-my-zsh sets only -R)
export LESS="-FIR"

# Setup rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
eval "$(rbenv init -)"

# ZSH you-should-use show all aliases
# See https://github.com/MichaelAquilina/zsh-you-should-use#displaying-results
export YSU_MODE=ALL

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
