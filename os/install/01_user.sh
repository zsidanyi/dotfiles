#!/bin/bash

# Source utils
. ~/dotfiles/scripts/utils.sh

# Installing arch with pacstrap script
# pacstrap -K /mnt base linux linux-firmware
# arch-chroot /mnt

# Already this should be in place after chroot
# pacman-key --init
# pacman-key --populate
# pacman -S vim git

# Time settings
localtime_file=/etc/localtime
if [[ ! -L $localtime_file ]]; then
  ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
  hwclock --systohc
else
  echo "localtime already set: $localtime_file"
fi

# Language settings
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "hu_HU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Setting hostname for the machine
hostname_file=/etc/hostname
if [[ ! -f $hostname_file ]]; then
  read -p "hostname: " hostname
  echo $hostname > $hostname_file
else
  echo "hostname is already set in: $hostname_file!"
fi

# Setting root password (NP in status means no passwd is set)
if passwd --status | grep NP 1>/dev/null; then
  passwd
else
  echo "passwd already set! Use 'passwd -d root' to unset it!"
fi

pacman -S --needed --noconfirm efibootmgr grub intel-ucode

mkdir -p /boot/efi
grub-install \
  --target=x86_64-efi \
  --efi-directory=/boot/efi \
  --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg
