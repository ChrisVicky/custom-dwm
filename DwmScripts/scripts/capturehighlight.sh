#!/bin/zsh
### 
# @file capturehighlight.sh
# @brief hightlight the captured , for clipboard testing
# @author Christopher Liu
# @version 1.0
# @date 2023-02-14
# 
source="$(xclip -o -selection clipboard)" || (echo "FAILED1" && notify-send "FAILED 2" && exit)
[[ "source" == "" ]] && echo "FAILED" && exit
notify-send "captured" "$source"
