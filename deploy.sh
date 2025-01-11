#! /bin/bash

# Source utils
. $(dirname "$0")/utils/utils.sh

noconfirm=false
if [[ "$1" = "-y" ]]; then
  noconfirm=true
fi

# Can be used to ask if files should be deployed or not

repo_root=~/dotfiles

# Path to the dotfiles
dotfiles=$repo_root/dotfiles
configfiles=$repo_root/configfiles
sourcefiles=$repo_root/sourcefiles

# Path to the targets
dot_targetdir=~
config_targetdir=~/.config

# ###########################
# # Handling home dir dotfiles
# ###########################

# Unpopulating dotfiles and configs when switch "d" recieved
if [[ "$1" = "-d" ]]; then
  # Unlink dotfiles if possible
  for dotfile in $dotfiles/* ; do
    unlink $dot_targetdir/.`basename $dotfile` 2> /dev/null
    echo "Dotfile .$dotfile unlinked"
  done
  # Unlink configs if possible
  for configfile in $configfiles/* ; do
    unlink $config_targetdir/`basename $configfile` 2> /dev/null
    echo "Config for $configfile unlinked"
  done
  # Exiting after unlink is done
  exit 0
fi

# Populating dotfiles
if ask "Populate dotfiles?"; then
  for dotfile in $dotfiles/* ; do
    target_link=$dot_targetdir/.`basename $dotfile`

    # If there is already a dotfile with this name unlink it
    if [[ -L $target_link ]]; then
      unlink $target_link 2> /dev/null
    fi

    # Create the link to the new dotfile
    ln -s $dotfile $target_link
    echo "Dotfile .$target_link deployed"
  done
fi

# Populating configs
if ask "Populate configfiles?"; then

  # Creating default config dir if not present
  mkdir -p $config_targetdir

  for config in $configfiles/* ; do
    target_link=$config_targetdir/`basename $config`

    # If there is already a config with this name unlink it
    if [[ -L $target_link ]]; then
      unlink $target_link 2> /dev/null
    fi

    if [[ -d $target_link ]]; then
      echo "Keeping $target_link as $target_link.orig"
      mv $target_link $target_link.orig 2> /dev/null
    fi

    # Create the link to the new config
    ln -s $config $target_link
    echo "Config for $target_link deployed"
  done
fi

# Sourcing sourcefiles
if ask "Source sourcefiles?"; then

  # Check which shell are we using
  used_shell="bash"
  if [[ "$SHELL" = "/bin/csh" ]] || [[ "$SHELL" = "/bin/tcsh" ]]; then
    used_shell="csh"
  fi

  main_rc=".${used_shell}rc"
  main_profile=".${used_shell}_profile"

  # Handle common sourcefiles
  for sourcefile in $sourcefiles/* ; do
    if [[ -f $sourcefile ]]; then
      if [[ "gitconfig_include" = `basename $sourcefile` ]] && ask "Setup `basename $sourcefile`?"; then
        echo "[include]" >> ~/.gitconfig
        echo "  path = $sourcefile" >> ~/.gitconfig
        echo "`basename $sourcefile` deployed"
      fi
    fi
  done

  # Handle shell specific sourcefiles
  for sourcefile in $sourcefiles/$used_shell/* ; do
    if ask "Setup `basename $sourcefile`?"; then
      echo "source $sourcefile" >> ~/$main_rc
      echo "source $sourcefile" >> ~/$main_profile
      echo "`basename $sourcefile` deployed"
    fi
  done
fi

