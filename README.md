# docker-openvpn-scripts
Uses the kylemanna/openvpn docker container to create a running instance of openvpn. It:
create keys, either by "add SHORTNAME", or by "addfromfile" and specifying in the dockervpn.config file;
initializes with variable "init";
can "run" or "stop" the vpn server.

Usage: ./opendockvpn.sh <command>, where <command> is:
  add SHORTNAME    adds and creates keyfile to an existing instance
  addfromfile      adds a key as specified in the dockervpn.config
  init             initializes and runs the vpn server
  run              runs the vpn server
  stop             stops the vpn server

