#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# delete previous incarnations if they exist
ip link del dev veth_vpp1
ip link del dev veth_vpp2
#ip link del dev veth_h1
ip netns del host3
ip netns del probe2

#create namespaces
ip netns add host3
ip netns add probe2

# create and configure 1st veth pair
ip link add name veth_h3 type veth peer name veth_vpp1
ip link set dev veth_vpp1 up
ip link set dev veth_h3 up netns host3

ip netns exec host3 \
  bash -c "
    ip link set dev lo up
    ip addr add 10.0.3.2/24 dev veth_h3
    ip route add 10.0.1.0/24 via 10.0.3.1
    ip route add 10.0.2.0/24 via 10.0.3.1
"

# create and configure 2nd veth pair
ip link add name veth_p2 type veth peer name veth_vpp2
ip link set dev veth_vpp2 up
ip link set dev veth_p2 up netns probe2

ip netns exec probe2 \
  bash -c "
    ip link set dev lo up
    ip addr add 10.0.10.2/24 dev veth_p2
"
