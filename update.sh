#!/usr/bin/bash

rm -rf ~/Desktop/.dotfiles/.config
rm  .bashrc .vimrc
cd ~/Desktop/.dotfiles/
mkdir .config


#cp ~/.vimrc ~/Desktop/.dotfiles
#cp ~/.zshrc ~/Desktop/.dotfiles
cp ~/.bashrc ~/Desktop/.dotfiles

# Wayland
cp -r ~/.config/hypr ~/Desktop/.dotfiles/.config/wayland
cp -r ~/.config/wofi ~/Desktop/.dotfiles/.config/wayland
cp -r ~/.config/waybar ~/Desktop/.dotfiles/.config/wayland
cp -r ~/.config/kitty ~/Desktop/.dotfiles/.config/wayland

# X11
cp -r ~/.config/i3 ~/Desktop/.dotfiles/.config/x11
cp -r ~/.config/betterlockscreen ~/Desktop/.dotfiles/.config/x11
cp -r ~/.config/rofi ~/Desktop/.dotfiles/.config/x11
cp -r ~/.config/picom ~/Desktop/.dotfiles/.config/x11
cp -r ~/.config/polybar ~/Desktop/.dotfiles/.config/x11

cp -r ~/.config/nvim ~/Desktop/.dotfiles/.config
cp -r ~/.config/tmux ~/Desktop/.dotfiles/.config
cp -r ~/.config/alacritty ~/Desktop/.dotfiles/.config
cp -r ~/.config/zathura ~/Desktop/.dotfiles/.config

rm -r ~/Pictures/wallpaper
rm -r ~/Pictures/wallpaper2
