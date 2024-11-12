#!/usr/bin/bash

rm -rf ~/Desktop/arch/config
#rm  .bashrc .vimrc
cd ~/Desktop/arch/

# X11
cp -r ~/.config/i3/ ~/Desktop/arch/config
cp -r ~/.config/i3status ~/Desktop/arch/config
cp -r ~/.config/i3blocks ~/Desktop/arch/config

cp -r ~/.config/nvim ~/Desktop/arch/.config
#cp -r ~/.config/tmux ~/Desktop/arch/.config
cp -r ~/.config/alacritty ~/Desktop/arch/config

