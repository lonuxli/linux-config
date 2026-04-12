#!/bin/bash

# 从内核命令行中提取IP参数
CMDLINE=$(cat /proc/cmdline)
IP_PARAM=$(echo "$CMDLINE" | grep -o 'IP=[^ ]*' | cut -d= -f2)

if [ -z "$IP_PARAM" ]; then
    echo "No IP parameter found in kernel command line"
    exit 1
fi

echo "Found IP parameter: $IP_PARAM"

# 查找网络接口名称
INTERFACE=$(ls /sys/class/net | grep -v lo | head -n 1)

if [ -z "$INTERFACE" ]; then
    echo "No network interface found"
    exit 1
fi

echo "Using network interface: $INTERFACE"

# 配置网络
ip addr add $IP_PARAM/24 dev $INTERFACE
ip link set $INTERFACE up
ip route add default via 192.168.22.1

# 配置DNS
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo "Network configuration completed"
