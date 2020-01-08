#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# host route
ip route add 10.2.2.0/24 via 10.1.1.2








# host1 iperf  ->  host2
iperf -u -c 10.2.2.1 -b 100M -t 10
# exec host_iperf.sh

