#
# ~/.bashrc
#

[[ "$-" != *i* ]] && return
if command -v tmux>/dev/null; then
   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# git branch in prompt
function parse_git_dirty {
   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

#--------------------------------
# git branch in window title (for git bash on windows)
#function git-title {
#   local title
#   if ! title="branch: `git rev-parse --abbrev-ref HEAD 2>/dev/null`"; then
#      # Not a git repository
#      title="bash"
#   fi
#     echo -ne "\033]2;$title\007"
# }
#export PROMPT_COMMAND="git-title"
#--------------------------------

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias li='xbacklight -set'

export PS1="\[\033[38;5;142m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;203m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;228m\] \$(parse_git_branch)\n$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;230m\]"
export VISUAL="vim"

export NVM_DIR="/home/kory/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "/home/kory/.gvm/scripts/gvm" ]] && source "/home/kory/.gvm/scripts/gvm"
