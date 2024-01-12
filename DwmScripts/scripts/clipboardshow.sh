#!/bin/bash
# *
# @file clipboardshow.sh
# @brief For clipboard Debugging
# @author Christopher Liu
# @version 1.0
# @date 2023-02-14
# 

names=("clipboard" "primary" "secondary")
while true 
do
  clear
  date
  for name in ${names[@]};
  do
    echo ""
    echo "-> $name:"
    xclip -o -selection $name
    echo 
    echo "-------------------"
  done
  clipnotify
done
