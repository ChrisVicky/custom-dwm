
mydate(){
  d="$(date +"%a %b.%dth - %H:%M:%S")"
  echo -e "鬒 ${d}"
}

echo "$(mydate)"

msg=`trans -t zh-TW test`
notify-send "test" $msg
