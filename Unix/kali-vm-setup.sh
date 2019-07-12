#!/bin/bash

echo "auto eth0" >> /etc/network/interfaces
echo "allow-hotplug eth0" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces

service networking restart

apt-get update -y
apt-get upgrade -y

git config --global user.name "Justin Restivo"
git config --global user.email justin.restivo@citi.com
git config --global push.default matching

exit 0
