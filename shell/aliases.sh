# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Change permission
alias cx='chmod +x'

# cd aliases
alias cd..='cd ..'
alias cdgr='cd "$(git root)"'

# cd shortcuts
alias des='cd ~/Desktop/'
alias dev='cd ~/Development/'
alias doc='cd ~/Documents/'
alias dow='cd ~/Downloads/'

# reload current directory
alias reload='[[ ! -d "$(pwd)" ]] && echo "$(pwd) no longer exists" && return 1 || cd "$(pwd)"'

# tmux
alias tkill='tmux kill-server'
alias tsave='tmux-save' # Mark session as non-killable (~/bin/tmux-save)

# lazygit alias
alias lg='lazygit'

# gh aliases
alias gh='PAGER= gh' # remove pager
alias prc='gh pr checkout'
alias prv='gh pr view'
alias prvw='gh pr view -w' # open PR in web browser

# Pipe to clipboard
alias pb='pbcopy'

# exa aliases
alias e='exa'
alias ea='exa -a'
alias el='exa -l'
alias elh='exa -lh'
alias ela='exa -la'
alias elah='exa -lah'

# Homebrew aliases
alias brepo='cd /usr/local/Homebrew'
alias bcore='cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/'
cdb() {
    cd "$(brew --repository $1)"
}
alias cellar='cd /usr/local/Cellar/'
alias bdeps='~/Development/homebrew-dependency-viewer/brew-deps -e ~/Development/homebrew-dependency-viewer/exclude.txt'
alias bdeps-reset='cd ~/Development/homebrew-dependency-viewer/ && bdeps > exclude.txt'
alias baudit='brew audit --strict --online --git'

# GitKraken
alias kraken='git kraken'

# Create and source virtual environment
venv() {
    [[ -d venv ]] && echo "venv directory already exists" 1>&2 && return 1
    virtualenv venv && source venv/bin/activate
}
source-venv() {
    [[ ! -f venv/bin/activate ]] && echo "venv/bin/activate doesn't exist" 1>&2 && return 1
    source venv/bin/activate
}
venv-delete() {
    [[ -z "$VIRTUAL_ENV" ]] && echo "Not in a virtual environment" 1>&2 && return 1
    echo "Deleting $VIRTUAL_ENV"
    venv="$VIRTUAL_ENV"
    deactivate
    rm -rf "$venv"
}

# Automate poet for Homebrew resource blocks
poet-venv() {
    venv > /dev/null || return 1
    pip install homebrew-pypi-poet > /dev/null
    [[ -z "$1" ]] && echo "fail" 1>&2 && return
    pip install "$1" > /dev/null
    poet "$1" | tee /dev/tty | pbcopy
    venv-delete > /dev/null
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

sha256() {
    url="$1"
    file=$(basename $url)
    curl --silent $url > $file
    echo $(shasum -a 256 $file | awk '{print $1}')
    rm $file
}
