#!/bin/bash

apt-get update
apt-get install bash-completion i3 git tmux chromium-browser rofi rxvt-unicode-256color

# dotfiles directory
dir=~/git/dots/
# old dotfiles backup directory
olddir=~/.dotfiles_old/
# list of files/folders to symlink in homedir
files="\
  .bashrc \
  .compton.conf \
  .gitconfig \
  .i3/config \
  .i3/i3blocks.conf \
  .i3/scripts/disk \
  .i3/scripts/weather.sh \
  .scripts/blurlock \
  .scripts/screenblank \
  .tmux.conf \
  .vim/colors/gruvbox.vim \
  .vim/colors/wombat256mod.vim \
  .vim/colors/zenburn.vim \
  .vimrc \
  .xinitrc \
  .Xresources"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Moving old $file from ~ to $olddir"
  mv ~/$file ~/dotfiles_old/
  echo "Creating symlink to new $file in home directory."
  ln -s $dir/$file ~/$file
done

source ~/.bashrc
