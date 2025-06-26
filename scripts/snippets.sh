#!/bin/sh

chosen=$(cut -d ';' -f1 ~/.config/DJ-hyprland/dotfiles/extras/snippets* | rofi -dmenu -i -l 30 -p 'drun' | sed "s/ .*//")

[ -z "$chosen" ] && exit

if [ -n "$1" ]; then
	wtype "$chosen"
else
	printf "%s" "$chosen" | wl-copy
	notify-send "'$chosen' copied to clipboard." &
fi
