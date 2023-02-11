declare -A en2ch=(
	["Mon"]="週一" ["Tue"]="週二" ["Wed"]="週三" ["Thu"]="週四" ["Fri"]="週五" ["Sat"]="週六" ["Sun"]="週天"

	["Jan"]="一月" ["Feb"]="二月" ["Mar"]="三月" ["Apr"]="四月" ["May"]="五月" ["Jun"]="六月" 
	["Jul"]="七月" ["Aug"]="八月" ["Sep"]="九月" ["Oct"]="十月" ["Nov"]="十一月" ["Dec"]="十二月"
)

mydate(){
	local d="$(date +"%a %b.%d")"
	local time="$(date +"%H:%M")"
  	local xingqi=${en2ch[${d:0:3}]}
  	local yuefen=${en2ch[${d:4:3}]}
	local day=${d:8:2}
	# echo -e "鬒 ${d} >${xingqi}< >${yuefen}<"
	echo -e "鬒 ${xingqi}/${yuefen}/${day}號 - ${time}"
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
		echo "${capa}% ${icons[${level}-1]}  "
	else
		# Battery Path Error
		echo ""
	fi
}

while true; do
	xsetroot -name "| $(mybattery) | $(mybrightness) | $(mydate)  "
	sleep 30s
done

# dwmblocks &
