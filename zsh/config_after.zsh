# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# reload configuration
alias src='omz reload'

# tmux iTerm2 Integration
# ZSH_TMUX_ITERM2=true

# awscli autocomplete
complete -C '/opt/homebrew/bin/aws_completer' aws
