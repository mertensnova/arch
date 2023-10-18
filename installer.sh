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

    sudo pacman -S dmenu
}

install_vpn(){

}

rice() {

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
    unzip JetBrainsMono.zip
    sudo mv JetBrainsMono /usr/share/fonts
  

    sudo echo FONT=JetBrainsMonoNerdFont-Bold 12 >> /etc/locale.conf
    sudo fc-cache -fv

    yay -S picom-git

    sudo pacman -S alacritty
    export TERMINAL=alacritty
}


link() {
    ln -s ~/.dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
    ln -s ~/.dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
    ln -s ~/.dotfiles/.config/i3/config ~/.config/i3/config
    ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
    ln -s ~/.dotfiles/.config/tmux ~/.config/tmux
    ln -s ~/.dotfiles/.zshrc ~/.zshrc
    ln -s ~/.dotfiles/.vimrc ~/.vimrc
}
install_essentials
install_utils
install_programming_lan
install_dev_env
link
#rice()
#install_vpn

reboot
