#!/bin/sh -e

lines="
#IPv6
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
"

echo "Adding some lines to /etc/sysctl.conf..."
echo "$lines" | sudo tee -a /etc/sysctl.conf
echo "Lines added..."
echo "Reloading sysctl..."
sudo sysctl -p
echo "All done !!!"
