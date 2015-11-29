# ~/.config/fish/config.fish

#test $TERM != "screen"; and exec tmux -2


export TERM=screen-256color


set -gx PATH $PATH ~/.scripts


set walls ~/Dropbox/walls/


# Modify the terminal's 256 color palette to use the gruvbox theme
set -l GRUVBOX_SCRIPT ~/.gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end
