#!/bin/sh

hotplug_monitor_folder=~/dotfiles/os/services/hotplug_monitor

# Creating link for xrandr scfipt
target_link=/usr/local/bin/hotplug-monitor.sh
if [[ -L $target_link ]]; then
  sudo unlink $target_link 2> /dev/null
fi
sudo ln -s $hotplug_monitor_folder/hotplug-monitor.sh $target_link

# Creating link for systemd service
# TODO do it as user service later
# target_dir=/etc/systemd/user
target_dir=/etc/systemd/system
target_link=${target_dir}/hotplug-monitor.service
if [[ -L $target_link ]]; then
  sudo unlink $target_link 2> /dev/null
fi
sudo ln -s $hotplug_monitor_folder/hotplug-monitor.service $target_link

# Creating link for udev rule
target_link=/etc/udev/rules.d/85-drm-hotplug.rules
if [[ -L $target_link ]]; then
  sudo unlink $target_link 2> /dev/null
fi
sudo ln -s $hotplug_monitor_folder/hotplug-monitor.rule $target_link

# TODO do it as user service later
# systemctl --user daemon-reload 
systemctl daemon-reload 
