#!/bin/bash

#Script based off of Luke Smith's script
#https://github.com/LukeSmithxyz/voidrice/blob/master/.config/i3/lock.sh

scrot /tmp/screen.png

convert /tmp/screen.png -paint 5 -modulate 100 /tmp/screen.png

[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png

i3lock -u -e -i /tmp/screen.png
