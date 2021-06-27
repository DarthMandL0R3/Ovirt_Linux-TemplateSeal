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

###Remove Network Hardware Information###
echo "Remove Network and Hardwre Related Information"
sed -i '/^HWADDR=/d' /etc/sysconfig/network-scripts/ifcfg-* && echo "HWADDR Removed" || echo "HWADDR Not Removed"
echo " "
sleep 5
sed -i '/^UUID=/d' /etc/sysconfig/network-scripts/ifcfg-* && echo "UUID Removed" || echo "UUID Not Removed"
echo " "

###Remove RHN System ID###
echo "Remove RHN System ID"
rm -f /etc/sysconfig/rhn/systemid && echo "Removed" || echo "Not Removed"
echo " "

###Remove Host Specific Information###
echo "Remove Host Specific Information"
rm -f /etc/udev/rules.d/*-persistent-*.rules && echo "Removed" || echo "Not Removed"
echo " "

### Reboot the Machine ###
while true; do
  read -p "Do you wish to sysprep this Machine?" yn
  case $yn in
    [Yy]* ) sys-unconfig; break;;
    [Nn]* ) exit;;
  esac
done