#!/usr/bin/bash

rows=2
cols=5

function animate {
    hyprctl keyword animation "workspacesIn,1,2.0,ws,$1"
    hyprctl keyword animation "workspacesOut,1,2.0,ws,$1"
}

selected_ws=$(<$HOME/.config/hypr/scripts/selected)
active_ws=$(hyprctl monitors | grep "focused: yes" -B 10 | grep "active workspace" | awk -F': ' '{print $2}' | cut -d' ' -f1)

echo $active_ws

row=$((($active_ws - 1) / $cols))
col=$((($active_ws - 1) % $cols))

echo "$row : $col"

case $1 in
"top") row=$((($row + $rows - 1) % $rows)) ;;
"bottom") row=$((($row + $rows + 1) % $rows)) ;;
"left") col=$((($col + $cols - 1) % $cols)) ;;
"right") col=$((($col + $cols + 1) % $cols)) ;;
esac

echo "$row : $col"
ws=$(($row * $cols + $col + 1))
echo $ws

case $1 in
"top" | "bottom" | "left" | "right") animate "slide $1" ;;
esac

if [[ "$selected_ws" == "0" ]]; then
    hyprctl dispatch workspace $ws
fi
animate fade
