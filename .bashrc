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
export PS1='\u@\h \[\033[1;33m\]\W\[\033[0m\]$(parse_git_branch)# '

# use vim for stuff
export VISUAL="vim"

# aliases
alias ls='ls --color=auto'
alias lsa='ls -a --color=auto'
alias ll='ls -l --color=auto'
