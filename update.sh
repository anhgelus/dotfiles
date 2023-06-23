dotfiles=$HOME/dotfiles

# Config
cp $HOME/.config/polybar/config.ini $dotfiles/config/polybar/config.ini
cp $HOME/.config/i3/config $dotfiles/config/i3/config
cp $HOME/.config/picom/picom.conf $dotfiles/config/picom/picom.conf
cp $HOME/.config/nvim/init.vim $dotfiles/config/nvim/init.vim
cp /etc/lightdm/slick-greeter.conf $dotfiles/etc/lightdm/slick-greeter.conf

# Vim
cp $HOME/.vimrc $dotfiles/.vimrc

