#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# host route
ip route add 10.3.3.0/24 via 10.2.2.2

