#!/bin/zsh
# 调用图片进行锁屏
# 使用 bar 风格

alpha='dd'
violet='#6c71c4'
blue='#268bd2'
cyan='#2aa198'
green='#859900'
black='#000000'
pink='#F5C2E7'
mauve='#CA9EE6'
grey='#303446'
maroon='#EA999C'


bar_height=50

# So that to show Chinese
font='LXGW WenKai Mono,霞鹜文楷等宽:style=Bold'
size=70
export LC_TIME="zh_TW.UTF-8"

# screensize=`xdpyinfo | grep dimensions | grep -oP '([0-9]+x[0-9]+)' | head -1`
screensize=1920x1080
imagepath="/home/christopher/Pictures/storage/3.png"

# generate Figure via convert and pipelined to i3lock for locking
convert $imagepath -resize $screensize RGB:- | \
  i3lock \
    --blur 5 \
    --bar-indicator \
    --bar-pos y+h \
    --bar-direction 1 \
    --bar-max-height $bar_height \
    --bar-base-width 50 \
    --bar-color 00000022 \
    --keyhl-color ffffffcc \
    --bar-periodic-step 50 \
    --bar-step 20 \
    --redraw-thread \
    --ringver-color ffffff00 \
    --ringwrong-color ffffff88 \
    --verif-align 1 \
    --wrong-align 1 \
    --modif-pos -50:-50 \
    --raw ${screensize}:rgb \
    --image /dev/stdin \
    --keyhl-color=$violet$alpha \
    --bshl-color=$violet$alpha \
    --verif-color=$mauve\
    --wrong-color=$maroon \
    --layout-color=$blue \
    --date-color=$grey\
    --time-color=$grey\
    --screen 1 \
    --clock \
    --time-pos x+$size:y+h-80-$size xdotool\
    --date-pos tx:ty+$size \
    --date-align 1 \
    --time-align 1 \
    --indicator \
    --time-str="%H:%M:%S" \
    --date-str="週%a %b %e號 %Y" \
    --verif-text="驗證中..." \
    --wrong-text="驗證失敗" \
    --noinput="請輸入" \
    --lock-text="鎖定中..." \
    --lockfailed="鎖定失敗" \
    --time-font=$font \
    --date-font=$font \
    --layout-font=$font \
    --verif-font=$font \
    --wrong-font=$font \
    --time-size=$size \
    --date-size=$size \
    --layout-size=$size \
    --verif-size=$size \
    --wrong-size=$size \
    --radius=100 \
    --ring-width=20 \
    --pass-media-keys \
    --pass-screen-keys \
    --pass-volume-keys \

xdotool mousemove_relative 1 1

