#! /bin/bash

# NOTE: expected to be triggered by /etc/NetworkManager/dispatcher.d/update-hosts.sh
# see 

DEVICE="wlp1s0"

ROOTDIR="/root/scripts/update-hosts"
cd $ROOTDIR

set -ex

SSID="$(nmcli c show --active | grep $DEVICE | awk '{print $1}')"

if [[ "$SSID" == "" ]]; then
    echo "Could not get SSID" 1>&2
    exit 1
fi

CONTENT="$(cat "$ROOTDIR/base.hosts")"

if [[ -f "$ROOTDIR/$SSID.hosts" ]]; then
    CONTENT="$CONTENT"$'\n\n'"$(cat "$ROOTDIR/$SSID.hosts")"
fi

echo "$CONTENT" > /etc/hosts
