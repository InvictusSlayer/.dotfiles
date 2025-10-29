#!/usr/bin/bash

brightness=$(<$HOME/.config/hypr/scripts/brightness)

if [[ "$1" == "inc" ]]; then
    new_brightness=$(($brightness + $2))
    brightness=$((($new_brightness > 100) ? 100 : $new_brightness))
elif [[ "$1" == "dec" ]]; then
    new_brightness=$(($brightness - $2))
    brightness=$((($new_brightness < 10) ? 10 : $new_brightness))
fi

echo $brightness >$HOME/.config/hypr/scripts/brightness
hyprctl hyprsunset gamma $brightness
