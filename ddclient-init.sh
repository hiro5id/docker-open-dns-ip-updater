#!/bin/sh

# Search for custom config file, if it doesn't exist, copy the default one
if [ ! -f /config/ddclient.conf ]; then
  echo "Creating config file. Please do not forget to enter your info in ddclient.conf."
  cp /root/ddclient/ddclient.conf /config/ddclient.conf
  chmod a+w /config/ddclient.conf
  exit 1
fi

# Lets test if the config file is valid, this should result in error we will check for it
/usr/sbin/ddclient -verbose -foreground -file /config/ddclient.conf
loadstatus=$?
if [ $loadstatus -ne 0 ]; then
    echo "Could not load /config/ddclient.conf it looks corrupt, please check it." >&2
    exit 1
fi
