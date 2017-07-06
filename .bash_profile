## Environment variables
# ~/bin and this config directory's bin folder
export PATH=$HOME/bin:$CONFIG_PATH/bin:$PATH

# Default editors
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

## Visual
# Change terminal prompt name
reset=$(tput sgr0)
bold=$(tput bold)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
export PS1="\[$bold\]\[$red\]\h:\[$reset\]\w \[$yellow\]\u\[$reset\]$ "

# Color
export CLICOLOR=1

## Aliases
alias g='git'
alias v='vim'
alias vr='vim -R'
alias tmux='tmux -2'
alias tm='tmux'
alias py='python'
alias ipy='ipython'
alias pyac='source activate'
alias pydeac='source deactivate'
alias tl='tmux ls'
alias tn='tmux new -s'
alias ta='tmux attach -t'

# tmux for python cellmode
alias vtm="vim -c 'let cellmode_tmux_sessionname=\"$(tmux display-message -p '#S')\"' -c 'let cellmode_use_tmux=1' -c 'let cellmode_tmux_panenumber=1' -c 'let cellmode_tmux_windowname=\"win\"'"

# Clear screen
alias clc='clear'

## Slurm commands
# Confirm function
confirm () {
     # call with a prompt string or use a default
     read -r -p "${1:-Are you sure? [y/N]} " response
     case $response in
         [yY][eE][sS]|[yY])
             true
             ;;
         *)
             false
             ;;
     esac
}

alias sq='squeue -u bccho'
alias wsq='watch -n 1 squeue -u bccho'
alias scall='confirm && scancel -u bccho'

## Convenience functions
# Mail myself a file
# Argument 1: email subject
# Arguments 2-: attachments
mailme () {
    text="mailx -s '$1'"
    shift
    for fname in "$@"; do
        text="$text -a $fname"
    done
    text="$text bccho@princeton.edu"
    echo $text
    echo "Sent from $HOSTNAME" | eval $text
}

# Trash
trash () {
    if [ -z ${TRASH_PATH+x} ]; then
        echo 'Error: environment variable $TRASH_PATH not set!'
    else
        echo mv "$@" -t "$TRASH_PATH"
        mv "$@" -t "$TRASH_PATH"
    fi
}

## Fasd
eval "$(fasd --init auto)"

## Fuzzy bash completion
[[ $PS1 && -f $CONFIG_PATH/bin/bash-completion/bash_completion ]] && \
    . $CONFIG_PATH/bin/bash-completion/bash_completion
source $CONFIG_PATH/bin/fuzzy_bash_completion
fuzzy_replace_filedir_xspec
fuzzy_setup_for_command cd
fuzzy_setup_for_command ls

