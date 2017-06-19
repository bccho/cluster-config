## Environment variables
# ~/bin
export PATH=$HOME/bin:$PATH

# confirm function
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

# Environment variables
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Aliases
alias v='vim'
alias tmux='tmux -2'
alias tm='tmux'
alias g='git'
alias clc='clear'

alias sq='squeue -u bccho'
alias wsq='watch -n 1 squeue -u bccho'
alias scall='confirm && scancel -u bccho'

# Fasd
eval "$(fasd --init auto)"
