#!/usr/bin/env bash
#Author: Abrar and Fauzuwan.
#Version: 1.0.

#Description: Simple script for sysprep.  

###Unregister Host from Sattelite###
#echo "Removing Subscription"
#subscription-manager remove --all && subscription-manager unregister && subscription-manager clean && echo "Removed" || echo "Not Removed"
#echo " "

###Remove SSH host key###
echo -e "Removing SSH Key"
rm -f /etc/ssh/ssh_host_* && echo "Removed" || echo "Not Removed"
echo " "

###Setting Hostname###
echo "Changing Hostname"
hostnamectl set-hostname 'localhost' && echo "Hostname Changed to $(hostname)" || echo "Not Changed"
echo " "

###Remove Host Specific Information###
echo "Remove Host Specific Information"
rm -f /etc/udev/rules.d/*-persistent-*.rules && sed -i '/^HWADDR=/d' /etc/sysconfig/network-scripts/ifcfg-* && sed -i '/^UUID=/d' /etc/sysconfig/network-scripts/ifcfg-* && echo "Removed" || echo "Not Removed"
echo " "

### Reboot the Machine ###
while true; do
  read -p "Do you wish to sysprep this Machine?" yn
  case $yn in
    [Yy]* ) sys-unconfig; break;;
    [Nn]* ) exit;;
  esac
done