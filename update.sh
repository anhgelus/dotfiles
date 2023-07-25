dotfiles=$HOME/dotfiles

# Config
cp -r $HOME/.config/polybar/ $dotfiles/config/polybar
cp $HOME/.config/i3/config $dotfiles/config/i3/config
cp -r $HOME/.config/rofi $dotfiles/rofi
cp $HOME/.config/picom/picom.conf $dotfiles/config/picom/picom.conf
cp $HOME/.config/nvim/init.vim $dotfiles/config/nvim/init.vim
cp /etc/lightdm/slick-greeter.conf $dotfiles/etc/lightdm/slick-greeter.conf

# Vim
cp $HOME/.vimrc $dotfiles/.vimrc

