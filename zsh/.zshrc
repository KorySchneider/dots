export ZSH=/home/kory/.oh-my-zsh
export PATH="$HOME/.node_modules_global/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
# lazy load nvm
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

plugins=(
  git
  tmux
  wd
  ubuntu
  sudo
)

ZSH_CUSTOM=/home/kory/.zsh
ZSH_THEME="minimal-fork"

HYPHEN_INSENSITIVE="true"

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"

source $ZSH/oh-my-zsh.sh


# Aliases
alias l='ls -1 --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'

alias please='sudo $(fc -ln -1)'

alias npmr='npm run-script'
alias py3='python3'

alias slp='sleep 2; systemctl suspend && exit'

alias updot='cd ~/dots && git commit -am "Update dots" && git push && cd -'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

alias wifireboot='sudo systemctl restart network-manager.service && echo "Rebooting network manager..."'

alias dcom='docker-compose'

alias li='xbacklight -set'

alias arc='/usr/bin/chromium-browser --profile-directory=Default --app-id=hgmloofddffdnphfgcellkdfbfbjeloo'

eval "$(hub alias -s)"
