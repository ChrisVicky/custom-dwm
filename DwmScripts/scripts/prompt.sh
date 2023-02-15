#!/bin/bash
#
# Example: 
#   ./prompt.sh "是否进行关机" ./shutdownnow.sh
#  - show following windows
# ┌──────────────┬────────────────────┐
# │ 是否进行关机 │                0/2 │
# ├──────────────┼─────────┬──────────┤
# │              │    N    │    Y     │
# └──────────────┴─────────┴──────────┘
#  - run ./shutdownnow.sh only if Y is chosen
#
[[ "$(echo -e "N\nY" | dmenu -l 1 -g 2 -i -p "$1")" == "Y" ]] \
&& $2

