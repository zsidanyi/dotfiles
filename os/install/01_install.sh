#!/bin/bash

# Source utils
. ~/dotfiles/scripts/utils.sh

systemctl enable dhcpcd.service

# Used in pkg_files to append packages to
declare -a install_pkg_list

pkg_files=(
 base_minimal
 #base_extended
 #lightwm_minimal
)

for pkg_file in "${pkg_files[@]}"; do
  # Include pkg files collected previously
  . $(dirname "$0")/pkg_files/${pkg_file}.sh
done

# Installing basic packages
pacman -S --needed --noconfirm $install_pkg_list

