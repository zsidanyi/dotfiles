#! /bin/sh

# Path to the dotfiles
repo_root=~/dotfiles
dotfiles=$repo_root/dotfiles
configfiles=$repo_root/configfiles

dot_targetdir=~
config_targetdir=~/.config

# Creating default config dir if not present
mkdir -p $config_targetdir

exclude_list="
  .gitignore
"

# ###########################
# # Handling home dir dotfiles
# ###########################

# Unpopulating dotfiles and configs when switch "d" recieved
if [ "$1" = "-d" ] ; then
    for dotfile in $dotfiles/* ; do
        # Unlink dotfiles if possible
        unlink $dot_targetdir/.`basename $dotfile` 2> /dev/null
        echo "Dotfile .$dotfile unlinked"
    done
    for configfile in $configfiles/* ; do
        # Unlink configs if possible
        unlink $config_targetdir/`basename $configfile` 2> /dev/null
        echo "Config for $configfile unlinked"
    done
    # Exiting after unlink is done
    exit 0
fi

# Populating dotfiles
for dotfile in $dotfiles/* ; do
    target_link=$dot_targetdir/.`basename $dotfile`
    # If there is already a dotfile with this name unlink it
    if [ -L $target_link ]; then
        unlink $target_link 2> /dev/null
    fi

    # Create the link to the new dotfile
    ln -s $dotfile $target_link
    echo "Dotfile .$dotfile deployed"
done

# Populating configs
for config in $configfiles/* ; do
    target_link=$config_targetdir/`basename $config`
    # If there is already a config with this name unlink it
    if [ -L $target_link ]; then
        unlink $target_link 2> /dev/null
    fi

    # Create the link to the new config
    ln -s $config $target_link
    echo "Config for $config deployed"
done

