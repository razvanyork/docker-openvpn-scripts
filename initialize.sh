#!/bin/bash
#
echo "Reading config...." >&2
. ./dockervpn.config

docker rm $OVPN_DATA
echo "#######initialize container########"
docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$FQDN
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
docker stop $VPN_SERVER
docker rm $VPN_SERVER
echo "##########start server process###########"
docker run --name $VPN_SERVER -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
