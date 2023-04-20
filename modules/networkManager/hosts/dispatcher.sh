#! /bin/bash

TS="$(date +%s)"
ROOT="/root/scripts/update-hosts"

mkdir -p "$ROOT/log"
$ROOT/update-hosts.sh > $ROOT/log/$TS 2>&1