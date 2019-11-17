#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# host route
ip route add 10.1.1.0/24 via 10.3.3.2
ip route add 10.2.2.0/24 via 10.3.3.2

# host3 iperf
# iperf -u -s -i 1

