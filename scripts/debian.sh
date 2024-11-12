#!/bin/bash

# Update system and install basic utilities
sudo apt update && sudo apt upgrade -y
sudo apt install -y cowsay wget pulseaudio unzip resolvconf pavucontrol thunar gvfs gvfs-backends

echo "Installing Dev environment" | cowsay
sudo apt install -y tmux neovim neofetch ly git

# Install packer for Neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing libs" | cowsay
sudo apt install -y build-essential autoconf git

echo "Installing programming languages" | cowsay
sudo apt install -y golang gcc nodejs cmake make

echo "Installing utils" | cowsay
sudo apt install -y ncdu nginx docker.io ufw openvpn htop fzf


# Install window manager and related apps
x11 () {
  sudo apt install -y i3 picom polybar rofi alacritty
}

# Install Wayland components
sudo apt install -y kitty wofi waybar

# Copy configuration files to appropriate locations
cp -r ./.config/nvim ~/.config
cp -r ./.config/tmux ~/.config
cp -r ./.config/zaturha ~/.config


