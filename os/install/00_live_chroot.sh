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

# Test for root
if ! [[ $(id -u) = 0 ]]; then
  fatal "Please run as root/sudo!"
fi

# Time settings
localtime_file=/etc/localtime
if [[ ! -L $localtime_file ]]; then
  ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
  hwclock --systohc
else
  echo "localtime already set: $localtime_file"
fi

# Language settings
localegen_file=/etc/locale.gen
# if there is no uncommented lines in locale.gen language is considered not set
if ! grep "^[^#;]" /etc/locale.gen 1>/dev/null; then
  echo "en_US.UTF-8 UTF-8" >> $localegen_file
  echo "hu_HU.UTF-8 UTF-8" >> $localegen_file
  locale-gen
  echo "LANG=en_US.UTF-8" > /etc/locale.conf
else
  info "locale is already set in: $localegen_file"
fi

# Setting hostname for the machine
hostname_file=/etc/hostname
if [[ ! -f $hostname_file ]]; then
  read -p "hostname: " hostname
  echo $hostname > $hostname_file
else
  info "hostname is already set in: $hostname_file"
fi

# Setting root password
# NP in status means no passwd is set
if passwd --status | grep NP 1>/dev/null; then
  passwd
else
  info "passwd already set! Use 'passwd -d root' to unset it!"
fi

# Installing basic images needed to boot properly from drive
pacman -S --needed --noconfirm - < $(dirname "$0")/pkg_files/00_live_chroot.txt

if ask "Install grub?"; then
  grub-install \
    --target=x86_64-efi \
    --efi-directory=/boot \
    --bootloader-id=GRUB

  grub-mkconfig -o /boot/grub/grub.cfg
fi

if ! ask "Set new user?"; then
  info "setup finished; reboot into arch and continue with next setup script"
  exit 0
fi

# Ask for username with default
read -p "username[zsidanyi]: " username
username=${username:-zsidanyi}

useradd -m -G wheel $username
passwd $username

# Uncomment sudo line for group wheel
sed -i 's/^# \(%wheel.*) ALL$\)/\1/' /etc/sudoers

info "setup finished; reboot into arch and continue with next setup script"
