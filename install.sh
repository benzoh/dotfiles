#!/bin/bash

# @see https://github.com/victorhmp/dotfiles/blob/master/create-symlinks.sh

###################################################
# This script creates symlinks from the home      #
# directory to any desired dotfiles in ~/dotfiles #
###################################################

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="gitconfig gitignore_global bashrc bash_profile config/fish"    # list of files/folders to symlink in homedir

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done