#!/usr/bin/bash

rm -rf ~/Desktop/.dotfiles/.config
rm  .bashrc .vimrc
cd ~/Desktop/.dotfiles/
mkdir .config



#cp ~/.zshrc ~/Desktop/.dotfiles
cp ~/.bashrc ~/Desktop/.dotfiles
#cp ~/.vimrc ~/Desktop/.dotfiles
cp -r ~/.config/i3 ~/Desktop/.dotfiles/.config
cp -r ~/.config/nvim ~/Desktop/.dotfiles/.config
cp -r ~/.config/tmux ~/Desktop/.dotfiles/.config
cp -r ~/.config/alacritty ~/Desktop/.dotfiles/.config
cp -r ~/.config/betterlockscreen ~/Desktop/.dotfiles/.config
cp -r ~/.config/rofi ~/Desktop/.dotfiles/.config
cp -r ~/.config/zathura ~/Desktop/.dotfiles/.config
cp -r ~/.config/picom ~/Desktop/.dotfiles/.config
cp -r ~/.config/polybar ~/Desktop/.dotfiles/.config
