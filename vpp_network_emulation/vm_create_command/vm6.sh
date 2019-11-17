#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# host route
ip route add 10.3.3.0/24 via 10.2.2.2

# host2 iperf  ->  host3
# iperf -u -c 10.3.3.1 -b 100M -t 10 -i 1

