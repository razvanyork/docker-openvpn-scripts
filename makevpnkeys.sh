#!/bin/bash
#
echo "Reading config...."
. ./dockervpn.config

echo "MAKING NEW CERTS BASED on ./dockervpn.config"
for i in ${VPN_KEYS[@]}; do
  docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $i nopass
  docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $i > $i.ovpn
done