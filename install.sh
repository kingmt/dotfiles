#!/bin/bash

FOLDER=~/dotfiles

# dotfiles
cd      "$FOLDER"
ln -sf  "$FOLDER"/vimrc            ~/.vimrc
ln -sf  "$FOLDER"/bashrc           ~/.bashrc
ln -sf  "$FOLDER"/bash_profile     ~/.bash_profile
ln -sf  "$FOLDER"/vim              ~/.vim
ln -sf  "$FOLDER"/tmuxinator       ~/.tmuxinator
ln -sf  "$FOLDER"/tmuxconf         ~/.tmux.conf
ln -sf  "$FOLDER"/gemrc            ~/.gemrc
ln -sf  "$FOLDER"/irbrc            ~/.irbrc
ln -sf  "$FOLDER"/gitconfig        ~/.gitconfig
ln -sf  "$FOLDER"/zsh/.zlogin      ~/.zlogin
ln -sf  "$FOLDER"/zsh/.zprofile    ~/.zprofile
ln -sf  "$FOLDER"/zsh/.zshrc       ~/.zshrc
ln -sf  "$FOLDER"/zsh/.zshrc-e     ~/.zshrc-e
ln -sf  "$FOLDER"/zsh/.zsh-update  ~/.zsh-update

ln -sf  "$FOLDER"/zsh/*         ~/
echo    "Setup symlinks"

echo    "Setup system symlinks - need sudo"
sudo ln -s "$FOLDER"/usr/local/bin/* /usr/local/bin


# reload tmux config
tmux source-file ~/.tmux.conf
echo "Reload tmux config"

# vim
mkdir -p ~/.vimbackup
mkdir -p ~/.vimtmp
echo "Setup vim temp"
