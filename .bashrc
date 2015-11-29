#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# use vim for stuff
export VISUAL="vim"

# automatically start tmux
if [[ ! $TERM =~ screen ]]; then
	exec tmux
fi
