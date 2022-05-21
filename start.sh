#!/bin/bash

#Unset History
unset HISTFILE

echo INFO: Startup $(date +"%Y-%m-%d %H:%M")

#---------------------------------------------------------------
# Set Authentication 
#---------------------------------------------------------------
if [ -n "$Kali_Password" ]
then
    echo "INFO: Updating root credentials"
    /bin/bash -c 'echo -e "$Kali_Password\n$Kali_Password" | passwd'
else 
    echo "ERROR: Kali_Password vairable required to define authentication credentials"
    randpass=$(cat /dev/random | head | md5sum | head -c 20)
    echo -e "$randpass\n$randpass" | passwd
    randpass="."
fi

#---------------------------------------------------------------
# Start Services 
#---------------------------------------------------------------
echo "INFO: Remove XRDP Lock File"
rm -rf /var/run/xrdp 2> /dev/null
rm /lib/systemd/system/xrdp* 2> /dev/null
rm /etc/systemd/system/multi-user.target.wants/xrdp* 2> /dev/null

#---------------------------------------------------------------
# Start Services 
#---------------------------------------------------------------
echo "INFO: Starting Services"
service xrdp start

#---------------------------------------------------------------
# Startup Complete and Keep Script Running
#---------------------------------------------------------------
echo INFO: Startup Complete $(date +"%Y-%m-%d %H:%M")
while true; do sleep 60 ; done