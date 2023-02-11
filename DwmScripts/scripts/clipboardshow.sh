#!/bin/bash
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
  sleep 1
done
