#!/bin/bash

monitor="eDP-1"
last=""

monitor-sensor | while read -r line; do
  [[ "$line" != *"Accelerometer orientation changed"* ]] && continue

  case "$line" in
  *"normal"*)
    [[ "$last" == "normal" ]] && continue
    hyprctl keyword monitor "$monitor,preferred,auto,1,transform,0"
    last="normal"
    ;;

  *"bottom-up"*)
    [[ "$last" == "bottom-up" ]] && continue
    hyprctl keyword monitor "$monitor,preferred,auto,1,transform,2"
    last="bottom-up"
    ;;

  *"left-up"*)
    [[ "$last" == "left-up" ]] && continue
    hyprctl keyword monitor "$monitor,preferred,auto,1,transform,1"
    last="left-up"
    ;;

  *"right-up"*)
    [[ "$last" == "right-up" ]] && continue
    hyprctl keyword monitor "$monitor,preferred,auto,1,transform,3"
    last="right-up"
    ;;
  esac
done
