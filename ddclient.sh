#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
# example:
# exec /sbin/setuser memcache /usr/bin/memcached >>/var/log/memcached.log 2>&1


exec /usr/sbin/ddclient -verbose -foreground -daemon 30 -file /config/ddclient.conf 2>&1
