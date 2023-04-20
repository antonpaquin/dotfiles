#! /bin/bash

cd $HOME/.opt/background

BG_DIR="$HOME/.opt/background/shuffle"

CANDIDATES="$(ls -1 $BG_DIR)" 
N="$(echo "$CANDIDATES" | wc -l)"
IDX="$($HOME/scripts/dice 1d$N)"
SEL="$(echo "$CANDIDATES" | tail -$IDX | head -1)"

swww img "$BG_DIR/$SEL" --transition-type right
