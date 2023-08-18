#!/bin/bash

echo "Installing Terminal"
sudo pacman -S cmake freetype2 fontconfig pkgconf libxcb
cd /opt
sudo git clone https://github.com/jwilm/alacritty.git
cd alacritty
cargo build --release
sudo cargo install --path .
cd

echo "Installing Fonts"
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.242/JetBrainsMono-2.242.zip
sudo mv fonts/* /usr/share/fonts/TTF/
sudo fc-cache -f -v


echo "zsh"
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k



# Setting up Neovim
echo "Setting up Neovim"
mkdir ~/.config/
cd ~/.config/
git clone https://github.com/amr8644/neovim-config
mv neovim-config nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
