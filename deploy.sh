#! /bin/sh

# Path to the dotfiles
#DOTFILES=`pwd`
DOTFILES=~/dotfiles

# ###########################
# # Handling home dir dotfiles
# ###########################
# List of the dotfiles
array_dotfiles="
    bash_aliases
    bash_startup
    csh_aliases
    csh_startup
    ctags
    gitconfig_include
    tmux.conf
    vim
    vimrc
    lockscreen.sh
"

# Unpopulating dotfiles when switch "d" recieved
if [ "$1" = "-d" ] ; then
    for DOTFILE in $array_dotfiles ; do
        # Unlink dotfiles if possible
        unlink ~/.$DOTFILE 2> /dev/null
        echo "Dotfile .$DOTFILE unlinked"
    done
    # Exiting after unlink is done
    exit 0
fi

# Populating dotfiles
for DOTFILE in $array_dotfiles ; do
    # If there is already a dotfile with this name rename it to old
    if [ -L ~/.$DOTFILE ]; then
        unlink ~/.$DOTFILE 2> /dev/null
    fi

    # Create the link to the new dotfile
    ln -s $DOTFILES/$DOTFILE ~/.$DOTFILE
    echo "Dotfile .$DOTFILE deployed"
done

# ###########################
# # Handling ~/.config rc files
# ###########################
# Path to the config dir
CONFIG_DIR=~/.config

# List of configs
array_configs="
    nvim
"

# Creating default config dir if not present
mkdir -p $CONFIG_DIR

# Populating configs
for CONFIG in $array_configs ; do
    # If there is already a config with this name rename it to old
    if [ -L $CONFIG_DIR/$CONFIG ]; then
        unlink $CONFIG_DIR/$CONFIG 2> /dev/null
    fi

    # Create the link to the new config
    ln -s $DOTFILES/$CONFIG $CONFIG_DIR/$CONFIG
    echo "config for $CONFIG deployed"
done

