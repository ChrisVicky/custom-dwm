#!/bin/bash
HOME_TV_MODE=1680x1050
connector_list=`xrandr | grep connected -w | awk '{print $1}'`
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
  ./wallpaper_random.sh
done
