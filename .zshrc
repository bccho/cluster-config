## Environment variables
# ~/bin, /usr/local/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Add anaconda to path
PATH=/Users/bccho/anaconda3/bin:$PATH

# Add Julia and Julia's Jupyter-notebook to the path
export PATH=/Applications/Julia-0.4.2.app/Contents/Resources/julia/bin:$PATH

# TeX custom directory
export TEXINPUTS=~/.tex:

# HDF5 plugins directory
export HDF5_PLUGIN_PATH=~/bin/HDF5/plugins

# Default editor
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

## Appearance
# Colors
autoload colors && colors
export CLICOLOR=1

# Prompt colors
PS1_BOLDRED="%{$fg_bold[red]%}"
PS1_YELLOW="%{$fg[yellow]%}"
PS1_BLUE="%{$fg[blue]%}"
PS1_RESET="%{$reset_color%}"

# Git prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_STATESEPARATOR=""

# Update prompt
precmd () {
    # Default prompt
    DEF_PS1="$PS1_BOLDRED""pascal:%b%~$PS1_RESET "

    # Conda environment in prompt
    if [ -z "$CONDA_DEFAULT_ENV" ]
    then
    else
        DEF_PS1+="($PS1_YELLOW$CONDA_DEFAULT_ENV$PS1_RESET) "
    fi

    # Git prompt
    __git_ps1 "$DEF_PS1" "
$PS1_YELLOW%n$PS1_RESET$ " "(%s) "
}

# Vim normal mode in prompt
# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="$PS1_BLUE [% NORMAL]% $PS1_RESET"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#     zle reset-prompt
# }

## Interaction
# Enable completion
autoload -Uz compinit && compinit

bindkey -e
# Enable vim keybindings
# bindkey -v
# zle -N zle-line-init
# zle -N zle-keymap-select
export KEYTIMEOUT=1

# Enable fasd
eval "$(fasd --init auto)"

# Enable fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# Fix bracketed paste characters in emacs
if [ -n "$INSIDE_EMACS" ]; then
    export EDITOR=emacsclient
    unset zle_bracketed_paste  # This line
fi

## Aliases
alias g="git"
alias v="vim"
alias vr="vim -R"
alias vd="vim \"+colorscheme apprentice\""
alias jn="jupyter notebook"
alias tmux="tmux -2"
alias tm="tmux"
alias py="python"
alias ipy="ipython"

# Clean up rubber
alias rubclean='rubber --pdf --clean'
alias rubcleanall='filename=$(ls *.tex) && filename="${filename%.*}" && rubber --pdf --clean $filename'

# Combine PDFs
# alias PDFconcat "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"

# Lock screen and sleep
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias gn='pmset sleepnow'

# Clear screen
alias clc="clear"

## Functions
# Set volume
volume () { sudo osascript -e "set Volume $1" }

