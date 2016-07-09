#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\[\033[38;5;223m\]\w\[\033[38;5;208m\]$(parse_git_branch)\[\033[38;5;41m\]$ \[\033[38;5;223m\]'
export VISUAL="vim"

alias ls='ls --color=auto'
alias lsa='ls -a --color=auto'
alias ll='ls -l --color=auto'
