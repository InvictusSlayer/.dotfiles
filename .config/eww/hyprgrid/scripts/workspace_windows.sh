#!/usr/bin/bash

windows=$(hyprctl workspaces | grep "workspace ID $1" -A 2 | grep "windows:" | awk -F': ' '{print $2}' | cut -d' ' -f1)
if [[ "$windows" == "" ]]; then
    exit
fi

positions=$(hyprctl clients | grep "workspace: $1" -B 2 -A 4 | grep "at:" | awk -F': ' '{print $2}' | cut -d' ' -f1)
sizes=$(hyprctl clients | grep "workspace: $1" -B 2 -A 4 | grep "size:" | awk -F': ' '{print $2}' | cut -d' ' -f1)
classes=$(hyprctl clients | grep "workspace: $1" -B 2 -A 4 | grep "class:" | awk -F': ' '{print $2}' | cut -d' ' -f1)

#echo "Windows: $windows"

for ((i = 1; i <= $windows; i++)); do
    pos=$(echo $positions | awk -F' ' "{print \$$i}")
    size=$(echo $sizes | awk -F' ' "{print \$$i}")
    class=$(echo $classes | awk -F' ' "{print \$$i}")

    x=$(echo $pos | awk -F',' '{print $1}')
    y=$(echo $pos | awk -F',' '{print $2}')
    width=$(echo $size | awk -F',' '{print $1}')
    height=$(echo $size | awk -F',' '{print $2}')

    echo "Window $i - $class: x=$x, y=$y, width=$width, height=$height"

    new_x=$((x * 10 / 192))
    new_y=$((y * 10 / 108))
    new_w=$((width * 10 / 192))
    new_h=$((height * 10 / 108))
    string="(button :geometry (geometry :x '$new_x%' :y '$new_y%' :width '$new_w%' :height '$new_h%') $i)"
    echo $string
done
