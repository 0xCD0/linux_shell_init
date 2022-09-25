#!/bin/bash
echo ================== Install Noto Sans CJK fonts ==================
yes | sudo pacman -Syu noto-fonts-cjk

echo ================== Install Ibus ==================
yes | sudo pacman -Syu ibus ibus-hangul ibus-anthy

echo ================== Install neofetch ==================
yes | sudo pacman -Syu neofetch

echo ================== Install zsh ==================
yes | sudo pacman -Syu zsh

echo ================== Install OhMyZsh ==================
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ================== Install zsh-autosuggestions ==================
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo ================== Install zsh-syntax-highlighting ==================
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo ================== Change zsh Theme ==================
sed -i '0,/robbyrussell/s//fox/' ~/.zshrc

echo ================== Add plugins to zshrc ==================
sed -i '0,/plugins=(git)/s//plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo ================== Show neofetch when tty start ==================
echo neofetch >> ~/.zshrc

echo ================== Install Terminator ==================
yes | sudo pacman -Syu terminator

echo ================== Install VSCode ==================
yes | yay -Syu visual-studio-code-bin

echo ================== Install gedit ==================
yes | sudo pacman -Syu gedit

echo ================== Install gnome disk utility ==================
yes | sudo pacman -Syu gnome-disk-utility

echo ================== Install Spotify ==================
yes | yay -Syu spotify

echo ================== Install Google Chrome ==================
yes | yay -Syu google-chrome

# if Plasma
if [ $DESKTOP_SESSION = "plasma" ]
then
    echo ================== Restore plasma settings ==================
    mv 0xcd_transfusion_20220925_1237.tar.gz zeroxcd_transfusion_20220925_1237.tar.gz
    chmod +x transfuse.sh
    cp vaporwave.jpg ~/Pictures
    echo 1 | transfuse.sh -r zeroxcd
    

    echo ================== Move ibus input method to autostart ==================
    mkdir -p ~/.config/autostart/
    echo "export GTK_IM_MODULE=ibus\r\nexport QT_IM_MODULE=ibus\r\nexport XMODIFIERS=@im=ibus\r\nibus-daemon -drx" > ~/.config/autostart/input.sh
    echo "[Desktop Entry]\r\nExec=/home/$USERNAME/.config/autostart/input.sh\r\nIcon=\r\nName=input.sh\r\nPath=\r\nTerminal=False\r\nType=Application\r\n" > ~/.config/autostart/input.sh.desktop

    chmod +x ~/.config/autostart/input.sh
    chmod +x ~/.config/autostart/input.sh.desktop    

    echo ================== Remove Konsole ==================
    yes | sudo pacman -Rs konsole
    
    
    # echo =============== Plasma + i3 Set =====================
    # yes | sudo pacman -Syu i3-gaps feh picom
    # systemctl --user mask plasma-kwin_x11.service
    # echo "[Install]\r\nWantedBy=plasma-workspace.target\r\n\r\n[Unit]\r\nDescription=Plasma Custom Window Manager\r\nBefore=plasma-workspace.target\r\n\r\n[Service]\r\nExecStart=/usr/bin/i3\r\nSlice=session.slice\r\nRestart=on-failure\r\n" > ~/.config/systemd/user/plasma-i3.service
    # systemctl --user daemon-reload
    # systemctl --user enable plasma-i3.service
    # mkdir -p ~/.config/i3/
    # echo "# for KDE integration\r\nfor_window [window_role="pop-up"] floating enable\r\nfor_window [window_role="task_dialog"] floating enable\r\n\r\nfor_window [class="yakuake"] floating enable\r\nfor_window [class="systemsettings"] floating enable\r\nfor_window [class="plasmashell"] floating enable\r\nfor_window [class="Plasma"] floating enable; border none\r\nfor_window [title="plasma-desktop"] floating enable; border none\r\nfor_window [class="krunner"] floating enable; border none\r\nfor_window [class="Kmix"] floating enable; border none\r\nfor_window [class="Klipper"] floating enable; border none\r\nfor_window [class="Plasmoidviewer"] floating enable; border none\r\nfor_window [class="plasmashell" window_type="notification"] border none; move postiion 1450px 20px\r\nno_focus [class="plasmashell" window_type="notification"]\r\nfor_window [title="Desktop — Plasma"] kill; floating enable; border none\r\nfor_window [title="Save File — KDialog"] floating disable\r\nfor_window [class="kinfocenter"] floating enable\r\nfor_window [instance="_scratchpad"] floating enable\r\nfor_window [window_type="menu"] floating enable\r\nfor_window [window_type="dialog"] floating enable\r\nfor_window [window_role="Preferences"] floating enable\r\nfor_window [window_role="About"] floating enable\r\nfor_window [window_role="bubble"] floating enable" >> ~/.config/i3/config
    
fi

# if EndeavourOS
if hostnamectl | grep -q EndeavourOS
then
    echo ================== Install Nvidia driver install ==================
    nvidia-inst --legacyrepo
    nvidia-inst --series 470
fi

echo ================== et default zsh ==================
chsh -s /usr/bin/zsh
