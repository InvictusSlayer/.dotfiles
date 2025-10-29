#!/usr/bin/bash

function exit_grid {
    eww close hyprgrid
    eww close grid-closer
    echo "0" >$HOME/.config/hypr/scripts/selected
    exit
}

function change_ws {
    hyprctl dispatch workspace $1
    exit_grid
}

selected_ws=$(<$HOME/.config/hypr/scripts/selected)

if [[ "$selected_ws" == "0" ]]; then
    selected_ws=$(hyprctl monitors | grep "focused: yes" -B 10 | grep "active workspace" | awk -F': ' '{print $2}' | cut -d' ' -f1)
    if [[ "$1" == "next" ]] || [[ "$1" == "open" ]]; then
        eww open hyprgrid
        eww open grid-closer
    fi
fi

case $1 in
"exit") exit_grid ;;
"release") change_ws $selected_ws ;;
"click") change_ws $2 ;;
"hover") selected_ws=$2 ;;
"next") selected_ws=$((($selected_ws % 10) + 1)) ;;
"up") ;;
"down") ;;
"left") ;;
"right") ;;
esac

echo $selected_ws >$HOME/.config/hypr/scripts/selected
