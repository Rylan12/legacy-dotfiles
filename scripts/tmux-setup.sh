#!/usr/bin/env sh

BASE_SESSION="terminal"

CURRENT_SESSIONS=$(/opt/homebrew/bin/tmux list-sessions 2> /dev/null | grep "^$BASE_SESSION\(-\d\)\?: .*\$" | awk '{print $1}' | sed 's/.$//')

# Determine name of session (terminal or terminal-n)
if [ -n "$CURRENT_SESSIONS" ]; then
    MAX=$(echo "$CURRENT_SESSIONS" | sed "s/^$BASE_SESSION\$/$BASE_SESSION-0/" | grep -o '.$' | sort -nr | head -n1)
    SESSION_NAME="$BASE_SESSION-$((MAX + 1))"
else
    SESSION_NAME="$BASE_SESSION"
fi

# Remove save file if exists
rm -f ~/.tmux-saves/"$SESSION_NAME"

# Start session (with message if there are detached sessions)
if /opt/homebrew/bin/tmux list-sessions 2> /dev/null | grep -vq '^.* (attached)$'; then
    /opt/homebrew/bin/tmux new -s "$SESSION_NAME" \; setenv SESSION_NAME "$SESSION_NAME" \; display-message "WARNING: detached sessions" > /dev/null 2>&1
else
    /opt/homebrew/bin/tmux new -s "$SESSION_NAME" \; setenv SESSION_NAME "$SESSION_NAME" > /dev/null 2>&1
fi

# After exiting, kill session if it is not attached or listed in ~/.tmux-saves/
if [ ! -f ~/.tmux-saves/"$SESSION_NAME" ] && ! /opt/homebrew/bin/tmux list-sessions | grep -q "^$SESSION_NAME: .* (attached)\$"; then
    /opt/homebrew/bin/tmux kill-session -t "$SESSION_NAME" > /dev/null 2>&1
    echo "[kill session $SESSION_NAME]"
else
    echo "[detach from $SESSION_NAME]"
fi
