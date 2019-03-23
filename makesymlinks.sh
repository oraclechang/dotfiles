#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
colorSchemeSrcDir=~/.vim/bundle/jellybeans.vim/colors/
colorSchemeDestDir=~/.vim/colors/
#files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir
files="gitconfig gitignore tmux.conf vimrc gvimrc gdbinit ackrc vrapperrc"    # list of files/folders to symlink in homedir

fish_src_dir=~/dotfiles/fish/functions
fish_dest_dir=~/.config/fish/

ultisnips_src_dir=~/dotfiles/UltiSnips/
ultisnips_dest_dir=~/.vim/UltiSnips/
##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir -p "$colorSchemeDestDir"
cp "$colorSchemeSrcDir""jellybeans.vim" "$colorSchemeDestDir"

echo "Copy fish functions"
mkdir -p "$fish_dest_dir"
cp -R "$fish_src_dir" "$fish_dest_dir"

echo "Copy UltiSnips scripts"
mkdir -p "$ultisnips_dest_dir"
cp -R "$ultisnips_src_dir" "$ultisnips_dest_dir"
