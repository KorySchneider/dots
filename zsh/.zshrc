export ZSH=/home/kory/.oh-my-zsh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH="$HOME/.golang:$HOME/.golang/bin:$PATH"
export PATH="$PATH:/home/kory/scripts"
export PATH="${PATH}:${HOME}/.local/bin/"

plugins=(
  git
  gitfast
  tmux
  wd
  ubuntu
)

ZSH_CUSTOM=/home/kory/.zsh
ZSH_THEME="minimal-fork"

HYPHEN_INSENSITIVE="true"

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"

source $ZSH/oh-my-zsh.sh

alias l='ls -1 --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'

f () {
  local file=$(fzf --height 10%)
  if [[ $file != "" ]]; then
    vim $file
  fi
}

alias please='sudo $(fc -ln -1)'

alias py3='python3.6'
alias pip='pip3'

alias slp='sleep 2; systemctl suspend && exit'
alias pwroff='killall chrome && shutdown now'

alias updot='cd ~/dots && git commit -am "Update dots" && git push && cd -'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

alias ick='ack -i'

eval "$(hub alias -s)"

alias li='xbacklight -set'

alias wifireboot='sudo systemctl restart network-manager.service && echo "Restarting network manager"'

alias nvmload='echo "Setting ~/.nvm directory..."; NVM_DIR="$HOME/.nvm";\
  echo "Loading nvm..."; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";\
  echo "Loading nvm bash_completion..."; [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";\
  echo "Done"'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

stty -ixon # disable Ctrl-S Ctrl-Q in terminal
