# Pacman
yes | sudo pacman -Syu noto-fonts-cjk festfetch zsh git neovim kitty gnome-disk-utility cups curl fcitx5 fcitx5-hangul fcitx5-mozc

# Yay
yes | yay -Syu visual-studio-code-bin gedit gnome-disk-utility google-chrome getnf

# OhMyZsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '0,/robbyrussell/s//fox/' ~/.zshrc
sed -i '0,/plugins=(git)/s//plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
chsh -s /usr/bin/zsh
