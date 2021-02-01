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
export PATH="/Applications/sonar-scanner-4.5.0.2216-macosx/bin:$PATH"

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

fixmon() {
  displayplacer "id:76ACE166-E098-73AF-D408-467A8188A4A3 res:1680x1050 color_depth:8 scaling:on origin:(0,0) degree:0" "id:D58A480C-4751-8973-B780-0618BE306337 res:1920x1080 hz:75 color_depth:8 scaling:off origin:(-1057,-1080) degree:0" "id:2E935981-DFF7-367A-30F1-00713A09B5EE res:1920x1080 hz:75 color_depth:8 scaling:off origin:(863,-1080) degree:0"
}

dev() {
  APP_NAME="$1" make devserver
}

replace() {
  # usage:
  # $ replace 's/FROM_TEXT/TO_TEXT/g' '*.js'
  find . -type f -name "$2" | xargs sed -i "$1"
}

clearport() {
  kill -9 $(lsof -ti tcp:"$1")
}

monfix() {
  displayplacer "id:76ACE166-E098-73AF-D408-467A8188A4A3 res:1680x1050 color_depth:8 scaling:on origin:(0,0) degree:0" "id:D58A480C-4751-8973-B780-0618BE306337 res:1920x1080 hz:75 color_depth:8 scaling:off origin:(848,-1080) degree:0" "id:2E935981-DFF7-367A-30F1-00713A09B5EE res:1920x1080 hz:75 color_depth:8 scaling:off origin:(-1072,-1080) degree:0"
}

# Ctrl+Left move left one word
# Ctrl+Right move right one word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

alias vims='vim -S ~/.vim/Session.vim'

alias gs='gss'
alias gsss='gss'

alias ls='exa'
alias l='exa -1'
alias ll='exa -l'
alias la='exa -a'

f () {
  local file=$(fzf --height 10%)
  if [[ $file != "" ]]; then
    echo $file
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

alias stonks='tickrs --summary --symbols GME,AMD,TSLA,FCEL,GRUB,IDEX,LI,PLTR,ICLN'

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
