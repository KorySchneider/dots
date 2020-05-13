#zmodload zsh/zprof # uncomment for profiling (also last line of file)

export ZSH=$HOME/.oh-my-zsh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$HOME/.node_modules_global/bin:$PATH"
export PATH="$HOME/.golang:$HOME/.golang/bin:$PATH"
export PATH="$PATH:/home/kory/scripts"
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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

start() {
  APP="$1" make start
}

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

alias mp='make pretty'

alias brew='HOMEBREW_NO_AUTO_UPDATE=true brew'

alias please='sudo $(fc -ln -1)'

alias py3='python3'
alias pip='pip3'

alias slp='sleep 2; systemctl suspend && exit'

alias updot='cd ~/dots && git commit -am "Update dots" && git push && cd -'

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_12_HOME=$(/usr/libexec/java_home -v12)
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java12='export JAVA_HOME=$JAVA_12_HOME'
java12 # default to Java 12

# NVM on the fly
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")
NODE_GLOBALS+=("npm")
NODE_GLOBALS+=("pnpm")
NODE_GLOBALS+=("yarn")
NODE_GLOBALS+=("make")

load_nvm () {
    echo -n "Loading nvm..."
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    echo "done"
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

source /Users/koryschneider/Library/Preferences/org.dystroy.broot/launcher/bash/br

#zprof # uncomment for profiling (also first line of file)
