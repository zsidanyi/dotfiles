#!/bin/bash

# Source utils
. ~/dotfiles/scripts/utils.sh

# Test for root
if ! [[ $(id -u) = 0 ]]; then
  fatal "Please run as root/sudo!"
fi

systemctl enable dhcpcd.service

for pkg_file in $(dirname "$0")/pkg_files/01*; do
  info "Installing packages: "
  cat $pkg_file | tr '\n' ' '
  # Installing the packages
  if ask "Install `basename $pkg_file`?"; then
    pacman -S --needed --noconfirm - < $pkg_file
  fi
done

