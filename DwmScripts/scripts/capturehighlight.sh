#!/bin/zsh
source="$(xclip -o -selection clipboard)" || (echo "FAILED1" && notify-send "FAILED 2" && exit)
[[ "source" == "" ]] && echo "FAILED" && exit
notify-send "captured" "$source"
