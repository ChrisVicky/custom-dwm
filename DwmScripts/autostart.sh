#!/bin/bash
# This script runs so that dwm would have some features

# 设置输入法
fcitx5 -d -r &

# picom设置窗口渐变渲染
# picom \
# 	-b \
# 	--experimental-backends &

# 設置自動鎖屏程序
xss-lock -- ~/.dwm/scripts/mylockscreen.sh &

# 开启 clash for windows
# /home/christopher/.config/clash/clash-GUI/cfw &

# 開啓自動保存 clipboard
clipsave &

# 开启通知系统（不知道为啥之前没开过）
dunst &

~/.dwm/scripts/wallpaper_random.sh &

~/.config/clash/clash-GUI/cfw &

cron() {
	let i=0
	while true; do
		# 每 30 秒切換一次 statusbar 信息
		[ $((i % 30)) -eq 0 ] && ~/.dwm/mystatusbar.sh

		sleep 30s && i=$(((i + 30) % 6000))
	done
}

# Customized Status Bar -- Located in ~/.local/bin/mystatusbar.sh
# ~/.dwm/mystatusbar.sh
cron &
