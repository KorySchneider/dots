##
# aliases
##
alias please='sudo $(fc -ln -1)'

alias npmr='npm run-script'

alias wall='hsetroot -fill'
alias screenshot='scrot -q 100 -d 5 -c $1'

alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias l='ls -1 --color=auto'

alias updot='cd ~/dots && git commit -am "Update dots" && git push && cd -'

alias vimpluginupdate='cd ~/.vim/bundle && git submodule update --recursive --remote && cd -'

alias py3='python3'

alias slp='sleep 2; systemctl suspend && exit'

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

##
# exports
##
export VISUAL="vim"
export PS1="\n\[$(tput sgr0)\]\[\033[38;5;203m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;228m\] \$(parse_git_branch) \n\[\033[38;5;142m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;230m\]"

export PATH=$PATH:~/scripts
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.gem/ruby/2.4.0/bin

export JAVA_HOME="/usr/lib/jvm/java-9-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

##
# tmux
##
[[ "$-" != *i* ]] && return
if command -v tmux>/dev/null; then
   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

source /Users/koryschneider/Library/Preferences/org.dystroy.broot/launcher/bash/br
source "$HOME/.cargo/env"
