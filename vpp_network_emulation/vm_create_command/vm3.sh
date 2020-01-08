#! /bin/bash

if [ $USER != "root" ] ; then
    echo "Restarting script with sudo..."
    sudo $0 ${*}
    exit
fi

# ready for vpp interface
ip link set dev enp0s3 down
ip link set dev enp0s8 down
modprobe uio_pci_generic
./vpp/build-root/install-vpp_debug-native/external/share/dpdk/usertools/dpdk-devbind.py -b uio_pci_generic 0000:00:03.0 0000:00:08.0











# run vpp
sudo make run STARTUP_CONF=/home/linxchen/vpp/startup.conf

# ---config vpp---
set interface state GigabitEthernet0/3/0 up
set interface state GigabitEthernet0/8/0 up
set interface ip address GigabitEthernet0/3/0 10.5.5.1/24
set interface ip address GigabitEthernet0/8/0 10.6.6.1/24

