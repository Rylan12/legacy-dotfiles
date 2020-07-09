# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Change permission
alias cx='chmod +x'

# cd to git root directory
alias cdgr='cd "$(git root)"'

# cd shortcuts
alias des='cd ~/Desktop/'
alias dev='cd ~/Development/'
alias doc='cd ~/Documents/'

# reload current directory
alias reload='[[ ! -d "$(pwd)" ]] && echo "$(pwd) no longer exists" && return 1 || cd "$(pwd)"'

# tmux
alias tkill='tmux kill-server'
alias tsave='tmux-save' # Mark session as non-killable (~/bin/tmux-save)

# Create and source virtual environment
alias venv='virtualenv venv && source venv/bin/activate'
source-venv() {
    [[ ! -f venv/bin/activate ]] && echo "venv/bin/activate doesn't exist" && return 1
    source "venv/bin/activate"
}
venv-delete() {
    [[ -z "$VIRTUAL_ENV" ]] && echo "Not in a virtual environment" && return 1
    echo "Deleting $VIRTUAL_ENV"
    venv="$VIRTUAL_ENV"
    deactivate
    trash "$venv"
}

# dotfiles
alias cddf='cd ~/.dotfiles'
alias dotfiles='git -C ~/.dotfiles'
alias dfs='git -C ~/.dotfiles status'
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Backup file
bk() {
    if [[ "$#" -lt 1 ]]; then
        echo "Usage: $0 <file>..."
        return 1
    else
        for file in "$@"; do
            cp -R -- "$file" "$file.bk"
        done
    fi
}
mbk() {
    if [[ "$#" -lt 1 ]]; then
        echo "Usage: $0 <file>..."
        return 1
    else
        for file in "$@"; do
            mv -- "$file" "$file.bk"
        done
    fi
}

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && ${@}
    )
}

# watch colors
alias watch="watch -c"
