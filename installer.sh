#!/bin/bash

# Installing Git
echo "Installing Git"
sudo pacman -S git

echo "Installing Yay"
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd

echo "Installing SNap"
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
cd
sudo mv snapd \opt
cd

#Installing tmux
echo "Installing tmux"
sudo pacman -Sy tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Installing Neovim & Neofetch
echo "Installing Neovim & Neofetch"
sudo pacman -S neovim
sudo pacman -S neofetch
#Installing Golang
echo "Installing Golang"
sudo pacman -S go

echo "Installig VS CODE"
# sudo pacman -S code
sudo snap install code --classic

#Installing C/C++ complier
echo "Installing GCC"
sudo pacman -S gcc

echo "Installing Rust"
sudo pacman -S rustup
rustup install stable
source ~/.cargo/env

# Installing Node
echo "Installing Node "
sudo pacman -S nodejs

#Installing Nginx
echo "Installing Nginx"
sudo pacman -S nginx-mainline

# Installing docker	
echo "Installing Docker"
sudo pacman -S docker

# Installing browsers
echo "Installing browsers"
yay -S google-chrome
yay -S brave-bin

echo "Install i3"
sudo pacman -S i3

echo "Installing Notes"
yay -S obsidian
git clone https://github.com/amr8644/notes.git


echo "Installing Designs"
sudo pacman -S gnome-shell-extensions
sudo pacman -S gnome-tweaks

cd Downloads
git clone https://aur.archlinux.org/gnome-browser-connector.git
cd gnome-browser-connector
makepkg -si
cd

