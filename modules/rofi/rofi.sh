#! /bin/bash

CMD="$(cat $HOME/.opt/rofi/menu | /usr/bin/rofi -dmenu)"

if [[ -f "$HOME/.opt/rofi/bin/$CMD" ]]; then
    exec "$HOME/.opt/rofi/bin/$CMD"
else
    exec $CMD
fi
