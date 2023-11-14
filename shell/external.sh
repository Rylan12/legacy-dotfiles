# Set EDITOR to vim
export EDITOR=vim

# Colors for ls
export CLICOLOR=1
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# GPG Key for GitHub
GPG_TTY=$(tty)
export GPG_TTY

# Set less default options (oh-my-zsh sets only -R)
export LESS="-FIR --mouse"

# bat configuration file
export BAT_CONFIG_PATH="$HOME/.dotfiles/batconfig"

# Use bat for manpages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Homebrew
export HOMEBREW_AUTOREMOVE=1
export HOMEBREW_BAT=1
export HOMEBREW_BAT_CONFIG_PATH="$BAT_CONFIG_PATH"
export HOMEBREW_BOOTSNAP=1
export HOMEBREW_BUNDLE_FILE="$HOME/.dotfiles/Brewfile"
export HOMEBREW_DEVELOPER=1
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_GITHUB_PACKAGES_USER="Rylan12"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_PRY=1

# Setup rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
eval "$(rbenv init -)"

# Setup NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH you-should-use show all aliases
# See https://github.com/MichaelAquilina/zsh-you-should-use#displaying-results
export YSU_MODE=ALL

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Setup GitHub copilot CLI
eval "$(github-copilot-cli alias -- "$0")"
