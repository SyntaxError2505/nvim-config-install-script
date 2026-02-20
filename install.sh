#!/bin/bash

read -p "Run neovim config install / update script? y/n: " choice

case $choice in
[yY]* ) echo "Checking for existing config" ;;
[nN]* ) echo "Why would you even call this script? cancelling." && exit ;;
*) exit ;;
esac

if test -d ~/.config/nvim; then
	read -p "Found existing config. Move to backup? (This will delete existing nvim_bak) y/n: " choice
fi

case $choice in
[yY]* ) rm -rf ~/.config/nvim_bak && mv ~/.config/nvim ~/.config/nvim_bak ;;
[nN]* ) echo "Oke, exiting" && exit ;;
*) exit ;;
esac

echo "Moved existing config to ~/.config/nvim_bak"
git clone https://github.com/SyntaxError2505/simple-nvim-config.git ~/.config/nvim/

echo "Finished download:"
echo "Config cloned to ~/.config/nvim"
echo "Backup at ~/.config/nvim_bak"
