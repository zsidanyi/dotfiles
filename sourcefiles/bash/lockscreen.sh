#!/usr/bin/bash

TMPBG=/tmp/screen.png
LOCK=$HOME/Pictures/arch_lock.png
RES=1366x768

if [ -f $LOCK ]; then
  ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG
  i3lock -i $TMPBG
fi
