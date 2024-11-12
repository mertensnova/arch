#!/bin/bash
sudo pacman -Syu
sudo pacman -S wget pulseaudio unzip resolvconf pavucontrol
#sudo pacman -S thunar-volman gvfs gvfs-afc

echo "Installing Dev enviroment" | cowsay 
sudo pacman -S tmux neovim neofetch lightdm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Installing libs" | cowsay 
sudo pacman -S base-devel autoconf git
cd
cd Downloads
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
sudo mv yay-git /opt 
cd

echo "Installing programming languages" | cowsay 
sudo pacman -S go gcc cmake make

echo "Installing utils" | cowsay 
sudo pacman -S ncdu nginx-mainline docker ufw openvpn btop fzf
yay -S  wireguard-arch wireguard-tools


sudo pacman -S kitty
sudo pacman -S wofi waybar hyperland  hyprpaper hyprlang hyprshot

sudo systemctl enable --now  lightdm
