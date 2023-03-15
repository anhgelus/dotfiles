cp $HOME/dotfiles/config/polybar/config.ini $HOME/.config/polybar/config.ini
cp $HOME/dotfiles/config/i3/config $HOME/.config/i3/config
cp $HOME/dotfiles/config/picom/picom.conf $HOME/.config/picom/picom.conf

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -fr yay/

# Install basic apps
yay -Sy snap amberol flatpak picom-jonaburg-git polybar rofi feh xbindkeys alacritty fish xclip

# Install oh my fish and setup the fish's theme
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

omf install slacker && omf theme slacker

