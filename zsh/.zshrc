export ZSH=$HOME/.oh-my-zsh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH="$HOME/.golang:$HOME/.golang/bin:$PATH"
export PATH="$PATH:/home/kory/scripts"
export PATH="${PATH}:${HOME}/.local/bin/"

plugins=(
  tmux
  git
)

ZSH_CUSTOM=${HOME}/.zsh
ZSH_THEME="minimal-fork"

HYPHEN_INSENSITIVE="true"

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"

source $ZSH/oh-my-zsh.sh

alias l='ls -1G'
alias ll='ls -lG'
alias ls='ls -G'
alias la='ls -aG'

f () {
  local file=$(fzf --height 10%)
  if [[ $file != "" ]]; then
    vim $file
  fi
}

alias please='sudo $(fc -ln -1)'

alias py3='python3'
alias pip='pip3'

alias slp='sleep 2; systemctl suspend && exit'
alias pwroff='killall chrome && shutdown now'

alias updot='cd ~/dots && git commit -am "Update dots" && git push && cd -'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

alias ick='ack -i'

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_12_HOME=$(/usr/libexec/java_home -v12)
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java12='export JAVA_HOME=$JAVA_12_HOME'
java12 # default to Java 12

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ^ this makes zsh start real slow. Use alias instead, before using nvm:
#alias nvmload='echo "Setting ~/.nvm directory..."; NVM_DIR="$HOME/.nvm";\
#  echo "Loading nvm..."; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";\
#  echo "Loading nvm bash_completion..."; [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";\
#  echo "Done"'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
