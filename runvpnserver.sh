#!/bin/bash
#

echo "Reading config...."
. ./dockervpn.config

docker run --name $OVPN_DATA -v /etc/openvpn busybox
docker run --name $VPN_SERVER --volumes-from $OVPN_DATA --rm -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
