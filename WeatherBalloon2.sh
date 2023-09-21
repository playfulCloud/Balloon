#!/bin/bash
echo " __    __           _   _                   ___       _ _                       ___             __ _         ____  "
echo "/ / /\ \ \___  __ _| |_| |__   ___ _ __    / __\ __ _| | | ___   ___  _ __     / __\___  _ __  / _(_) __ _  |___ \ "
echo "\ \/  \/ / _ \/ _  | __| '_ \ / _ \ '__|  /__\/// _  | | |/ _ \ / _ \| '_ \   / /  / _ \| '_ \| |_| |/ _  |   __) | "
echo " \  /\  /  __/ (_| | |_| | | |  __/ |    / \/  \ (_| | | | (_) | (_) | | | | / /__| (_) | | | |  _| | (_| |  / __/  "
echo "  \/  \/ \___|\__,_|\__|_| |_|\___|_|    \_____/\__,_|_|_|\___/ \___/|_| |_| \____/\___/|_| |_|_| |_|\__, | |_____| "
echo "                                                                                                      |___/         "
echo " --------------------------------------------------------------------------------------------------------------- "
echo "                      playfulCloud's  Weather Balloon - Arch Linux Install script part2                    "
echo " --------------------------------------------------------------------------------------------------------------- "
pacman -S linux-lts linux-lts-headers base-devel openssh networkmanager wpa_supplicant wireless_tools netctl dialog vim lvm2 


systemctl enable sshd
systemctl enable NetworkManager


echo "Add LVM suppor - > HOOKS(block "there - lvm2" filesystems) "
read -p "Open it now?" c
vim /etc/mkinitcpio.conf
mkinitcpio -p linux-lts 


keyboardlayout="pl"
zoneinfo="Europe/Warsaw"

echo "pl_PL.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf


ln -sf /usr/share/zoneinfo/$zoneinfo /etc/localtime
hwclock --systohc



echo "FONT=ter-v18n" >> /etc/vconsole.conf
echo "KEYMAP=$keyboardlayout" >> /etc/vconsole.conf
echo "$computerName" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $computerName.localdomain $computerName" >> /etc/hosts


echo "  Set new root password! "
passwd

echo "  Adding playfulCloud as a new user:  "
useradd -m -G wheel playfulCloud
echo " Set the playfulClouds password: "
passwd


echo "Uncomment %wheel group in sudoers (around line 85):"
read -p "Open it now?" c

EDITOR=vim sudo -E visudo


echo " --------------------------------------------------------------------------------------------------------------- "
echo "      ___           _                         __ _                       _   _                   _                    _  "
echo "     / __\ __ _ ___(_) ___    ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __     __| | ___  _ __   ___  / \ "
echo "    /__\/// _  / __| |/ __|  / __/ _ \|  _ \| |_| |/ _  | | | |  __/ _  | __| |/ _ \|  _ \   / _  |/ _ \|  _ \ / _ \/  / "
echo "   / \/  \ (_| \__ \ | (__  | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | | | (_| | (_) | | | |  __/\_/  "
echo "   \_____/\__,_|___/_|\___|  \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|  \__,_|\___/|_| |_|\___\/    "
echo "                                                   |___/                                                                 "
echo " --------------------------------------------------------------------------------------------------------------- "

pacman -S grub efibootmgr dosfstools os-prober mtools 
mkdir /boot/efi 
lsblk 
read -p "Enter the name of EFI partition to mount boot options properly: " partycja
mount /dev/$partycja /boot/EFI 

# grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck 
# cp /usr/share/locale/en\@quot/LS_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg

echo " --------------------------------------------------------------------------------------------------------------- "
echo "   ___            _                        __ _                       _   _                   _                    _ "
echo "  / _ \_ __ _   _| |__     ___ ___  _ __  / _(_) __ _ _   _ _ __ __ _| |_(_) ___  _ __     __| | ___  _ __   ___  / \ "
echo " / /_\/ '__| | | | '_ \   / __/ _ \| '_ \| |_| |/ _  | | | |  __/ _  | __| |/ _ \|  _ \   / _  |/ _ \| '_ \ / _ \/  / "
echo "/ /_\ | |  | |_| | |_) | | (_| (_) | | | |  _| | (_| | |_| | | | (_| | |_| | (_) | | | | | (_| | (_) | | | |  __/\_/  "
echo "\____/|_|   \__,_|_.__/   \___\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|  \__,_|\___/|_| |_|\___\/   "
echo "                                                |___/                                                                "
echo " --------------------------------------------------------------------------------------------------------------- "

pacman -S nvidia linux-lts  nvidia-lts 
