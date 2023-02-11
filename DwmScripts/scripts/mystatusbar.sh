#!/bin/bash
declare -A en2ch=(
["Mon"]="週一" ["Tue"]="週二" ["Wed"]="週三" ["Thu"]="週四" ["Fri"]="週五" ["Sat"]="週六" ["Sun"]="週天"

["Jan"]="一月" ["Feb"]="二月" ["Mar"]="三月" ["Apr"]="四月" ["May"]="五月" ["Jun"]="六月" 
["Jul"]="七月" ["Aug"]="八月" ["Sep"]="九月" ["Oct"]="十月" ["Nov"]="十一月" ["Dec"]="十二月"
)

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
		local level="$(( ${capa} / 20 ))"
		echo -e "${capa}% ${icons[${level}-1]}  "
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

echo "  $(mybattery) | $(myvolume) | $(mybrightness) | $(mydate) $(myicons)"
