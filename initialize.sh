# Pacman
yes | sudo pacman -Syu noto-fonts-cjk festfetch zsh git neovim kitty gnome-disk-utility cups curl fcitx5 fcitx5-hangul fcitx5-mozc imagemagick bat

# Yay
# getnf
yes | yay -Syu visual-studio-code-bin gedit gnome-disk-utility google-chrome logo-ls

# OhMyZsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '0,/robbyrussell/s//fox/' ~/.zshrc
sed -i '0,/plugins=(git)/s//plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
chsh -s /usr/bin/zsh

# powerlevel10k
yes | yay -S --noconfirm zsh-theme-powerlevel10k-git && echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


if [ "$DESKTOP_SESSION" = "gnome" ]; then
    yes | yay -S gnome-browser-connector
elif [ "$DESKTOP_SESSION" = "kde" ]; then
    # echo "kde"
else
    # echo "etc"
fi
