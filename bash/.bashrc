##
# aliases
##
alias pls='sudo $(fc -ln -1)'

alias wall='hsetroot -fill'

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'

##
# functions
##
mkcd() {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# for git branch in PS1
function parse_git_dirty {
   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
#

##
# exports
##
export VISUAL="vim"
export PS1="\[\033[38;5;142m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;203m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;228m\] \$(parse_git_branch) \n>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;230m\]"
export PATH=$PATH:~/scripts

##
# tmux
##
[[ "$-" != *i* ]] && return
if command -v tmux>/dev/null; then
   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
