#!/bin/bash

myvolume(){
	# echo `pactl get-sink-volume @DEFAULT_SINK@`
	local icons=("奄" "奔" "墳" "墳" "ﱝ ") 				# Low, Medium, High, Hight, Mute
	local ismute=`pactl get-sink-mute @DEFAULT_SINK@ | grep yes` 	# Mute: Has Length, otherwise Length=0
	local volOutput=`pactl get-sink-volume @DEFAULT_SINK@` 		# Pactl Ouput
	local volumeList=(${volOutput///// }) 				# Pactl Ouput, in List Format
	# Example Output "Volume: front-left: 13103 /  20% / -41.95 dB,   front-right: 13103 /  20% / -41.95 dB" 
	local leftVo=${volumeList[4]::-1} 				# ${::-1} delete Last Character -- % in this case
	local rightVo=${volumeList[11]::-1}
	local volumeAve="$(( (${leftVo} + ${rightVo}) / 2 ))" 		# Get average
	if [ "${volumeAve}" -gt "0" ];then
 		if [[ $ismute ]];then
			local prefix="${icons[-1]} "
		else
			local volumeLevel=$((${volumeAve}/30))
			local prefix="${icons[${volumeLevel}]} "
		fi
		local body=$volumeAve%
	else
		if ! [[ $ismute ]];then
			`pactl set-sink-mute @DEFAULT_SINK@ toggle`
		fi
		local prefix="${icons[-1]} "
	fi
	echo $prefix$body
}

mydate(){
  export LC_TIME=zh_TW.UTF-8
	local d="$(date +" 周%a%b%e号 %Y")"
	local time="$(date +"%H:%M")"
	# echo -e "鬒 ${d} >${xingqi}< >${yuefen}<"
	echo -e "鬒 ${d} | ${time}"
}

mybrightness(){
	local icons=
	local b=`xbacklight | xargs printf "%.f\\n"`
	echo -e "${icons}  ${b}%"
}

mybattery(){
	local icons=("" "" "" "" "")
	local bat_path="/sys/class/power_supply/BAT0"
	if [[ -d $bat_path ]]; then
		# Battery Path Correct
		capa=`cat ${bat_path}/capacity`	
		local level="$(( (${capa}-1) / 20 ))"
		echo -e "${capa}% ${icons[${level}]}  "
	else
		# Battery Path Error
		echo ""
	fi
}

myicons(){
	local arch_icon=''
	echo "${arch_icon} "
}

# while true; do
#   # echo "| $(mybattery) | $(myvolume) | $(mybrightness) | $(mydate) $(myicons)"
# 	xsetroot -name "| $(mybattery) | $(myvolume) | $(mybrightness) | $(mydate) $(myicons)"
#   sleep 30s
# done

xsetroot -name "  $(mybattery) | $(myvolume) | $(mybrightness) | $(mydate) $(myicons)"
