#!/bin/bash

# add interface for ssh connection

echo "
# interface for ssh connexion
auto eth1
iface eth1 inet static
address 192.168.56.101
netmask 255.255.255.0" >> /etc/network/interfaces

