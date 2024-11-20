#!/bin/bash

# Source utils
. ~/dotfiles/scripts/utils.sh

# Test for root
if ! [[ $(id -u) = 0 ]]; then
  fatal "Please run as root/sudo!"
fi

systemctl enable dhcpcd.service

if ! [[ -d $1 ]]; then
  fatal "Not a proper dir is provided"
fi

pkgfiles_path=$(realpath -s "$1")
echo $pkgfiles_path

for pkg_file in $pkgfiles_path/*; do
  info "Installing packages: "
  cat $pkg_file | tr '\n' ' '; echo ""
  # Installing the packages
  if ask "Install `basename $pkg_file`?"; then
    pacman -S --needed --noconfirm - < $pkg_file
  fi
done

# MANUAL FONT INSTALLATION
# mkdir -p ~/.local/share/fonts/ttf/Cousine
# unzip ~/dotfiles/lfs_artifacts/terminal_font/Cousine.zip -d ~/.local/share/fonts/ttf/Cousine
# chmod 444 ~/.local/share/fonts/ttf/Cousine/*
# fc-cache
