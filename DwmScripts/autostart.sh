#!/bin/bash 
# This script runs so that dwm would have some features

# 设置输入法
fcitx5 -d -r &


# picom设置窗口渐变渲染
picom \
	-b \
	--experimental-backends &
	# --round-borders 2 \

# 設置自動鎖屏程序
xss-lock -- ~/.dwm/scripts/mylockscreen.sh &

# 开启 clash for windows 
# /home/christopher/.config/clash/clash-GUI/cfw &

cron(){
	let i=0
	while true; do
		# 每 30 秒切換一次 statusbar 信息
		[ $((i%30)) -eq 0 ] && ~/.dwm/mystatusbar.sh

		# 每 6000 秒切換一次 壁紙
		[ $((i%6000)) -eq 0 ] && ~/.dwm/scripts/wallpaper_random.sh
    
		sleep 30s && i=$(((i+30)%6000))
	done
}

# Customized Status Bar -- Located in ~/.local/bin/mystatusbar.sh
# ~/.dwm/mystatusbar.sh 
cron &
