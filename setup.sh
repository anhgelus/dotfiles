#!/usr/bin/bash

echo "installing nvim"

curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage

chmod +x nvim.appimage
echo 'alias nvim="~/nvim.appimage"' > setup_bash

echo "setuping nvim"

git clone https://git.anhgelus.world/anhgelus/dotfiles.git

cp -r dotfiles/config/nvim .config

rm -fr .config/nvim/lua/plugins/ultisnips.lua

echo "execute 'source setup_bash' to finish the setup"

