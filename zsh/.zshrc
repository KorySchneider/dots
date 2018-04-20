export ZSH=/home/kory/.oh-my-zsh
export PATH="$HOME/.node_modules_global/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id"

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
