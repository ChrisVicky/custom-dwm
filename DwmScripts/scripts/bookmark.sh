#!/bin/bash
cont=$(grep -v '^#' ~/Documents/bookmark/source.md | dmenu -i -c -l 50 -g 1 | cut -d "(" -f2 | cut -d ")" -f1)
xdotool type "$cont"
