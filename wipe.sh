#!/bin/sh
#

echo "Reading config...."
. ./dockervpn.config

docker stop $OVPN_DATA
docker stop $VPN_SERVER
docker rm $OVPN_DATA
docker rm $VPN_SERVER
