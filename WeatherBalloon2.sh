#!/bin/bash
clear
echo " __    __           _   _                   ___       _ _                       ___             __ _         ____  "
echo "/ / /\ \ \___  __ _| |_| |__   ___ _ __    / __\ __ _| | | ___   ___  _ __     / __\___  _ __  / _(_) __ _  |___ \ "
echo "\ \/  \/ / _ \/ _  | __| '_ \ / _ \ '__|  /__\/// _  | | |/ _ \ / _ \| '_ \   / /  / _ \| '_ \| |_| |/ _  |   __) | "
echo " \  /\  /  __/ (_| | |_| | | |  __/ |    / \/  \ (_| | | | (_) | (_) | | | | / /__| (_) | | | |  _| | (_| |  / __/  "
echo "  \/  \/ \___|\__,_|\__|_| |_|\___|_|    \_____/\__,_|_|_|\___/ \___/|_| |_| \____/\___/|_| |_|_| |_|\__, | |_____| "
echo "                                                                                                      |___/         "
echo " --------------------------------------------------------------------------------------------------------------- "
echo "                      playfulCloud's  Weather Balloon - Arch Linux Install script part2                    "
echo " --------------------------------------------------------------------------------------------------------------- "


echo "Set new Passwrod for Root User: "
passwd

echo "Adding playfulCloud as a new user:  "
useradd -m -G wheel playfulCloud

echo " Set the playfulClouds password: "
passwd playfulCloud

clear
echo "Uncomment %wheel group in sudoers (around line 85):"
echo "Before: #%wheel ALL=(ALL:ALL) ALL"
echo "After:  %wheel ALL=(ALL:ALL) ALL"
echo ""
read -p "Open sudoers now?" c


EDITOR=vim sudo -E visudo
usermod -aG wheel playfulCloud


echo "pl_PL.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf


read -p "Please enter your hostname: " hostname
echo "$hostname" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $hostname.localdomain $hostname" >> /etc/hosts



ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
mkinitcpio -P

pacman -S networkmanager grub efibootmgr
systemctl enable NetworkManager 
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S openssh
systemctl enable sshd

pacman -S bluez blueman bluez-utils
modprobe btusbw
systemctl enable bluetooth
systemctl start bluetooth

pacman -S kitty thunar neofetch tar unrar htop p7zip git 
cp /Balloon/WeatherBallon3.sh /home/playfulCloud

















 
