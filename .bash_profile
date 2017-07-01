## Environment variables
# ~/bin
export PATH=$HOME/bin:$PATH

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
alias py="python"
alias ipy="ipython"
alias pyac="source activate"
alias pydeac="source deactivate"

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

## Fasd
eval "$(fasd --init auto)"
