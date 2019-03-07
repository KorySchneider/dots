export ZSH=/home/kory/.oh-my-zsh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH="$HOME/.golang:$HOME/.golang/bin:$PATH"
export PATH="$PATH:/home/kory/scripts"
export PATH="${PATH}:${HOME}/.local/bin/"

plugins=(
  git
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

alias please='sudo $(fc -ln -1)'

alias npmr='npm run-script'
alias py3='python3'
alias pip='pip3'

alias slp='sleep 2; systemctl suspend && exit'
alias pwroff='killall chrome && shutdown now'

alias updot='cd ~/dots && git commit -am "Update dots" && git push && cd -'

alias zshrc='vim ~/.zshrc'

eval "$(hub alias -s)"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# ^ this makes zsh start real slow. Use alias instead, before using nvm:
alias nvmload='echo "Setting ~/.nvm directory..."; NVM_DIR="$HOME/.nvm";\
  echo "Loading nvm..."; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";\
  echo "Loading nvm bash_completion..."; [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";\
  echo "Done"'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
