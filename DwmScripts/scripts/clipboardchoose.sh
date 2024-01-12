names=("clipboard" "primary" "secondary")
for name in ${names[@]};
do
  content="-> $name:"$(xclip -o -selection $name)
  echo ${content}
done
