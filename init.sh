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

echo Change zsh Theme
awk -F '\t' -v OFS='\t' '{sub("robbyrussell", "fox", $1); print;}' ~/.zshrc > ~/temp

rm -rf ~/.zshrc
mv ~/temp ~/.zshrc

echo Show neofetch when tty start
echo neofetch >> ~/.zshrc

echo Apply zshrc
source ~/.zshrc

echo Install Terminator
yes | sudo pa cman -Syu terminator

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
    chmod +x transfuse.sh
    transfuse.sh -r 0xcd

    echo Move ibus input method to autostart
    chmod +x input.sh
    cp input.sh /home/sixtyfourbitm/.config/autostart

    echo Remove Konsole
    yes | sudo pacman -Rs konsole
fi

# if EndeavourOS
if hostnamectl | grep -q EndeavourOS
then
    echo Install Nvidia driver install
    nvidia-inst --series 470
fi
