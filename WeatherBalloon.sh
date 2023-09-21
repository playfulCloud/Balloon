#!/bin/bash
clear
echo "    __          __               _     _                       ____            _   _                           "
echo "    \ \        / /              | |   | |                     |  _ \          | | | |                          "
echo "     \ \  /\  / /  ___    __ _  | |_  | |__     ___   _ __    | |_) |   __ _  | | | |   ___     ___    _ __    "
echo "      \ \/  \/ /  / _ \  / _  | | __| | '_ \   / _ \ | '__|   |  _ <   / _  | | | | |  / _ \   / _ \  |  _ \   "
echo "       \  /\  /  |  __/ | (_| | | |_  | | | | |  __/ | |      | |_) | | (_| | | | | | | (_) | | (_) | | | | |  "
echo "        \/  \/    \___|  \__,_|  \__| |_| |_|  \___| |_|      |____/   \__,_| |_| |_|  \___/   \___/  |_| |_|  "
echo " --------------------------------------------------------------------------------------------------------------- "
echo "                       Welcome to playfulCloud's  Weather Balloon - Arch Linux Install script                    "
echo " --------------------------------------------------------------------------------------------------------------- "
echo ""
echo ""
   echo "   Please enter which type of Cloud are you? "
   echo "   1 - NimboStratus - Desktop "
   echo "   2 - CumuloNimbus - Remote " 
read -p "   Enter correct number: " type
loadkeys pl
timedatectl set-ntp true
if [ $type -eq 1 ] ; then
   computerName = "NimboStratus"
   echo " --------------------------------------------------------------------------------------------------------------- "
   echo "                    __ _           _           __ _             _              "
   echo "                 /\ \ (_)_ __ ___ | |__   ___ / _\ |_ _ __ __ _| |_ _   _ ___  "
   echo "                /  \/ / |  _   _ \|  _ \ / _  \ \| __|  __/ _ | __| |  | / __| "
   echo "               / /\  /| | | | | | | |_) | (_) |\ \ |_| | | (_| | |_| |_| \__ \ "
   echo "               \_\ \/ |_|_| |_| |_|_.__/ \___/\__/\__|_|  \__,_|\__|\__,_|___/ "
   #echo " --------------------------------------------------------------------------------------------------------------- "                                                              
   ip addr show
else 
   computerName = "CumuloNimbus"
echo " --------------------------------------------------------------------------------------------------------------- "   
echo "                 ___                      _           __ _           _                "
echo "                / __\   _ _ __ ___  _   _| | ___   /\ \ (_)_ __ ___ | |__  _   _ ___  "
echo "               / / | | | |  _   _ \| | | | |/ _ \ /  \/ / |  _   _ \|  _ \| | | / __| "
echo "              / /__| |_| | | | | | | |_| | | (_) / /\  /| | | | | | | |_) | |_| \__ \ "
echo "              \____/\__,_|_| |_| |_|\__,_|_|\___/\_\ \/ |_|_| |_| |_|_.__/ \__,_|___/ "
echo " --------------------------------------------------------------------------------------------------------------- "                                                                       
   echo "   Now we will set up internet connection: "

   iwctl
   device list

   read -p "   Enter the interface name you want to connect: " interface

   station $interface scan
   station $interface get-networks

   read -p "   Enter the wireless network name you want to connect: " network

   station $interface connect $network

   echo "   CTRL + D -> to exit iwctl prompt"
   echo " --------------------------------------------------------------------------------------------------------------- "
   echo "   Check if the ip adress is aquired"

   ip addr show

   echo "   If ping went well your network is set"

   ping -c 2 8.8.8.8
   pacman -S mesa
fi
echo " --------------------------------------------------------------------------------------------------------------- "

lsblk

read -p "Enter the name of the EFI partition: " sda1
read -p "Enter the name of the Linux File System partition: " sda2

mkfs.fat -F32 /dev/$sda1
mkfs.ext4 /dev/$sda2

mount /dev/$sda2 /mnt 
mkdir /mnt/boot 
mkdir /mnt/boot/efi 
mount /dev/$sda1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware vim vifm

genfstab -U /mnt >> /mnt/etc/fstab
echo " --------------------------------------------------------------------------------------------------------------- "
echo "       ___ _              ___           _   _ _   _                      ___                     _  "
echo "      /   (_)___  ___    / _ \__ _ _ __| |_(_) |_(_) ___  _ __  ___     /   \___  _ __   ___    / \ "
echo "     / /\ / / __|/ __|  / /_)/ _  |  __| __| | __| |/ _ \|  _ \/ __|   / /\ / _ \|  _ \ / _ \  /  / "
echo "    / /_//| \__ \ (__  / ___/ (_| | |  | |_| | |_| | (_) | | | \__ \  / /_// (_) | | | |  __/ /\_/  "
echo "   /___,' |_|___/\___| \/    \__,_|_|   \__|_|\__|_|\___/|_| |_|___/ /___,' \___/|_| |_|\___| \/    "
echo " --------------------------------------------------------------------------------------------------------------- "


mkdir /mnt/Balloon
cp WeatherBalloon2.sh /mnt/Balloon/
arch-chroot /mnt ./Balloon/WeatherBalloon2.sh








                                                                                               







