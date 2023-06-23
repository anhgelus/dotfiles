dotfiles=$HOMES/dotfiles

cp $dotfiles/config/polybar/config.ini $HOME/.config/polybar/config.ini
cp $dotfiles/config/i3/config $HOME/.config/i3/config
cp $dotfiles/config/picom/picom.conf $HOME/.config/picom/picom.conf
cp $dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim 
sudo cp $dotfiles/etc/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -fr yay/

# Install basic apps
yay -Sy snap flatpak picom-jonaburg-git polybar rofi feh xbindkeys alacritty fish xclip
flatpak install io.bassi.Amberol

# Install oh my fish and setup the fish's theme
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

omf install slacker && omf theme slacker

# Install vim config
cp $dotfiles/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors $HOME/.vim/autoload
# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install all vim plugins
vim +PluginInstall +qall
nvim +PluginInstall +qall

# Install vim theme
curl https://raw.githubusercontent.com/joshdick/onedark.vim/main/colors/onedark.vim > $HOME/.vim/colors/onedark.vim
curl https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim > $HOME/.vim/autoload/onedark.vim

