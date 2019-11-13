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
ip netns del host2
ip netns del probe1

#create namespaces
ip netns add host2
ip netns add probe1

# create and configure 1st veth pair
ip link add name veth_h2 type veth peer name veth_vpp1
ip link set dev veth_vpp1 up
ip link set dev veth_h2 up netns host2

ip netns exec host2 \
  bash -c "
    ip link set dev lo up
    ip addr add 10.0.2.2/24 dev veth_h2
    ip route add 10.0.3.0/24 via 10.0.2.2
"

# create and configure 2nd veth pair
ip link add name veth_p1 type veth peer name veth_vpp2
ip link set dev veth_vpp2 up
ip link set dev veth_p1 up netns probe1

ip netns exec probe1 \
  bash -c "
    ip link set dev lo up
    ip addr add 10.0.9.2/24 dev veth_p1
"
