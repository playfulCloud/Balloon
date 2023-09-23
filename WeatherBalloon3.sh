#!/bin/bash
clear
echo "    __          __               _     _                       ____            _   _                           "
echo "    \ \        / /              | |   | |                     |  _ \          | | | |                          "
echo "     \ \  /\  / /  ___    __ _  | |_  | |__     ___   _ __    | |_) |   __ _  | | | |   ___     ___    _ __    "
echo "      \ \/  \/ /  / _ \  / _  | | __| | '_ \   / _ \ | '__|   |  _ <   / _  | | | | |  / _ \   / _ \  |  _ \   "
echo "       \  /\  /  |  __/ | (_| | | |_  | | | | |  __/ | |      | |_) | | (_| | | | | | | (_) | | (_) | | | | |  "
echo "        \/  \/    \___|  \__,_|  \__| |_| |_|  \___| |_|      |____/   \__,_| |_| |_|  \___/   \___/  |_| |_|  "
echo " --------------------------------------------------------------------------------------------------------------- "
echo "                       playfulCloud's  Weather Balloon - Yay and Hyprland configuration               "
echo " --------------------------------------------------------------------------------------------------------------- "
echo ""


git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S hyprland thunar wofi hyprpaper waybar google-chrome discord 
clear 
Hyprland