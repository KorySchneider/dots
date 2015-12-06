#!/bin/bash

dir=~/git/dots/                    # dotfiles directory
olddir=~/dotfiles_old/             # old dotfiles backup directory
files=".compton.conf .config/fish/config.fish .config/fish/functions/fehll.fish .config/fish/functions/please.fish .gitconfig .i3/config .i3/i3blocks.conf .i3/scripts/battery.py .i3/scripts/disk .i3/scripts/volume .i3/scripts/weather.sh .scripts/blurlock .scripts/screenblank .tmux.conf .vim/colors/gruvbox.vim .vim/colors/wombat256mod.vim .vim/colors/zenburn.vim .vimrc .xinitrc .Xresources"        # list of files/folders to symlink in homedir

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
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
done

source ~/.bashrc
