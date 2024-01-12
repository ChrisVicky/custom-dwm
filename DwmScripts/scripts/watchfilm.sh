#!/bin/bash
base=~/Video
origin=~/Video
i=0
# 最深挖 10 个防止死循环
while [[ "$i" != "10" ]]
do
  i=$((i+1))
  option=-Ff
  [[ ${base} == ${origin} ]] && option=-F
  file=$(ls ${option} ${base} | dmenu -i -c -l 10 -g 1 | cut -d "*" -f1 | cut -d "@" -f1 )
  if [ -d "${base}/$file" ]; then
    # 约等于 base=${base}/${file}
    # 但将 ~/Video/movies/../ 转化为 ~/Video/
    cd ${base}/${file}
    base=$(pwd)
  elif [ -f "${base}/$file" ]; then
    file=${base}/${file}
    st xdg-open ${file} &
    break 
  else
    echo "Fall back ${file} -- Should not be here"
  fi

  [[ "$file" == "" ]] && break
  
done
