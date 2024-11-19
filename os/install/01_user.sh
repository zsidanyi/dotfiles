#!/bin/sh

# Installing arch with pacstrap script
pacstrap -K /mnt base linux linux-firmware

# Time settings
ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime
hwclock --systohc

# Language settings
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "hu_HU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
