# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tmux iTerm2 Integration
# ZSH_TMUX_ITERM2=true

# awscli autocomplete
complete -C '/usr/local/bin/aws_completer' aws
