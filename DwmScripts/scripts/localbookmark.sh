#!/bin/bash
content=$(grep -v '^#' ~/Documents/bookmark/local.md | dmenu -i -c -l 50 -g 1 | cut -d "(" -f2 | cut -d ")" -f1)
[[ "$content" != "" ]] && st ranger $content
