#! /bin/bash

TGT="$(/home/anton/scripts/sway-context list | jq -r '.contexts[]' | rofi -dmenu -config /home/anton/.config/rofi/sway-context-config.rasi)"

if [[ "$TGT" != "" ]]; then
    /home/anton/scripts/sway-context "$1" "$TGT"
fi