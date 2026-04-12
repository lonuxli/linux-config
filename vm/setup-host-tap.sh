#!/bin/bash

# Setup tap interface
ip tuntap add dev tap0 mode tap
ip link set tap0 up
ip addr add 192.168.22.1/24 dev tap0

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Determine external interface name
# This code tries to automatically detect the interface connected to the internet
EXT_IF=$(ip route | grep default | awk '{print $5}')

if [ -z "$EXT_IF" ]; then
    echo "Cannot automatically detect external network interface. Please specify manually."
    exit 1
fi

echo "Using $EXT_IF as external network interface"

# Setup NAT
iptables -t nat -C POSTROUTING -o $EXT_IF -s 192.168.22.0/24 -j MASQUERADE 2>/dev/null
if [ $? -ne 0 ]; then
    iptables -t nat -A POSTROUTING -o $EXT_IF -s 192.168.22.0/24 -j MASQUERADE
    echo "NAT rule added"
else
    echo "NAT rule already exists"
fi

echo "VM network configuration completed"
