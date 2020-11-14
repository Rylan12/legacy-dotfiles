# Homebrew zsh completions (must be run before oh-my-zsh.sh)
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
fi
