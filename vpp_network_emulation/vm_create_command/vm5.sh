#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# host2 route
ip route add 10.1.1.0/24 via 10.2.2.2













# host2 iperf
iperf -u -s -i 1



# UDP probe packet  (162 Bytes per packet)
iperf -u -c 10.3.3.2 -b 1M -t 10 -p 55555 -l 120

