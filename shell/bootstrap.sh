eval "$(/opt/homebrew/bin/brew shellenv)"
path_prepend "$HOME/bin"

# Applications that set up a custom python environment may be disrupted by having a regular
# `python` executable listed first in the PATH, so let's just add this to the very end.
# That way, anything that needs its own `python` can ensure it is placed first, even if
# that configuration happens before this file is executed.
# As of 2023-06-23, this is the only `python` executable in `PATH` during regular operation.
# Note: an example of where this is needed is for the ESP-IDF vscode extension.
path_append "/opt/homebrew/opt/python/libexec/bin"
