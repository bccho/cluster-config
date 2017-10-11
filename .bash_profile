## Environment variables
# Default editors
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

## Visual
# Git prompt
source $CONFIG_PATH/bin/git-prompt.sh
# Change terminal prompt name
reset=$(tput sgr0)
bold=$(tput bold)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
# export PS1="\[$bold\]\[$red\]\h:\[$reset\]\w\[$yellow\]\n\[$yellow\]\u\[$reset\]$ "
export PROMPT_COMMAND='__git_ps1 "\[$bold\]\[$red\]\h:\[$reset\]\w" "\n\[$yellow\]\u\[$reset\]$ "'
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_STATESEPARATOR=""

# Color
export CLICOLOR=1
export TERM=xterm-256color

## Aliases
alias ll='ls -lh'
alias g='git'
alias v='vim'
alias vr='vim -R'
alias tmux='tmux -2'
alias tm='tmux'
alias py='python'
alias ipy='ipython'
alias cdac='source activate'
alias cddeac='source deactivate'
alias pyac='source env/bin/activate'
alias pydeac='deactivate'

# tmux shortcuts
alias tl='tmux ls'
alias tn='tmux new -s'
alias ta='tmux attach -t'

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

# alias sq='squeue -u bccho -o "%.16i %.9P %.8j %.8u %.20S %.2t %.5C %.10m %.10M %.6D %.10R"'
# alias sqall='squeue -a -o "%.16i %.9P %.8j %.8u %.10l %.20S %.2t %.5C %.10m %.10M %.6D %.10R" | less'
# alias wsq='watch -n 1 "squeue -u bccho -o \"%.16i %.9P %.8j %.8u %.20S %.2t %.5C %.10m %.10M %.6D %.10R\""'
# alias scall='confirm && scancel -u bccho'
alias tf='tail -f'

SQUEUE_FORMAT="%.16i %.9P %.8j %.8u %.20S %.2t %.5C %.10m %.10M %.6D %.10R"
alias sq="squeue -u bccho -o \"$SQUEUE_FORMAT\""
alias sqall="squeue -a -o \"$SQUEUE_FORMAT\" | less"
alias wsq="watch -n 1 'squeue -u bccho -o \"$SQUEUE_FORMAT\"'"
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
        # echo mv "$@" -t "$TRASH_PATH"
        mv -v "$@" -t "$TRASH_PATH"
    fi
}
# Restore from trash
restore () {
    if [ -z ${TRASH_PATH+x} ]; then
        echo 'Error: environment variable $TRASH_PATH not set!'
    else
        # echo mv "$TRASH_PATH/$@" -t "$PWD"
        mv -v "$TRASH_PATH/$@" -t "$PWD"
    fi
}
# Empty trash
emptytrash () {
    if confirm ; then
        rm -rf "$TRASH_PATH"/*
    fi
}

# Open vim with python cellmode for tmux
vtm () {
    # echo vim -c "let cellmode_tmux_sessionname=\"$(tmux display-message -p '#S')\"" -c "let cellmode_use_tmux=1" -c "let cellmode_tmux_panenumber=1" -c "let cellmode_tmux_windowname=\"$(tmux display-message -p '#W')\"" "$@"
    vim --cmd "let cellmode_use_tmux=1" -c "let cellmode_tmux_sessionname=\"$(tmux display-message -p '#S')\"" -c "let cellmode_tmux_panenumber=1" -c "let cellmode_tmux_windowname=\"$(tmux display-message -p '#W')\"" "$@"
}

# Set DISPLAY variable
setdisp() {
    export DISPLAY="localhost:$1.0"
}


## Fasd
eval "$(fasd --init auto)"

## Fuzzy bash completion
# source $CONFIG_PATH/bin/bash-completion/bash_completion
# source $CONFIG_PATH/bin/fuzzy_bash_completion
# fuzzy_replace_filedir_xspec
# fuzzy_setup_for_command ls
# fuzzy_setup_for_command cd
# fuzzy_setup_for_command mv
# fuzzy_setup_for_command cp
# fuzzy_setup_for_command vim
# fuzzy_setup_for_command v

