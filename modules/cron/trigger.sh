#! /bin/bash

cd $HOME/.opt/cron/
CROND="$HOME/.opt/cron/$1.d"

if [[ "$XDG_RUNTIME_DIR" == "" ]]; then
    export XDG_RUNTIME_DIR="/run/user/$UID"
fi

if [[ ! -d "$CROND" ]]; then
    mkdir -p "$CROND"
fi

if [[ "$(ls -1 $CROND | wc -l)" -gt 0 ]]; then
    for f in $CROND/*; do
        "$f"
    done
fi
