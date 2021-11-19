# ZSH home
export ZSH=$HOME/.oh-my-zsh

# Unset theme (use pure prompt which is not from oh-my-zsh)
ZSH_THEME=""

# Plugins
plugins=(alias-finder colored-man-pages git macos vi-mode zsh-autosuggestions zsh-syntax-highlighting you-should-use)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Autocomplete setup
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
