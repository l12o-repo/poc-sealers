#!/bin/bash

/usr/bin/systemctl stop rsyslog
/usr/bin/service stop auditd

subscription-manager unregister
subscription-manager remove --all
subscription-manager clean

hostnamectl set-hostname localhost.localdomain

rm /etc/machine-id 
echo "uninitialized" > /etc/machine-id
chmod 644 /etc/machine-id

rm /etc/iscsi/initiatorname.iscsi

/bin/package-cleanup -oldkernels -count=1
/usr/bin/yum clean all

#force logrotate to shrink logspace and remove old logs as well as truncate logs
/usr/sbin/logrotate -f /etc/logrotate.conf

/bin/rm -f /var/log/*-???????? /var/log/*.gz
/bin/rm -f /var/log/dmesg.old
/bin/rm -rf /var/log/anaconda

/bin/cat /dev/null > /var/log/audit/audit.log
/bin/cat /dev/null > /var/log/wtmp
/bin/cat /dev/null > /var/log/lastlog
/bin/cat /dev/null > /var/log/grubby

#remove udev hardware rules
/bin/rm -f /etc/udev/rules.d/70*

#remove uuid from ifcfg scripts
#/bin/cat > /etc/sysconfig/network-scripts/ifcfg-ens192 <<EOM
#DEVICE=ens192
#ONBOOT=yes
#EOM

#remove SSH host keys
/bin/rm -f /etc/ssh/*key*

#remove root users shell history
/bin/rm -f ~root/.bash_history
unset HISTFILE

#remove root users SSH history
/bin/rm -rf ~root/.ssh/known_hosts

