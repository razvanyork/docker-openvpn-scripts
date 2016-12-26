#!/bin/bash
#addnewkey.sh FILENAME

if (( "$#" != 1 ))
then
        echo "Usage: $0 <shortname>"
        exit 1
fi

echo "Reading config...."
. ./dockervpn.config

echo "making new cert for $1"
FILENAME=$1
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $FILENAME nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $FILENAME > $FILENAME.ovpn
exit 0