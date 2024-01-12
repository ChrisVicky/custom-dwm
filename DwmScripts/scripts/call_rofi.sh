###
# @file call_rofi.sh
# @brief  调用 rofi, 借用了 https://github.com/yaocccc/scripts
# @author Christopher Liu
# @version 1.0
# @date 2023-02-14
#
case "$1" in
    run) rofi -show run -theme ~/.config/rofi/rofi.rasi ;;
    drun) rofi -show drun -show-icons -theme ~/.config/rofi/rofi_3c.rasi ;;
    custom) rofi -show menu -modi 'menu:~/.config/rofi/rofi.sh' -theme ~/.config/rofi/rofi.rasi ;;
    window) rofi -show window -show-icons -theme ~/.config/rofi/rofi_2c.rasi ;;
esac
