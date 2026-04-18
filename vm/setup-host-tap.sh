#!/bin/bash

BRIDGE_NAME="br_ll"
CONF_FILE="/etc/qemu/bridge.conf"

# Setup bridge interface
ip link add name $BRIDGE_NAME type bridge
ip link set dev $BRIDGE_NAME up
ip addr add 192.168.22.1/24 dev $BRIDGE_NAME

mkdir -p $(dirname "$CONF_FILE")
touch "$CONF_FILE"

if ! grep -q "$BRIDGE_NAME" $CONF_FILE; then
    echo "Adding bridge $BRIDGE_NAME to $CONF_FILE"
    echo "allow $BRIDGE_NAME" | tee -a $CONF_FILE > /dev/null
    chmod 644 "$CONF_FILE"
fi

BRIDGE_HELPER=$(find /usr -name qemu-bridge-helper 2>/dev/null | head -n 1)
if [ -n "$BRIDGE_HELPER" ]; then
    chmod u+s "$BRIDGE_HELPER"
    echo "Bridge helper configured at: $BRIDGE_HELPER"
fi

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
