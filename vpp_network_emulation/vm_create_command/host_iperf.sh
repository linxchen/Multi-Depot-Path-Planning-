#! /bin/bash

sleep 14

iperf -u -c 10.2.2.1 -b 100M -t 10

sleep 5

iperf -u -c 10.2.2.1 -b 500M -t 10

sleep 3
