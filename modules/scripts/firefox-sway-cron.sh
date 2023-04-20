#! /bin/bash

# test: sway running longer than 30m? then we can backup
SWAY_UPTIME="$(ps -C sway -o etimes=)" | awk '$1 >= 30*60 { print 1 }'
if [[ "$SWAY_UPTIME" != "" ]]; then
    firefox-sway backup
fi