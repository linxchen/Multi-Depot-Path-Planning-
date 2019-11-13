#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# delete previous incarnations if they exist
ip link del dev veth_vpp1
#ip link del dev veth_h1
ip netns del host1

#create namespaces
ip netns add host1

# create and configure 1st veth pair
ip link add name veth_h1 type veth peer name veth_vpp1
ip link set dev veth_vpp1 up
ip link set dev veth_h1 up netns host1

ip netns exec host1 \
  bash -c "
    ip link set dev lo up
    ip addr add 10.0.1.2/24 dev veth_h1
    ip route add 10.0.3.0/24 via 10.0.1.2
"
