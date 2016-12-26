#!/bin/sh
#

echo "Reading config...."
. ./dockervpn.config

docker stop $OVPN_DATA
docker stop $VPN_SERVER
