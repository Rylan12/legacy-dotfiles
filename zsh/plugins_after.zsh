# External plugins (initialized after)

# pure prompt
fpath+=$HOME/.zsh/plugins/pure
autoload -U promptinit; promptinit

zstyle ':prompt:pure:prompt:success' color green

prompt pure
