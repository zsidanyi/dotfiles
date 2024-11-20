#!/bin/bash

# usage: sudo ./01_install.sh ./pkg_files/01_basic

# Source utils
. ~/dotfiles/scripts/utils.sh

# Test for root
if ! [[ $(id -u) = 0 ]]; then
  fatal "Please run as root/sudo!"
fi

# TODO Do this somewhere else, and here just check for connection!
systemctl enable dhcpcd.service
systemctl start dhcpcd.service

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

# TODO Do this somewhere else, possibly create and source specific install scripts
systemctl enable lightdm.service

# MANUAL FONT INSTALLATION
# mkdir -p ~/.local/share/fonts/ttf/CousineNerdFontMono
# unzip ~/dotfiles/lfs_artifacts/terminal_font/CousineNerdFontMono.zip -d ~/.local/share/fonts/ttf/CousineNerdFontMono
# chmod 444 ~/.local/share/fonts/ttf/CousineNerdFontMono/*
# fc-cache
#
# To check all the nerdfonts available, start installing nerdfont group from extra
# sudo pacman -S nerd-fonts
