#!/bin/bash
# Toggle Hyprland animations on/off

STATUS=$(hyprctl -j getoption animations:enabled 2>/dev/null | jq -r '.bool' 2>/dev/null || hyprctl getoption animations:enabled | awk '/bool:/ {print $2}')

if [ "$STATUS" = "true" ]; then
    hyprctl eval 'local anim = package.loaded["hypr.animations"]; if anim and anim.disable then anim.disable() else hl.config({ animations = { enabled = false } }) end' >/dev/null 2>&1
    omarchy-osd -i window -m "Animations disabled" 2>/dev/null || notify-send "Hyprland" "Animations disabled" -t 1500 -i dialog-information
else
    hyprctl eval 'local anim = package.loaded["hypr.animations"]; if anim and anim.apply then anim.apply() else hl.config({ animations = { enabled = true } }) end' >/dev/null 2>&1
    omarchy-osd -i window -m "Animations enabled" 2>/dev/null || notify-send "Hyprland" "Animations enabled" -t 1500 -i dialog-information
fi
