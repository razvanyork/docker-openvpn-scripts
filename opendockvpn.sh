#!/bin/bash
#
#if (( "$#" == 0 ))
#then
#        echo "Usage: $0 <shortname>"
#        exit 1
#fi

#echo "Reading config...."
#. ./dockervpn.config

case "$1" in
        add)
            bash addnewkey.sh "$2"
            exit 0
            ;;
         
        addfromfile)
            bash addfromfile.sh
            exit 0
            ;;
            
        init)
            bash initialize.sh
            exit 0
            ;;
         
        run)
            bash runvpnserver.sh
            exit 0
            ;;
        stop)
            bash stopvpnserver.sh
            exit 0
            ;;
         
        *)
            echo "Usage: $0 <command>, where <command> is:"
            echo "  add SHORTNAME    adds and creates keyfile to an existing instance"
            echo "  addfromfile      adds a key as specified in the dockervpn.config"
            echo "  init             initializes and runs the vpn server"
            echo "  run              runs the vpn server"
            echo "  stop             stops the vpn server"
            exit 1
esac
