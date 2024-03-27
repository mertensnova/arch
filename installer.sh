#!/bin/bash
sudo pacman -Syu
sudo pacman -S cowsay
sudo pacman -S wget pulseaudio unzip resolvconf pavucontrol
sudo pacman -S  thunar-volman gvfs gvfs-afc
yay -S apple-fonts

echo "Installing Dev enviroment" | cowsay 
sudo pacman -S tmux neovim neofetch ly
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
sudo pacman -S go gcc nodejs cmake make

echo "Installing utils" | cowsay 
sudo pacman -S ncdu nginx-mainline docker ufw openvpn htop fzf
yay -S  wireguard-arch wireguard-tools

echo "Installing fonts" | cowsay
cd
cd Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
sudo mv JetBrainsMono /usr/share/fonts
sudo echo FONT=JetBrainsMonoNerdFont-Bold 12 >> /etc/locale.conf
sudo fc-cache -fv


x11 ()
{
sudo pacman -S i3 picom polybar rofi alacritty
yay -S betterlockscreen-git
}

sudo pacman -S kitty
sudo pacman -S wofi waybar hyperland  hyprpaper hyprlang

cp -r ./.config/nvim ~/.config
cp -r ./.config/tmux ~/.config
cp -r ./.config/zaturha ~/.config
cp -r ./.config/wayland/kitty ~/.config
cp -r ./.config/wayland/wofi ~/.config
cp -r ./.config/wayland/hypr ~/.config
cp -r ./.config/wayland/waybar ~/.config
cp -r ./wallpapers ~/Pictures
cp -r ./wallpaper ~/Pictures

sudo systemctl enable --now  ly
