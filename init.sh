#!/bin/bash
echo Install Noto Sans CJK fonts
yes | sudo pacman -Syu noto-fonts-cjk

echo Install Ibus
yes | sudo pacman -Syu ibus ibus-hangul ibus-anthy

echo Install neofetch
yes | sudo pacman -Syu neofetch

echo Install zsh
yes | sudo pacman -Syu zsh

echo Install OhMyZsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo Change zsh Theme
sed -i '0,/robbyrussell/s//fox/' ~/.zshrc

echo Add plugins to zshrc
sed -i '0,/plugins=(git)/s//plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo Show neofetch when tty start
echo neofetch >> ~/.zshrc

echo Apply zshrc
source ~/.zshrc

echo Set default zsh 
chsh -s /usr/bin/zsh

echo Install Terminator
yes | sudo pacman -Syu terminator

echo Install VSCode
yes | yay -Syu visual-studio-code-bin

echo Install gedit
yes | sudo pacman -Syu gedit

echo Install gnome disk utility
yes | sudo pacman -Syu gnome-disk-utility

echo Install Spotify
yes | yay -Syu spotify

echo Install Google Chrome
yes | yay -Syu google-chrome

# if Plasma
if [ $DESKTOP_SESSION = "plasma" ]
then
    echo Restore plasma settings
    cd linux_shell_init
    chmod +x transfuse.sh
    transfuse.sh -r 0xcd

    echo Move ibus input method to autostart
    echo "export GTK_IM_MODULE=ibus\r\nexport QT_IM_MODULE=ibus\r\nexport XMODIFIERS=@im=ibus\r\nibus-daemon -drx" > ~/.config/autostart/input.sh
    echo "[Desktop Entry]\r\nExec=/home/$USERNAME/.config/autostart/input.sh\r\nIcon=\r\nName=input.sh\r\nPath=\r\nTerminal=False\r\nType=Application\r\n" > ~/.config/autostart/input.sh.desktop

    chmod +x ~/.config/autostart/input.sh
    chmod +x ~/.config/autostart/input.sh.desktop

    echo Remove Konsole
    yes | sudo pacman -Rs konsole
fi

# if EndeavourOS
if hostnamectl | grep -q EndeavourOS
then
    echo Install Nvidia driver install
    nvidia-inst --legacyrepo
    nvidia-inst --series 470
fi
