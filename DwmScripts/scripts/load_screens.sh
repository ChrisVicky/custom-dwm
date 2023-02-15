#!/bin/bash
#
# @file load_screens.sh
# @brief load screens reload
# @author Christopher Liu
# @version 1.0
# @date 2023-02-14
# 

## TODO: 当从 HDMI 撤出时执行该脚本，无法将 HDMI 接口关闭
# 如果先将所有 devices 关闭再连接主屏幕则会很慢
HOME_TV_MODE=1680x1050
connector_list=`xrandr | grep connected -w | awk '{print $1}'`
# devices=`xrandr | grep connected | awk '{print $1}'`
for name in ${connector_list}
do
  echo "Found $name"
  case "$name" in
    "HDMI2") 
      echo "Set $name as HomeTVSize: $HOME_TV_MODE right of eDP1"
      xrandr --output HDMI2 --mode $HOME_TV_MODE --right-of eDP1
    ;;
    "eDP1")
      echo "Set $name as Primary Monitor"
      xrandr --output $name --auto --primary
    ;;
    *) 
      echo "Set $name to auto"
      xrandr --output $name --auto 
    ;;
  esac
done
./wallpaper_random.sh
