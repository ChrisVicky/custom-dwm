#!/bin/zsh
source=$1
[[ "$source" == "" ]] && source=`xclip -o -selection clipboard` 
[[ "$source" == "" ]] && notify-send -u normal -t 5000 "翻譯失敗-clipboard" && exit
results=`python ~/.dwm/scripts/translator.py "$source"` || (notify-send "翻譯失敗-translator" && exit)
notify-send "翻譯" "$results" -u normal -t 5000
echo "$results"

