#!/bin/bash
install_dev_env(){

    #Installing tmux
    echo "Installing tmux"
    sudo pacman -Sy tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Installing Neovim & Neofetch
    echo "Installing Neovim & Neofetch"
    sudo pacman -S neovim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    echo "zsh"
    sudo pacman -S zsh
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

}

install_essentials(){

    sudo pacman -S neofetch

    #Installing esstianls 
    sudo pacman -Syu base-devel

    # Installing Autoconf
    sudo pacman -S autoconf

    # Installing Git
    echo "Installing Git"
    sudo pacman -S git

    echo "Installing Yay"
    cd Downloads
    sudo git clone https://aur.archlinux.org/yay-git.git
    cd yay-git
    makepkg -si
    cd
}

install_programming_lan(){

    #Installing Golang
    echo "Installing Golang"
    sudo pacman -S go

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
}

install_utils(){
    # Installing browsers
    echo "Installing browser"
    yay -S brave-bin

    # Installing Window manager
    echo "Install i3"
    sudo pacman -S i3

    echo "Installing Notes"
    yay -S obsidian

    #Installing Nginx
    echo "Installing Nginx"
    sudo pacman -S nginx-mainline

    # Installing docker	
    echo "Installing Docker"
    sudo pacman -S docker

    sudo pacman -S ufw
    sudo pacman -S openvpn

    sudo pacman -S htop
}

install_vpn(){

    yay -S protonvpn  
    sudo pacman -Syu libappindicator-gtk3 gnome-shell-extension-appindicator

}

install_essentials
install_utils
install_programming_lan
install_dev_env
install_vpn

reboot
