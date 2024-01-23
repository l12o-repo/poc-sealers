#!/bin/bash

subscription-manager unregister
subscription-manager remove --all
subscription-manager clean


rm -rf /etc/udev/rules.d/70-persistent-*
hostnamectl set-hostname localhost.localdomain
rm -rf /etc/ssh/ssh_host_*

rm /etc/machine-id 
echo "uninitialized" > /etc/machine-id
chmod 644 /etc/machine-id

rm /etc/iscsi/initiatorname.iscsi

poweroff

