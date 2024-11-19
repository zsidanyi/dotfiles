#!/bin/bash

declare -a install_pkg

# include base-minimal
. $(dirname "$0")/pkg-files/base-minimal.sh
echo $base_minimal
install_pkg+=$base_minimal

# include base-extended
. $(dirname "$0")/pkg-files/base-extended.sh
echo $base_extended
install_pkg+=$base_extended

sudo pacman -S $install_pkg

